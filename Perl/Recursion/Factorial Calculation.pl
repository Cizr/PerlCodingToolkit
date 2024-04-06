
use strict;
use warnings;

# Factorial calculation using recursion
sub factorial {
    my ($n) = @_;
    return 1 if $n == 0;
    return $n * factorial($n - 1);
}

# Main program
my $number = 5;
print "Factorial of $number is ", factorial($number), "\n";
