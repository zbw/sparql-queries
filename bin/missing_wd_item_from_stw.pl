#!/bin/env perl
# nbt, 11.4.2017

# create a list of STW concepts which have no links in Wikidata,
# with links invoking Quickstatements for adding these concepts

use strict;
use warnings;
use open ":encoding(utf8)";

binmode STDOUT, ":utf8";

use Data::Dumper;
use JSON qw'decode_json encode_json';
use Path::Tiny;
use REST::Client;

#use Text::Truncate;
use URI::Escape;

my $ENDPOINT = 'http://zbw.eu/beta/sparql/stw/query';
##my $ENDPOINT = 'http://172.16.10.102:3030/ebds/query';
my $QUERY_FN = '../stw/wikidata_item_candidate.rq';

my $result_data;

# initialize rest client
my $client = REST::Client->new( timeout => 600 );

# get query and encode it
my $query = path($QUERY_FN)->slurp;
$query = uri_escape($query);

# create GET url
my $url = $ENDPOINT . '?query=' . $query;

# execute the request (may also ask for 'text/csv') and write response to file
$client->GET( $url, { 'Accept' => 'application/sparql-results+json' } );
eval {
  my $json = $client->responseContent();
  $result_data = decode_json($json);
};
if ($@) {
  die "Error parsing response: ", $client->responseContent(), "\n";
}

my $stw_retrieved           = "|S813|+2018-08-24T00:00:00Z/10";
my $stw_reference_statement = "|S248|Q26903352$stw_retrieved";

foreach my $entry ( @{ $result_data->{results}->{bindings} } ) {

  print Dumper $entry;

  print "CREATE\n";

  foreach my $lang (qw/ de en /) {
    
    # labels and aliases
    foreach my $type ( qw/ L A / ) {
      my $field = "${type}_$lang";
      if ($entry->{$field}{value} ) {
        my @labels = split(/\|/, $entry->{$field}{value});
        foreach my $label (@labels) {
          # skip items with excessive altLabels
          next if (scalar(@labels) > 10);
          if ($lang eq 'en') {
            $label = lcfirst($label);
          }
          print "LAST|$type$lang|\"$label\"\n";
        }
      }
    }
  }
  # set record specific source statements
  my $source_statement = "|S248|Q26903352|S3911|\"$entry->{stwId}{value}\""
    . "|S1476|en:\"$entry->{L_en}{value}\"$stw_retrieved";

  # economical concept
  print "LAST|P31|Q29028649$source_statement\n";

  # external IDs
  if ( $entry->{gndId} ) {
    print "LAST|P227|\"$entry->{gndId}->{value}\"$source_statement\n";
  }
  # stw id
  print "LAST|P3911|\"$entry->{stwId}{value}\"\n";

  exit;
}

