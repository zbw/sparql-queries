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

Readonly my $MNM_URL_TEMPLATE =>
  'https://mix-n-match.toolforge.org/api.php?query=download2&catalogs=CATALOG_ID&as_file=1';
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

