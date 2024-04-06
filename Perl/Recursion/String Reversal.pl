
use strict;
use warnings;

# String reversal using recursion
sub reverse_string {
    my ($str) = @_;
    return $str if length($str) <= 1;
    return reverse_string(substr($str, 1)) . substr($str, 0, 1);
}

# Main program
my $string = "hello";
print "Reversed string: ", reverse_string($string), "\n";
