use strict;
use warnings;

use Test::More tests => 4;

#use lib 'lib';

use_ok('Math::Symbolic');
use Math::Symbolic::ExportConstants qw/:all/;

my $var = Math::Symbolic::Variable->new();
my $a   = $var->new( 'x' => 2 );

my $c   = Math::Symbolic::Constant->zero();
my $two = $c->new(2);

print "Vars: x=" . $a->value() . " (Value is optional)\n\n";

my $op = Math::Symbolic::Operator->new();

my $sin;
undef $@;
eval <<'HERE';
$sin = $op->new('sin', $op->new('*', $two, $a));
HERE
ok( !$@, 'sine creation' );

print "Expression: sin(2*x)\n\n";

print "prefix notation and evaluation:\n";
undef $@;
eval <<'HERE';
print $sin->to_string('prefix') . "\n\n";
HERE
ok( !$@, 'sine to_string' );

print "Now, we derive this partially to x: (prefix again)\n";

my $n_tree = $op->new(
    {
        type     => U_P_DERIVATIVE,
        operands => [ $sin, $a ],
    }
);

print $n_tree->to_string('prefix') . "\n\n";

print "Now, we apply the derivative to the term: (infix)\n";

my $derived;
undef $@;
eval <<'HERE';
$derived = $n_tree->apply_derivatives();
HERE
ok( !$@, 'sine derivative' );

print "$derived\n\n";

print "Finally, we simplify the derived term as much as possible:\n";
$derived = $derived->simplify();
print "$derived\n\n";

print "Now, we do this three more times:\n";
for ( 1 .. 3 ) {
    $derived = $op->new(
        {
            type     => U_P_DERIVATIVE,
            operands => [ $derived, $a ],
        }
    )->apply_derivatives()->simplify();
}

print "$derived\n\n";

