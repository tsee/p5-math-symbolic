use strict;
use warnings;

use Test::More;

BEGIN {
    eval { require Pod::Coverage; };
    if ($@) {
        plan skip_all => 'Pod::Coverage not installed';
        exit;
    }
    else {
        import Pod::Coverage;
        plan tests => 22;
    }
}

use_ok('Math::Symbolic');
use_ok('Math::Symbolic::MiscAlgebra');
use_ok('Math::Symbolic::VectorCalculus');
use_ok('Math::Symbolic::MiscCalculus');

my @packages = qw(
  Math::Symbolic
  Math::Symbolic::AuxFunctions
  Math::Symbolic::Base
  Math::Symbolic::Compiler
  Math::Symbolic::Constant
  Math::Symbolic::Custom
  Math::Symbolic::Custom::Base
  Math::Symbolic::Custom::DefaultDumpers
  Math::Symbolic::Custom::DefaultMods
  Math::Symbolic::Custom::DefaultTests
  Math::Symbolic::Derivative
  Math::Symbolic::ExportConstants
  Math::Symbolic::MiscAlgebra
  Math::Symbolic::MiscCalculus
  Math::Symbolic::Operator
  Math::Symbolic::Parser
  Math::Symbolic::Variable
  Math::Symbolic::VectorCalculus
);

foreach my $namespace (@packages) {
    my $coverage = Pod::Coverage->new(
        package => $namespace,
        private => [ '^_', '^\(', '^AUTOLOAD$', '^DESTROY$', '^can$' ],
    );
    ok(
        (
            not defined $coverage->coverage()
              and $coverage->why_unrated() =~ /^no public symbols/
        )
          || ( defined( $coverage->coverage() ) && $coverage->coverage() == 1 ),
        "Package coverage for $namespace."
    );
    if ( not defined( $coverage->coverage() ) ) {
        my $reason = $coverage->why_unrated();
        if ( $reason !~ /^no public symbols/ ) {
            warn "\nDocumentation missing or broken in $namespace:\n"
              . $coverage->why_unrated() . "\n";
        }
    }
    elsif ( $coverage->coverage() < 1 ) {
        warn "\nDocumentation missing in $namespace for:\n"
          . join( "\n", $coverage->uncovered() ) . "\n";
    }
}

