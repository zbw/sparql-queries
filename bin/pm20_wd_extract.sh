#!/bin/sh

# Add a wikidata graph with an extract of WD for items with PM20 id
# and aggregated values

cd /opt/sparql-queries/pm20

# extract PM20 relevant data
curl --silent -X POST -H "Accept: text/turtle" --data "query=`cat construct_wd_extract.rq`"  https://query.wikidata.org/sparql > results/construct_wd_extract.ttl

# create wikidata graph
curl --silent -X PUT -H "Content-Type: text/turtle" -d @results/construct_wd_extract.ttl http://localhost:3030/pm20/data?graph=http://zbw.eu/beta/wikidata/ng > /dev/null


# construct wp count
curl --silent -X POST -H "Accept: text/turtle" --data "query=`cat construct_wp_count.rq`"  https://query.wikidata.org/sparql > results/construct_wp_count.ttl

# add to wikidata graph
curl --silent -X POST -H "Content-Type: text/turtle" -d @results/construct_wp_count.ttl http://localhost:3030/pm20/data?graph=http://zbw.eu/beta/wikidata/ng  > /dev/null


# construct wp count
curl --silent -X POST -H "Accept: text/turtle" --data "query=`cat construct_wd_life.rq`"  https://query.wikidata.org/sparql > results/construct_wd_life.ttl

# add to wikidata graph
curl --silent -X POST -H "Content-Type: text/turtle" -d @results/construct_wd_life.ttl http://localhost:3030/pm20/data?graph=http://zbw.eu/beta/wikidata/ng  > /dev/null


