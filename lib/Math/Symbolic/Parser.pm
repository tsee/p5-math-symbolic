
=head1 NAME

Math::Symbolic::Parser - Parse strings into Math::Symbolic trees

=head1 SYNOPSIS

  use Math::Symbolic::Parser;
  my $parser = Math::Symbolic::Parser->new();
  $string =~ s/\s+//g;
  my $tree = $parser->parse($string);
  
  # or better:
  use Math::Symbolic;
  my $tree = Math::Symbolic->parse_from_string($string);

=head1 DESCRIPTION

This module contains the parsing routines used by Math::Symbolic to
parse strings into Math::Symbolic trees. Usually, you will want
to simply use the Math::Symbolic->parse_from_string() class method
instead of this module directly. If you do, however, make sure to
remove any whitespace from your input string.

=head2 STRING FORMAT

The parser has been designed to parse strings that are reminiscient of
ordinary algebraic expressions including the standard arithmetic infix
operators such as multiplication. Many functions such as a rather
comprehensive set of trigonometric functions are parsed in prefix form
like 'sin(expression)' or 'log(base, expression)'. Unknown identifiers starting with a letter and containing only letters, digits, and underscores are
parsed as variables. If these identifiers are followed by parenthesis
containing a list of identifiers, the list is parsed as the signature of
the variable. Example: '5*x(t)' is parsed as the product of the constant five
and the variable 'x' which depends on 't'. These dependencies are
important for total derivatives.

The supported builtin-functions are listed in the documentation for
Math::Symbolic::Operator in the section on the new() constructor.

=head2 EXAMPLES

  # An example from analytical mechanics:
  my $hamilton_function =
          Math::Symbolic->parse_from_string(
            'p_q(q, dq_dt, t) * dq_dt(q, t) - Lagrange(q, p_q, t)'
          );

This parses as "The product
of the generalized impulse p_q (which is a function of the generalized
coordinate q, its derivative, and the time) and the derivative of the
generalized coordinate dq_dt (which depends on q itself and the time).
This term minus the Lagrange Function (of q, the impulse, and the time)
is the Hamilton Function."

Well, that's how it parses in my head anyway. The parser will generate a tree
like this:

  Operator {
    type     => difference,
    operands => (
                  Operator {
                    type     => product,
	            operands => (
                                  Variable {
                                    name         => p_q,
                                    dependencies => q, dq_dt, t
                                  },
                                  Variable {
                                     name         => dq_dt,
                                     dependencies => q, t
                                  }
                    )
                  },
                  Variable {
                    name         => Lagrange,
                    dependencies => q, p_q, t
                  }
                )
  }

Possibly a simpler example would be 'amplitude * sin(phi(t))' which
descibes an oscillation. sin(...) is assumed to be the sine function,
amplitude is assumed to be a symbol / variable that doesn't depend on any
others. phi is recognized as a variable that changes over time (t). So
phi(t) is actually a function of t that hasn't yet been specified.
phi(t) could look like 'omega*t + theta' where strictly speaking,
omega, t, and theta are all symbols without dependencies. So omega and theta
would be treated as constants if you derived them in respect to t.
Figuratively speaking, omega would be a frequency and theta would be a
initial value.

=head2 EXPORT

None by default.

=head1 CLASS DATA

While working with this module, you might get into the not-so-convient position
of having to debug the parser and/or its grammar. In order to make this
possible, there's the $DEBUG package variable which, when set to 1, makes
the parser warn which grammar elements are being processed. Note, however,
that their order is bottom-up, not top-down.

=cut

package Math::Symbolic::Parser;

use 5.006;
use strict;
use warnings;

use Carp;

use Math::Symbolic::ExportConstants qw/:all/;

#use Parse::RecDescent;
my $Required_Parse_RecDescent = 0;

our $VERSION = '0.201';
our $DEBUG   = 0;

