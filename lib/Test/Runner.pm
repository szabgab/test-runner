package Test::Runner;
use Moose;

use autodie;
use Data::Dumper qw(Dumper);
use Getopt::Long qw(GetOptions);
use JSON ();


after 'new' => sub {
	my %opt;
	GetOptions(\%opt,
		'file=s',
	) or usage();
	usage() if not $opt{file};


	my $data_json = slurp($opt{file});
	my $data = JSON::from_json($data_json);
	print Dumper $data;
};


sub slurp {
	my $file = shift;
	open my $fh, '<', $file;
	local $/ = undef;
	return <$fh>;
}

sub usage {
	print <<"END_USAGE";
Usage: $0
         --file FILENAME     mandatory

         --help
END_USAGE
	exit;
}

1;
