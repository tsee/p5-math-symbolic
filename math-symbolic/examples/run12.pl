#!/usr/bin/perl
use strict;
use warnings;

use lib '../lib';
use Math::Symbolic qw/:all/;

# A particle being thrown on the earth:

# general equations

# total mechanical energy in the system
my $energy = parse_from_string('E_pot(y) + E_kin(v)');

# expression for velocity obtained from the derivatives of the expressions for position at a given time
my $velocity =
  parse_from_string(
    '( total_derivative(x(t), t)^2 + total_derivative(y(t), t)^2 )^0.5');

# expressions for the x and y positions at time t
my $x = parse_from_string('x_initial + v_x_initial * t');
my $y = parse_from_string('y_initial + v_y_initial * t - (g*t^2)/2');

# fill in the missing functions
$y->implement( g => parse_from_string('9.8') );

$velocity->implement(
    'x' => $x,
    'y' => $y
);

$velocity = $velocity->apply_derivatives()->simplify();

$energy->implement(
    E_pot => parse_from_string('m * g * y(t)'),         # potential energy
    E_kin => parse_from_string('0.5 * m * v(t)^2')      # kinetic energy
);

# specific example using the above equations
my %initial_values = (
    x_initial   => Math::Symbolic::Constant->new(0),
    y_initial   => Math::Symbolic::Constant->new(0),
    v_x_initial => Math::Symbolic::Constant->new(5),
    v_y_initial => Math::Symbolic::Constant->new(2),
);

my $specific_velocity = $velocity->new()->implement(%initial_values);

my $specific_energy = $energy->new();
$specific_energy->implement(
    'g' => parse_from_string('9.8'),
    'm' => Math::Symbolic::Constant->new(5),
    'v' => $specific_velocity,
    'y' => $y->new()->implement(%initial_values),
);

# simplify these resulting expressions
$specific_velocity = $specific_velocity->simplify();
$specific_energy = $specific_energy->simplify();

print "Expression for velocity: $specific_velocity\n";
print "Expression for energy: $specific_energy\n";
print "\n";

# compile the expressions to Perl subs
my ($sub_v) = Math::Symbolic::Compiler->compile_to_sub($specific_velocity);
my ($sub_e) = Math::Symbolic::Compiler->compile_to_sub($specific_energy);

# run a (very coarse) simulation forward in time
for (my $time = 0; $time < 3.0; $time += 0.1 ) {
    print "At t = ", sprintf("%.1f", $time), ":\tAbsolute velocity =  ", sprintf("%.5f", $sub_v->($time)), " m/s;\tTotal energy = ", sprintf("%.5f", $sub_e->($time)), " J\n";
}