our $Grammar = <<'GRAMMAR_END';
	parse: expr /^\Z/
			{
				$return = $item[1]
			}
	     | // {undef}

	expr: addition
			{
				#warn 'expr ' if $Math::Symbolic::Parser::DEBUG;
				$item[1]
			}

	addition: <leftop:multiplication add_op multiplication>
			{
				#warn 'addition '
				#  if $Math::Symbolic::Parser::DEBUG;
				if (@{$item[1]} == 1) {
					$item[1][0]
				}
				else {
					my @it = @{$item[1]};
					my $tree = shift @it;
					while (@it) {
						$tree = Math::Symbolic::Operator->new(
							shift(@it), $tree, shift(@it)
						);
					}
					$tree;
				}
			}

	add_op: '+'
	      | '-'

	multiplication: <leftop:exp mult_op exp>
			{
				#warn 'multiplication '
				#  if $Math::Symbolic::Parser::DEBUG;
				if (@{$item[1]} == 1) {
					$item[1][0]
				}
				else {
					my @it = @{$item[1]};
					my $tree = shift @it;
					while (@it) {
						$tree = Math::Symbolic::Operator->new(
							shift(@it), $tree, shift(@it)
						);
					}
					$tree;
				}
			}
  
	mult_op: '*'
	       | '/'


	exp: <rightop:factor '^' factor>
			{
				#warn 'exp ' if $Math::Symbolic::Parser::DEBUG;
				if (@{$item[1]} == 1) {
					$item[1][0]
				}
				else {
					my @it = reverse @{$item[1]};
					my $tree = shift @it;
					while (@it) {
						$tree = Math::Symbolic::Operator->new(
							'^', shift(@it), $tree
						);
					}
					$tree;
				}
			}

	factor: /(?:\+|-)*/ number
			{
				#warn 'unary_n '
				#  if $Math::Symbolic::Parser::DEBUG;
				if ($item[1]) {
					my @it = split //, $item[1];
					my $ret = $item[2];
					foreach (grep {$_ eq '-'} @it) {
						$ret = Math::Symbolic::Operator->new('neg',$ret);
					}
					$ret
				}
				else {
					$item[2]
				}
			}
			
	       | /(?:\+|-)*/ function
			{
				#warn 'unary_f '
				#  if $Math::Symbolic::Parser::DEBUG;
				if ($item[1]) {
					my @it = split //, $item[1];
					my $ret = $item[2];
					foreach (grep {$_ eq '-'} @it) {
						$ret = Math::Symbolic::Operator->new('neg',$ret);
					}
					$ret
				}
				else {
					$item[2]
				}
			}
			
	       | /(?:\+|-)*/ variable
			{
				#warn 'unary_v '
				#  if $Math::Symbolic::Parser::DEBUG;
				if ($item[1]) {
					my @it = split //, $item[1];
					my $ret = $item[2];
					foreach (grep {$_ eq '-'} @it) {
						$ret = Math::Symbolic::Operator->new('neg',$ret);
					}
					$ret
				}
				else {
					$item[2]
				}
			}

		| /(?:\+|-)*/ '(' expr ')'
			{
				#warn 'unary_expr '
				#	if $Math::Symbolic::Parser::DEBUG;
				if ($item[1]) {
					my @it = split //, $item[1];
					my $ret = $item[3];
					foreach (grep {$_ eq '-'} @it) {
						$ret = Math::Symbolic::Operator->new('neg',$ret);
					}
					$ret
				}
				else {
					$item[3]
				}
			}

	number:	/([+-]?)(?=\d|\.\d)\d*(\.\d*)?([Ee]([+-]?\d+))?/
			{
				#warn 'number '
				#  if $Math::Symbolic::Parser::DEBUG;
				Math::Symbolic::Constant->new($item[1])
			}

	function: function_name '(' expr_list ')'
			{
				#warn 'function ' 
				#  if $Math::Symbolic::Parser::DEBUG;
				my $function =
				  $Math::Symbolic::Operator::Op_Symbols{
				    $item[1]
				  };
				die "Invalid function '$item[1]'!"
				  unless defined $function;
					
				Math::Symbolic::Operator->new(
				  {
				    type => $function,
				    operands => $item[3],
				  }
				);
			}

	function_name: 'log'
		     | 'partial_derivative'
		     | 'total_derivative'
		     | 'sinh'
		     | 'cosh'
		     | 'asinh'
		     | 'acosh'
		     | 'asin'
		     | 'acos'
		     | 'atan'
		     | 'acot'
		     | 'sin'
		     | 'cos'
		     | 'tan'
		     | 'cot'


	expr_list: <leftop:expr ',' expr>
			{
				#warn 'expr_list '
				#  if $Math::Symbolic::Parser::DEBUG;
				$item[1]
			}

	variable: /[a-zA-Z][a-zA-Z0-9_]*/ '(' identifier_list ')'
			{
				#warn 'variable '
				#  if $Math::Symbolic::Parser::DEBUG;
				Math::Symbolic::Variable->new(
				  {
				    name => $item[1],
				    signature => $item[3],
				  }
				);
			}

		| /[a-zA-Z][a-zA-Z0-9_]*/
			{
				#warn 'variable '
				#  if $Math::Symbolic::Parser::DEBUG;
				Math::Symbolic::Variable->new( $item[1] );
			}

	identifier_list: <leftop:/[a-zA-Z][a-zA-Z0-9_]*/ ',' /[a-zA-Z][a-zA-Z0-9_]*/>
			{
				#warn 'identifier_list '
				#  if $Math::Symbolic::Parser::DEBUG;
				$item[1]
			}
	
