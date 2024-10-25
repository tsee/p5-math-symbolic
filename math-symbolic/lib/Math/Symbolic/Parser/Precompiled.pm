package Math::Symbolic::Parser::Precompiled;
our $VERSION = '0.613';

use strict;

=encoding utf8

=head1 NAME

Math::Symbolic::Parser::Precompiled - Precompiled Math::Symbolic Parser

=head1 DESCRIPTION

This module is a precompiled version of the Parse::RecDescent grammar
that can be found in $Math::Symbolic::Parser::Grammar. It is used internally
to improve startup performance. Please use the new() method in the
Math::Symbolic::Parser namespace to generate new parsers.

Also note that some modules on CPAN (like Math::SymbolicX::Complex, etc.) modify
the parser which is stored in $Math::Symbolic::Parser at the time of loading
the module.

=head1 AUTHOR

Please send feedback, bug reports, and support requests to the Math::Symbolic
support mailing list:
math-symbolic-support at lists dot sourceforge dot net. Please
consider letting us know how you use Math::Symbolic. Thank you.

If you're interested in helping with the development or extending the
module's functionality, please contact the developers' mailing list:
math-symbolic-develop at lists dot sourceforge dot net.

List of contributors:

  Steffen Müller, symbolic-module at steffen-mueller dot net
  Stray Toaster, mwk at users dot sourceforge dot net
  Oliver Ebenhöh

=head1 SEE ALSO

New versions of this module can be found on
http://steffen-mueller.net or CPAN. The module development takes place on
Sourceforge at http://sourceforge.net/projects/math-symbolic/

L<Math::Symbolic>

L<Math::Symbolic::Parser>

=cut

#
# This parser was generated with
# Parse::RecDescent version 1.967015
#

