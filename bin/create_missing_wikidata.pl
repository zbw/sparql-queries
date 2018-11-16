#!/bin/env perl
# nbt, 15.11.2018

# Transform a sparql result to QS create statements

use strict;
use warnings;
use open ":encoding(utf8)";

binmode STDOUT, ":utf8";

use Data::Dumper;
use JSON qw'decode_json encode_json';
use Path::Tiny;
use Readonly;
use REST::Client;

Readonly my $ENDPOINT => 'http://zbw.eu/beta/sparql/pm20/query';
Readonly my $QUERY =>
  path('/opt/sparql-queries/pm20/companies_missing_in_wikidata.rq');
Readonly my $TODAY      => `date +%F | tr -d "\n"`;
Readonly my $SOURCE_QID => '|S248|Q36948990';      # 20th century press archives
Readonly my $SOURCE_TITLE => '|S1476|';
Readonly my $SOURCE_ID    => '|S4293|';
Readonly my $RETRIEVED    => "|S813|+${TODAY}T00:00:00Z/11";
Readonly my $LIMIT        => 2000;
Readonly my @LANGUAGES    => qw/ de en /;

Readonly my %CONFIG => (
  source_title => 'pm20Label',
  source_id    => 'pm20Id',
  label        => {
    de => 'wdLabel',
    en => 'wdLabel',
  },
  descr => {
    de => 'descrDe',
    en => 'descrEn',
  },
  properties => [
    {
      pid        => 'P31',
      var_name   => 'classQid',
      value_type => 'item',
    },
    {
      pid        => 'P571',
      var_name   => 'incepted',
      value_type => 'date',
      precision  => '',
    },
    {
      pid        => 'P576',
      var_name   => 'abandoned',
      value_type => 'date',
      precision  => '',
    },
    {
      pid        => 'P227',
      var_name   => 'gndId',
      value_type => 'literal',
    },
  ],
);

# initialize rest client
my $client = REST::Client->new( timeout => 600 );

# execute the request (may also ask for 'text/csv') and write response to file
$client->POST(
  $ENDPOINT,
  $QUERY->slurp,
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

my $count;
foreach my $entry ( @{ $result_data->{results}->{bindings} } ) {

  # Limit the numer of results
  # (data checking required)
  $count++;
  last if $count > $LIMIT;

  # set record specific reference statement
  my $reference_statement =
      $SOURCE_QID
    . $SOURCE_TITLE
    . quote( $entry->{ $CONFIG{source_title} }{value}, 'de' )
    . $SOURCE_ID
    . quote( $entry->{ $CONFIG{source_id} }{value} )
    . $RETRIEVED;

  # new item
  print "\nCREATE\n";

  # output fields
  foreach my $field (qw/ label descr alias /) {
    next unless $CONFIG{$field};
    my $abbrev = uc( substr( $field, 0, 1 ) );
    foreach my $lang (@LANGUAGES) {
      print "LAST|$abbrev$lang|"
        . quote( $entry->{ $CONFIG{$field}{$lang} }{value} ) . "\n";
    }
  }

  # output PM20 property (without reference)
  print 'LAST|P4293|' . quote( $entry->{ $CONFIG{source_id} }{value} ) . "\n";

  # output properties
  foreach my $property ( @{ $CONFIG{properties} } ) {
    my $value = $entry->{ $property->{var_name} }{value};
    next unless $value;

    if ( $property->{value_type} eq 'literal' ) {
      $value = quote($value);
    } elsif ( $property->{value_type} eq 'date' ) {
      $value = format_date($value);
    }
    print 'LAST|'
      . $property->{pid} . '|'
      . $value
      . $reference_statement . "\n";
  }
}

#####################

sub quote {
  my $text = shift or die "param missing\n";
  my $lang = shift;

  my $q = '"';

  my $quoted = "$q$text$q";

  if ($lang) {
    $quoted = "$lang:$quoted";
  }

  return $quoted;
}

sub format_date {
  my $date = shift or die "param missing\n";

  # TODO interpret different data formats
  if ( $date =~ m/^\d\d\d\d$/ ) {
    $date = "+$date-01-01T00:00:00Z/9";
  }
  return $date;
}
