#!perl -T

use Test::More tests => 3;
use HTML::Auto qw/matrix h v/;
use Data::Dumper;

my $tests = {
  'simple h test' => {
    test => "h('l','r')",
    gold => '<div> <div style="float: left;">l</div> <div style="float: left;">r</div> <span style="clear: both;"></div> </div>'
  },
  'simple v test' => {
    test => "v('u','d')",
    gold => '<div>u</div> <div>d</div>'
  },
  'simple matrix test' => {
    test => 'matrix([qw/c1 c2/],[qw/l1 l2/],[ [1,0], [0,1] ])',
    gold => '<style type="text/css"> span { -webkit-transform: rotate(-90deg); -moz-transform: rotate(-90deg); writing-mode: tb-rl; filter: flipv fliph; display: block; width: 20px; /*height: 70px;*/ white-space: nowrap; } th { padding-top: 50px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px; width: 20px; background-color: #aaaaaa; } td { text-align: center; width: 20px; background-color: #eeeeee; } .fst { width: 60px; font-weight: bold; background-color: #aaaaaa; padding: 5px; } .empty { background-color: white; } .mid { background-color: #cccccc; } </style> <table> <tr> <th class="empty"></th> <th><span>C1</span></th> <th><span>C2</span></th> </tr> <tr> <td class="fst">L1</td> <td class="mid" >1</td> <td >0</td> </tr> <tr> <td class="fst">L2</td> <td >0</td> <td class="mid" >1</td> </tr> </table>'
  },
};

foreach (keys %$tests) {
  ok(run($tests->{$_}->{test}) eq $tests->{$_}->{gold}, $_);
}

sub run {
    clean(eval $_[0]);
}

sub clean {
  my $_ = shift;
  $_ =~ s/^\s+|\s+$//sg;
  $_ =~ s/\s+/ /sg;
  return $_;
}
