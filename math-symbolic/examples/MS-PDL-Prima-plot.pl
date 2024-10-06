#!/usr/bin/perl
#
# If you have PDL and Prima installed it is possible to quickly get a graph of a simple function y = f(x).
# In this script, specify the function on the command line e.g.: MS-PDL-Prima-plot.pl "x^2 + 2*x + 1"
# and it will pop up a window with the graph in. Right-click to get menus where you can adjust axes etc.
# See PDL::Graphics::Prima::Simple for more details.
use strict;
use warnings;
use PDL;
use PDL::Graphics::Prima::Simple [1024, 768], 'plot';
use Math::Symbolic qw/:all/;

# 1. Ensure the user has entered something on the command line
my $expr = $ARGV[0] or die qq/Please enter a Math::Symbolic-compatible expression for f(x), e.g. "(x+2)*(x-1)^2"\n/;

# 2. Try to get Math::Symbolic to parse it.
my $f = parse_from_string($expr);
if ( not defined $f ) {
    die "Could not parse the inputted expression. Please make sure the expression is written in a format compatible with Math::Symbolic.\n";
}

# 3. Check to ensure it is a function of 1 variable.
my @sig = $f->explicit_signature();
if (scalar(@sig)>1) {
    die "Please make sure your expression is a function of one variable.\n";
}

# 4. Compile the expression to a sub.
my ($func_ref) = Math::Symbolic::Compiler->compile_to_sub($f);

# 5. Provide the sub to the PDL::Graphics::Prima::Simple plot function with some reasonable defaults.
plot(
    title => "y = $f",
    backColor => cl::White,
    color => cl::Black,
    -data => ds::Func(
        $func_ref,
        lineWidth => 1,
        color => cl::LightBlue,
        ),
);


