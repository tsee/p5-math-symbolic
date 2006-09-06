#!/usr/bin/perl
use Benchmark qw/cmpthese/;
use Math::Symbolic qw/:all/;
use lib 'lib';
use Math::Symbolic::Custom::Transformation qw/new_trafo/;
use Memoize;

my $trafo = new_trafo('TREE_a + TREE_a' => '2 * TREE_a');
my $tree = parse_from_string('(foo * 2) + (foo * 2)');

memoize('new_trafo');
cmpthese(-3,
{
	existing => sub {
		$trafo->apply($tree);
	},
	memoized => sub {
		my $tr = new_trafo( 'TREE_a + TREE_a' => '2 * TREE_a' );
		$tr->apply($tree);
	},
	fresh => sub {
		my $tr = Math::Symbolic::Custom::Transformation->new('TREE_a + TREE_a' => '2 * TREE_a');
		$tr->apply($tree);
	},
	literal => sub {
	  my $tree = $tree->new();
      if ( $tree->term_type() == T_OPERATOR
           and $tree->type() == B_SUM
           and $tree->op1()->is_identical($tree->op2()) )
      {
        $tree = Math::Symbolic::Operator->new(
          '*', Math::Symbolic::Constant->new(2), $tree->op1()->new()
        );
      }
	},
}
);


