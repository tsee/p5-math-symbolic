package Math::SymbolicX::FastEvaluator;

use 5.006002;
use strict;
use warnings;

our $VERSION = '0.01';

use Math::Symbolic::Operator;

require XSLoader;
XSLoader::load('Math::SymbolicX::FastEvaluator', $VERSION);


1;
__END__

=head1 NAME

Math::SymbolicX::FastEvaluator - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Math::SymbolicX::FastEvaluator;
  blah blah blah

=head1 DESCRIPTION

Blah blah blah.

=head1 AUTHOR

Steffen Mueller, E<lt>tsee@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Steffen Mueller

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