GRAMMAR_END


=head2 Constructor new

This constructor does not expect any arguments and returns a Parse::RecDescent
parser to parse algebraic expressions from a string into Math::Symbolic
trees.

The constructor takes key/value pairs of options. Currently, the only option
is to regenerate the parser from the grammar in the scalar
$Math::Symbolic::Parser::Grammar instead of using the (faster) precompiled
grammar from Math::Symbolic::Parser::Precompiled.
You can enable recompilation from the grammar with the option
"recompile => 1".

=cut

sub new {
    my $class = shift;
    if ( not $Required_Parse_RecDescent ) {
        local $@;
        eval 'require Parse::RecDescent;';
        croak "Could not require Parse::RecDescent. Please install\n"
          . "Parse::RecDescent in order to use Math::Symbolic::Parser."
          if $@;
    }
    my %args = @_;
    my $parser;

    if ( exists $args{recompile} and $args{recompile} ) {
        $parser = new Parse::RecDescent($Grammar);
    }
    else {
        eval 'require Math::Symbolic::Parser::Precompiled;';
        croak "Could not require Math::Symbolic::Parser::Precompiled.\n"
          . "Please install the latest version of Math::Symbolic"
          . "(>=0.135)."
          if $@;
        $parser = Math::Symbolic::Parser::Precompiled->new();
    }
    return $parser;
}

1;
__END__

=head1 AUTHOR

Please send feedback, bug reports, and support requests to the Math::Symbolic
support mailing list:
math-symbolic-support at lists dot sourceforge dot net. Please
consider letting us know how you use Math::Symbolic. Thank you.

If you're interested in helping with the development or extending the
module's functionality, please contact the developers' mailing list:
math-symbolic-develop at lists dot sourceforge dot net.

List of contributors:

  Steffen Müller, symbolic-module at steffen-mueller dot net
  Stray Toaster, mwk at users dot sourceforge dot net
  Oliver Ebenhöh

=head1 SEE ALSO

New versions of this module can be found on
http://steffen-mueller.net or CPAN. The module development takes place on
Sourceforge at http://sourceforge.net/projects/math-symbolic/

L<Math::Symbolic>

L<Math::Symbolic::Parser::Precompiled>

=cut

