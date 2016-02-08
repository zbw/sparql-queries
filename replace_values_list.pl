#!/usr/bin/perl

# Replace a single value in a SPARQL VALUES clause by a list of values
# obtained from an external file

use strict;
use warnings;

use File::Slurp;

if (@ARGV < 2) {
  print "usage: $0 query_file values_list\n";
  exit;
}

my $QUERY = read_file($ARGV[0]);
my $VALUES = read_file($ARGV[1]);

# Restrictions:
# - only one values clause
# - only one single value in the clause
$QUERY =~ s/ ( \s+ values \s+ .*? \s+ { ) .*? \s+ } /$1\n$VALUES\n}/ixms;

print $QUERY;

