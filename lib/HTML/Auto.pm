package HTML::Auto;

use warnings;
use strict;

use Template;
use HTML::Auto::Templates;
use Data::Dumper;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(matrix h v);

=head1 NAME

HTML::Auto - The great new HTML::Auto!

=head1 VERSION

Version 0.01_1

=cut

our $VERSION = '0.01_1';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use HTML::Auto;

    my $foo = HTML::Auto->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 matrix

=cut

sub matrix {
	my ($cols,$lines,$data,$options) = @_;

	# pre-process data
	foreach (@$cols) {
		$_ = ucfirst($_);
	}
	foreach (@$lines) {
		$_ = ucfirst($_);
	}

	my $vars = {
			cols => $cols,
			lines => $lines,
			data => $data,
		};
	my $template_name = 'matrix';

	__process($template_name, $vars);
}

=head2 h

A function to allow horizontal composition.

=cut

sub h {
	my (@list) = @_;

	my $vars = {
			list => [@list],
		};
	my $template_name = 'h';

	__process($template_name, $vars);
}

=head2 v

A function to allow vertical composition.

=cut

sub v {
   my (@list) = @_;

   my $vars = {
         list => [@list],
      };
   my $template_name = 'v';

   __process($template_name, $vars);
}

=head2 __process

TODO

=cut

sub __process {
	my ($template_name,$vars) = @_;

	# build html from template
   my $template_config = {
         INCLUDE_PATH => [ 'templates' ],
      };
   my $template = Template->new({
        LOAD_TEMPLATES => [ HTML::Auto::Templates->new($template_config) ],
   });
	my $html;
   $template->process($template_name, $vars, \$html);

	$html;
}

=head1 AUTHOR

Nuno Carvalho, C<< <smash at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-html-auto at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=HTML-Auto>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc HTML::Auto


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=HTML-Auto>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/HTML-Auto>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/HTML-Auto>

=item * Search CPAN

L<http://search.cpan.org/dist/HTML-Auto/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Nuno Carvalho.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of HTML::Auto
