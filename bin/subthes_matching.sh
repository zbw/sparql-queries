#!/bin/sh
# nbt, 22.12.2021

# create sectioned refine and qs files for a sub-thesaurs

SEARCH=B.01.01.01

cd /opt/sparql-queries/bin
for replace in N.00 N.01 N.02 N.03 N.04 N.05 N.06 N.07 N.08 N.09 N.10 V.00 V.01 V.02 V.03 V.04 V.05 V.06 V.07 V.08 V.09 V.10 V.11 V.12 V.13 V.14; do 
  # activate only for initial production
  ##./make_openrefine_input.sh stw stw_openrefine $SEARCH $replace
  perl ./missing_wd_item_from_stw.pl $SEARCH $replace
done
