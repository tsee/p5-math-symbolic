#!perl
use strict;
use warnings;
use Math::Symbolic qw(:all);
use Test::More tests => 4;

ok(Math::Symbolic::Constant->new(42)->differentiate()->to_string() eq "0", "Differentiating a constant results in 0");
ok(Math::Symbolic::Variable->new("x")->differentiate()->to_string() eq "1", "Differentiating a variable wrt itself results in 1 v1");
ok(Math::Symbolic::Variable->new("x")->differentiate("x")->to_string() eq "1", "Differentiating a variable wrt itself results in 1 v2");
ok(parse_from_string("u+a*t")->differentiate("t")->to_string() eq "a", "Differentiating simple expression for velocity results in acceleration");

