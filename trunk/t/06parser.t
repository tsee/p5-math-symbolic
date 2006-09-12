# BEGIN{$::RD_HINT = 1;}

use strict;
use warnings;

use Test::More tests => 14;

BEGIN {
	use_ok('Math::Symbolic');
}

if ($ENV{TEST_YAPP_PARSER}) {
	require Math::Symbolic::Parser::Yapp;
	$Math::Symbolic::Parser = Math::Symbolic::Parser::Yapp->new();
}

use Math::Symbolic::ExportConstants qw/:all/;

my $tree;
undef $@;
eval <<'HERE';
$tree = Math::Symbolic->parse_from_string('2');
HERE
ok( ( !$@ and ref($tree) eq 'Math::Symbolic::Constant' ), 'Parsing constants' );

my $str;
undef $@;
eval <<'HERE';
$tree = Math::Symbolic->parse_from_string('2*2');
HERE
$str = $tree->to_string();
$str =~ s/\(|\)|\s+//g;
ok( ( !$@ and $str eq '2*2' ), 'Parsing multiplication' );

undef $@;
eval <<'HERE';
$tree = Math::Symbolic->parse_from_string('(2+2)*2');
HERE
$str = $tree->to_string();
$str =~ s/\s+//g;
ok( ( !$@ and $str eq '(2+2)*2' ), 'Parsing parens and addition, precedence' );

undef $@;
eval <<'HERE';
$tree = Math::Symbolic->parse_from_string('2-2+2-2');
HERE
# as of version 0.160, this is no longer true.
# The parser doesn't reorder the same way it used to.
# It was a bad test anyway.
#$str = $tree->to_string();
#$str =~ s/\s+//g;
#ok(
#    ( !$@ and $str eq '((2+2)-2)-2' ),
#    'Parsing difference, chaining, reordering'
#);

ok( !$@, 'no fatal error.');
is($tree->value(), 2+2-2-2, 'Parsing difference, chaining.' );

undef $@;
eval <<'HERE';
$tree = Math::Symbolic->parse_from_string('-2');
HERE
$str = $tree->to_string();
$str =~ s/\s+//g;
ok( ( !$@ and $str eq '-2' ), 'Parsing unary' );

undef $@;
eval <<'HERE';
$tree = Math::Symbolic->parse_from_string('5^log(2,4)');
HERE
$str = $tree->to_string('prefix');
$str =~ s/\s+//g;
ok( ( !$@ and $str eq 'exponentiate(5,log(2,4))' ), 'Parsing exp and log' );

undef $@;
eval <<'HERE';
$tree = Math::Symbolic->parse_from_string('1+2*(-5)^log(2,4)');
HERE
$str = $tree->to_string('prefix');
$str =~ s/\s+//g;
ok( ( !$@ and $str eq 'add(1,multiply(2,exponentiate(-5,log(2,4))))' or $str eq 'add(1,multiply(2,exponentiate(negate(5),log(2,4))))' ),
    'Parsing complicated term' );

undef $@;
eval <<'HERE';
$tree = Math::Symbolic->parse_from_string('cos(sin(1+2*-5^log(2,4)))');
HERE
$str = $tree->to_string('prefix');
$str =~ s/\s+//g;
ok(
    (
        !$@
          and $str eq
          'cos(sin(add(1,multiply(2,exponentiate(-5,log(2,4))))))'
		  or $str eq
          'cos(sin(add(1,multiply(2,exponentiate(negate(5),log(2,4))))))'
    ),
    'Parsing complicated term involving sine and cosine'
);

my $res;
eval {
$res = Math::Symbolic->parse_from_string('blah[blubb');
};
ok((not defined($res)), 'Parse fails on invalid string.');

eval {
    $res = Math::Symbolic->parse_from_string('exp(a*b)');
};
ok( !$@, 'parsing exp() does not throw an error');
isa_ok($res, 'Math::Symbolic::Operator', 'parsing exp() returns an operator');
my $string = $res->to_string('prefix');
ok( ($string =~ /^exponentiate\(2\.7\d*,\s*multiply\(a,\s*b\)\)$/),
    'Parse of exp() turns it into e^()'
);

