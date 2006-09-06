
use strict;
use warnings;
#########################

use Test::More tests => 273;
use_ok('Math::Symbolic');
use_ok('Math::Symbolic::Custom::Pattern');
use Math::Symbolic qw/parse_from_string/;

sub gen_pattern {
	my $str = shift;
	my $tree = parse_from_string($str);
	ok(defined $tree, "Parsed pattern string '$str' as Math::Symbolic tree." );
	my $pattern = Math::Symbolic::Custom::Pattern->new($tree);
	ok(ref($pattern)&& $pattern->isa('Math::Symbolic::Custom::Pattern'),
	"Converted '$str' to pattern using constructor"
	);
	$pattern = $tree->to_pattern();
	ok(ref($pattern)&& $pattern->isa('Math::Symbolic::Custom::Pattern'),
	"Converted '$str' to pattern using to_pattern"
	);
	return $pattern;
}


my $tree;
my $tstr;

while (<DATA>) {
	chomp;
	next if /^\s*$/;
	next if /^\s*#/;
	if (/^\s*tree\s*:\s*(.+)$/i) {
		$tstr = $1;
		$tree = parse_from_string($tstr);
		ok(defined($tree)&& ref($tree) =~ /^Math::Symbolic/, "Parsed string '$tstr' as Math::Symbolic tree." );
	}
	elsif (not defined $tree) {
		die "Cannot run tests without a tree line to start with.";
	}
	elsif (/^\s*(not okay|okay)\s*:\s*(.+)$/i) {
		my $status = lc($1);
		my $pstr = $2;
		$status = $status =~ /not okay/ ? 0 : 1;
		my $pattern = gen_pattern($pstr);
		my $is_status = $pattern->match($tree);
		$is_status = 0 if not defined $is_status;
		$is_status = 1 if $is_status;
		ok(
		( ($status and $is_status) or (!$status and !$status) ),
		"Pattern matches tree with expected status (Expected: $status, Real: $is_status)"
		);
		$is_status = $tree->is_of_form($pattern);
		$is_status = 0 if not defined $is_status;
		ok(
		( ($status and $is_status) or (!$status and !$status) ),
		"Tree is of form of pattern with expected status (Expected: $status, Real: $is_status)"
		);
	}
	else {
		die "Invalid test line: $_";
	}
}


__DATA__

tree: a
okay: VAR
okay: VAR_a
okay: VAR_a_b
okay: VAR_b_c_d
not okay: CONST
not okay: CONST_a
not okay: VAR + VAR
okay: TREE
okay: TREE_a
okay: TREE_a_b

tree: a + b
not okay: VAR
not okay: VAR_a
not okay: VAR_a_b
not okay: VAR_b_c_d
not okay: CONST
not okay: CONST_a
okay: VAR + VAR
okay: VAR_f + VAR_g
not okay: VAR_r + VAR_r
not okay: VAR - VAR
okay: TREE
okay: TREE_a + TREE_b
not okay: TREE_a + TREE_a
okay: TREE_a_b
okay: TREE_a_b + TREE_a_b
okay: VAR_a_b + VAR_a_b
not okay: CONST + CONST

tree: ((1 * 1 + 2) + 3) - 2 / (1*1)
okay: TREE
not okay: VAR
not okay: CONST
okay: TREE_a
okay: TREE_a_b_c
okay: TREE - TREE
okay: TREE_a - TREE_b
not okay: TREE_a - TREE_a
okay: TREE - CONST / TREE
okay: (TREE_a_b + TREE_a_b) + CONST - TREE_a_b / TREE_a_b
not okay: (TREE_a_b + TREE_a_b) + CONST - TREE_a_b / TREE_a_b
not okay: (TREE_b + TREE_b) + CONST - TREE_a_b / TREE_a_b
okay: (TREE_a + CONST_b) + CONST_c - CONST_a / TREE_a
okay: (TREE_a_b + TREE_b) + CONST - TREE_a_b / TREE_a_b
not okay: TREE / TREE

tree: (a/b + b/c) + c/d
okay: TREE
okay: TREE + TREE + TREE
okay: VAR_1/VAR_2 + VAR_2/VAR_3 + VAR_3/VAR_4
not okay: VAR_2/VAR_2 + VAR_2/VAR_3 + VAR_3/VAR_4
okay: a/VAR_2 + VAR_2/VAR_3 + VAR_3/VAR_4
not okay: a/b + VAR_2/VAR_3 + VAR_3/VAR_4

tree: sin(a*b^cos(foo-atan(bar)))+cos(1)
okay: TREE + TREE
okay: sin(a*b^cos(foo-atan(bar)))+cos(TREE)

tree: ((sin(a*b^cos(foo-atan(bar)))+cos(1))+(sin(a*b^cos(foo-atan(bar)))+cos(1)))+((sin(a*b^cos(foo-atan(bar)))+cos(1))+(sin(a*b^cos(foo-atan(bar)))+cos(1)))
okay: TREE
okay: TREE + TREE
okay: TREE_a + TREE_a


