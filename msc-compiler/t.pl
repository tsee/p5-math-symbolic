use strict;
use warnings;
use Math::Symbolic qw/:all/;
#use lib 'lib';
use Math::Symbolic::Custom::CCompiler;
use Benchmark;

print "Parsing function...\n";
my $f = parse_from_string('partial_derivative(partial_derivative(partial_derivative(sin(a)^cos(a)+sinh(a)/5*cosh(a)*sin(a)*cos(a), a), a), a)');
print "Simplifying function...\n";
$f = $f->simplify();
print "Deriving function...\n";
$f = $f->apply_derivatives();
print "Simplifying function again...\n";
$f = $f->simplify();
#$f = $f->apply_derivatives();
#$f = $f->simplify();
print $f;
print "\n\n";
print "Prepared function.\n";
my $perlfunc;
my $cfunc;
my $tree;
timethese(1,
{to_perl => sub{
		($perlfunc,$tree) =
		Math::Symbolic::Compiler->compile_to_sub($f);
	},
to_c => sub {$cfunc = $f->to_compiled_c();},
});
my @a = (1);

timethese(-5,
	{
		evaluated => sub {
			foreach my $a (@a) {
				$f->value(a => $a);
			}
		},
		perlfunc => sub {
			foreach my $a (@a) {
				$perlfunc->($a);
			}
		},
		cfunc => sub {
			foreach my $a (@a) {
				$cfunc->($a);
			}
		},
	}
);

