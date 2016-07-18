# NAME

HTML::Auto - write HTML for common elements

# VERSION

version 0.08

# SYNOPSIS

Simple example:

    use HTML::Auto qw/matrix h v/;

    my @cols = qw/c1 c2 c3 c4 c5/;
    my @lines = qw/l1 l2 l3 l4 l5/;
    my $data =
       [ [1,2,3,4,5],
         [6,7,8,9,0],
         [1,1,1,1,1],
         [2,2,2,2,2],
         [3,3,3,3,3] ];

    my $m = matrix(\@cols,\@lines,$data);

    print v(
            h($m,$m,$m),
            h($m,$m),
          );

Using attributes:

    use HTML::Auto qw/matrix h v/;

    my @cols = qw/c1 c2/;
    my @lines = qw/l1 l2/;
    my $data =
       [
         [
           {v => 1, a => { style => 'background: green'}},
           2
         ],
         [
           {v => 3, a => {class => 'foo'}},
           {v => 4, a => {style => 'color: red'}}
         ]
       ];

    my $m = matrix(\@cols,\@lines,$data);

    print v(
            h($m)
          );

With mouse-over span:

    use HTML::Auto qw/matrix h v/;

    my @cols = qw/c1 c2/;
    my @lines = qw/l1 l2/;
    my $data =
       [[1,2],
      [3,
      { v=> 4,
        more_info => "This is a pop-up!"
      }]
     ];


    my $m = matrix(\@cols,\@lines,$data);

    print v(
            h($m)
          );

Passing additional CSS:

    use HTML::Auto qw/matrix h v/;

    my @cols = qw/c1 c2/;
    my @lines = qw/l1 l2/;
    my $data =
       [
         [
           {v => 1, a => { class => 'warn'}},
           2
         ],
         [3,4]
       ];

    my $options = { css => '.warn { background-color: yellow !important; }' };

    my $m = matrix(\@cols,\@lines,$data,$options);

    print v(
            h($m)
          );

# FUNCTIONS

## matrix

Build a matrix. Some options are available to pass to the matrix function:

- `diagonal`

    Highlight the diagonal of the matrix.

        my $m = matrix(\@cols,\@lines,$data, {diagonal => 1});

- `format`

    Pass a string to be used by the `format` filter in the TT2 template.

        my $m = matrix(\@cols,\@lines,$data, {format => '%.6f'});

- `ucfirst`

    Option to uppercase first letter in columns and lines labels.

        my $m = matrix(\@cols,\@lines,$data, {ucfirst => 1});

## h

A function to allow horizontal composition.

## v

A function to allow vertical composition.

# AUTHORS

- Nuno Carvalho <smash@cpan.org>
- André Santos <andrefs@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2012-2016 by Project Natura <natura@natura.di.uminho.pt>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
