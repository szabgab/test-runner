package Test::Runner::Mechanize;
use strict;
use warnings;

use base 'Test::WWW::Mechanize';

sub get_ok {
	my ($self, %params) = @_;
	my $url = delete $params{url};
	return $self->SUPER::get_ok($url);
}

1;
