use strict;
use warnings;
use Test::More tests => 1;

BEGIN {use_ok('Math::SymbolicX::FastEvaluator'); }
use Math::Symbolic qw/:all/;

my $fe = Math::SymbolicX::FastEvaluator->new();
my $exp = Math::SymbolicX::FastEvaluator::Expression->new();
my $op = Math::SymbolicX::FastEvaluator::Op->new();

$op->SetValue(1.3);
$op->SetNumber();
$exp->AddOp($op);

$op->SetVariable();
$op->SetValue(0.0);
$exp->AddOp($op);

$op->SetOpType(B_SUM);
$exp->AddOp($op);

foreach (1..1000-1) {
  $op->SetValue(1.0);
  $op->SetVariable();
  $exp->AddOp($op);

  $op->SetOpType(B_SUM);
  $exp->AddOp($op);
}

print 'v: ', $fe->Evaluate($exp, [1.3, 2.0]), "\n";

#use Benchmark qw/cmpthese/;
#
#my $ms = parse_from_string("1.3+a" . ("+b" x 999));
#use Math::Symbolic::Compiler;
#my ($sub, @stuff) = parse_from_string("1.3+a" . ("+b" x 999))->to_sub();
#
#cmpthese(-2, {
#  fast => sub{$fe->Evaluate($exp, [1.3, 2.0]);},
#  simple => sub{$ms->value(a => 1.3, b=> 2.0)},
#  perl => sub{$sub->(1.3, 2.0)},
#});

=pod

my $fe = Math::SymbolicX::FastEvaluator->new();


my $exp = Math::SymbolicX::FastEvaluator::Expression->new();

my $op = Math::SymbolicX::FastEvaluator::Op->new();
$op->SetValue(1.3);
$op->SetOpType(B_SUM);

foreach (1..300000) {
  print "i\n" if not $_% 10000;
  $exp->AddOp($op);
}
undef $op;
undef $exp;

print "one:\n";
my $t = <STDIN>;

foreach (1..100) {
  my $exp = Math::SymbolicX::FastEvaluator::Expression->new();

  my $op = Math::SymbolicX::FastEvaluator::Op->new();
  $op->SetValue(1.3);
  $op->SetOpType(B_SUM);

  foreach (1..300000) {
    print "i\n" if not $_% 10000;
    $exp->AddOp($op);
  }
  undef $op;
  undef $exp;
}

print "two:\n";
$t = <STDIN>;

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

