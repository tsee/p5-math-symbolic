package Math::SymbolicX::ParserExtensionFactory;

use 5.006;
use strict;
use warnings;
use Carp;
use Math::Symbolic;

our $BeenUsedBefore    = 0;
our $Functions         = {};
our $Order             = [];
our $RegularExpression = qw//;

our $VERSION = '1.00';

sub import {
    my $package = shift;
    croak "Uneven number of arguments in usage of "
      . "Math::SymbolicX::ParserExtensionFactory"
      if @_ % 2;

    my %args = @_;

    if ( not $BeenUsedBefore ) {
        $Math::Symbolic::Parser->Extend(<<'EXTENSION');
function: /$Math::SymbolicX::ParserExtensionFactory::RegularExpression/
	{
		warn 'function_msx_parser_extension_factory ' 
		  if $Math::Symbolic::Parser::DEBUG;
		my $string = $item[1];
		my ($function, $argstring) = ($string =~ /^([^\(]+)\((.*)\)$/);
		die "Invalid extension function and/or arguments '$string'".
		  "(Math::SymbolicX::ParserExtensionFactory)"
		  if not exists
		     $Math::SymbolicX::ParserExtensionFactory::Functions
		     ->{$function};
		my $result =
		  $Math::SymbolicX::ParserExtensionFactory::Functions
		  ->{$function}->($argstring);
		die "Invalid result of extension function application "
		  ."('$item[1]($argstring)'). Also refer to the "
		  ."Math::SymbolicX::ParserExtensionFactory manpage."
		  if ref($result) !~ /^Math::Symbolic/;
		$return = $result;
	}
EXTENSION
        $BeenUsedBefore = 1;
    }

    foreach my $key ( keys %args ) {
        croak "Invalid keys => value pairs as arguments in usage of "
          . "Math::SymbolicX::ParserExtensionFactory"
          if not ref( $args{$key} ) eq 'CODE';
        if ( not exists $Functions->{$key} ) {
            push @$Order, $key;
        }
        $Functions->{$key} = $args{$key};
    }

    _regenerate_regex();

    return ();
}

sub _regenerate_regex {
    my $string = join '|', @$Order;
    $RegularExpression = qr/(?:$string)\(.*?(?<!\\)\)/;
}

1;
__END__

=head1 NAME

Math::SymbolicX::ParserExtensionFactory - Generate parser extensions

=head1 SYNOPSIS

  use Math::Symbolic qw/parse_from_string/;
  
  use Math::SymbolicX::ParserExtensionFactory (
  
    functionname => sub {
      my $argumentstring = shift;
      my $result = construct_some_math_symbolic_tree( $argumentstring );
      return $result;
    },
  
    anotherfunction => sub {
      ...
    },
  
  );
  
  # ...
  # Later in your code
  
  my $formula = parse_from_string('variable * 4 * functionname(someargument)');
  
  # use $formula as a Math::Symbolic object.
  # Refer to Math::SymbolicX::BigNum (arbitrary precision arithmetic
  # support through the Math::Big* modules) or to
  # Math::SymbolicX::ComplexNumbers (complex number support) for examples.
  
=head1 DESCRIPTION

This module provides a simple way to extend the Math::Symbolic parser with
arbitrary functions that return any valid Math::Symbolic tree.
The return value of the function call is
inserted into the complete parse tree at the point at which the function
call is parsed. Familiarity with the Math::Symbolic module will be
assumed throughout the documentation.

This module is not object oriented. It does not export anything. You should
not call any subroutines directly nor should you modify any class data
directly. The complete interface is the call to
C<use Math::SymbolicX::ParserExtensionFactory> and its arguments. The reason
for the long module name is that you should not have to call it multiple times
in your code because it modifies the parser for good. It is intended to be
a pain to type. :-)

The aim of the module is to allow for hooks into the parser without modifying
the parser yourself because that requires rather in-depth knowledge of the
module code. By specifying key => value pairs of function names and
function implementations (code references) as arguments to the use() call
of the module, this module extends the parser that is stored in the
C<$Math::Symbolic::Parser> variable with the specified functions and whenever
"C<yourfunction(any argument string not containing an unescaped \) )>" occurs
in the code, the subroutine reference is called with the argument string as
argument.

The subroutine is expected to return any Math::Symbolic tree. That means,
as of version 0.133, a Math::Symbolic::Operator, a Math::Symbolic::Variable,
or a Math::Symbolic::Constant object. The returned object will be incorporated
into the Math::Symbolic tree that results from the parse at the exact position
at which the custom function call was parsed.

Please note that the usage of this module will be quite slow at compile time
because it has to regenerate the complete Math::Symbolic parser the first
time you use this module in your code. The run time performance penalty
should be low, however.

=head1 CAVEATS

Since the module is implemented in a way that won't affect the parse speed a
lot at runtime, it is somewhat inflexible. The extensions get the actual
argument string, not a preprocessed form of it. Since the extensions are
implemented as regular expressions, they cannot correctly parse expressions
involving balanced parenthesis. See C<perldoc -q nesting> for details.
For example C<foo(bar(1))> would only match
the C<foo> call until the first parenthesis. You can escape the inner
parenthesis like this: C<foo(bar(1\))>. It's not currently possible to escape
the escape character ('\'). Again: This is a somewhat simple regular expression.
It's not hard to write a parser for balanced parenthesis with escaping, but its
nigh on impossible to do this in a single expression.

=head1 AUTHOR

Copyright (C) 2003-2005 Steffen Mueller

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

You may contact the author at symbolic-module at steffen-mueller dot net

Please send feedback, bug reports, and support requests to the Math::Symbolic
support mailing list:
math-symbolic-support at lists dot sourceforge dot net. Please
consider letting us know how you use Math::Symbolic. Thank you.

If you're interested in helping with the development or extending the
module's functionality, please contact the developers' mailing list:
math-symbolic-develop at lists dot sourceforge dot net.

=head1 SEE ALSO

New versions of this module can be found on
http://steffen-mueller.net or CPAN.

Also have a look at L<Math::Symbolic>,
and at L<Math::Symbolic::Parser>

Refer to L<Math::SymbolicX::BigNum> (arbitrary precision
arithmetic support through the Math::Big* modules) or to
L<Math::SymbolicX::ComplexNumbers> (complex number support) for examples.

=cut
