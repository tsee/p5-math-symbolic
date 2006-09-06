#!/usr/bin/perl
use strict;
use warnings;
use lib 'lib';
use Math::Symbolic qw/:all/;
use Math::Symbolic::Custom::Pattern;
use Time::HiRes qw/time/;
use Data::Dumper;
use Benchmark;

my $pat_string = "a + VAR_foo - (1+VAR_foo)^TREE + 1+TREE - (1-VAR_foo^(VAR_bar*2+TREE))";
my $pat = parse_from_string($pat_string);
my $pattern = Math::Symbolic::Custom::Pattern->new($pat);

my $str_ok = "a + r - (1+r)^(r-1+fopo(a,v)*2) + 1+a^b*r - (1-r^(a*2+2^2))";
#my $str_ok = "a + b - (1+b)^3";
my $tree_ok = parse_from_string($str_ok);

print $pattern->match($tree_ok) ? 'tree_ok okay' : 'tree_ok not okay';
print "\n";
my $tree_nok = parse_from_string("a + b - (1+c)^3");
print $pattern->match($tree_nok) ? 'tree_nok okay' : 'tree_nok not okay';
print "\n";
timethese( -3, {
	okay => sub {$pattern->match($tree_ok)},
	not_okay => sub {$pattern->match($tree_nok)},
	iokay => sub {$tree_ok->is_of_form($pattern)},
	inot_okay => sub {$tree_nok->is_of_form($pattern)},
	pokay => sub {$tree_ok->is_of_form($pat_string)},
	pnot_okay => sub {$tree_nok->is_of_form($pat_string)},
	tokay => sub {$tree_ok->is_of_form($pat)},
	tnot_okay => sub {$tree_nok->is_of_form($pat)},
	id_okay => sub {$tree_ok->is_identical($tree_ok)},
	id_not_okay => sub {$tree_nok->is_identical($tree_nok)},
}
);


