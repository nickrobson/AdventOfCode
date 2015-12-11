#!/usr/bin/env perl

use List::Util qw[min max];

open(F, 'input') or die 'Failed to open input.';

my $required = 0;
foreach my $line (<F>) {
    my @dims = sort { $a <=> $b } split /x/, $line;
    my $min_dim = $dims[0] * $dims[1];
    my $area = 2 * ($dims[0] * $dims[1] + $dims[0] * $dims[2] + $dims[1] * $dims[2]);
    $required += $area + $min_dim;
}

print "Required wrapping paper: $required square feet"