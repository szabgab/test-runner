package Test::Telnet;
use strict;
use warnings;

# this will be released in its own package

=head1 NAME

Test::Telnet - testing via Net::Telnet

=head1 SYNOPSIS

  use Test::More;
  plan tests => 1;

  use Test::Telnet;

  my $t = Test::Telnet->new();

=head1 DESCRIPTION

=cut

use base 'Net::Telnet';

sub new {
	#Net::Telnet
}

1;

