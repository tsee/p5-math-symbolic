
=head1 NAME

Math::Symbolic::Derivative - Derive Math::Symbolic trees

=head1 SYNOPSIS

  use Math::Symbolic::Derivative qw/:all/;
  $derived = partial_derivative($term, $variable);
  # or:
  $derived = total_derivative($term, $variable);

=head1 DESCRIPTION

This module implements derivatives for Math::Symbolic trees.
Derivatives are Math::Symbolic::Operators, but their implementation
is drawn from this module because it is significantly more complex
than the implementation of most operators.

Derivatives come in two flavours. There are partial- and total derivatives.

Explaining the precise difference between partial- and total derivatives is
beyond the scope of this document, but in the context of Math::Symbolic,
the difference is simply that partial derivatives just derive in terms of
I<explicit> dependency on the differential variable while total derivatives
recongnize implicit dependencies from variable signatures.

Partial derivatives are faster, have been tested more thoroughly, and
are probably what you want for simpler applications anyway.

=head2 EXPORT

None by default. But you may choose to import the total_derivative()
and partial_derivative() functions.

=cut

package Math::Symbolic::Derivative;

use 5.006;
use strict;
use warnings;
no warnings 'recursion';

use Carp;

use Math::Symbolic::ExportConstants qw/:all/;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = (
    'all' => [
        qw(
          &total_derivative
          &partial_derivative
          )
    ]
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = '0.201';

=head1  CLASS DATA

The package variable %Partial_Rules contains partial
derivative rules as key-value pairs of names and subroutines.

=cut

# lookup-table for derivative rules for various operators.
our %Rules = (
    'each operand'                      => \&_each_operand,
    'product rule'                      => \&_product_rule,
    'quotient rule'                     => \&_quotient_rule,
    'logarithmic chain rule after ln'   => \&_logarithmic_chain_rule_after_ln,
    'logarithmic chain rule'            => \&_logarithmic_chain_rule,
    'derivative commutation'            => \&_derivative_commutation,
    'trigonometric derivatives'         => \&_trigonometric_derivatives,
    'inverse trigonometric derivatives' => \&_inverse_trigonometric_derivatives,
);

# References to derivative subroutines
# Will be assigned a reference after subroutine compilation.
our $Partial_Sub;
our $Total_Sub;

=begin comment

The following subroutines are helper subroutines that apply a
specific rule to a tree.

=end comment

=cut

sub _each_operand {
    my ( $tree, $var, $cloned, $d_sub ) = @_;
    foreach ( @{ $tree->{operands} } ) {
        $_ = $d_sub->( $_, $var, 1 );
    }
    return $tree;
}

sub _product_rule {
    my ( $tree, $var, $cloned, $d_sub ) = @_;

    my $ops = $tree->{operands};
    my $do1 = $d_sub->( $ops->[0], $var, 0 );
    my $do2 = $d_sub->( $ops->[1], $var, 0 );
    my $m1  = Math::Symbolic::Operator->new( '*', $ops->[0], $do2 );
    my $m2  = Math::Symbolic::Operator->new( '*', $ops->[1], $do1 );
    return Math::Symbolic::Operator->new( '+', $m1, $m2 );
}

sub _quotient_rule {
    my ( $tree, $var, $cloned, $d_sub ) = @_;
    my $ops = $tree->{operands};
    my $do1 = $d_sub->( $ops->[0], $var, 0 );
    my $do2 = $d_sub->( $ops->[1], $var, 0 );
    my $m1  = Math::Symbolic::Operator->new( '*', $do1, $ops->[1] );
    my $m2  = Math::Symbolic::Operator->new( '*', $ops->[0], $do2 );
    my $m3  = Math::Symbolic::Operator->new(
		'^', $ops->[1], Math::Symbolic::Constant->new(2)
    );
    my $a   = Math::Symbolic::Operator->new( '-', $m1, $m2 );
    return Math::Symbolic::Operator->new( '/', $a, $m3 );
}

sub _logarithmic_chain_rule_after_ln {
    my ( $tree, $var, $cloned, $d_sub ) = @_;

    # y(x)=u^v
    # y'(x)=y*(d/dx ln(y))
    # y'(x)=y*(d/dx (v*ln(u)))
	my ($u, $v) = @{$tree->{operands}};

	# This is a special case:
	# y(x)=u^CONST
    # y'(x)=CONST*y* d/dx ln(u)
	# y'(x)=CONST*y* u' / u
	if ($v->term_type() == T_CONSTANT) {
        return Math::Symbolic::Operator->new(
			'*', 
			Math::Symbolic::Operator->new(
		    	'*', $v->new(), $tree
			),
			Math::Symbolic::Operator->new(
				'/', $d_sub->($u, $var, 0), $u->new()
			)
		);
	}
    my $e    = Math::Symbolic::Constant->euler();
    my $ln   = Math::Symbolic::Operator->new( 'log', $e, $u );
    my $mul1 = $ln->new( '*', $v, $ln );
    my $dmul = $d_sub->( $mul1, $var, 0 );
    $tree = $ln->new( '*', $tree, $dmul );
    return $tree;
}

sub _logarithmic_chain_rule {
    my ( $tree, $var, $cloned, $d_sub ) = @_;

    #log_a(y(x))=>y'(x)/(ln(a)*y(x))
    my ($a, $y) = @{$tree->{operands}};
    my $dy  = $d_sub->( $y, $var, 0 );
	
	# This would be y'/y
	if ($a->term_type() == T_CONSTANT and $a->{special} eq 'euler') {
		return Math::Symbolic::Operator->new('/', $dy, $y);
	}
	
    my $e    = Math::Symbolic::Constant->euler();
    my $ln   = Math::Symbolic::Operator->new( 'log', $e, $a );
    my $mul1 = $ln->new( '*', $ln, $a->new() );
    $tree = $ln->new( '/', $dy, $mul1 );
    return $tree;
}

sub _derivative_commutation {
    my ( $tree, $var, $cloned, $d_sub ) = @_;
    $tree->{operands}[0] = $d_sub->( $tree->{operands}[0], $var, 0 );
    return $tree;
}

sub _trigonometric_derivatives {
    my ( $tree, $var, $cloned, $d_sub ) = @_;
    my $op = Math::Symbolic::Operator->new();
    my $d_inner = $d_sub->( $tree->{operands}[0], $var, 0 );
    my $trig;
	my $type = $tree->type();
    if ( $type == U_SINE ) {
        $trig = $op->new( 'cos', $tree->{operands}[0] );
    }
    elsif ( $type == U_COSINE ) {
        $trig = $op->new( 'neg', $op->new( 'sin', $tree->{operands}[0] ) );
    }
    elsif ( $type == U_SINE_H ) {
        $trig = $op->new( 'cosh', $tree->{operands}[0] );
    }
    elsif ( $type == U_COSINE_H ) {
        $trig = $op->new( 'sinh', $tree->{operands}[0] );
    }
    elsif ( $type == U_TANGENT or $type == U_COTANGENT ) {
        $trig = $op->new(
            '/',
            Math::Symbolic::Constant->one(),
            $op->new(
                '^',
                $op->new( 'cos', $tree->op1() ),
                Math::Symbolic::Constant->new(2)
            )
        );
        $trig = $op->new( 'neg', $trig ) if $type == U_COTANGENT;
    }
    else {
        die "Trigonometric derivative applied to invalid operator.";
    }
	if ($d_inner->term_type() == T_CONSTANT) {
		my $spec = $d_inner->special();
		if ($spec eq 'zero') {
			return $d_inner;
		}
		elsif ($spec eq 'one') {
			return $trig;
		}
	}
    return $op->new( '*', $d_inner, $trig );
}

sub _inverse_trigonometric_derivatives {
    my ( $tree, $var, $cloned, $d_sub ) = @_;
    my $op = Math::Symbolic::Operator->new();
    my $d_inner = $d_sub->( $tree->{operands}[0], $var, 0 );
    my $trig;
	my $type = $tree->type();
    if ( $type == U_ARCSINE or $type == U_ARCCOSINE ) {
        my $one = $type == U_ARCSINE
			? Math::Symbolic::Constant->one()
			: Math::Symbolic::Constant->new(-1);
        $trig = $op->new( '/', $one,
            $op->new( '-', $one->new(1), $op->new( '^', $tree->op1(), $one->new(2) ) )
        );
    }
    elsif ($type == U_ARCTANGENT
        or $type == U_ARCCOTANGENT )
    {
        my $one = $type == U_ARCTANGENT
			? Math::Symbolic::Constant->one()
			: Math::Symbolic::Constant->new(-1);
        $trig = $op->new( '/', $one,
            $op->new( '+', $one->new(1), $op->new( '^', $tree->op1(), $one->new(2) ) )
        );
    }
    elsif ($type == U_AREASINE_H
        or $type == U_AREACOSINE_H )
    {
        my $one = Math::Symbolic::Constant->one();
        $trig = $op->new(
            '/', $one,
            $op->new(
                '^',
                $op->new(
                    ( $tree->type() == U_AREASINE_H ? '+' : '-' ),
                    $op->new( '^', $tree->op1(), $one->new(2) ),
                    $one
                ),
                $one->new(0.5)
            )
        );
    }
    else {
        die "Inverse trig. derivative applied to invalid operator.";
    }

	if ($d_inner->term_type() == T_CONSTANT) {
		my $spec = $d_inner->special();
		if ($spec eq 'zero') {
			return $d_inner;
		}
		elsif ($spec eq 'one') {
			return $trig;
		}
	}
    return $op->new( '*', $d_inner, $trig );
}

=head1 SUBROUTINES

=cut

=head2 partial_derivative

Takes a Math::Symbolic tree and a Math::Symbolic::Variable as argument.
third argument is an optional boolean indicating whether or not the
tree has to be cloned before being derived. If it is true, the
subroutine happily stomps on any code that might rely on any components
of the Math::Symbolic tree that was passed to the sub as first argument.

=cut

sub partial_derivative {
    my $tree = shift;
    my $var  = shift;
    defined $var or die "Cannot derive using undefined variable.";
    if ( ref($var) eq '' ) {
        $var = Math::Symbolic::parse_from_string($var);
        croak "2nd argument to partial_derivative must be variable."
          if ( ref($var) ne 'Math::Symbolic::Variable' );
    }
    else {
        croak "2nd argument to partial_derivative must be variable."
          if ( ref($var) ne 'Math::Symbolic::Variable' );
    }

    my $cloned = shift;

    if ( not $cloned ) {
        $tree   = $tree->new();
        $cloned = 1;
    }

    if ( $tree->term_type() == T_OPERATOR ) {
        my $rulename =
          $Math::Symbolic::Operator::Op_Types[ $tree->type() ]->{derive};
        my $subref = $Rules{$rulename};

        die "Cannot derive using rule '$rulename'."
          unless defined $subref;
        $tree = $subref->( $tree, $var, $cloned, $Partial_Sub );

    }
    elsif ( $tree->term_type() == T_CONSTANT ) {
        $tree = Math::Symbolic::Constant->zero();
    }
    elsif ( $tree->term_type() == T_VARIABLE ) {
        if ( $tree->name() eq $var->name() ) {
            $tree = Math::Symbolic::Constant->one;
        }
        else {
            $tree = Math::Symbolic::Constant->zero;
        }
    }
    else {
        die "Cannot apply partial derivative to anything but a tree.";
    }

    return $tree;
}

=head2 total_derivative

Takes a Math::Symbolic tree and a Math::Symbolic::Variable as argument.
third argument is an optional boolean indicating whether or not the
tree has to be cloned before being derived. If it is true, the
subroutine happily stomps on any code that might rely on any components
of the Math::Symbolic tree that was passed to the sub as first argument.

=cut

sub total_derivative {
    my $tree = shift;
    my $var  = shift;
    defined $var or die "Cannot derive using undefined variable.";
    if ( ref($var) eq '' ) {
        $var = Math::Symbolic::parse_from_string($var);
        croak "Second argument to total_derivative must be variable."
          if ( ref($var) ne 'Math::Symbolic::Variable' );
    }
    else {
        croak "Second argument to total_derivative must be variable."
          if ( ref($var) ne 'Math::Symbolic::Variable' );
    }

    my $cloned = shift;

    if ( not $cloned ) {
        $tree   = $tree->new();
        $cloned = 1;
    }

    if ( $tree->term_type() == T_OPERATOR ) {
        my $var_name = $var->name();
        my @tree_sig = $tree->signature();
        if ( ( grep { $_ eq $var_name } @tree_sig ) > 0 ) {
            my $rulename =
              $Math::Symbolic::Operator::Op_Types[ $tree->type() ]->{derive};
            my $subref = $Rules{$rulename};

            die "Cannot derive using rule '$rulename'."
              unless defined $subref;
            $tree = $subref->( $tree, $var, $cloned, $Total_Sub );
        }
        else {
            $tree = Math::Symbolic::Constant->zero();
        }
    }
    elsif ( $tree->term_type() == T_CONSTANT ) {
        $tree = Math::Symbolic::Constant->zero();
    }
    elsif ( $tree->term_type() == T_VARIABLE ) {
        my $name     = $tree->name();
        my $var_name = $var->name();

        if ( $name eq $var_name ) {
            $tree = Math::Symbolic::Constant->one;
        }
        else {
            my @tree_sig = $tree->signature();
            my $is_dependent;
            foreach my $ident (@tree_sig) {
                if ( $ident eq $var_name ) {
                    $is_dependent = 1;
                    last;
                }
            }
            if ( $is_dependent ) {
                $tree =
                  Math::Symbolic::Operator->new( 'total_derivative', $tree,
                    $var );
            }
            else {
                $tree = Math::Symbolic::Constant->zero;
            }
        }
    }
    else {
        die "Cannot apply total derivative to anything but a tree.";
    }

    return $tree;
}

# Class data again.
$Partial_Sub = \&partial_derivative;
$Total_Sub   = \&total_derivative;

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

=cut

