package Test::Runner::Mechanize;
use strict;
use warnings;

use base 'Test::WWW::Mechanize';

sub get_ok {
	my ($self, %params) = @_;
	my $url = delete $params{url};
	return $self->SUPER::get_ok($url);
}

sub content_like {
	my ($self, %params) = @_;
	my $regex = delete $params{regex};
	return $self->SUPER::content_like($regex);
}

1;
