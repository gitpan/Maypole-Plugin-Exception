use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Maypole::Plugin::Exception',
    AUTHOR       => 'Sebastian Riedel (sri@oook.de)',
    VERSION_FROM => 'Exception.pm',
    PREREQ_PM    => { Maypole => '2.0', 'Exception::Class' => 0 }
);
