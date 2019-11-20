#!/bin/env perl
# nbt, 14.11.2018

# Download a Mix-n-match catalog, convert ids to RDF and load
# into a named graph. Creates triples
#
#   ?externalResourceUri dc:identifier "mnm_entry_id" .

use strict;
use warnings;

use Text::CSV_XS qw/csv/;
use Data::Dumper;
use Readonly;
use REST::Client;

##Readonly my $MNM_URL_TEMPLATE =>
##'http://tools.wmflabs.org/mix-n-match/api.php?query=download2&catalogs=CATALOG_ID&columns=%7B%22exturl%22%3A1%2C%22username%22%3A1%2C%22aux%22%3A0%2C%22dates%22%3A0%2C%22location%22%3A0%2C%22multimatch%22%3A1%7D&hidden=%7B%22any_matched%22%3A0%2C%22firmly_matched%22%3A0%2C%22user_matched%22%3A0%2C%22unmatched%22%3A0%2C%22automatched%22%3A0%2C%22name_date_matched%22%3A0%2C%22aux_matched%22%3A0%2C%22no_multiple%22%3A0%7D&format=tab&as_file=1';
Readonly my $MNM_URL_TEMPLATE =>
'https://tools.wmflabs.org/mix-n-match/api.php?query=download2&catalogs=CATALOG_ID&as_file=1';
Readonly my %URI => (
  gnd  => 'https://d-nb.info/gnd/',
  pm20 => 'http://purl.org/pressemappe20/folder/',
);

if ( scalar(@ARGV) < 2 ) {
  print "usage: $0 dataset catalog_id\n";
  exit;
}

my $dataset    = $ARGV[0];
my $catalog_id = $ARGV[1];
( my $mnm_url = $MNM_URL_TEMPLATE ) =~ s/CATALOG_ID/$catalog_id/;
my $endpoint   = "http://localhost:3030/$dataset/data";
my $graph_name = "http://zbw.eu/beta/mix-n-match-$catalog_id/ng";

# initialize rest client
my $client = REST::Client->new();

# get catalog file (tsv)
$client->GET($mnm_url);
my $mnm_ref;
eval {
  my $result = $client->responseContent();
  $mnm_ref = csv(
    in         => \$result,
    sep_char   => "\t",
    quote_char => undef,
    binary     => 1,
    auto_diag  => 1,
    headers    => 'auto'
  );
};
if ($@) {
  die "Error parsing response: ", $client->responseContent(), "\n";
}

# format as turtle
my @statements;
foreach my $entry ( @{$mnm_ref} ) {
  push( @statements,
        "<$URI{$dataset}$entry->{external_id}> "
      . "<http://purl.org/dc/elements/1.1/identifier> "
      . "'$entry->{'#entry_id'}' ." );
}

# load as named graph
$client->PUT(
  "$endpoint?graph=$graph_name",
  join( "\n", @statements ),
  { 'Content-type' => 'text/turtle' },
);
print "Endpoint response for loading into graph <$graph_name>:\n"
  . $client->responseContent();

