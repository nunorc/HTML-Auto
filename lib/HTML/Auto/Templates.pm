package HTML::Auto::Templates;
use base qw/Template::Provider/;

use warnings;
use strict;

=head1 NAME

HTML::Auto::Templates - this module stores HTML::Auto templates

=head1 VERSION

Version 0.02

=cut

our $VERSION = '0.02';

my $templates = {

'matrix' => <<'EOT'
<style type="text/css">
td:hover {
    background-color: #aaaaaa;
}
table.main th {
    padding-top: 70px;
    padding-bottom: 10px;
    padding-left: 5px;
    padding-right: 5px;
    width: 20px;
    background-color: #aaaaaa;
}
table.main td {
    text-align: center;
    width: 30px;
    background-color: #eeeeee;
}
td.more_info { 
    position:relative;
	z-index:24;
    text-decoration:none;
    cursor: default;
    color: black;
	width: 80px;
}
td.more_info:hover{
    z-index:25;
}
td.more_info td {
	width: auto;
}

td.more_info span {
	display: none
}
td.more_info:hover span { 
    display:block;
    position:absolute;
    border:1px solid #ccc;
	min-width:24em;
    background-color:#fff;
	color:#000;
    text-align: left;
    font-size: 80%;
    text-decoration: none;
} 
span.vertical {
    -webkit-transform: rotate(-90deg);
    -moz-transform: rotate(-90deg);
    writing-mode: tb-rl;
    filter: flipv fliph;
    display: block;
    width: 20px;
    /*height: 70px;*/
    white-space: nowrap;
}
.fst {
    width: 80px;
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
[% IF css %]
[% css %]
[% END %]
</style>

<table class="main">
	<tr>
		<th class="empty"></th>
		[% FOREACH i IN cols %]
			<th><span class="vertical">[% i -%]</span></th>
		[% END %]
	</tr>
	[% i_c = 0 %]
	[% FOREACH i IN vals %]
		<tr>
		<td class="fst">[% lines.shift -%]</td>
		[% j_c = 0 %]
		[% FOREACH j IN i %]
			<td
				[% IF i_c == j_c %]
					[% class = "mid" %]
				[% END %]
				[% IF more.$i_c.$j_c %]
					[% class = "more_info " _  class %]
				[% END %]
				[% class = class _  attrs.$i_c.$j_c.class %]
				[% attrs.$i_c.$j_c.delete('class') %]
				class="[% class %]" 
				[% FOREACH att IN attrs.$i_c.$j_c.keys %]
					[% att %]="[% attrs.$i_c.$j_c.$att %]" 
				[% END %]
			>[% j %]
				[% IF more.$i_c.$j_c %]
					<span>[% more.$i_c.$j_c %]</span> 
				[% END %]
			</td> 
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

Copyright 2012 Nuno Carvalho.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of HTML::Auto
