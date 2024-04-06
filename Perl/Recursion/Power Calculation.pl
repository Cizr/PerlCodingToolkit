
use strict;
use warnings;

# Power calculation using recursion
sub power {
    my ($base, $exp) = @_;
    return 1 if $exp == 0;
    return $base * power($base, $exp - 1);
}

# Main program
my ($base, $exp) = (2, 5);
print "$base raised to the power of $exp is ", power($base, $exp), "\n";
