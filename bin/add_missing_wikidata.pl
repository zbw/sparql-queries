#!/bin/env perl
# nbt, 15.11.2018

# Transform a sparql result to QS create statements

use strict;
use warnings;
use open ":encoding(utf8)";

binmode STDOUT, ":utf8";

use Carp;
use Data::Dumper;
use JSON qw'decode_json encode_json';
use Path::Tiny;
use Readonly;
use REST::Client;

# limit setting just stops output (on next run, after import, created items are
# excluded by query)
Readonly my $LIMIT     => 2000;
Readonly my $NAMED_AS  => '|S1810|';
Readonly my $TODAY     => `date +%F | tr -d "\n"`;
Readonly my $RETRIEVED => "|S813|+${TODAY}T00:00:00Z/11";

Readonly my @LANGUAGES     => qw/ de en /;
Readonly my %SOURCE_CONFIG => (
  gnd => {
    endpoint        => 'http://zbw.eu/beta/sparql/gnd/query',
    source_qid      => '|S248|Q36578',                          # GND
    source_property => 'P227',
    source_id       => '|S227|',
  },
  pm20 => {
    endpoint => 'http://zbw.eu/beta/sparql/pm20/query',
    source_qid      => '|S248|Q36948990',    # 20th century press archives
    source_property => 'P4293',
    source_id       => '|S4293|',
    default_property_query =>
      path('/opt/sparql-queries/pm20/property_missing_in_wikidata.rq'),
  }
);

Readonly my %CONFIG => (
  gnd_pe => {
    source     => 'gnd',
    label_type => 'last_first',
    query => path('/opt/sparql-queries/gnd/persons_missing_in_wikidata.rq'),
    source_title => 'gndLabel',
    source_id    => 'gndId',
    label        => {
      de => 'gndLabel',
      en => 'gndLabel',
    },
    descr => {
      de => 'descrDe',
      en => 'descrEn',
    },
    properties => {
      P31 => {
        var_name   => 'classQid',
        value_type => 'item',
      },
      P569 => {
        var_name   => 'births',
        value_type => 'date',
      },
      P570 => {
        var_name   => 'deaths',
        value_type => 'date',
      },
      P106 => {
        var_name   => 'occupationQid',
        value_type => 'item',
      },
    },
  },

  pm20_co => {
    source     => 'pm20',
    label_type => 'co',
    query => path('/opt/sparql-queries/pm20/companies_missing_in_wikidata.rq'),
    source_type  => 'zbwext:CompanyFolder',
    source_title => 'pm20Label',
    source_id    => 'pm20Id',
    label        => {
      de => 'pm20Label',
      en => 'pm20Label',
    },
    descr => {
      de => 'descrDe',
      en => 'descrEn',
    },
    properties => {
      P31 => {
        var_name   => 'classQid',
        value_type => 'item',
      },
      P571 => {
        var_name   => 'incepted',
        value_type => 'date',
      },
      P576 => {
        var_name   => 'abandoned',
        value_type => 'date',
      },
      P1448 => {
        pid        => 'P1448',
        var_name   => 'pm20Label',
        value_type => 'monolingual-text',
        lang       => 'und',
      },
      P227 => {
        var_name   => 'gndId',
        value_type => 'literal',
      },
    },
  },

  pm20_pe => {
    source     => 'pm20',
    label_type => 'last_first',
    query => path('/opt/sparql-queries/pm20/persons_missing_in_wikidata.rq'),
    source_type  => 'zbwext:PersonFolder',
    source_title => 'pm20Label',
    source_id    => 'pm20Id',
    label        => {
      de => 'pm20Label',
      en => 'pm20Label',
    },
    descr => {
      de => 'descrDe',
      en => 'descrEn',
    },
    properties => {
      P31 => {
        var_name   => 'classQid',
        value_type => 'item',
      },
      P569 => {
        var_name        => 'birth',
        value_type      => 'date',
        source_property => 'schema:birthDate',
      },
      P570 => {
        var_name        => 'death',
        value_type      => 'date',
        source_property => 'schema:deathDate',
      },
      P227 => {
        var_name        => 'gndId',
        value_type      => 'literal',
        source_property => 'gndo:gndIdentifier',
      },
      P106 => {
        query    => path('/opt/sparql-queries/pm20/wd_occupation_economist.rq'),
        var_name => 'occupationQid',
        value_type => 'item',
      },
      P53 => {
        query      => path('/opt/sparql-queries/pm20/wd_person_family.rq'),
        qid        => 'wdpersonQid',
        var_name   => 'wdfamilyQid',
        value_type => 'item',
      },
    },
  },
);

