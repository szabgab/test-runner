use strict;
use warnings;

use Test::More;
plan tests => 1;
use Test::WWW::Mechanize;
my %tools;
$tools{1} = Test::WWW::Mechanize->new();
$tools{1}->get_ok('http://www.google.com/', );