package Math::Symbolic::Parser::Precompiled;
use Parse::RecDescent;
{ my $ERRORS;


package Parse::RecDescent::Math::Symbolic::Parser::Precompiled;
use strict;
use vars qw($skip $AUTOLOAD  );
@Parse::RecDescent::Math::Symbolic::Parser::Precompiled::ISA = ();
$skip = '\\s*';



{
local $SIG{__WARN__} = sub {0};
# PRETEND TO BE IN Parse::RecDescent NAMESPACE
*Parse::RecDescent::Math::Symbolic::Parser::Precompiled::AUTOLOAD   = sub
{
    no strict 'refs';

    ${"AUTOLOAD"} =~ s/^Parse::RecDescent::Math::Symbolic::Parser::Precompiled/Parse::RecDescent/;
    goto &{${"AUTOLOAD"}};
}
}

push @Parse::RecDescent::Math::Symbolic::Parser::Precompiled::ISA, 'Parse::RecDescent';
# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::add_op
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"add_op"};

    Parse::RecDescent::_trace(q{Trying rule: [add_op]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{add_op},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{'+', or '-'});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['+']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{add_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{add_op});
        %item = (__RULE__ => q{add_op});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['+']},
                      Parse::RecDescent::_tracefirst($text),
                      q{add_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\+/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['+']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{add_op},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['-']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{add_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[1];
        $text = $_[1];
        my $_savetext;
        @item = (q{add_op});
        %item = (__RULE__ => q{add_op});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['-']},
                      Parse::RecDescent::_tracefirst($text),
                      q{add_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\-/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['-']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{add_op},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{add_op},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{add_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{add_op},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{add_op},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::addition
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"addition"};

    Parse::RecDescent::_trace(q{Trying rule: [addition]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{addition},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{<leftop: multiplication add_op multiplication>});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [<leftop: multiplication add_op multiplication>]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{addition},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{addition});
        %item = (__RULE__ => q{addition});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying operator: [<leftop: multiplication add_op multiplication>]},
                  Parse::RecDescent::_tracefirst($text),
                  q{addition},
                  $tracelevel)
                    if defined $::RD_TRACE;
        $expectation->is(q{})->at($text);

        $_tok = undef;
        OPLOOP: while (1)
        {
          $repcount = 0;
          my @item;
          my %item;

          # MATCH LEFTARG
          
        Parse::RecDescent::_trace(q{Trying subrule: [multiplication]},
                  Parse::RecDescent::_tracefirst($text),
                  q{addition},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{multiplication})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::multiplication($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [multiplication]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{addition},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [multiplication]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{addition},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{multiplication}} = $_tok;
        push @item, $_tok;
        
        }



          $repcount++;

          my $savetext = $text;
          my $backtrack;

          # MATCH (OP RIGHTARG)(s)
          while ($repcount < 100000000)
          {
            $backtrack = 0;
            
        Parse::RecDescent::_trace(q{Trying subrule: [add_op]},
                  Parse::RecDescent::_tracefirst($text),
                  q{addition},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{add_op})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::add_op($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [add_op]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{addition},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [add_op]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{addition},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{add_op}} = $_tok;
        push @item, $_tok;
        
        }

            $backtrack=1;
            
            
        Parse::RecDescent::_trace(q{Trying subrule: [multiplication]},
                  Parse::RecDescent::_tracefirst($text),
                  q{addition},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{multiplication})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::multiplication($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [multiplication]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{addition},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [multiplication]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{addition},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{multiplication}} = $_tok;
        push @item, $_tok;
        
        }

            $savetext = $text;
            $repcount++;
          }
          $text = $savetext;
          pop @item if $backtrack;

          unless (@item) { undef $_tok; last }
          $_tok = [ @item ];

          last;
        } # end of OPLOOP

        unless ($repcount>=1)
        {
            Parse::RecDescent::_trace(q{<<Didn't match operator: [<leftop: multiplication add_op multiplication>]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{addition},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched operator: [<leftop: multiplication add_op multiplication>]<< (return value: [}
                      . qq{@{$_tok||[]}} . q{]},
                      Parse::RecDescent::_tracefirst($text),
                      q{addition},
                      $tracelevel)
                        if defined $::RD_TRACE;

        push @item, $item{__DIRECTIVE1__}=$_tok||[];

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{addition},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'addition '
              #  if $Math::Symbolic::Parser::DEBUG;
              if (@{$item[1]} == 1) {
                $item[1][0]
              }
              else {
                my @it = @{$item[1]};
                my $tree = shift @it;
                while (@it) {
                  $tree = Math::Symbolic::Operator->new(
                    shift(@it), $tree, shift(@it)
                  );
                }
                $tree;
              }
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [<leftop: multiplication add_op multiplication>]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{addition},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{addition},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{addition},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{addition},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{addition},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::exp
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"exp"};

    Parse::RecDescent::_trace(q{Trying rule: [exp]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{exp},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{<rightop: factor '^' factor>});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [<rightop: factor '^' factor>]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{exp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{exp});
        %item = (__RULE__ => q{exp});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying operator: [<rightop: factor '^' factor>]},
                  Parse::RecDescent::_tracefirst($text),
                  q{exp},
                  $tracelevel)
                    if defined $::RD_TRACE;
        $expectation->is(q{})->at($text);

        $_tok = undef;
        OPLOOP: while (1)
        {
          $repcount = 0;
          my @item;
          my %item;

          my $savetext = $text;
          my $backtrack;
          # MATCH (LEFTARG OP)(s)
          while ($repcount < 100000000)
          {
            $backtrack = 0;
            
        Parse::RecDescent::_trace(q{Trying subrule: [factor]},
                  Parse::RecDescent::_tracefirst($text),
                  q{exp},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{factor})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::factor($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [factor]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{exp},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [factor]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{exp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{factor}} = $_tok;
        push @item, $_tok;
        
        }


            $repcount++;
            $backtrack = 1;
            
        Parse::RecDescent::_trace(q{Trying terminal: ['^']},
                      Parse::RecDescent::_tracefirst($text),
                      q{exp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'^'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\^/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

            $savetext = $text;
            pop @item;
            
          }
          $text = $savetext;
          pop @item if $backtrack;

          # MATCH RIGHTARG
          
        Parse::RecDescent::_trace(q{Trying subrule: [factor]},
                  Parse::RecDescent::_tracefirst($text),
                  q{exp},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{factor})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::factor($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [factor]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{exp},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [factor]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{exp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{factor}} = $_tok;
        push @item, $_tok;
        
        }

          $repcount++;
          unless (@item) { undef $_tok; last }
          $_tok = [ @item ];

          last;
        } # end of OPLOOP

        unless ($repcount>=1)
        {
            Parse::RecDescent::_trace(q{<<Didn't match operator: [<rightop: factor '^' factor>]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{exp},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched operator: [<rightop: factor '^' factor>]<< (return value: [}
                      . qq{@{$_tok||[]}} . q{]},
                      Parse::RecDescent::_tracefirst($text),
                      q{exp},
                      $tracelevel)
                        if defined $::RD_TRACE;

        push @item, $item{__DIRECTIVE1__}=$_tok||[];

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{exp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'exp ' if $Math::Symbolic::Parser::DEBUG;
              if (@{$item[1]} == 1) {
                $item[1][0]
              }
              else {
                my @it = reverse @{$item[1]};
                my $tree = shift @it;
                while (@it) {
                  $tree = Math::Symbolic::Operator->new(
                    '^', shift(@it), $tree
                  );
                }
                $tree;
              }
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [<rightop: factor '^' factor>]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{exp},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{exp},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{exp},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{exp},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{exp},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::expr
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"expr"};

    Parse::RecDescent::_trace(q{Trying rule: [expr]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{expr},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{addition});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [addition]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{expr},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{expr});
        %item = (__RULE__ => q{expr});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [addition]},
                  Parse::RecDescent::_tracefirst($text),
                  q{expr},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::addition($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [addition]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{expr},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [addition]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{expr},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{addition}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{expr},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'expr ' if $Math::Symbolic::Parser::DEBUG;
              $item[1]
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [addition]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{expr},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{expr},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{expr},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{expr},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{expr},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::expr_list
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"expr_list"};

    Parse::RecDescent::_trace(q{Trying rule: [expr_list]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{expr_list},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{<leftop: expr ',' expr>});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [<leftop: expr ',' expr>]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{expr_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{expr_list});
        %item = (__RULE__ => q{expr_list});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying operator: [<leftop: expr ',' expr>]},
                  Parse::RecDescent::_tracefirst($text),
                  q{expr_list},
                  $tracelevel)
                    if defined $::RD_TRACE;
        $expectation->is(q{})->at($text);

        $_tok = undef;
        OPLOOP: while (1)
        {
          $repcount = 0;
          my @item;
          my %item;

          # MATCH LEFTARG
          
        Parse::RecDescent::_trace(q{Trying subrule: [expr]},
                  Parse::RecDescent::_tracefirst($text),
                  q{expr_list},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{expr})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::expr($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [expr]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{expr_list},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [expr]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{expr_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{expr}} = $_tok;
        push @item, $_tok;
        
        }



          $repcount++;

          my $savetext = $text;
          my $backtrack;

          # MATCH (OP RIGHTARG)(s)
          while ($repcount < 100000000)
          {
            $backtrack = 0;
            
        Parse::RecDescent::_trace(q{Trying terminal: [',']},
                      Parse::RecDescent::_tracefirst($text),
                      q{expr_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{','})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\,/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

            pop @item;
            
            
        Parse::RecDescent::_trace(q{Trying subrule: [expr]},
                  Parse::RecDescent::_tracefirst($text),
                  q{expr_list},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{expr})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::expr($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [expr]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{expr_list},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [expr]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{expr_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{expr}} = $_tok;
        push @item, $_tok;
        
        }

            $savetext = $text;
            $repcount++;
          }
          $text = $savetext;
          pop @item if $backtrack;

          unless (@item) { undef $_tok; last }
          $_tok = [ @item ];

          last;
        } # end of OPLOOP

        unless ($repcount>=1)
        {
            Parse::RecDescent::_trace(q{<<Didn't match operator: [<leftop: expr ',' expr>]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{expr_list},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched operator: [<leftop: expr ',' expr>]<< (return value: [}
                      . qq{@{$_tok||[]}} . q{]},
                      Parse::RecDescent::_tracefirst($text),
                      q{expr_list},
                      $tracelevel)
                        if defined $::RD_TRACE;

        push @item, $item{__DIRECTIVE1__}=$_tok||[];

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{expr_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'expr_list '
              #  if $Math::Symbolic::Parser::DEBUG;
              $item[1]
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [<leftop: expr ',' expr>]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{expr_list},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{expr_list},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{expr_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{expr_list},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{expr_list},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::factor
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"factor"};

    Parse::RecDescent::_trace(q{Trying rule: [factor]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{factor},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/(?:\\+|-)*/});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/(?:\\+|-)*/ number]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{factor});
        %item = (__RULE__ => q{factor});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/(?:\\+|-)*/]}, Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:(?:\+|-)*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [number]},
                  Parse::RecDescent::_tracefirst($text),
                  q{factor},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{number})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::number($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [number]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{factor},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [number]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{number}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'unary_n '
              #  if $Math::Symbolic::Parser::DEBUG;
              if ($item[1]) {
                my @it = split //, $item[1];
                my $ret = $item[2];
                foreach (grep {$_ eq '-'} @it) {
                  $ret = Math::Symbolic::Operator->new('neg',$ret);
                }
                $ret
              }
              else {
                $item[2]
              }
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/(?:\\+|-)*/ number]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/(?:\\+|-)*/ function]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[1];
        $text = $_[1];
        my $_savetext;
        @item = (q{factor});
        %item = (__RULE__ => q{factor});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/(?:\\+|-)*/]}, Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:(?:\+|-)*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [function]},
                  Parse::RecDescent::_tracefirst($text),
                  q{factor},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{function})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::function($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [function]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{factor},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [function]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{function}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'unary_f '
              #  if $Math::Symbolic::Parser::DEBUG;
              if ($item[1]) {
                my @it = split //, $item[1];
                my $ret = $item[2];
                foreach (grep {$_ eq '-'} @it) {
                  $ret = Math::Symbolic::Operator->new('neg',$ret);
                }
                $ret
              }
              else {
                $item[2]
              }
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/(?:\\+|-)*/ function]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/(?:\\+|-)*/ variable]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[2];
        $text = $_[1];
        my $_savetext;
        @item = (q{factor});
        %item = (__RULE__ => q{factor});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/(?:\\+|-)*/]}, Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:(?:\+|-)*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [variable]},
                  Parse::RecDescent::_tracefirst($text),
                  q{factor},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{variable})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::variable($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [variable]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{factor},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [variable]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{variable}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'unary_v '
              #  if $Math::Symbolic::Parser::DEBUG;
              if ($item[1]) {
                my @it = split //, $item[1];
                my $ret = $item[2];
                foreach (grep {$_ eq '-'} @it) {
                  $ret = Math::Symbolic::Operator->new('neg',$ret);
                }
                $ret
              }
              else {
                $item[2]
              }
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/(?:\\+|-)*/ variable]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/(?:\\+|-)*/ '(' expr ')']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[3];
        $text = $_[1];
        my $_savetext;
        @item = (q{factor});
        %item = (__RULE__ => q{factor});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/(?:\\+|-)*/]}, Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:(?:\+|-)*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: ['(']},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'('})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\(/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [expr]},
                  Parse::RecDescent::_tracefirst($text),
                  q{factor},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{expr})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::expr($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [expr]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{factor},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [expr]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{expr}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [')']},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{')'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'unary_expr '
              #  if $Math::Symbolic::Parser::DEBUG;
              if ($item[1]) {
                my @it = split //, $item[1];
                my $ret = $item[3];
                foreach (grep {$_ eq '-'} @it) {
                  $ret = Math::Symbolic::Operator->new('neg',$ret);
                }
                $ret
              }
              else {
                $item[3]
              }
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/(?:\\+|-)*/ '(' expr ')']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{factor},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{factor},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{factor},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{factor},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::function
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"function"};

    Parse::RecDescent::_trace(q{Trying rule: [function]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{function},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{function_name});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [function_name '(' expr_list ')']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{function});
        %item = (__RULE__ => q{function});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [function_name]},
                  Parse::RecDescent::_tracefirst($text),
                  q{function},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::function_name($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [function_name]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{function},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [function_name]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{function},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{function_name}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: ['(']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'('})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\(/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [expr_list]},
                  Parse::RecDescent::_tracefirst($text),
                  q{function},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{expr_list})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::expr_list($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [expr_list]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{function},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [expr_list]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{function},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{expr_list}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [')']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{')'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{function},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'function ' 
              #  if $Math::Symbolic::Parser::DEBUG;
              my $fname = $item[1];
              my $function;
              if (exists($Math::Symbolic::Parser::Parser_Functions{$fname})) {
                $function = $Math::Symbolic::Parser::Parser_Functions{$fname}->($fname, @{$item[3]});
                die "Invalid function '$fname'!"
                  unless defined $function;
              }
              else {
                $function = $Math::Symbolic::Operator::Op_Symbols{ $fname };
                die "Invalid function '$fname'!"
                  unless defined $function;
                $function = Math::Symbolic::Operator->new(
                  { type => $function, operands => $item[3] }
                );
              }
              $function
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [function_name '(' expr_list ')']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{function},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{function},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{function},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{function},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::function_name
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"function_name"};

    Parse::RecDescent::_trace(q{Trying rule: [function_name]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{function_name},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{'log', or 'partial_derivative', or 'total_derivative', or 'sinh', or 'cosh', or 'asinh', or 'acosh', or 'asin', or 'acos', or 'atan2', or 'atan', or 'acot', or 'sin', or 'cos', or 'tan', or 'cot', or 'exp', or 'sqrt', or 'ln'});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['log']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['log']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Alog/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['log']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['partial_derivative']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[1];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['partial_derivative']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Apartial_derivative/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['partial_derivative']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['total_derivative']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[2];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['total_derivative']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Atotal_derivative/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['total_derivative']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['sinh']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[3];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['sinh']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Asinh/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['sinh']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['cosh']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[4];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['cosh']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Acosh/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['cosh']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['asinh']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[5];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['asinh']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Aasinh/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['asinh']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['acosh']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[6];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['acosh']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Aacosh/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['acosh']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['asin']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[7];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['asin']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Aasin/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['asin']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['acos']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[8];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['acos']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Aacos/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['acos']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['atan2']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[9];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['atan2']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Aatan2/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['atan2']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['atan']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[10];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['atan']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Aatan/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['atan']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['acot']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[11];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['acot']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Aacot/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['acot']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['sin']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[12];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['sin']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Asin/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['sin']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['cos']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[13];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['cos']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Acos/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['cos']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['tan']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[14];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['tan']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Atan/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['tan']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['cot']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[15];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['cot']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Acot/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['cot']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['exp']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[16];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['exp']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Aexp/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['exp']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['sqrt']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[17];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['sqrt']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Asqrt/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['sqrt']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['ln']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[18];
        $text = $_[1];
        my $_savetext;
        @item = (q{function_name});
        %item = (__RULE__ => q{function_name});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['ln']},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\Aln/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['ln']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{function_name},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{function_name},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{function_name},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{function_name},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::identifier_list
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"identifier_list"};

    Parse::RecDescent::_trace(q{Trying rule: [identifier_list]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{identifier_list},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{<leftop: /[a-zA-Z][a-zA-Z0-9_]*/ ',' /[a-zA-Z][a-zA-Z0-9_]*/>});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [<leftop: /[a-zA-Z][a-zA-Z0-9_]*/ ',' /[a-zA-Z][a-zA-Z0-9_]*/>]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{identifier_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{identifier_list});
        %item = (__RULE__ => q{identifier_list});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying operator: [<leftop: /[a-zA-Z][a-zA-Z0-9_]*/ ',' /[a-zA-Z][a-zA-Z0-9_]*/>]},
                  Parse::RecDescent::_tracefirst($text),
                  q{identifier_list},
                  $tracelevel)
                    if defined $::RD_TRACE;
        $expectation->is(q{})->at($text);

        $_tok = undef;
        OPLOOP: while (1)
        {
          $repcount = 0;
          my @item;
          my %item;

          # MATCH LEFTARG
          
        Parse::RecDescent::_trace(q{Trying terminal: [/[a-zA-Z][a-zA-Z0-9_]*/]}, Parse::RecDescent::_tracefirst($text),
                      q{identifier_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/[a-zA-Z][a-zA-Z0-9_]*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:[a-zA-Z][a-zA-Z0-9_]*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        



          $repcount++;

          my $savetext = $text;
          my $backtrack;

          # MATCH (OP RIGHTARG)(s)
          while ($repcount < 100000000)
          {
            $backtrack = 0;
            
        Parse::RecDescent::_trace(q{Trying terminal: [',']},
                      Parse::RecDescent::_tracefirst($text),
                      q{identifier_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{','})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\,/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

            pop @item;
            
            
        Parse::RecDescent::_trace(q{Trying terminal: [/[a-zA-Z][a-zA-Z0-9_]*/]}, Parse::RecDescent::_tracefirst($text),
                      q{identifier_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/[a-zA-Z][a-zA-Z0-9_]*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:[a-zA-Z][a-zA-Z0-9_]*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

            $savetext = $text;
            $repcount++;
          }
          $text = $savetext;
          pop @item if $backtrack;

          unless (@item) { undef $_tok; last }
          $_tok = [ @item ];

          last;
        } # end of OPLOOP

        unless ($repcount>=1)
        {
            Parse::RecDescent::_trace(q{<<Didn't match operator: [<leftop: /[a-zA-Z][a-zA-Z0-9_]*/ ',' /[a-zA-Z][a-zA-Z0-9_]*/>]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{identifier_list},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched operator: [<leftop: /[a-zA-Z][a-zA-Z0-9_]*/ ',' /[a-zA-Z][a-zA-Z0-9_]*/>]<< (return value: [}
                      . qq{@{$_tok||[]}} . q{]},
                      Parse::RecDescent::_tracefirst($text),
                      q{identifier_list},
                      $tracelevel)
                        if defined $::RD_TRACE;

        push @item, $item{__DIRECTIVE1__}=$_tok||[];

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{identifier_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'identifier_list '
              #  if $Math::Symbolic::Parser::DEBUG;
              $item[1]
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [<leftop: /[a-zA-Z][a-zA-Z0-9_]*/ ',' /[a-zA-Z][a-zA-Z0-9_]*/>]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{identifier_list},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{identifier_list},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{identifier_list},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{identifier_list},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{identifier_list},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::mult_op
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"mult_op"};

    Parse::RecDescent::_trace(q{Trying rule: [mult_op]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{mult_op},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{'*', or '/'});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['*']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{mult_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{mult_op});
        %item = (__RULE__ => q{mult_op});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['*']},
                      Parse::RecDescent::_tracefirst($text),
                      q{mult_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\*/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['*']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{mult_op},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: ['/']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{mult_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[1];
        $text = $_[1];
        my $_savetext;
        @item = (q{mult_op});
        %item = (__RULE__ => q{mult_op});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: ['/']},
                      Parse::RecDescent::_tracefirst($text),
                      q{mult_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\//)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{>>Matched production: ['/']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{mult_op},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{mult_op},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{mult_op},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{mult_op},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{mult_op},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::multiplication
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"multiplication"};

    Parse::RecDescent::_trace(q{Trying rule: [multiplication]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{multiplication},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{<leftop: exp mult_op exp>});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [<leftop: exp mult_op exp>]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{multiplication},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{multiplication});
        %item = (__RULE__ => q{multiplication});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying operator: [<leftop: exp mult_op exp>]},
                  Parse::RecDescent::_tracefirst($text),
                  q{multiplication},
                  $tracelevel)
                    if defined $::RD_TRACE;
        $expectation->is(q{})->at($text);

        $_tok = undef;
        OPLOOP: while (1)
        {
          $repcount = 0;
          my @item;
          my %item;

          # MATCH LEFTARG
          
        Parse::RecDescent::_trace(q{Trying subrule: [exp]},
                  Parse::RecDescent::_tracefirst($text),
                  q{multiplication},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{exp})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::exp($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [exp]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{multiplication},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [exp]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{multiplication},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{exp}} = $_tok;
        push @item, $_tok;
        
        }



          $repcount++;

          my $savetext = $text;
          my $backtrack;

          # MATCH (OP RIGHTARG)(s)
          while ($repcount < 100000000)
          {
            $backtrack = 0;
            
        Parse::RecDescent::_trace(q{Trying subrule: [mult_op]},
                  Parse::RecDescent::_tracefirst($text),
                  q{multiplication},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{mult_op})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::mult_op($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [mult_op]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{multiplication},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [mult_op]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{multiplication},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{mult_op}} = $_tok;
        push @item, $_tok;
        
        }

            $backtrack=1;
            
            
        Parse::RecDescent::_trace(q{Trying subrule: [exp]},
                  Parse::RecDescent::_tracefirst($text),
                  q{multiplication},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{exp})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::exp($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [exp]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{multiplication},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [exp]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{multiplication},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{exp}} = $_tok;
        push @item, $_tok;
        
        }

            $savetext = $text;
            $repcount++;
          }
          $text = $savetext;
          pop @item if $backtrack;

          unless (@item) { undef $_tok; last }
          $_tok = [ @item ];

          last;
        } # end of OPLOOP

        unless ($repcount>=1)
        {
            Parse::RecDescent::_trace(q{<<Didn't match operator: [<leftop: exp mult_op exp>]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{multiplication},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched operator: [<leftop: exp mult_op exp>]<< (return value: [}
                      . qq{@{$_tok||[]}} . q{]},
                      Parse::RecDescent::_tracefirst($text),
                      q{multiplication},
                      $tracelevel)
                        if defined $::RD_TRACE;

        push @item, $item{__DIRECTIVE1__}=$_tok||[];

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{multiplication},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'multiplication '
              #  if $Math::Symbolic::Parser::DEBUG;
              if (@{$item[1]} == 1) {
                $item[1][0]
              }
              else {
                my @it = @{$item[1]};
                my $tree = shift @it;
                while (@it) {
                  $tree = Math::Symbolic::Operator->new(
                    shift(@it), $tree, shift(@it)
                  );
                }
                $tree;
              }
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [<leftop: exp mult_op exp>]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{multiplication},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{multiplication},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{multiplication},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{multiplication},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{multiplication},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::number
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"number"};

    Parse::RecDescent::_trace(q{Trying rule: [number]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{number},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/([+-]?)(?=\\d|\\.\\d)\\d*(\\.\\d*)?([Ee]([+-]?\\d+))?/});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/([+-]?)(?=\\d|\\.\\d)\\d*(\\.\\d*)?([Ee]([+-]?\\d+))?/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{number},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{number});
        %item = (__RULE__ => q{number});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/([+-]?)(?=\\d|\\.\\d)\\d*(\\.\\d*)?([Ee]([+-]?\\d+))?/]}, Parse::RecDescent::_tracefirst($text),
                      q{number},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:([+-]?)(?=\d|\.\d)\d*(\.\d*)?([Ee]([+-]?\d+))?)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{number},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'number '
              #  if $Math::Symbolic::Parser::DEBUG;
              Math::Symbolic::Constant->new($item[1])
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/([+-]?)(?=\\d|\\.\\d)\\d*(\\.\\d*)?([Ee]([+-]?\\d+))?/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{number},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{number},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{number},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{number},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{number},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::parse
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"parse"};

    Parse::RecDescent::_trace(q{Trying rule: [parse]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{parse},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{expr, or //});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [expr /^\\Z/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{parse});
        %item = (__RULE__ => q{parse});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying subrule: [expr]},
                  Parse::RecDescent::_tracefirst($text),
                  q{parse},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::expr($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [expr]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{parse},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [expr]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{expr}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [/^\\Z/]}, Parse::RecDescent::_tracefirst($text),
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/^\\Z/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:^\Z)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              $return = $item[1]
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [expr /^\\Z/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [//]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[1];
        $text = $_[1];
        my $_savetext;
        @item = (q{parse});
        %item = (__RULE__ => q{parse});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [//]}, Parse::RecDescent::_tracefirst($text),
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {undef};
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [//]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{parse},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{parse},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{parse},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{parse},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args, $_itempos)
sub Parse::RecDescent::Math::Symbolic::Parser::Precompiled::variable
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
    my $thisrule = $thisparser->{"rules"}{"variable"};

    Parse::RecDescent::_trace(q{Trying rule: [variable]},
                  Parse::RecDescent::_tracefirst($_[1]),
                  q{variable},
                  $tracelevel)
                    if defined $::RD_TRACE;

    
    my $err_at = @{$thisparser->{errors}};

    my $score;
    my $score_return;
    my $_tok;
    my $return = undef;
    my $_matched=0;
    my $commit=0;
    my @item = ();
    my %item = ();
    my $repeating =  $_[2];
    my $_noactions = $_[3];
    my @arg =    defined $_[4] ? @{ &{$_[4]} } : ();
    my $_itempos = $_[5];
    my %arg =    ($#arg & 01) ? @arg : (@arg, undef);
    my $text;
    my $lastsep;
    my $current_match;
    my $expectation = new Parse::RecDescent::Expectation(q{/[a-zA-Z][a-zA-Z0-9_]*/});
    $expectation->at($_[1]);
    
    my $thisline;
    tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

    

    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/[a-zA-Z][a-zA-Z0-9_]*/ /\\'*/ '(' identifier_list ')']},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[0];
        $text = $_[1];
        my $_savetext;
        @item = (q{variable});
        %item = (__RULE__ => q{variable});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/[a-zA-Z][a-zA-Z0-9_]*/]}, Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:[a-zA-Z][a-zA-Z0-9_]*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\'*/]}, Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\'*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\'*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: ['(']},
                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{'('})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\(/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying subrule: [identifier_list]},
                  Parse::RecDescent::_tracefirst($text),
                  q{variable},
                  $tracelevel)
                    if defined $::RD_TRACE;
        if (1) { no strict qw{refs};
        $expectation->is(q{identifier_list})->at($text);
        unless (defined ($_tok = Parse::RecDescent::Math::Symbolic::Parser::Precompiled::identifier_list($thisparser,$text,$repeating,$_noactions,sub { \@arg },undef)))
        {
            
            Parse::RecDescent::_trace(q{<<Didn't match subrule: [identifier_list]>>},
                          Parse::RecDescent::_tracefirst($text),
                          q{variable},
                          $tracelevel)
                            if defined $::RD_TRACE;
            $expectation->failed();
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched subrule: [identifier_list]<< (return value: [}
                    . $_tok . q{]},

                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $item{q{identifier_list}} = $_tok;
        push @item, $_tok;
        
        }

        Parse::RecDescent::_trace(q{Trying terminal: [')']},
                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{')'})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A\)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            
            $expectation->failed();
            Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                            if defined $::RD_TRACE;
        push @item, $item{__STRING2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'variable '
              #  if $Math::Symbolic::Parser::DEBUG;
              my $varname = $item[1];
              my $ticks = $item[2];
              if ($ticks) {
                my $n = length($ticks);
                my $sig = $item[4] || ['x'];
                my $dep_var = $sig->[0];
                my $return = Math::Symbolic::Variable->new(
                  { name => $varname, signature => $sig }
                );
                foreach (1..$n) {
                  $return = Math::Symbolic::Operator->new(
                    'partial_derivative', 
                     $return, $dep_var,
                  );
                }
                $return;
              }
              else {
                Math::Symbolic::Variable->new(
                  { name => $varname, signature => $item[4] }
                );
              }
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/[a-zA-Z][a-zA-Z0-9_]*/ /\\'*/ '(' identifier_list ')']<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    while (!$_matched && !$commit)
    {
        
        Parse::RecDescent::_trace(q{Trying production: [/[a-zA-Z][a-zA-Z0-9_]*/ /\\'*/]},
                      Parse::RecDescent::_tracefirst($_[1]),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        my $thisprod = $thisrule->{"prods"}[1];
        $text = $_[1];
        my $_savetext;
        @item = (q{variable});
        %item = (__RULE__ => q{variable});
        my $repcount = 0;


        Parse::RecDescent::_trace(q{Trying terminal: [/[a-zA-Z][a-zA-Z0-9_]*/]}, Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:[a-zA-Z][a-zA-Z0-9_]*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN1__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying terminal: [/\\'*/]}, Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        undef $lastsep;
        $expectation->is(q{/\\'*/})->at($text);
        

        unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ m/\A(?:\'*)/)
        {
            $text = $lastsep . $text if defined $lastsep;
            $expectation->failed();
            Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;

            last;
        }
        $current_match = substr($text, $-[0], $+[0] - $-[0]);
        substr($text,0,length($current_match),q{});
        Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
                        . $current_match . q{])},
                          Parse::RecDescent::_tracefirst($text))
                    if defined $::RD_TRACE;
        push @item, $item{__PATTERN2__}=$current_match;
        

        Parse::RecDescent::_trace(q{Trying action},
                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        

        $_tok = ($_noactions) ? 0 : do {
              #warn 'variable '
              #  if $Math::Symbolic::Parser::DEBUG;
              my $varname = $item[1];
              my $ticks = $item[2];
              if ($ticks) {
                my $n = length($ticks);
                my $return = Math::Symbolic::Variable->new(
                  { name => $varname, signature => ['x'] }
                );
                foreach (1..$n) {
                  $return = Math::Symbolic::Operator->new(
                    'partial_derivative', 
                     $return, 'x',
                  );
                }
                $return;
              }
              elsif ( $varname eq 'pi' ) {
                Math::Symbolic::Constant->pi();
              }
              elsif ( $varname eq 'e' ) {
                Math::Symbolic::Constant->euler();
              }
              else {                
                Math::Symbolic::Variable->new( $varname );
              }
            };
        unless (defined $_tok)
        {
            Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
                    if defined $::RD_TRACE;
            last;
        }
        Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
                      . $_tok . q{])},
                      Parse::RecDescent::_tracefirst($text))
                        if defined $::RD_TRACE;
        push @item, $_tok;
        $item{__ACTION1__}=$_tok;
        

        Parse::RecDescent::_trace(q{>>Matched production: [/[a-zA-Z][a-zA-Z0-9_]*/ /\\'*/]<<},
                      Parse::RecDescent::_tracefirst($text),
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;



        $_matched = 1;
        last;
    }


    unless ( $_matched || defined($score) )
    {
        

        $_[1] = $text;  # NOT SURE THIS IS NEEDED
        Parse::RecDescent::_trace(q{<<Didn't match rule>>},
                     Parse::RecDescent::_tracefirst($_[1]),
                     q{variable},
                     $tracelevel)
                    if defined $::RD_TRACE;
        return undef;
    }
    if (!defined($return) && defined($score))
    {
        Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
                      q{variable},
                      $tracelevel)
                        if defined $::RD_TRACE;
        $return = $score_return;
    }
    splice @{$thisparser->{errors}}, $err_at;
    $return = $item[$#item] unless defined $return;
    if (defined $::RD_TRACE)
    {
        Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
                      $return . q{])}, "",
                      q{variable},
                      $tracelevel);
        Parse::RecDescent::_trace(q{(consumed: [} .
                      Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])},
                      Parse::RecDescent::_tracefirst($text),
                      , q{variable},
                      $tracelevel)
    }
    $_[1] = $text;
    return $return;
}
}
package Math::Symbolic::Parser::Precompiled; sub new { my $self = bless( {
                 '_AUTOACTION' => undef,
                 '_AUTOTREE' => undef,
                 '_check' => {
                               'itempos' => '',
                               'prevcolumn' => '',
                               'prevline' => '',
                               'prevoffset' => '',
                               'thiscolumn' => '',
                               'thisoffset' => ''
                             },
                 'localvars' => '',
                 'namespace' => 'Parse::RecDescent::Math::Symbolic::Parser::Precompiled',
                 'rules' => {
                              'add_op' => bless( {
                                                   'calls' => [],
                                                   'changed' => 0,
                                                   'impcount' => 0,
                                                   'line' => 32,
                                                   'name' => 'add_op',
                                                   'opcount' => 0,
                                                   'prods' => [
                                                                bless( {
                                                                         'actcount' => 0,
                                                                         'dircount' => 0,
                                                                         'error' => undef,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'description' => '\'+\'',
                                                                                               'hashname' => '__STRING1__',
                                                                                               'line' => 32,
                                                                                               'lookahead' => 0,
                                                                                               'pattern' => '+'
                                                                                             }, 'Parse::RecDescent::Literal' )
                                                                                    ],
                                                                         'line' => undef,
                                                                         'number' => 0,
                                                                         'patcount' => 0,
                                                                         'strcount' => 1,
                                                                         'uncommit' => undef
                                                                       }, 'Parse::RecDescent::Production' ),
                                                                bless( {
                                                                         'actcount' => 0,
                                                                         'dircount' => 0,
                                                                         'error' => undef,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'description' => '\'-\'',
                                                                                               'hashname' => '__STRING1__',
                                                                                               'line' => 33,
                                                                                               'lookahead' => 0,
                                                                                               'pattern' => '-'
                                                                                             }, 'Parse::RecDescent::Literal' )
                                                                                    ],
                                                                         'line' => 33,
                                                                         'number' => 1,
                                                                         'patcount' => 0,
                                                                         'strcount' => 1,
                                                                         'uncommit' => undef
                                                                       }, 'Parse::RecDescent::Production' )
                                                              ],
                                                   'vars' => ''
                                                 }, 'Parse::RecDescent::Rule' ),
                              'addition' => bless( {
                                                     'calls' => [
                                                                  'multiplication',
                                                                  'add_op'
                                                                ],
                                                     'changed' => 0,
                                                     'impcount' => 0,
                                                     'line' => 13,
                                                     'name' => 'addition',
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'actcount' => 1,
                                                                           'dircount' => 1,
                                                                           'error' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'expected' => '<leftop: multiplication add_op multiplication>',
                                                                                                 'hashname' => '__DIRECTIVE1__',
                                                                                                 'leftarg' => bless( {
                                                                                                                       'argcode' => undef,
                                                                                                                       'implicit' => undef,
                                                                                                                       'line' => 13,
                                                                                                                       'lookahead' => 0,
                                                                                                                       'matchrule' => 0,
                                                                                                                       'subrule' => 'multiplication'
                                                                                                                     }, 'Parse::RecDescent::Subrule' ),
                                                                                                 'max' => 100000000,
                                                                                                 'min' => 1,
                                                                                                 'name' => '',
                                                                                                 'op' => bless( {
                                                                                                                  'argcode' => undef,
                                                                                                                  'implicit' => undef,
                                                                                                                  'line' => 13,
                                                                                                                  'lookahead' => 0,
                                                                                                                  'matchrule' => 0,
                                                                                                                  'subrule' => 'add_op'
                                                                                                                }, 'Parse::RecDescent::Subrule' ),
                                                                                                 'rightarg' => bless( {
                                                                                                                        'argcode' => undef,
                                                                                                                        'implicit' => undef,
                                                                                                                        'line' => 13,
                                                                                                                        'lookahead' => 0,
                                                                                                                        'matchrule' => 0,
                                                                                                                        'subrule' => 'multiplication'
                                                                                                                      }, 'Parse::RecDescent::Subrule' ),
                                                                                                 'type' => 'leftop'
                                                                                               }, 'Parse::RecDescent::Operator' ),
                                                                                        bless( {
                                                                                                 'code' => '{
              #warn \'addition \'
              #  if $Math::Symbolic::Parser::DEBUG;
              if (@{$item[1]} == 1) {
                $item[1][0]
              }
              else {
                my @it = @{$item[1]};
                my $tree = shift @it;
                while (@it) {
                  $tree = Math::Symbolic::Operator->new(
                    shift(@it), $tree, shift(@it)
                  );
                }
                $tree;
              }
            }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'line' => 14,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef,
                                                                           'number' => 0,
                                                                           'op' => [],
                                                                           'patcount' => 0,
                                                                           'strcount' => 0,
                                                                           'uncommit' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'vars' => ''
                                                   }, 'Parse::RecDescent::Rule' ),
                              'exp' => bless( {
                                                'calls' => [
                                                             'factor'
                                                           ],
                                                'changed' => 0,
                                                'impcount' => 0,
                                                'line' => 58,
                                                'name' => 'exp',
                                                'opcount' => 0,
                                                'prods' => [
                                                             bless( {
                                                                      'actcount' => 1,
                                                                      'dircount' => 1,
                                                                      'error' => undef,
                                                                      'items' => [
                                                                                   bless( {
                                                                                            'expected' => '<rightop: factor \'^\' factor>',
                                                                                            'hashname' => '__DIRECTIVE1__',
                                                                                            'leftarg' => bless( {
                                                                                                                  'argcode' => undef,
                                                                                                                  'implicit' => undef,
                                                                                                                  'line' => 58,
                                                                                                                  'lookahead' => 0,
                                                                                                                  'matchrule' => 0,
                                                                                                                  'subrule' => 'factor'
                                                                                                                }, 'Parse::RecDescent::Subrule' ),
                                                                                            'max' => 100000000,
                                                                                            'min' => 1,
                                                                                            'name' => '',
                                                                                            'op' => bless( {
                                                                                                             'description' => '\'^\'',
                                                                                                             'hashname' => '__STRING1__',
                                                                                                             'line' => 58,
                                                                                                             'lookahead' => 0,
                                                                                                             'pattern' => '^'
                                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                            'rightarg' => bless( {
                                                                                                                   'argcode' => undef,
                                                                                                                   'implicit' => undef,
                                                                                                                   'line' => 58,
                                                                                                                   'lookahead' => 0,
                                                                                                                   'matchrule' => 0,
                                                                                                                   'subrule' => 'factor'
                                                                                                                 }, 'Parse::RecDescent::Subrule' ),
                                                                                            'type' => 'rightop'
                                                                                          }, 'Parse::RecDescent::Operator' ),
                                                                                   bless( {
                                                                                            'code' => '{
              #warn \'exp \' if $Math::Symbolic::Parser::DEBUG;
              if (@{$item[1]} == 1) {
                $item[1][0]
              }
              else {
                my @it = reverse @{$item[1]};
                my $tree = shift @it;
                while (@it) {
                  $tree = Math::Symbolic::Operator->new(
                    \'^\', shift(@it), $tree
                  );
                }
                $tree;
              }
            }',
                                                                                            'hashname' => '__ACTION1__',
                                                                                            'line' => 59,
                                                                                            'lookahead' => 0
                                                                                          }, 'Parse::RecDescent::Action' )
                                                                                 ],
                                                                      'line' => undef,
                                                                      'number' => 0,
                                                                      'op' => [],
                                                                      'patcount' => 0,
                                                                      'strcount' => 1,
                                                                      'uncommit' => undef
                                                                    }, 'Parse::RecDescent::Production' )
                                                           ],
                                                'vars' => ''
                                              }, 'Parse::RecDescent::Rule' ),
                              'expr' => bless( {
                                                 'calls' => [
                                                              'addition'
                                                            ],
                                                 'changed' => 0,
                                                 'impcount' => 0,
                                                 'line' => 7,
                                                 'name' => 'expr',
                                                 'opcount' => 0,
                                                 'prods' => [
                                                              bless( {
                                                                       'actcount' => 1,
                                                                       'dircount' => 0,
                                                                       'error' => undef,
                                                                       'items' => [
                                                                                    bless( {
                                                                                             'argcode' => undef,
                                                                                             'implicit' => undef,
                                                                                             'line' => 7,
                                                                                             'lookahead' => 0,
                                                                                             'matchrule' => 0,
                                                                                             'subrule' => 'addition'
                                                                                           }, 'Parse::RecDescent::Subrule' ),
                                                                                    bless( {
                                                                                             'code' => '{
              #warn \'expr \' if $Math::Symbolic::Parser::DEBUG;
              $item[1]
            }',
                                                                                             'hashname' => '__ACTION1__',
                                                                                             'line' => 8,
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Action' )
                                                                                  ],
                                                                       'line' => undef,
                                                                       'number' => 0,
                                                                       'patcount' => 0,
                                                                       'strcount' => 0,
                                                                       'uncommit' => undef
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'vars' => ''
                                               }, 'Parse::RecDescent::Rule' ),
                              'expr_list' => bless( {
                                                      'calls' => [
                                                                   'expr'
                                                                 ],
                                                      'changed' => 0,
                                                      'impcount' => 0,
                                                      'line' => 194,
                                                      'name' => 'expr_list',
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'actcount' => 1,
                                                                            'dircount' => 1,
                                                                            'error' => undef,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'expected' => '<leftop: expr \',\' expr>',
                                                                                                  'hashname' => '__DIRECTIVE1__',
                                                                                                  'leftarg' => bless( {
                                                                                                                        'argcode' => undef,
                                                                                                                        'implicit' => undef,
                                                                                                                        'line' => 194,
                                                                                                                        'lookahead' => 0,
                                                                                                                        'matchrule' => 0,
                                                                                                                        'subrule' => 'expr'
                                                                                                                      }, 'Parse::RecDescent::Subrule' ),
                                                                                                  'max' => 100000000,
                                                                                                  'min' => 1,
                                                                                                  'name' => '',
                                                                                                  'op' => bless( {
                                                                                                                   'description' => '\',\'',
                                                                                                                   'hashname' => '__STRING1__',
                                                                                                                   'line' => 194,
                                                                                                                   'lookahead' => 0,
                                                                                                                   'pattern' => ','
                                                                                                                 }, 'Parse::RecDescent::Literal' ),
                                                                                                  'rightarg' => bless( {
                                                                                                                         'argcode' => undef,
                                                                                                                         'implicit' => undef,
                                                                                                                         'line' => 194,
                                                                                                                         'lookahead' => 0,
                                                                                                                         'matchrule' => 0,
                                                                                                                         'subrule' => 'expr'
                                                                                                                       }, 'Parse::RecDescent::Subrule' ),
                                                                                                  'type' => 'leftop'
                                                                                                }, 'Parse::RecDescent::Operator' ),
                                                                                         bless( {
                                                                                                  'code' => '{
              #warn \'expr_list \'
              #  if $Math::Symbolic::Parser::DEBUG;
              $item[1]
            }',
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'line' => 195,
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'line' => undef,
                                                                            'number' => 0,
                                                                            'op' => [],
                                                                            'patcount' => 0,
                                                                            'strcount' => 1,
                                                                            'uncommit' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'vars' => ''
                                                    }, 'Parse::RecDescent::Rule' ),
                              'factor' => bless( {
                                                   'calls' => [
                                                                'number',
                                                                'function',
                                                                'variable',
                                                                'expr'
                                                              ],
                                                   'changed' => 0,
                                                   'impcount' => 0,
                                                   'line' => 76,
                                                   'name' => 'factor',
                                                   'opcount' => 0,
                                                   'prods' => [
                                                                bless( {
                                                                         'actcount' => 1,
                                                                         'dircount' => 0,
                                                                         'error' => undef,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'description' => '/(?:\\\\+|-)*/',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'ldelim' => '/',
                                                                                               'line' => 76,
                                                                                               'lookahead' => 0,
                                                                                               'mod' => '',
                                                                                               'pattern' => '(?:\\+|-)*',
                                                                                               'rdelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'argcode' => undef,
                                                                                               'implicit' => undef,
                                                                                               'line' => 76,
                                                                                               'lookahead' => 0,
                                                                                               'matchrule' => 0,
                                                                                               'subrule' => 'number'
                                                                                             }, 'Parse::RecDescent::Subrule' ),
                                                                                      bless( {
                                                                                               'code' => '{
              #warn \'unary_n \'
              #  if $Math::Symbolic::Parser::DEBUG;
              if ($item[1]) {
                my @it = split //, $item[1];
                my $ret = $item[2];
                foreach (grep {$_ eq \'-\'} @it) {
                  $ret = Math::Symbolic::Operator->new(\'neg\',$ret);
                }
                $ret
              }
              else {
                $item[2]
              }
            }',
                                                                                               'hashname' => '__ACTION1__',
                                                                                               'line' => 77,
                                                                                               'lookahead' => 0
                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                    ],
                                                                         'line' => undef,
                                                                         'number' => 0,
                                                                         'patcount' => 1,
                                                                         'strcount' => 0,
                                                                         'uncommit' => undef
                                                                       }, 'Parse::RecDescent::Production' ),
                                                                bless( {
                                                                         'actcount' => 1,
                                                                         'dircount' => 0,
                                                                         'error' => undef,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'description' => '/(?:\\\\+|-)*/',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'ldelim' => '/',
                                                                                               'line' => 93,
                                                                                               'lookahead' => 0,
                                                                                               'mod' => '',
                                                                                               'pattern' => '(?:\\+|-)*',
                                                                                               'rdelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'argcode' => undef,
                                                                                               'implicit' => undef,
                                                                                               'line' => 93,
                                                                                               'lookahead' => 0,
                                                                                               'matchrule' => 0,
                                                                                               'subrule' => 'function'
                                                                                             }, 'Parse::RecDescent::Subrule' ),
                                                                                      bless( {
                                                                                               'code' => '{
              #warn \'unary_f \'
              #  if $Math::Symbolic::Parser::DEBUG;
              if ($item[1]) {
                my @it = split //, $item[1];
                my $ret = $item[2];
                foreach (grep {$_ eq \'-\'} @it) {
                  $ret = Math::Symbolic::Operator->new(\'neg\',$ret);
                }
                $ret
              }
              else {
                $item[2]
              }
            }',
                                                                                               'hashname' => '__ACTION1__',
                                                                                               'line' => 94,
                                                                                               'lookahead' => 0
                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                    ],
                                                                         'line' => 93,
                                                                         'number' => 1,
                                                                         'patcount' => 1,
                                                                         'strcount' => 0,
                                                                         'uncommit' => undef
                                                                       }, 'Parse::RecDescent::Production' ),
                                                                bless( {
                                                                         'actcount' => 1,
                                                                         'dircount' => 0,
                                                                         'error' => undef,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'description' => '/(?:\\\\+|-)*/',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'ldelim' => '/',
                                                                                               'line' => 110,
                                                                                               'lookahead' => 0,
                                                                                               'mod' => '',
                                                                                               'pattern' => '(?:\\+|-)*',
                                                                                               'rdelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'argcode' => undef,
                                                                                               'implicit' => undef,
                                                                                               'line' => 110,
                                                                                               'lookahead' => 0,
                                                                                               'matchrule' => 0,
                                                                                               'subrule' => 'variable'
                                                                                             }, 'Parse::RecDescent::Subrule' ),
                                                                                      bless( {
                                                                                               'code' => '{
              #warn \'unary_v \'
              #  if $Math::Symbolic::Parser::DEBUG;
              if ($item[1]) {
                my @it = split //, $item[1];
                my $ret = $item[2];
                foreach (grep {$_ eq \'-\'} @it) {
                  $ret = Math::Symbolic::Operator->new(\'neg\',$ret);
                }
                $ret
              }
              else {
                $item[2]
              }
            }',
                                                                                               'hashname' => '__ACTION1__',
                                                                                               'line' => 111,
                                                                                               'lookahead' => 0
                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                    ],
                                                                         'line' => 110,
                                                                         'number' => 2,
                                                                         'patcount' => 1,
                                                                         'strcount' => 0,
                                                                         'uncommit' => undef
                                                                       }, 'Parse::RecDescent::Production' ),
                                                                bless( {
                                                                         'actcount' => 1,
                                                                         'dircount' => 0,
                                                                         'error' => undef,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'description' => '/(?:\\\\+|-)*/',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'ldelim' => '/',
                                                                                               'line' => 127,
                                                                                               'lookahead' => 0,
                                                                                               'mod' => '',
                                                                                               'pattern' => '(?:\\+|-)*',
                                                                                               'rdelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'description' => '\'(\'',
                                                                                               'hashname' => '__STRING1__',
                                                                                               'line' => 127,
                                                                                               'lookahead' => 0,
                                                                                               'pattern' => '('
                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                      bless( {
                                                                                               'argcode' => undef,
                                                                                               'implicit' => undef,
                                                                                               'line' => 127,
                                                                                               'lookahead' => 0,
                                                                                               'matchrule' => 0,
                                                                                               'subrule' => 'expr'
                                                                                             }, 'Parse::RecDescent::Subrule' ),
                                                                                      bless( {
                                                                                               'description' => '\')\'',
                                                                                               'hashname' => '__STRING2__',
                                                                                               'line' => 127,
                                                                                               'lookahead' => 0,
                                                                                               'pattern' => ')'
                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                      bless( {
                                                                                               'code' => '{
              #warn \'unary_expr \'
              #  if $Math::Symbolic::Parser::DEBUG;
              if ($item[1]) {
                my @it = split //, $item[1];
                my $ret = $item[3];
                foreach (grep {$_ eq \'-\'} @it) {
                  $ret = Math::Symbolic::Operator->new(\'neg\',$ret);
                }
                $ret
              }
              else {
                $item[3]
              }
            }',
                                                                                               'hashname' => '__ACTION1__',
                                                                                               'line' => 128,
                                                                                               'lookahead' => 0
                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                    ],
                                                                         'line' => 127,
                                                                         'number' => 3,
                                                                         'patcount' => 1,
                                                                         'strcount' => 2,
                                                                         'uncommit' => undef
                                                                       }, 'Parse::RecDescent::Production' )
                                                              ],
                                                   'vars' => ''
                                                 }, 'Parse::RecDescent::Rule' ),
                              'function' => bless( {
                                                     'calls' => [
                                                                  'function_name',
                                                                  'expr_list'
                                                                ],
                                                     'changed' => 0,
                                                     'impcount' => 0,
                                                     'line' => 151,
                                                     'name' => 'function',
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'actcount' => 1,
                                                                           'dircount' => 0,
                                                                           'error' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'line' => 151,
                                                                                                 'lookahead' => 0,
                                                                                                 'matchrule' => 0,
                                                                                                 'subrule' => 'function_name'
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'description' => '\'(\'',
                                                                                                 'hashname' => '__STRING1__',
                                                                                                 'line' => 151,
                                                                                                 'lookahead' => 0,
                                                                                                 'pattern' => '('
                                                                                               }, 'Parse::RecDescent::Literal' ),
                                                                                        bless( {
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'line' => 151,
                                                                                                 'lookahead' => 0,
                                                                                                 'matchrule' => 0,
                                                                                                 'subrule' => 'expr_list'
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'description' => '\')\'',
                                                                                                 'hashname' => '__STRING2__',
                                                                                                 'line' => 151,
                                                                                                 'lookahead' => 0,
                                                                                                 'pattern' => ')'
                                                                                               }, 'Parse::RecDescent::Literal' ),
                                                                                        bless( {
                                                                                                 'code' => '{
              #warn \'function \' 
              #  if $Math::Symbolic::Parser::DEBUG;
              my $fname = $item[1];
              my $function;
              if (exists($Math::Symbolic::Parser::Parser_Functions{$fname})) {
                $function = $Math::Symbolic::Parser::Parser_Functions{$fname}->($fname, @{$item[3]});
                die "Invalid function \'$fname\'!"
                  unless defined $function;
              }
              else {
                $function = $Math::Symbolic::Operator::Op_Symbols{ $fname };
                die "Invalid function \'$fname\'!"
                  unless defined $function;
                $function = Math::Symbolic::Operator->new(
                  { type => $function, operands => $item[3] }
                );
              }
              $function
            }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'line' => 152,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef,
                                                                           'number' => 0,
                                                                           'patcount' => 0,
                                                                           'strcount' => 2,
                                                                           'uncommit' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'vars' => ''
                                                   }, 'Parse::RecDescent::Rule' ),
                              'function_name' => bless( {
                                                          'calls' => [],
                                                          'changed' => 0,
                                                          'impcount' => 0,
                                                          'line' => 173,
                                                          'name' => 'function_name',
                                                          'opcount' => 0,
                                                          'prods' => [
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'log\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 173,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'log'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => undef,
                                                                                'number' => 0,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'partial_derivative\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 174,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'partial_derivative'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 174,
                                                                                'number' => 1,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'total_derivative\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 175,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'total_derivative'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 175,
                                                                                'number' => 2,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'sinh\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 176,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'sinh'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 176,
                                                                                'number' => 3,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'cosh\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 177,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'cosh'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 177,
                                                                                'number' => 4,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'asinh\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 178,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'asinh'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 178,
                                                                                'number' => 5,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'acosh\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 179,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'acosh'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 179,
                                                                                'number' => 6,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'asin\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 180,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'asin'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 180,
                                                                                'number' => 7,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'acos\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 181,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'acos'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 181,
                                                                                'number' => 8,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'atan2\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 182,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'atan2'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 182,
                                                                                'number' => 9,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'atan\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 183,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'atan'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 183,
                                                                                'number' => 10,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'acot\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 184,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'acot'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 184,
                                                                                'number' => 11,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'sin\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 185,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'sin'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 185,
                                                                                'number' => 12,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'cos\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 186,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'cos'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 186,
                                                                                'number' => 13,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'tan\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 187,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'tan'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 187,
                                                                                'number' => 14,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'cot\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 188,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'cot'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 188,
                                                                                'number' => 15,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'exp\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 189,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'exp'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 189,
                                                                                'number' => 16,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'sqrt\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 190,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'sqrt'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 190,
                                                                                'number' => 17,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'actcount' => 0,
                                                                                'dircount' => 0,
                                                                                'error' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'ln\'',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'line' => 191,
                                                                                                      'lookahead' => 0,
                                                                                                      'pattern' => 'ln'
                                                                                                    }, 'Parse::RecDescent::Literal' )
                                                                                           ],
                                                                                'line' => 191,
                                                                                'number' => 18,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'uncommit' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'vars' => ''
                                                        }, 'Parse::RecDescent::Rule' ),
                              'identifier_list' => bless( {
                                                            'calls' => [],
                                                            'changed' => 0,
                                                            'impcount' => 0,
                                                            'line' => 259,
                                                            'name' => 'identifier_list',
                                                            'opcount' => 0,
                                                            'prods' => [
                                                                         bless( {
                                                                                  'actcount' => 1,
                                                                                  'dircount' => 1,
                                                                                  'error' => undef,
                                                                                  'items' => [
                                                                                               bless( {
                                                                                                        'expected' => '<leftop: /[a-zA-Z][a-zA-Z0-9_]*/ \',\' /[a-zA-Z][a-zA-Z0-9_]*/>',
                                                                                                        'hashname' => '__DIRECTIVE1__',
                                                                                                        'leftarg' => bless( {
                                                                                                                              'description' => '/[a-zA-Z][a-zA-Z0-9_]*/',
                                                                                                                              'hashname' => '__PATTERN1__',
                                                                                                                              'ldelim' => '/',
                                                                                                                              'line' => 259,
                                                                                                                              'lookahead' => 0,
                                                                                                                              'mod' => '',
                                                                                                                              'pattern' => '[a-zA-Z][a-zA-Z0-9_]*',
                                                                                                                              'rdelim' => '/'
                                                                                                                            }, 'Parse::RecDescent::Token' ),
                                                                                                        'max' => 100000000,
                                                                                                        'min' => 1,
                                                                                                        'name' => '',
                                                                                                        'op' => bless( {
                                                                                                                         'description' => '\',\'',
                                                                                                                         'hashname' => '__STRING1__',
                                                                                                                         'line' => 259,
                                                                                                                         'lookahead' => 0,
                                                                                                                         'pattern' => ','
                                                                                                                       }, 'Parse::RecDescent::Literal' ),
                                                                                                        'rightarg' => bless( {
                                                                                                                               'description' => '/[a-zA-Z][a-zA-Z0-9_]*/',
                                                                                                                               'hashname' => '__PATTERN2__',
                                                                                                                               'ldelim' => '/',
                                                                                                                               'line' => 259,
                                                                                                                               'lookahead' => 0,
                                                                                                                               'mod' => '',
                                                                                                                               'pattern' => '[a-zA-Z][a-zA-Z0-9_]*',
                                                                                                                               'rdelim' => '/'
                                                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                                        'type' => 'leftop'
                                                                                                      }, 'Parse::RecDescent::Operator' ),
                                                                                               bless( {
                                                                                                        'code' => '{
              #warn \'identifier_list \'
              #  if $Math::Symbolic::Parser::DEBUG;
              $item[1]
            }',
                                                                                                        'hashname' => '__ACTION1__',
                                                                                                        'line' => 260,
                                                                                                        'lookahead' => 0
                                                                                                      }, 'Parse::RecDescent::Action' )
                                                                                             ],
                                                                                  'line' => undef,
                                                                                  'number' => 0,
                                                                                  'op' => [],
                                                                                  'patcount' => 2,
                                                                                  'strcount' => 1,
                                                                                  'uncommit' => undef
                                                                                }, 'Parse::RecDescent::Production' )
                                                                       ],
                                                            'vars' => ''
                                                          }, 'Parse::RecDescent::Rule' ),
                              'mult_op' => bless( {
                                                    'calls' => [],
                                                    'changed' => 0,
                                                    'impcount' => 0,
                                                    'line' => 54,
                                                    'name' => 'mult_op',
                                                    'opcount' => 0,
                                                    'prods' => [
                                                                 bless( {
                                                                          'actcount' => 0,
                                                                          'dircount' => 0,
                                                                          'error' => undef,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'description' => '\'*\'',
                                                                                                'hashname' => '__STRING1__',
                                                                                                'line' => 54,
                                                                                                'lookahead' => 0,
                                                                                                'pattern' => '*'
                                                                                              }, 'Parse::RecDescent::Literal' )
                                                                                     ],
                                                                          'line' => undef,
                                                                          'number' => 0,
                                                                          'patcount' => 0,
                                                                          'strcount' => 1,
                                                                          'uncommit' => undef
                                                                        }, 'Parse::RecDescent::Production' ),
                                                                 bless( {
                                                                          'actcount' => 0,
                                                                          'dircount' => 0,
                                                                          'error' => undef,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'description' => '\'/\'',
                                                                                                'hashname' => '__STRING1__',
                                                                                                'line' => 55,
                                                                                                'lookahead' => 0,
                                                                                                'pattern' => '/'
                                                                                              }, 'Parse::RecDescent::Literal' )
                                                                                     ],
                                                                          'line' => 55,
                                                                          'number' => 1,
                                                                          'patcount' => 0,
                                                                          'strcount' => 1,
                                                                          'uncommit' => undef
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'vars' => ''
                                                  }, 'Parse::RecDescent::Rule' ),
                              'multiplication' => bless( {
                                                           'calls' => [
                                                                        'exp',
                                                                        'mult_op'
                                                                      ],
                                                           'changed' => 0,
                                                           'impcount' => 0,
                                                           'line' => 35,
                                                           'name' => 'multiplication',
                                                           'opcount' => 0,
                                                           'prods' => [
                                                                        bless( {
                                                                                 'actcount' => 1,
                                                                                 'dircount' => 1,
                                                                                 'error' => undef,
                                                                                 'items' => [
                                                                                              bless( {
                                                                                                       'expected' => '<leftop: exp mult_op exp>',
                                                                                                       'hashname' => '__DIRECTIVE1__',
                                                                                                       'leftarg' => bless( {
                                                                                                                             'argcode' => undef,
                                                                                                                             'implicit' => undef,
                                                                                                                             'line' => 35,
                                                                                                                             'lookahead' => 0,
                                                                                                                             'matchrule' => 0,
                                                                                                                             'subrule' => 'exp'
                                                                                                                           }, 'Parse::RecDescent::Subrule' ),
                                                                                                       'max' => 100000000,
                                                                                                       'min' => 1,
                                                                                                       'name' => '',
                                                                                                       'op' => bless( {
                                                                                                                        'argcode' => undef,
                                                                                                                        'implicit' => undef,
                                                                                                                        'line' => 35,
                                                                                                                        'lookahead' => 0,
                                                                                                                        'matchrule' => 0,
                                                                                                                        'subrule' => 'mult_op'
                                                                                                                      }, 'Parse::RecDescent::Subrule' ),
                                                                                                       'rightarg' => bless( {
                                                                                                                              'argcode' => undef,
                                                                                                                              'implicit' => undef,
                                                                                                                              'line' => 35,
                                                                                                                              'lookahead' => 0,
                                                                                                                              'matchrule' => 0,
                                                                                                                              'subrule' => 'exp'
                                                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                                       'type' => 'leftop'
                                                                                                     }, 'Parse::RecDescent::Operator' ),
                                                                                              bless( {
                                                                                                       'code' => '{
              #warn \'multiplication \'
              #  if $Math::Symbolic::Parser::DEBUG;
              if (@{$item[1]} == 1) {
                $item[1][0]
              }
              else {
                my @it = @{$item[1]};
                my $tree = shift @it;
                while (@it) {
                  $tree = Math::Symbolic::Operator->new(
                    shift(@it), $tree, shift(@it)
                  );
                }
                $tree;
              }
            }',
                                                                                                       'hashname' => '__ACTION1__',
                                                                                                       'line' => 36,
                                                                                                       'lookahead' => 0
                                                                                                     }, 'Parse::RecDescent::Action' )
                                                                                            ],
                                                                                 'line' => undef,
                                                                                 'number' => 0,
                                                                                 'op' => [],
                                                                                 'patcount' => 0,
                                                                                 'strcount' => 0,
                                                                                 'uncommit' => undef
                                                                               }, 'Parse::RecDescent::Production' )
                                                                      ],
                                                           'vars' => ''
                                                         }, 'Parse::RecDescent::Rule' ),
                              'number' => bless( {
                                                   'calls' => [],
                                                   'changed' => 0,
                                                   'impcount' => 0,
                                                   'line' => 144,
                                                   'name' => 'number',
                                                   'opcount' => 0,
                                                   'prods' => [
                                                                bless( {
                                                                         'actcount' => 1,
                                                                         'dircount' => 0,
                                                                         'error' => undef,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'description' => '/([+-]?)(?=\\\\d|\\\\.\\\\d)\\\\d*(\\\\.\\\\d*)?([Ee]([+-]?\\\\d+))?/',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'ldelim' => '/',
                                                                                               'line' => 144,
                                                                                               'lookahead' => 0,
                                                                                               'mod' => '',
                                                                                               'pattern' => '([+-]?)(?=\\d|\\.\\d)\\d*(\\.\\d*)?([Ee]([+-]?\\d+))?',
                                                                                               'rdelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'code' => '{
              #warn \'number \'
              #  if $Math::Symbolic::Parser::DEBUG;
              Math::Symbolic::Constant->new($item[1])
            }',
                                                                                               'hashname' => '__ACTION1__',
                                                                                               'line' => 145,
                                                                                               'lookahead' => 0
                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                    ],
                                                                         'line' => undef,
                                                                         'number' => 0,
                                                                         'patcount' => 1,
                                                                         'strcount' => 0,
                                                                         'uncommit' => undef
                                                                       }, 'Parse::RecDescent::Production' )
                                                              ],
                                                   'vars' => ''
                                                 }, 'Parse::RecDescent::Rule' ),
                              'parse' => bless( {
                                                  'calls' => [
                                                               'expr'
                                                             ],
                                                  'changed' => 0,
                                                  'impcount' => 0,
                                                  'line' => 1,
                                                  'name' => 'parse',
                                                  'opcount' => 0,
                                                  'prods' => [
                                                               bless( {
                                                                        'actcount' => 1,
                                                                        'dircount' => 0,
                                                                        'error' => undef,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'line' => 1,
                                                                                              'lookahead' => 0,
                                                                                              'matchrule' => 0,
                                                                                              'subrule' => 'expr'
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'description' => '/^\\\\Z/',
                                                                                              'hashname' => '__PATTERN1__',
                                                                                              'ldelim' => '/',
                                                                                              'line' => 1,
                                                                                              'lookahead' => 0,
                                                                                              'mod' => '',
                                                                                              'pattern' => '^\\Z',
                                                                                              'rdelim' => '/'
                                                                                            }, 'Parse::RecDescent::Token' ),
                                                                                     bless( {
                                                                                              'code' => '{
              $return = $item[1]
            }',
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'line' => 2,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => undef,
                                                                        'number' => 0,
                                                                        'patcount' => 1,
                                                                        'strcount' => 0,
                                                                        'uncommit' => undef
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'actcount' => 1,
                                                                        'dircount' => 0,
                                                                        'error' => undef,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'description' => '//',
                                                                                              'hashname' => '__PATTERN1__',
                                                                                              'ldelim' => '/',
                                                                                              'line' => 5,
                                                                                              'lookahead' => 0,
                                                                                              'mod' => '',
                                                                                              'pattern' => '',
                                                                                              'rdelim' => '/'
                                                                                            }, 'Parse::RecDescent::Token' ),
                                                                                     bless( {
                                                                                              'code' => '{undef}',
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'line' => 5,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 5,
                                                                        'number' => 1,
                                                                        'patcount' => 1,
                                                                        'strcount' => 0,
                                                                        'uncommit' => undef
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'vars' => ''
                                                }, 'Parse::RecDescent::Rule' ),
                              'variable' => bless( {
                                                     'calls' => [
                                                                  'identifier_list'
                                                                ],
                                                     'changed' => 0,
                                                     'impcount' => 0,
                                                     'line' => 201,
                                                     'name' => 'variable',
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'actcount' => 1,
                                                                           'dircount' => 0,
                                                                           'error' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'description' => '/[a-zA-Z][a-zA-Z0-9_]*/',
                                                                                                 'hashname' => '__PATTERN1__',
                                                                                                 'ldelim' => '/',
                                                                                                 'line' => 201,
                                                                                                 'lookahead' => 0,
                                                                                                 'mod' => '',
                                                                                                 'pattern' => '[a-zA-Z][a-zA-Z0-9_]*',
                                                                                                 'rdelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'description' => '/\\\\\'*/',
                                                                                                 'hashname' => '__PATTERN2__',
                                                                                                 'ldelim' => '/',
                                                                                                 'line' => 201,
                                                                                                 'lookahead' => 0,
                                                                                                 'mod' => '',
                                                                                                 'pattern' => '\\\'*',
                                                                                                 'rdelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'description' => '\'(\'',
                                                                                                 'hashname' => '__STRING1__',
                                                                                                 'line' => 201,
                                                                                                 'lookahead' => 0,
                                                                                                 'pattern' => '('
                                                                                               }, 'Parse::RecDescent::Literal' ),
                                                                                        bless( {
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'line' => 201,
                                                                                                 'lookahead' => 0,
                                                                                                 'matchrule' => 0,
                                                                                                 'subrule' => 'identifier_list'
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'description' => '\')\'',
                                                                                                 'hashname' => '__STRING2__',
                                                                                                 'line' => 201,
                                                                                                 'lookahead' => 0,
                                                                                                 'pattern' => ')'
                                                                                               }, 'Parse::RecDescent::Literal' ),
                                                                                        bless( {
                                                                                                 'code' => '{
              #warn \'variable \'
              #  if $Math::Symbolic::Parser::DEBUG;
              my $varname = $item[1];
              my $ticks = $item[2];
              if ($ticks) {
                my $n = length($ticks);
                my $sig = $item[4] || [\'x\'];
                my $dep_var = $sig->[0];
                my $return = Math::Symbolic::Variable->new(
                  { name => $varname, signature => $sig }
                );
                foreach (1..$n) {
                  $return = Math::Symbolic::Operator->new(
                    \'partial_derivative\', 
                     $return, $dep_var,
                  );
                }
                $return;
              }
              else {
                Math::Symbolic::Variable->new(
                  { name => $varname, signature => $item[4] }
                );
              }
            }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'line' => 202,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef,
                                                                           'number' => 0,
                                                                           'patcount' => 2,
                                                                           'strcount' => 2,
                                                                           'uncommit' => undef
                                                                         }, 'Parse::RecDescent::Production' ),
                                                                  bless( {
                                                                           'actcount' => 1,
                                                                           'dircount' => 0,
                                                                           'error' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'description' => '/[a-zA-Z][a-zA-Z0-9_]*/',
                                                                                                 'hashname' => '__PATTERN1__',
                                                                                                 'ldelim' => '/',
                                                                                                 'line' => 229,
                                                                                                 'lookahead' => 0,
                                                                                                 'mod' => '',
                                                                                                 'pattern' => '[a-zA-Z][a-zA-Z0-9_]*',
                                                                                                 'rdelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'description' => '/\\\\\'*/',
                                                                                                 'hashname' => '__PATTERN2__',
                                                                                                 'ldelim' => '/',
                                                                                                 'line' => 229,
                                                                                                 'lookahead' => 0,
                                                                                                 'mod' => '',
                                                                                                 'pattern' => '\\\'*',
                                                                                                 'rdelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'code' => '{
              #warn \'variable \'
              #  if $Math::Symbolic::Parser::DEBUG;
              my $varname = $item[1];
              my $ticks = $item[2];
              if ($ticks) {
                my $n = length($ticks);
                my $return = Math::Symbolic::Variable->new(
                  { name => $varname, signature => [\'x\'] }
                );
                foreach (1..$n) {
                  $return = Math::Symbolic::Operator->new(
                    \'partial_derivative\', 
                     $return, \'x\',
                  );
                }
                $return;
              }
              elsif ( $varname eq \'pi\' ) {
                Math::Symbolic::Constant->pi();
              }
              elsif ( $varname eq \'e\' ) {
                Math::Symbolic::Constant->euler();
              }
              else {                
                Math::Symbolic::Variable->new( $varname );
              }
            }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'line' => 230,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => 229,
                                                                           'number' => 1,
                                                                           'patcount' => 2,
                                                                           'strcount' => 0,
                                                                           'uncommit' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'vars' => ''
                                                   }, 'Parse::RecDescent::Rule' )
                            },
                 'startcode' => ''
               }, 'Parse::RecDescent' );
}
1;
