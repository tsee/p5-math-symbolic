#!perl
use strict;
use warnings;

use Test::More tests => 6;

BEGIN {
	use_ok('Math::Symbolic');
}

if ($ENV{TEST_YAPP_PARSER}) {
	require Math::Symbolic::Parser::Yapp;
	$Math::Symbolic::Parser = Math::Symbolic::Parser::Yapp->new();
}

use Math::Symbolic::ExportConstants qw/:all/;

my $x = Math::Symbolic::parse_from_string('1+2');
ok(
    $x->apply_constant_fold()->to_string() eq '3',
    'apply_constant_fold() working for simple case'
);

$x = Math::Symbolic::parse_from_string('a');
ok(
    $x->apply_constant_fold()->to_string() eq 'a',
    'apply_constant_fold() working for simple case'
);

$x = Math::Symbolic::parse_from_string('a / (2 * 5)');
ok(
    $x->apply_constant_fold()->to_string() eq 'a / 10',
    'apply_constant_fold() working for simple case'
);

$x = Math::Symbolic::parse_from_string('d*acos(cos(1))');
ok(
    $x->apply_constant_fold()->to_string() eq 'd * 1',
    'apply_constant_fold() working for simple case'
);

$x = Math::Symbolic::parse_from_string('(1 + -2 * 7/(5+2) * 2^(3-1)) * d');
ok(
    $x->apply_constant_fold()->to_string() eq '-7 * d',
    'apply_constant_fold() working for simple case'
);