# evaluate commandline arguments
my ( $config, $src_cfg );
my $type     = $ARGV[0];
my $mode     = $ARGV[1] || 'create';
my $property = $ARGV[2];
if ( $type and exists $CONFIG{$type} and $mode =~ m/^(create|enhance)$/ ) {
  $config  = $CONFIG{$type};
  $src_cfg = $SOURCE_CONFIG{ $config->{source} };
} else {
  die "usage: $0 [", join( '|', keys %CONFIG ), "] {create|enhance pid}\n";
}
my @valid_properties = keys $config->{properties};
if ( $mode eq 'enhance'
  and not( $property and grep ( m/^$property$/, @valid_properties ) ) )
{
  die "usage: $0 $type $mode [", join( '|', @valid_properties ), "]\n";
}

# output file derived from query file, plus date for repeated runs
my ( $queryfile, $outfile, $query );
if ( $mode eq 'create' ) {
  $queryfile = $config->{query};
  $query     = $queryfile->slurp;
  $outfile   = $queryfile->parent->child('results')
    ->child( $queryfile->basename('.rq') . ".${TODAY}.qs.txt" );
} else {
  my $prop_cfg = $config->{properties}{$property};
  if ( $prop_cfg->{query} ) {
    $queryfile = $prop_cfg->{query};
    $query     = $queryfile->slurp;
  } else {
    $queryfile = $src_cfg->{default_property_query};
    $query = adapt_default_query( $queryfile->slurp, $property );
  }

  $outfile =
    $queryfile->parent->child('results')
    ->child(
    $property . '_' . $queryfile->basename('.rq') . ".${TODAY}.qs.txt" );
}
if ( -f $outfile ) {
  die "Error: $outfile exists\n";
}

# initialize rest client
my $client = REST::Client->new( timeout => 600 );

# execute the request (may also ask for 'text/csv') and write response to file
$client->POST(
  $src_cfg->{endpoint},
  $query,
  {
    'Content-type' => 'application/sparql-query',
    'Accept'       => 'application/sparql-results+json'
  }
);
my $result_data;
eval {
  my $json = $client->responseContent();
  $result_data = decode_json($json);
};
if ($@) {
  die "Error parsing response: ", $client->responseContent(), "\n";
}

my $count = 0;
my $fh    = $outfile->openw_utf8;
foreach my $entry ( @{ $result_data->{results}->{bindings} } ) {

  # Limit the numer of results
  # (data checking required)
  $count++;
  last if $count > $LIMIT;

  # set record specific reference statement
  my $entry_source_id    = quote( $entry->{ $config->{source_id} }{value} );
  my $entry_source_title = quote( $entry->{ $config->{source_title} }{value} );
  my $reference_statement =
      $src_cfg->{source_qid}
    . $src_cfg->{source_id}
    . $entry_source_id
    . $NAMED_AS
    . $entry_source_title
    . $RETRIEVED;

  if ( $mode eq 'create' ) {

    # new item
    print $fh "\nCREATE\n";

    # output fields
    foreach my $field (qw/ label descr alias /) {
      ##warn "  $field\n";
      next unless $config->{$field};
      my $abbrev = uc( substr( $field, 0, 1 ) );
      foreach my $lang (@LANGUAGES) {
        my $value = $entry->{ $config->{$field}{$lang} }{value};
        next unless $value;

        # transform label according to Wikidata rules
        if ( $field eq 'label' ) {
          $value = adjust_label( $value, $config->{label_type} );
        }
        print $fh "LAST|$abbrev$lang|" . quote($value) . "\n";
      }
    }

    # output source property (without reference)
    print $fh 'LAST|'
      . $src_cfg->{source_property} . '|'
      . quote( $entry->{ $config->{source_id} }{value} ) . "\n";

    # output properties
    foreach my $property ( keys $config->{properties} ) {
      my $prop_cfg = $config->{properties}{$property};
      next unless $entry->{ $prop_cfg->{var_name} };
      my $value = $entry->{ $prop_cfg->{var_name} }{value};
      next unless $value;

      print $fh 'LAST|'
        . $property . '|'
        . prepare_value( $property, $value )
        . $reference_statement . "\n";
    }
  } else {

    # only one property
    my $qid   = $config->{properties}{$property}{qid}      || 'qid';
    my $value = $config->{properties}{$property}{var_name} || 'value';
    print $fh $entry->{$qid}{value} . '|'
      . $property . '|'
      . prepare_value( $property, $entry->{$value}{value} )
      . $reference_statement . "\n";
  }
}
print "$count statements written to $outfile\n";

