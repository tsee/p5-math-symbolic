package Math::SymbolicX::Calculator::Command::DerivativeApplication;

use 5.006;
use strict;
use warnings;
use Params::Util qw/_INSTANCE/;
use base 'Math::SymbolicX::Calculator::Command';

our $VERSION = '0.01';

sub new {
    my $proto = shift;
    my $class = ref($proto)||$proto;

    my %args = @_;
    my $self = bless {
        symbol => $args{symbol},
        level => $args{level},
    } => $class;

    return $self;
}

sub _execute {
    my $self = shift;
    my $c = shift;
    
    my $sym = $self->{symbol};
    my $lvl = $self->{level};

    my $func = $c->{stash}{$sym};

    if (_INSTANCE($func, 'Math::Symbolic::Custom::Transformation')) {
        return "Cannot apply derivatives to a transformation '$sym'";
    }

    $func = $func->apply_derivatives(defined($lvl) ? $lvl : ());
    $c->{stash}{$sym} = $func;

    return($sym, '==', $func);
}

1;

