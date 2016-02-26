#!/usr/bin/perl
# nbt, 27.2.2016

# load synonym_by_xyz_id.rq queries from github and execute

use strict;
use warnings;

use File::Slurp;
use REST::Client;
use URI::Escape;
use WWW::Github::Files;

my @QUERIES  = qw/ synonyms_by_stw_id synonyms_by_gnd_id /;
my $ENDPOINT = 'http://zbw.eu/beta/sparql/stw/query';

# queries are downloaded from a github repository
my $gitfiles = WWW::Github::Files->new(
  author => 'jneubert',
  resp   => 'sparql-queries',
  branch => 'master',
);

# initialize rest client
my $client = REST::Client->new();

foreach my $query_name (@QUERIES) {

  # get query from github and encode it
  my $query = uri_escape( $gitfiles->get_file("/stw/$query_name.rq") );

  # create GET url
  my $url = $ENDPOINT . '?query=' . $query;

  # execute the request (may also ask for 'text/csv') and write response to file
  $client->GET( $url, { 'Accept' => 'application/sparql-results+json' } );
  write_file( $query_name . '.json', $client->responseContent() );
}

