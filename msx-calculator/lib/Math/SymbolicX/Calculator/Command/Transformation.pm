package Math::SymbolicX::Calculator::Command::Transformation;

use 5.006;
use strict;
use warnings;
use base 'Math::SymbolicX::Calculator::Command';
use Params::Util qw/_INSTANCE/;

our $VERSION = '0.01';

sub new {
    my $proto = shift;
    my $class = ref($proto)||$proto;

    my %args = @_;
    my $self = bless {
        symbol => $args{symbol},
        trafo => $args{object},
        shallow => $args{shallow},
    } => $class;

    return $self;
}

sub _execute {
    my $self = shift;
    my $c = shift;
    
    my $sym = $self->{symbol};
    my $trafo = $self->{trafo};

    my $func = $c->{stash}{$sym};
    if (_INSTANCE($func, 'Math::Symbolic::Custom::Transformation')) {
        return "Cannot apply transformation to another transformation '$sym'";
    }

    if ($self->{shallow}) {
        $trafo->apply($func);
    }
    else {
        $trafo->apply_recursive($func, $trafo);
    }

    return($sym, '==', $func);
}

1;