#####################

sub prepare_value {
  my $property = shift or confess "param missing";
  my $value    = shift or confess "param missing";

  my $value_type = $config->{properties}{$property}{value_type};
  if ( $value_type eq 'item' ) {
    ## use unquoted value
  } elsif ( $value_type eq 'literal' ) {
    $value = quote($value);
  } elsif ( $value_type eq 'date' ) {
    $value = format_date($value);
  } elsif ( $value_type eq 'monolingual-text' ) {
    $value = quote( $value, $config->{properties}{$property}{lang} );
  } else {
    die "Error: Unknown value_type [$value_type]\n";
  }
  return $value;
}

sub quote {
  my $text = shift or confess "param missing";
  my $lang = shift;

  my $q = '"';

  my $quoted = "$q$text$q";

  if ($lang) {
    $quoted = "$lang:$quoted";
  }

  return $quoted;
}

sub format_date {
  my $date = shift or confess "param missing";

  # TODO interpret different data formats
  if ( $date =~ m/^\d\d\d\d$/ ) {
    $date = "+$date-01-01T00:00:00Z/9";
  } elsif ( $date =~ m/^\d\d\d\d-\d\d-\d\d$/ ) {
    $date = "+${date}T00:00:00Z/11";
  } else {
    warn "Unknown date format in [$date] - returning string\n";
    $date = "\"$date\"";
  }

  return $date;
}

sub adjust_label {
  my $label      = shift or confess "param missing";
  my $label_type = shift or confess "param missing";

  # for persons
  if ( $label_type eq 'last_first' ) {
    ## remove optional qulifier in angle brackets
    $label =~ s/ \<.*?\>$//;
    ## reverse name parts
    my ( $last, $first ) = split( /, /, $label );
    if ($first) {
      $label = "$first $last";
    }
  }

  # for companies
  if ( $label_type eq 'co' ) {
    ## cut off legal form
    $label =~ s/(.*) Ltd\.$/$1/g;
    $label =~ s/(.*) Ltd$/$1/g;
    $label =~ s/(.*) Limited$/$1/g;
    $label =~ s/(.*) A\.G\.$/$1/g;
    $label =~ s/(.*) AG$/$1/g;
    $label =~ s/(.*) Aktiengesellschaft$/$1/g;
    $label =~ s/(.*) \& Co\.$/$1/ig;
    $label =~ s/(.*) \& Co$/$1/ig;
    $label =~ s/(.*) Co\.$/$1/ig;
    $label =~ s/(.*) Co$/$1/ig;
    $label =~ s/(.*) Corpi\.$/$1/ig;
    $label =~ s/(.*) mbh$/$1/ig;
    $label =~ s/(.*) Gmbh$/$1/ig;
    $label =~ s/(.*) e.V.$/$1/ig;
    $label =~ s/(.*) plc\.$/$1/g;
    $label =~ s/(.*) plc$/$1/g;
    $label =~ s/(.*) SA$/$1/g;
    $label =~ s/(.*) S\.A\.$/$1/g;
    $label =~ s/(.*) NV$/$1/g;
    $label =~ s/(.*) N\.V\.$/$1/g;
    $label =~ s/(.*) Co\.,$/$1/g;
  }
  return $label;
}

sub adapt_default_query {
  my $query    = shift or die "param missing";
  my $property = shift or die "param missing";

  my $source_property = $config->{properties}{$property}{source_property};

  # uses string replacement instead of values clause,
  # because that allows for property paths also
  $query =~ s/a \?sourceType/a $config->{source_type}/gms;
  $query =~ s/\?sourceProperty \?value/$source_property \?value/gms;
  $query =~ s/\?wdProperty \[/wdt:$property \[/gms;

  return $query;
}
