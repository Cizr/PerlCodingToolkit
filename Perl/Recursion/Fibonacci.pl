
use strict;
use warnings;

# Fibonacci sequence using recursion
sub fibonacci {
    my ($n) = @_;
    return $n if $n <= 1;
    return fibonacci($n - 1) + fibonacci($n - 2);
}

# Main program
my $num_terms = 10;
print "Fibonacci sequence up to $num_terms terms:\n";
for my $i (0..$num_terms-1) {
    print fibonacci($i), " ";
}
print "\n";
