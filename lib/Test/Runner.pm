package Test::Runner;
use Moose;

use autodie;
use Data::Dumper qw(Dumper);
use Getopt::Long qw(GetOptions);
use JSON ();

has 'file' => (isa => 'Str',      is => 'rw');
has 'code' => (isa => 'ArrayRef', is => 'rw');

our $VERSION = '0.01';

=head1 NAME

Test::Runner - running tests written in JSON format

=cut

sub run {
	my $self = shift;

	my %opt;
	GetOptions(\%opt,
		'file=s',
	) or _usage();
	$self->file($opt{file}) if $opt{file};

	_usage() if not $self->file;

	my $data_json = slurp($self->file);
	my $data = eval { JSON::from_json($data_json) };
	if ($@) {
		die sprintf "Incorrect format in file '%s'\n", $self->file;
	}
	#print Dumper $data;

	if (not ref $data or ref $data ne 'HASH') {
		die "Invalid content";
	}

#	print "$data->{name}\n";
	if (not $data->{format} or $data->{format} ne '0.01') {
		die "Unknown format\n";
	}
	my @code = ('use strict;', 'use warnings;', '', 'my %tools;');
	my $highest_id = 0;
	foreach my $step ( @{ $data->{steps} } ) {
		if ($step->{id} > $highest_id and $step->{action} = 'new') {
			$highest_id = $step->{id};
			push @code, '$tools{' . $step->{id} . '} = ' . 'Test::Runner::' . $step->{tool} . '->new(' . ');';
			next;
		}

		# hmm we are serializing the params here, should we just use Data::Dumper?
		my $params = '';
		foreach my $k (keys %{ $step->{params} }) {
			$params .= "$k => '$step->{params}{$k}', ";
		}
		push @code, '$tools{' . $step->{id} . '}->' . $step->{action} . '(' . $params . ');';
	}
	$self->code(\@code);
};


sub slurp {
	my $file = shift;
	open my $fh, '<', $file;
	local $/ = undef;
	return <$fh>;
}

sub _usage {
	print <<"END_USAGE";
Usage: $0
         --file FILENAME     mandatory

         --help
END_USAGE
	exit;
}

1;
