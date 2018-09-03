#!/bin/env perl
# nbt, 6.8.2018

# Execute a query and extract a result column formatted for input
# into QuickStatements

use strict;
use warnings;

use Data::Dumper;
use JSON;
use Path::Tiny;
use REST::Client;

my ( $query_file, $qs_var );

if ( scalar(@ARGV) < 2 ) {
  print "usage: $0 query_file qs_var\n";
  exit;
} else {

  # file with the query
  $query_file = path( $ARGV[0] );
  if ( !-f $query_file ) {
    print "error: $query_file does not exist\n";
  }

  # SPARQLresult variable with the quickStatement
  $qs_var = $ARGV[1];
}

# read query
my $query = $query_file->slurp;

# dataset and endpoint are derived from the query directory
my $dataset  = $query_file->parent->basename;
my $endpoint = "http://zbw.eu/beta/sparql/$dataset/query";
if ( $dataset eq 'wikidata' ) {
  $endpoint = 'https://query.wikidata.org/sparql';
}

# output file derived from query file, plus date for repeated runs
my $date    = `date +%F | tr -d "\n"`;
my $outfile = $query_file->parent->child('results')
  ->child( $query_file->basename('.rq') . ".${date}.qs.txt" );

# initialize rest client
my $client = REST::Client->new();

# execute the query
$client->POST(
  $endpoint,
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

if ( scalar( @{ $result_data->{results}->{bindings} } ) eq 0 ) {
  print "Empty query result - nothing to do\n";
} else {

  # extract the QS statements
  my $count = 0;
  my $fh    = $outfile->openw_utf8;
  foreach my $entry ( @{ $result_data->{results}->{bindings} } ) {
    print $fh "$entry->{$qs_var}{value}\n";
    $count++;
  }
  close($fh);

  print "$count statements written to $outfile\n";
}
