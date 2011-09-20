package HTML::Auto::Templates;
use base qw/Template::Provider/;

use warnings;
use strict;

=head1 NAME

HTML::Auto::Templates - this module stores the templates

=head1 VERSION

Version 0.01_2

=cut

our $VERSION = '0.01_3';

my $templates = {

'matrix' => <<'EOT'
<style type="text/css">
span {
    -webkit-transform: rotate(-90deg);
    -moz-transform: rotate(-90deg);
    writing-mode: tb-rl;
    filter: flipv fliph;
    display: block;
    width: 20px;
    /*height: 70px;*/
    white-space: nowrap;
}
th {
    padding-top: 50px;
    padding-bottom: 10px;
    padding-left: 5px;
    padding-right: 5px;
    width: 20px;
    background-color: #aaaaaa;
}
td {
    text-align: center;
    width: 20px;
    background-color: #eeeeee;
}
.fst {
    width: 60px;
    font-weight: bold;
    background-color: #aaaaaa;
    padding: 5px;
}
.empty {
    background-color: white;
}
.mid {
    background-color: #cccccc;
}
</style>

<table>
	<tr>
		<th class="empty"></th>
		[% FOREACH i IN cols %]
			<th><span>[% i -%]</span></th>
		[% END %]
	</tr>
	[% i_c = 0 %]
	[% FOREACH i IN vals %]
		<tr>
		<td class="fst">[% lines.shift -%]</td>
		[% j_c = 0 %]
		[% FOREACH j IN i %]
			<td[% IF i_c == j_c %] class="mid"[% END %]
			[% FOREACH att IN attrs.$i_c.$j_c.keys %]
				[% att %]="[% attrs.$i_c.$j_c.$att %]" 
			[% END %]
			>[% j %]</td>
			[% j_c = j_c + 1 %]
		[% END %]
		</tr>
		[% i_c = i_c + 1 %]
	[% END %]
</table>
EOT
,
'h' => <<'EOT'
<div>
	[% FOREACH i IN list %]
		<div style="float: left;">[% i %]</div>
	[% END %]
	<span style="clear: both;"></div>
</div>
EOT
,
'v' => <<'EOT'
[% FOREACH i IN list %]
	<div>[% i %]</div>
[% END %]
EOT

};

=head2 _template_modified

TODO

=cut

sub _template_modified {
    my($self,$path) = @_;

   return 1;
}

=head2 _template_content

TODO

=cut

sub _template_content {
    my($self,$path) = @_;

   $path =~ s#^templates/##;
    $self->debug("get $path") if $self->{DEBUG};

   my $data = $templates->{$path};
   my $error = "error: $path not found";
   my $mod_date = 1;

   return $data;
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
