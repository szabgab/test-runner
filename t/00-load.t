use strict;
use warnings;

use Test::More;

use Test::Runner;


my @files = glob('t/files/*.json');
plan tests => scalar @files;

foreach my $file (@files) {
	@ARGV = ('--file', $file);
	my $tr = Test::Runner->new;
	$tr->run;
	#diag explain $tr->code;
	my $pl_file = substr($file, 0, -4) . "pl";
	my @expected = slurp($pl_file);
	chomp @expected;
	is_deeply($tr->code, \@expected, $file) or diag explain $tr->code;
}


sub slurp {
	my $file = shift;
	open my $fh, '<', $file or die;
	if (wantarray) {
		return <$fh>;
	} else {
		local $/ = undef;
		return <$fh>;
	}
}