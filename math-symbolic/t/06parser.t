#!perl
# BEGIN{$::RD_HINT = 1;}

use strict;
use warnings;

use Test::More tests => 23+15+9+3+8;

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
#ok( ($string =~ /^exponentiate\(2\.7\d*,\s*multiply\(a,\s*b\)\)$/),    # NOTE: stringifying e no longer produces a number
ok( ($string =~ /^exponentiate\(e,\s*multiply\(a,\s*b\)\)$/),
    'Parse of exp() turns it into e^()'
);

eval {
    $res = Math::Symbolic->parse_from_string('sqrt(a*b)');
};
ok( !$@, 'parsing sqrt() does not throw an error');
isa_ok($res, 'Math::Symbolic::Operator', 'parsing sqrt() returns an operator');
$string = $res->to_string('prefix');
ok( ($string =~ /^exponentiate\(multiply\(a,\s*b\), 0.5\)$/),
    'Parse of sqrt() turns it into ()^0.5'
);

eval {
    $res = Math::Symbolic->parse_from_string('ln(a*b)');
};
ok( !$@, 'parsing ln() does not throw an error');
isa_ok($res, 'Math::Symbolic::Operator', 'parsing ln() returns an operator');
$string = $res->to_string('prefix');
#ok( ($string =~ /^log\(2\.7\d*,\s*multiply\(a,\s*b\)\)$/),         # NOTE: stringifying e no longer produces a number
ok( ($string =~ /^log\(e,\s*multiply\(a,\s*b\)\)$/),
    'Parse of ln(x) turns it into log(e,x)'
);

eval {
    $res = Math::Symbolic->parse_from_string('pi');
};
ok( !$@, 'parsing pi does not throw an error');
isa_ok($res, 'Math::Symbolic::Constant', 'parsing pi returns a constant');
$string = $res->to_string();
ok( $string eq 'pi', 'stringifying constant pi returns "pi"');
ok( $res->value() =~ m/^3\.14159265/, 'evaluating pi returns a number that looks like pi');

eval {
    $res = Math::Symbolic->parse_from_string('e');
};
ok( !$@, 'parsing e does not throw an error');
isa_ok($res, 'Math::Symbolic::Constant', 'parsing e returns a constant');
$string = $res->to_string();
ok( $string eq 'e', 'stringifying constant e returns "e"');
ok( $res->value() =~ m/^2\.71828182/, 'evaluating e returns a number that looks like e');

# test the ' notation
sub test_parse {
  my ($str, $type, $cmpregex) = @_;
  my $res;
  eval <<HERE;
      \$res = Math::Symbolic->parse_from_string(q{$str});
HERE
  ok( !$@, "parsing '$str' does not throw an error");
  warn "Error was: $@" if $@;
  isa_ok($res, "Math::Symbolic::$type", "parsing '$str' returns an operator");
  my $string = $res->to_string('prefix');
  ok( ($string =~ $cmpregex),
      "Parse of '$str' turns it into $cmpregex"
  );
}

my @testsets = (
  [
    "f'(x)", "Operator",
    qr/^partial_derivative\(f,\s*x\)$/,
  ],
  [
    "f'", "Operator",
    qr/^partial_derivative\(f,\s*x\)$/,
  ],
  [
    "f'(a)", "Operator",
    qr/^partial_derivative\(f,\s*a\)$/,
  ],
  [
    "f'(a, x)", "Operator",
    qr/^partial_derivative\(f,\s*a\)$/,
  ],
  [
    "f''(x)", "Operator",
    qr/^partial_derivative\(partial_derivative\(f,\s*x\),\s*x\)$/,
  ],
  [
    "f''", "Operator",
    qr/^partial_derivative\(partial_derivative\(f,\s*x\),\s*x\)$/,
  ],
  [
    "f''(a)", "Operator",
    qr/^partial_derivative\(partial_derivative\(f,\s*a\),\s*a\)$/,
  ],
  [
    "f''(a, x)", "Operator",
    qr/^partial_derivative\(partial_derivative\(f,\s*a\),\s*a\)$/,
  ],
);

foreach my $testset (@testsets) {
  test_parse(@$testset);
}



# test failure of parse_from_string
eval {
    $res = Math::Symbolic::parse_from_string();
};
ok ($@, 'parse_from_string complains about being called without args');

eval {
    $res = Math::Symbolic->parse_from_string();
};
ok ($@, 'parse_from_string complains about being called as method without args');

$Math::Symbolic::Parser = undef;
eval {
    $res = Math::Symbolic::parse_from_string('2');
};
ok(!$@ && ref($res) =~ /^Math::Symbolic/, 'parse_from_string creates a new parser if necessary');


my $yapp = Math::Symbolic::Parser->new(implementation => 'Yapp');
isa_ok($yapp, 'Math::Symbolic::Parser::Yapp');

my $rd = Math::Symbolic::Parser->new(implementation => 'RecDescent', recompile => 1);
ok(defined($rd) && $rd->isa('Parse::RecDescent')||$rd->isa('Math::Symbolic::Parser::Precompiled'), 'chose implementation RecDescent');

eval {$rd = Math::Symbolic::Parser->new(implementation=>'foo');};
ok ($@, 'Cannot create parser of unknown implementation');

