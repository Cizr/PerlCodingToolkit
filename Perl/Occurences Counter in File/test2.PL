
use strict;
use warnings;

my %words;
my $file = 'sample.txt';

open(my $fh, '<', $file) or die "Can't open $file: $!";

while (my $line = <$fh>) {
    chomp $line;
    foreach my $word (split /\s+/, $line) {
        $words{lc $word}++;
    }
}

close $fh;

foreach my $word (sort keys %words) {
    print "$word: $words{$word}\n";
}


