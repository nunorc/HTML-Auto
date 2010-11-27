use HTML::Auto qw/matrix/;

my @cols = qw/c1 c2 c3 c4 c5/;
my @lines = qw/l1 l2 l3 l4 l5/;
my $data = 
	[ [1,2,3,4,5],
	  [6,7,8,9,0],
	  [1,1,1,1,1],
	  [2,2,2,2,2],
	  [3,3,3,3,3] ];

print matrix(\@cols,\@lines,$data);
