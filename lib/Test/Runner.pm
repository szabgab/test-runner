package Test::Runner;
use Moose;

use autodie;
use Data::Dumper qw(Dumper);
use Getopt::Long qw(GetOptions);
use JSON ();

has 'file' => (isa => 'Str', is => 'rw');

sub run {
	my $self = shift;

	my %opt;
	GetOptions(\%opt,
		'file=s',
	) or _usage();
	$self->file($opt{file}) if $opt{file};


	_usage() if not $self->file;


	my $data_json = slurp($self->file);
	my $data = JSON::from_json($data_json);
	print Dumper $data;
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
