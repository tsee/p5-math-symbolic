#!/usr/bin/perl
use strict;
use warnings;

use Math::Symbolic qw(:all);

# Use some tree dump modules
use Text::Tree;
use Tree::To::TextLines qw(render_tree_as_text);
# can also use Tree::Dump but output is not as useful

# We're working with some Math::Symbolic expression
my $expr = parse_from_string("u*t + (1/2)*a*t^2");

# We want to see what the tree looks like for some reason
print qq{"$expr" in tree form.\n\n};

# View it with Tree::To::TextLines
print "Tree::To::TextLines:\n\n";
print render_tree_as_text({show_guideline => 1, id_attribute => 'tid',}, $expr), "\n\n";

# View it with Text::Tree
print "Text::Tree:\n\n";
my $text_tree = new Text::Tree( $expr->to_text_tree() );
print $text_tree->layout("spaced and centered in ovals"), "\n\n";


