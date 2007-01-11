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
    ok(num_equiv($d, $deriv, $limits), "$d == $deriv");
}

use Data::Dumper;
sub num_equiv {
    my ($t1, $t2, $limits, $tests, $eps) = @_;
    $limits ||= {};
    $tests ||= 20;
    $eps ||= 1e-7;
    my @s1 = $t1->signature();
    my @s2 = $t2->signature();

    my %sig = map {($_=>undef)} @s1, @s2;

    my $mult = 20;
    my $retry = 0;
    foreach (1..$tests) {
        croak("Could not evaluate test functions with numbers -10..10")
          if $retry > 5;
        for (keys %sig) {
            my $num = (rand() - 0.5)*$mult;
            redo if $limits->{$_} and not $limits->{$_}->($num);
            $sig{$_} = $num;
        }


        no warnings;
        my($y1, $y2);
        eval {$y1 = $t1->value(%sig);};
        if ($@) {
            warn "error during evaluation: $@";
            $retry++;
            $mult /= 2;
            redo;
        }
        eval {$y2 = $t2->value(%sig);};
        if ($@) {
            warn "error during evaluation: $@";
            $retry++;
            $mult /= 2;
            redo;
        }

        if (not defined $y1) {
            warn "Result of '$t1' not defined; ".Dumper(\%sig);
            next if not defined $y2;
            $retry++;
            redo;
        }
        elsif (not defined $y2) {
            warn "Result of '$t2' not defined; ".Dumper(\%sig);
            $retry++;
            redo;
        }


        warn("1: $y1, 2: $y2; ".Dumper(\%sig)),return 0 if $y1+$eps < $y2 or $y1-$eps > $y2;

        $mult = 20;
        $retry = 0;
    }

    return 1;
}
