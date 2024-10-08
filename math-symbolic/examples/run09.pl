#!/usr/bin/perl
use strict;
use warnings;

use lib '../lib';
use Data::Dumper;

use Math::Symbolic qw/:all/;

my $var = Math::Symbolic::Variable->new();
my $a   = $var->new( 'x' => 3.14159 );

my $two = Math::Symbolic::Constant->new(2);

print "Vars: x=" . $a->value() . " (Value is optional)\n\n";

my $op  = Math::Symbolic::Operator->new();
my $sin = $op->new( 'tan', $op->new( '*', $two, $a ) );

print "Expression: tan(x)\n\n";

print "prefix notation and evaluation:\n";
print $sin->to_string('prefix') . " = " . $sin->value() . "\n\n";

print "Now, we derive this partially to x: (prefix again)\n";

my $n_tree = $op->new(
    {
        type     => U_P_DERIVATIVE,
        operands => [ $sin, $a ],
    }
);

print $n_tree->to_string('prefix') . " = " . $n_tree->value() . "\n\n";

print "Now, we apply the derivative to the term: (infix)\n";
my $derived = $n_tree->apply_derivatives();

print "$derived" . " = " . $derived->value() . "\n\n";

print "Finally, we simplify the derived term as much as possible:\n";
$derived = $derived->simplify();
print "$derived = " . $derived->value() . "\n\n";

print "Two more derivatives:\n\n";
for ( 1 .. 2 ) {
    $derived = $op->new(
        {
            type     => U_P_DERIVATIVE,
            operands => [ $derived, $a ],
        }
    )->apply_derivatives()->simplify();
    print "$derived\n\n";
}

