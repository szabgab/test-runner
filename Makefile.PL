use 5.008005;
use ExtUtils::MakeMaker 6.56;

WriteMakefile(
    NAME           => 'Test::Runner',
    ABSTRACT_FROM  => 'lib/Test/Runner.pm',
    VERSION_FROM => 'lib/Test/Runner.pm',
    LICENSE      => 'perl',
    EXE_FILES    => ['script/test_runner.pl'],
    
    META_MERGE => {
        resources => {
            repository => '',
            bugtracker => '',
            homepage   => '',
        },
    },

    BUILD_REQUIRES => {
        'Test::More'             => '0.87',
    },

    PREREQ_PM => {

        'autodie'                => '0',
        'Data::Dumper'           => '0',
        'Getopt::Long'           => '0',
        'JSON'                   => '0',
        'Moose'                  => '0',
        'Test::WWW::Mechanize'   => '0',

#        'File::Basename'         => '0',
#        'File::Spec'             => '0',
    },
    # $params{CONFIGURE_REQUIRES};
    # $params{MIN_PERL_VERSION};

#    test      => {TESTS => join( ' ', (glob( 't/*.t'), glob('t/*/*.t')))},
#    clean     => {FILES => "t/lib/sessions/*.yml logs/*.log t/*/logs/*" }

);


