#########
# Author:        rmp
# Last Modified: $Date$ $Author$
# Id:            $Id$
# Source:        $Source: /cvsroot/Bio-DasLite/Bio-DasLite/t/00-critic.t,v $
# $HeadURL$
#
package critic;
use strict;
use warnings;
use Test::More;
use English qw(-no_match_vars);

if (!$ENV{TEST_AUTHOR}) {
  my $msg = 'Author test.  Set $ENV{TEST_AUTHOR} to a true value to run.';
  plan( skip_all => $msg );
}

eval {
  require Test::Perl::Critic;
};

if($EVAL_ERROR) {
  plan skip_all => 'Test::Perl::Critic not installed';

} else {
  Test::Perl::Critic->import(
			 -severity => 1,
			 -exclude  => [
                            'tidy',
                            'ValuesAndExpressions::ProhibitImplicitNewlines',
                            'ValuesAndExpressions::RequireConstantVersion',
                            'Documentation::PodSpelling',
                            'ProhibitLongChainsOfMethodCalls'
                          ],
			 -profile  => 't/perlcriticrc',
			    );
  all_critic_ok();
}

1;