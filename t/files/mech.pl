use strict;
use warnings;

use Test::More;
plan tests => 1;
use Test::Runner::Mechanize;
my %tools;
$tools{1} = Test::Runner::Mechanize->new();
$tools{1}->get_ok(url => 'http://www.google.com/', );
