use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'HTML::Auto',
    AUTHOR              => q{Nuno Carvalho <smash@cpan.org>},
    VERSION_FROM        => 'lib/HTML/Auto.pm',
    ABSTRACT_FROM       => 'lib/HTML/Auto.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'File::Basename' => 0,
        'Test::More'     => 0,
        'Template'       => 0
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'HTML-Auto-*' },
);
