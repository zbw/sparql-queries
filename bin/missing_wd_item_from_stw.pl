#!/usr/bin/env perl
# nbt, 23.8.2018

# Create a list of STW concepts which have no links in Wikidata,
# with Quickstatements to create an item.

# Pseudo-sparql result set with clickable QS links is useless, because links do
# not work with multiple statements - therefore use plain html.

use strict;
use warnings;
use open ":encoding(utf8)";

binmode STDOUT, ":utf8";

use Data::Dumper;
use JSON qw'decode_json encode_json';
use Path::Tiny;
use REST::Client;

my $ENDPOINT    = 'http://zbw.eu/beta/sparql/stw/query';
my $QUERY       = path('/opt/sparql-queries/stw/wikidata_item_candidate.rq');
my $OUTPUT_JSON = path('/var/www/html/beta/tmp/stw_qs_create.json');
my $OUTPUT_HTML = path('/var/www/html/beta/tmp/stw_qs_create.html');
my $TODAY       = `date +%F | tr -d "\n"`;
my $RETRIEVED   = "|S813|+${TODAY}T00:00:00Z/11";

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

# html head, one click selection of text to insert
my $html  = $OUTPUT_HTML->openw;
my $title = "QS: Create item from STW";
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
<p>In sync with Mix-n-match catalog <a
href="https://tools.wmflabs.org/mix-n-match/#/catalog/1259">STW W (de)</a>
(generated via <a
href="http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/wikidata_item_candidate.rq">query</a>
and <a
href="https://github.com/zbw/sparql-queries/blob/master/bin/missing_wd_item_from_stw.pl">script</a>)</p>
EOF

foreach my $entry ( @{ $result_data->{results}->{bindings} } ) {

  ##print Dumper $entry;

  my $label = "$entry->{L_de}{value} | $entry->{L_en}{value}";
  my $url   = $entry->{stw}{value};

  # start html entry
  print $html
    "\n<h3><a href='$url'>$label</a></h3>\n\n<pre class='force-select'>\n";

  print $html "CREATE\n";

  # labels, desriptions (from scope notes) and aliases
  foreach my $type (qw/ L D A /) {

    foreach my $lang (qw/ de en /) {

      my $field = "${type}_$lang";
      if ( $entry->{$field}{value} ) {
        my @labels = split( /\|/, $entry->{$field}{value} );
        foreach my $label (@labels) {

          # skip items with excessive altLabels
          next if ( scalar(@labels) > 10 );
          if ( $lang eq 'en' ) {
            $label = lcfirst($label);
          }
          print $html "LAST|$type$lang|\"$label\"\n";
        }
      }
    }

    # insert extra newline for visual separation
    if ( $entry->{"${type}_de"}{value} or $entry->{"${type}_en"}{value} ) {
      print $html "\n";
    }
  }

  # prepare record specific source statements
  my $source_statement = "|S248|Q26903352|S3911|\"$entry->{stwId}{value}\""
    . "|S1476|en:\"$entry->{L_en}{value}\"$RETRIEVED";

  # economical concept
  print $html "LAST|P31|Q29028649$source_statement\n";

  # external IDs
  if ( $entry->{gndId} ) {
    print $html "LAST|P227|\"$entry->{gndId}->{value}\"$source_statement\n";
  }

  # stw id with exact match
  print $html "LAST|P3911|\"$entry->{stwId}{value}\"|P4390|Q39893449\n";

  # finish entry
  print $html "</pre>\n";

  ##last;
}

# finish html
print $html "\n</body></html>\n";

