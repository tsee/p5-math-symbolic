#!/usr/bin/perl
use strict;
use warnings;

# Perl solving a physics / electrodynamics problem involving
# symbolic mathematics, derivatives and complex numbers:

use lib '../lib';
use Math::Symbolic qw/:all/;
use Math::Complex;

# Given the following simple circuit:
#
#  ----|||||-----/\/\/\----       (R = resistor,
# |      R          L      |       L = solenoid,
# |                        |       U = alternating voltage)
#  ---------O ~ O----------
#            U(t)
#
# Question: What's the current in this circuit?
#
# We'll need some physics before letting the computer do the
# math:
# Applying Kirchhoff's rules, one quickly ends up with the
# following differential equation for the current:
#     (L * dI/dt) + (R * I)  =  U
# U (voltage) and I (current) are specified as functions of time t
my $left  = parse_from_string('L * total_derivative(I(t), t) + R * I(t)');
my $right = parse_from_string('U(t)');

print "Voltage/Current relation for circuit: $left = $right\n";

# If we understand current and voltage to be complex functions,
# we'll be able to derive. ("'" denoting complex here)
#    I'(t) = I'_max * e^(i*omega*t)
#    U'(t) = U_max  * e^(i*omega*t)
# (Please note that omega is the frequency of the alternating voltage.
# For example, the voltage from German outlets has a frequency of 50Hz.)

my $argument = parse_from_string('e^(i*omega*t)');
my $current  = parse_from_string('I_max') * $argument;
my $voltage  = parse_from_string('U_max') * $argument;

print "\n";
print "Current = $current\n";
print "Voltage = $voltage\n";
print "\n";

# Putting it into the equation:
$left->implement( I  => $current );
$right->implement( U => $voltage );
$left = $left->apply_derivatives()->simplify();

print "Voltage/Current relation for circuit: $left = $right\n\n";

# Now, we can solve the equation to get a complex function for
# the current:

$left  /= $argument;
$right /= $argument;

my $quotient = parse_from_string('R + i*omega*L');

$left  /= $quotient;
$right /= $quotient;

# Now we have:
#    $left    = $right
#    I_max(t) = U_max / (R + i*omega*L)
# But I_max(t) is still complex and so is the right-hand-side of the
# equation!

# Making the symbolic i a "literal" Math::Complex i
$right->implement(
    e => Math::Symbolic::Constant->euler(),
    i => Math::Symbolic::Constant->new(i),      # Math::Complex magic
);

print "RHS of circuit equation: $right\n\n";

# Now, we're dealing with alternating current and voltage.
# So let's make a generator that generates nice current
# functions of time!
#   I(t) = Re(I_max(t)) * cos(omega*t - phase);

# Usage: generate_current(U_Max, R, L, omega, phase)
sub generate_current {
    my $current = $right->new();    # cloning

    $current *= parse_from_string('cos(omega*t - phase)');

    $current->implement(
        U_max => $_[0],
        R     => $_[1],
        L     => $_[2],
        omega => $_[3],
        phase => $_[4],
    );
    $current = $current->simplify();
    return sub { Re( $current->value( t => $_[0] ) ) };
}

print "Sample current function with: 230 V, 200 Ohms, 0.1 H, 50 Hz, PI/4\n";

my $current_of_time = generate_current( 230, 200, 0.1, 50, PI / 4 );
    
for (my $t = 0; $t < 0.03; $t += 0.001) {
    print "Current at ", sprintf("%.3f", $t), " seconds:\t", sprintf("%.5f", $current_of_time->($t)), " A\n";
}
