#!/bin/sh
# nbt, 22.12.2021

# create sectioned refine and qs files for a sub-thesaurs

SEARCH=B.01.01.01
for replace in B.00 B.01 B.02 B.03 B.04 B.05 B.06 B.07 B.08 B.09 B.10 ; do 
  # activate only for initial production
  ##./make_openrefine_input.sh stw stw_openrefine $SEARCH $replace
  perl missing_wd_item_from_stw.pl $SEARCH $replace
done
