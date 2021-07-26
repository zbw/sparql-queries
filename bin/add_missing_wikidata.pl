#!/bin/env perl
# nbt, 15.11.2018

# Transform a sparql result to QS create statements
# mode 'html' creates a list of QS inserts as html file

use strict;
use warnings;

binmode STDOUT, ":utf8";
use utf8;

use Carp;
use Data::Dumper;
use DateTime;
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
        query    => path('/opt/sparql-queries/gnd/wd_occupation_economist.rq'),
        var_name => 'occupationQid',
        value_type => 'item',
      },
    },
  },

  pm20_co => {
    source     => 'pm20',
    label_type => 'co',
    query => path('/opt/sparql-queries/pm20/companies_missing_in_wikidata.rq'),
    html  => path('/var/www/html/beta/tmp/pm20_qs_create.html'),
    source_type  => 'zbwext:CompanyFolder',
    source_title => 'pm20Label',
    source_id    => 'pm20Id',
    label        => {
      de => 'adjustedLabel',
      en => 'adjustedLabel',
    },
    descr => {
      de => 'descrDe',
      en => 'descrEn',
    },
    alias => {
      de => 'altLabels',
      en => 'altLabels',
    },
    properties => {
      P31 => {
        var_name   => 'classQids',
        value_type => 'item',
        query      => path('/opt/sparql-queries/pm20/wd_p31.rq'),
      },
      P571 => {
        var_name        => 'incepted',
        value_type      => 'date',
        source_property => 'schema:foundingDate',
      },
      P576 => {
        var_name        => 'abandoned',
        value_type      => 'date',
        source_property => 'schema:dissolutionDate',
      },
      P1448 => {
        pid        => 'P1448',
        var_name   => 'pm20Label',
        value_type => 'monolingual-text',
        lang       => 'de',
      },
      P227 => {
        var_name        => 'gndId',
        value_type      => 'literal',
        source_property => 'gndo:gndIdentifier',
      },
      P112 => {
        endpoint => 'https://query.wikidata.org/sparql',
        query    => path('/opt/sparql-queries/wikidata/pm20_company_person.rq'),
        var_name => 'founderQid',
        value_type => 'item',
      },
      P3320 => {
        endpoint => 'https://query.wikidata.org/sparql',
        query    => path('/opt/sparql-queries/wikidata/pm20_company_person.rq'),
        var_name => 'boardQid',
        value_type => 'item',
        qualifiers => {
          P580 => {
            var_name   => 'from',
            value_type => 'date',
          },
          P582 => {
            var_name   => 'to',
            value_type => 'date',
          },
        },
      },
      P5052 => {
        endpoint => 'https://query.wikidata.org/sparql',
        query    => path('/opt/sparql-queries/wikidata/pm20_company_person.rq'),
        var_name => 'advisoryQid',
        value_type => 'item',
        qualifiers => {
          P580 => {
            var_name   => 'from',
            value_type => 'date',
          },
          P582 => {
            var_name   => 'to',
            value_type => 'date',
          },
        },
      },
      P155 => {
        endpoint => 'https://query.wikidata.org/sparql',
        query    => path('/opt/sparql-queries/wikidata/pm20_company_predecessor.rq'),
        var_name => 'predecessorQid',
        value_type => 'item',
        inverse    => 'P156',
      },
      P749 => {
        endpoint => 'https://query.wikidata.org/sparql',
        query    => path('/opt/sparql-queries/wikidata/pm20_company_parent.rq'),
        var_name => 'parentQid',
        value_type => 'item',
        inverse    => 'P355',
      },
      P159 => {
        endpoint => 'https://query.wikidata.org/sparql',
        query    => path('/opt/sparql-queries/wikidata/pm20_company_location.rq'),
        var_name => 'geoQid',
        value_type => 'item',
      },
      P17 => {
        endpoint => 'https://query.wikidata.org/sparql',
        query    => path('/opt/sparql-queries/wikidata/pm20_company_country.rq'),
        var_name => 'geoQid',
        value_type => 'item',
      },
      P452 => {
        ## derived from NACE code
        ##endpoint => 'https://query.wikidata.org/sparql',
        ##query    => path('/opt/sparql-queries/wikidata/pm20_company_nace.rq'),
        # from mapping SK-WD
        query    => path('/opt/sparql-queries/pm20/wd_company_industry.rq'),
        var_name => 'industryQid',
        value_type => 'item',
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
      P27 => {
        query      => path('/opt/sparql-queries/pm20/wd_citizenship.rq'),
        var_name   => 'countryQid',
        value_type => 'item',
      },
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

  pm20_subject_category => {
    source     => 'pm20',
    label_type => 'category',
    query =>
      path('/opt/sparql-queries/pm20/subject_categories_for_wikidata.rq'),
    label => {
      de => 'labelDe',
      en => 'labelEn',
    },
    descr => {
      de => 'descrDe',
      en => 'descrEn',
    },
    alias => {
      de => 'aliasDe',
      en => 'aliasEn',
    },
    properties => {
      P31 => {
        var_name   => 'classQid',
        value_type => 'item',
      },
      P => {
        var_name   => 'classQid',
        value_type => 'item',
      },
    },
  },

  pm20_geo_category => {
    source     => 'pm20',
    label_type => 'category',
    properties => {
      P8483 => {
        query =>
          path('/opt/sparql-queries/pm20/wd_geo_category_longnotation.rq'),
        var_name   => 'geoCode',
        value_type => 'literal',
        qualifiers => {
          'P1545' => {
            var_name   => 'notationLong',
            value_type => 'literal',
          },
        },
      },
    },
  },

  pm20_subject_folder => {
    source     => 'pm20',
    label_type => 'subject_folder',
    query => path('/opt/sparql-queries/pm20/subject_folders_for_wikidata.rq'),
    label => {
      de => 'labelDe',
      en => 'labelEn',
    },
    descr => {
      de => 'descrDe',
      en => 'descrEn',
    },
    alias => {
      de => 'alias',
      en => 'alias',
    },
    properties => {
      P31 => {
        var_name   => 'classQid',
        value_type => 'item',
      },
      P4293 => {
        var_name   => 'pm20Id',
        value_type => 'literal',
      },
      P361 => {
        var_name   => 'partOf',
        value_type => 'item',
      },
      P1269 => {
        var_name   => 'countryQid',
        value_type => 'item',
        qualifiers => {
          'P8483' => {
            var_name   => 'countryCode',
            value_type => 'literal',
          },
        },
      },
      P921 => {
        var_name   => 'subjectQid',
        value_type => 'item',
        qualifiers => {
          P8484 => {
            var_name   => 'subjectCode',
            value_type => 'literal',
          },
        },
      },
    },
  },

  pm20_industry => {
    source     => 'pm20',
    label_type => 'category',
    query => path('/opt/sparql-queries/pm20/industries_missing_in_wikidata.rq'),
    html  => path('/var/www/html/beta/tmp/pm20_qs_create.html'),
    source_title => 'pm20Label',
    label        => {
      de => 'labelDe',
      en => 'labelEn',
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
      P1535 => {
        var_name   => 'usedFor',
        value_type => 'item',
      }
    },
  },

);

# evaluate commandline arguments
my ( $config, $src_cfg );
my $type     = $ARGV[0];
my $mode     = $ARGV[1] || 'create';
my $property = $ARGV[2];
if ( $type and exists $CONFIG{$type} and $mode =~ m/^(html|create|enhance)$/ ) {
  $config  = $CONFIG{$type};
  $src_cfg = $SOURCE_CONFIG{ $config->{source} };
} else {
  die "usage: $0 [", join( '|', keys %CONFIG ), "] {html|create|enhance pid}\n";
}
my @valid_properties = keys $config->{properties};
if ( $mode eq 'enhance'
  and not( $property and grep ( m/^$property$/, @valid_properties ) ) )
{
  die "usage: $0 $type $mode [", join( '|', @valid_properties ), "]\n";
}

# output file name derived from query file, plus date for repeated runs
my $prop_cfg;
my ( $queryfile, $outfile, $query );
if ( $mode eq 'html' or $mode eq 'create' ) {
  $queryfile = $config->{query};
  $query     = $queryfile->slurp;
  $outfile   = $queryfile->parent->child('results')
    ->child( $queryfile->basename('.rq') . ".${TODAY}.qs.txt" );
} elsif ( $mode eq 'enhance' ) {
  $prop_cfg = $config->{properties}{$property};
  if ( $prop_cfg->{query} ) {
    $queryfile = $prop_cfg->{query};
    $query     = $queryfile->slurp_utf8;
  } else {
    $queryfile = $src_cfg->{default_property_query};
    $query = adapt_default_query( $queryfile->slurp, $property );
  }

  $outfile =
    $queryfile->parent->child('results')
    ->child(
    $property . '_' . $queryfile->basename('.rq') . ".${TODAY}.qs.txt" );
}

# output files
my ( $html, $fh );
if ( $mode eq 'html' ) {
  if ( $config->{html} ) {
    $html = $config->{html}->openw_utf8;
    html_add_header( $html, $type );
  } else {
    die "Error: no html output defined for $type\n";
  }
}
if ( $mode ne 'html' ) {
  if ( -f $outfile ) {
    ## avoid accidental override
    die "Error: $outfile exists\n";
  } else {
    $fh = $outfile->openw_utf8;
  }
}

# initialize rest client
my $client = REST::Client->new( timeout => 600 );

# endpoint depends on source, yet may be overridden for certain properties
# (federated queries)
my $endpoint = $prop_cfg->{endpoint} || $src_cfg->{endpoint};

# execute the request (may also ask for 'text/csv') and write response to file
$client->POST(
  $endpoint,
  $query,
  {
    'Content-type' => 'application/sparql-query; charset=utf-8',
    'Accept'       => 'application/sparql-results+json'
  }
);
my $result_data;
eval {
  my $json = $client->responseContent();
  $result_data = decode_json($json);
};
if ($@) {
  die "Error parsing response from $endpoint: ", $client->responseContent(),
    "\n";
}

my $count = 0;
foreach my $entry ( @{ $result_data->{results}->{bindings} } ) {

  my $id = $entry->{ $config->{source_id} }{value};

  # set record specific reference statement
  my $reference_statement = '';
  if ( $config->{source_id} ) {
    my $entry_source_id = quote($id);
    my $entry_source_title =
      quote( $entry->{ $config->{source_title} }{value} );
    $reference_statement =
        $src_cfg->{source_qid}
      . $src_cfg->{source_id}
      . $entry_source_id
      . $NAMED_AS
      . $entry_source_title
      . $RETRIEVED;
  }

  if ( $mode eq 'html' or $mode eq 'create' ) {

    # new item
    my $block = "CREATE\n";

    # output fields
    foreach my $field (qw/ label descr alias /) {
      ##warn "  $field\n";
      next unless $config->{$field};
      my $abbrev = uc( substr( $field, 0, 1 ) );
      foreach my $lang (@LANGUAGES) {
        my $value = $entry->{ $config->{$field}{$lang} }{value};
        next unless $value;

        # multiple values should occur only for aliases
        my @split_val = split( /\|/, $value );
        foreach my $val (@split_val) {
          ## transform label according to Wikidata rules
          if ( $field eq 'label' ) {
            $value = adjust_label( $val, $config->{label_type} );
          }
          $block .= "LAST|$abbrev$lang|" . quote($val) . "\n";
        }
      }
    }

    # TODO remove!!!
    # q&d Hack for labels according to non-de/en languages
    ##$block .= 'LAST|Lnl|' . quote( $entry->{adjustedLabel}{value} ) . "\n";
    ##if ( $entry->{altLabels}{value} ) {
    ##  $block .= 'LAST|Anl|' . quote( $entry->{altLabels}{value} ) . "\n";
    ##}

    # output source property (without reference)
    # (if a source should be given)
    if ( $config->{source_id} ) {
      $block .= 'LAST|' . $src_cfg->{source_property} . '|' . quote($id) . "\n";
    }

    # output properties
    foreach my $property ( keys $config->{properties} ) {
      my $prop_cfg = $config->{properties}{$property};
      next unless $entry->{ $prop_cfg->{var_name} };
      my $value_type = $prop_cfg->{value_type};
      my $value      = $entry->{ $prop_cfg->{var_name} }{value};
      next unless $value;

      # in some cases, a value may consist of separate subfields
      # TODO code duplicated!
      my @prepared_values =
        ( prepare_values( $value_type, $value, $property ) );
      foreach my $prepared_value (@prepared_values) {
        $block .= 'LAST|'
          . $property . '|'
          . $prepared_value
          . get_qualifier_statements( $prop_cfg, $entry )
          . $reference_statement . "\n";
      }
    }
    my $label =
      $entry->{adjustedLabel}{value} . ' {' . $entry->{docCount}{value} . '}';
    if ( $mode eq 'html' ) {
      my $url = "http://purl.org/pressemappe20/folder/$id";
      ( my $name = $id ) =~ s/\//_/g;
      ## TODO q&d - this works only for companies
      print $html "\n<h3 id='$name'><a href='$url'># $label</a></h3>\n\n";
      print $html "<pre class='force-select'>\n$block\n</pre>\n\n";
    }
    if ( $mode eq 'create' ) {
      print $fh "\n# $label\n\n";
      print $fh "$block\n";
    }
  } else {

    # only one property
    my $qid = $config->{properties}{$property}{qid} || 'qid';
    my $value_type = $prop_cfg->{value_type};
    my $value =
      $entry->{ $prop_cfg->{var_name} }{value} || $entry->{value}{value};
    next if not $value or $value eq '';

    # in some cases, a value may consist of separate subfields
    # TODO code duplicated!
    my @prepared_values = ( prepare_values( $value_type, $value, $property ) );
    foreach my $prepared_value (@prepared_values) {
      print $fh $entry->{$qid}{value} . '|'
        . $property . '|'
        . $prepared_value
        . get_qualifier_statements( $prop_cfg, $entry )
        . $reference_statement . "\n";

      # special case: produce inverse statements
      # - value must by of type item
      # - currently no qualifiers
      if ( $prop_cfg->{inverse} ) {
        my $inverse_property = $prop_cfg->{inverse};
        print $fh $prepared_value . '|'
          . $inverse_property . '|'
          . $entry->{$qid}{value}
          . $reference_statement . "\n";
      }
    }
  }

  # Limit the numer of results
  # (data checking required)
  $count++;
  last if $count >= $LIMIT;
}
print "$count statements written to output file:\n";
if ( $mode eq 'html' ) {
  print $html "\n</body></html>\n";
  $html->close;
  print "http://zbw.eu/beta/tmp/pm20_qs_create.html\n";
} else {
  print "$outfile\n";
}

#####################

sub prepare_values {
  my $value_type = shift or confess "param missing";
  my $value      = shift or confess "param missing";
  my $property   = shift;

  # TODO allow multiple values for other item types than item

  my @values;
  if ( $value_type eq 'item' ) {
    ## split possible multiple values from group_concat
    ## use unquoted values
    @values = split( /\|/, $value );
  } elsif ( $value_type eq 'literal' ) {
    @values = ( quote($value) );
  } elsif ( $value_type eq 'quantity' ) {
    ## no modification of value
    @values = ($value);
  } elsif ( $value_type eq 'date' ) {
    @values = ( format_date($value) );
  } elsif ( $value_type eq 'monolingual-text' ) {
    @values = ( quote( $value, $config->{properties}{$property}{lang} ) );
  } else {
    die "Error: Unknown value_type [$value_type]\n";
  }
  return @values;
}

sub quote {
  my $text = shift or confess "param missing";
  my $lang = shift;

  my $q = '"';

  my $quoted = $text;

  # there seems to be no way of encoding double-quotes in
  # QS2 tab-separated input, so we transform them to single-quotes
  $quoted =~ s/$q/'/g;

  $quoted = "$q$quoted$q";

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

  # for companies, use already computed adjustedLabel

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

sub get_qualifier_statements {
  my $cfg   = shift or die "param missing";
  my $entry = shift or die "param missing";

  my $statements = '';
  if ( $cfg->{qualifiers} ) {
    foreach my $qualifier ( sort keys %{ $cfg->{qualifiers} } ) {
      my $qual_cfg   = $cfg->{qualifiers}{$qualifier};
      my $value      = $entry->{ $qual_cfg->{var_name} }{value};
      my $value_type = $qual_cfg->{value_type};
      next unless $value;
      $statements .=
        '|' . $qualifier . '|' . ( prepare_values( $value_type, $value ) )[0];
    }
  }
  return $statements;
}

sub html_add_header {
  my $html = shift or die "param missing";
  my $type = shift or die "param missing";

  my $now = DateTime->now( time_zone => 'Europe/Berlin' )->datetime(' ');
  my $title = "QS: Create item from $type";
  print $html <<"EOF";
<!DOCTYPE html>
<html><head><title>$title</title><style>
.force-select {
  -webkit-user-select: all;  /* Chrome 49+ */
  -moz-user-select: all;     /* Firefox 43+ */
  -ms-user-select: all;      /* No support yet */
  user-select: all;          /* Likely future */
}
</style></head><body>
<h1>$title</h1>
<h2>(as of $now)</h2>
<p>In sync with Mix-n-match catalog <a
href="https://tools.wmflabs.org/mix-n-match/#/catalog/4542">PM20 companies (div)</a>
</p>

EOF
}

