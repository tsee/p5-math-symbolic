#!perl
use strict;
use warnings;
use Carp qw/croak/;
use Test::More tests => 7;
BEGIN {
    use_ok('Math::Symbolic');
}
use Math::Symbolic qw/:all/;
use Math::Symbolic::Derivative qw/partial_derivative/;

if ($ENV{TEST_YAPP_PARSER}) {
	require Math::Symbolic::Parser::Yapp;
	$Math::Symbolic::Parser = Math::Symbolic::Parser::Yapp->new();
}


my @f = (
    [
        q{-a+b*x},
        q{b}
    ],
    [
        q{a+b*x+c*x^2},
        q{b+2*c*x}
    ],
    [
        q{a+x+}.join('+', map {"x^$_"} 2..10),
        '1+'.join('+', map {"$_*x^".($_-1)} 2..10)
    ],
    [
        q{sin(2*x)*cos(3*x)},
        q{2*cos(2*x)*cos(3*x)-3*sin(3*x)*sin(2*x)},
    ],
    [
        q{log(a, 2*x)},
        q{2/(log(2.71828182845905, a)*2*x)},
        { x => sub {$_[0] > 0}, a => sub {$_[0] > 0}, }
    ],
    [
        q{x/x^2},
        q{-1/x^2},
        { x => sub {$_[0] > 0} },
    ],
);

foreach my $ref (@f) {
    my ($f, $deriv) = map { parse_from_string($_) } @{$ref}[0,1];
    my $limits = $ref->[2];
    die "parse of '$ref->[0]' failed" if not defined $f;
    die "parse of '$ref->[1]' failed" if not defined $deriv;
    my $d = partial_derivative($f, 'x');
    ok($d->test_num_equiv($deriv, limits => $limits), "$d == $deriv");
}

