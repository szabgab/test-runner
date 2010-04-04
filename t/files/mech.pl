use strict;
use warnings;

my %tools;
$tools{1} = Test::Runner::Mechanize->new();
$tools{1}->get_url(url => 'http://www.google.com/', );
