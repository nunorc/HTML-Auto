#!perl -T

use Test::More tests => 2;
use HTML::Auto qw/h v/;

# 1
my $t1 = h('l','r');
$t1 =~ s/\s+//sg;
my $g1 = '<div><divstyle="float:left;">l</div><divstyle="float:left;">r</div><spanstyle="clear:both;"></div></div>';
ok ($t1 eq $g1, 'simple h test');

# 2
my $t2 = v('u','d');
$t2 =~ s/\s+//sg;
my $g2 = '<div>u</div><div>d</div>';
ok ($t2 eq $g2, 'simple v test');
