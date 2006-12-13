package Math::SymbolicX::Calculator::Command::Assignment;

use 5.006;
use strict;
use warnings;
use base 'Math::SymbolicX::Calculator::Command';

our $VERSION = '0.01';

sub new {
    my $proto = shift;
    my $class = ref($proto)||$proto;

    my %args = @_;
    my $self = bless {
        symbol => $args{symbol},
        object => $args{object},
    } => $class;

    return $self;
}

sub _execute {
    my $self = shift;
    my $c = shift;
    
    my $sym = $self->{symbol};
    my $func = $self->{object};

    $c->{stash}{$sym} = $func;

    return($sym, '==', $func);
}

1;

