use strict;
use warnings;

use Test::More;
plan tests => 2;
use Test::Runner::Mechanize;
my %tools;
$tools{1} = Test::Runner::Mechanize->new();
$tools{1}->get_ok(url => 'http://www.google.com/', );
$tools{1}->content_like(regex => qr{<title>Google</title>}, );
