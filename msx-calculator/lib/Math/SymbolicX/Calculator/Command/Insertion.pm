package Math::SymbolicX::Calculator::Command::Insertion;

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
        what => $args{what},
    } => $class;

    return $self;
}

sub _execute {
    my $self = shift;
    my $c = shift;
    
    my $sym = $self->{symbol};
    my $what = $self->{what};

    my $func = $c->{stash}{$sym};

    if (_INSTANCE($func, 'Math::Symbolic::Custom::Transformation')) {
        return "Cannot insert into a transformation '$sym'";
    }

    my @vars;
    if (not defined $what or $what eq '*') {
        @vars = $func->signature();
    }
    else {
        @vars = ($what);
    }

    @vars =
        grep {
            exists $c->{stash}{$_}
            and not _INSTANCE(
                $c->{stash}{$_},
                'Math::Symbolic::Custom::Transformation'
            );
        }
        @vars;

    $self->_insert_into($c, $func, \@vars);

    $c->{stash}{$sym} = $func;

    return($sym, '==', $func);
}

sub _insert_into {
    my $self = shift;
    my $c = shift;
    my $func = shift;
    my $vars = shift;

    my %vars;
    foreach (@$vars) {
        $vars{$_} = $c->{stash}{$_}->new;
    }

    $func->implement(%vars);
}
1;

