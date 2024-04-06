
use strict;
use warnings;

# Convert a binary number to its decimal equivalent using a loop
sub binary_to_decimal_1 {
    my ($num) = @_;
    my $dec_num;
    my $base = 0;
    while ($num > 0) {
        my $remainder = $num % 10;
        $dec_num += $remainder * (2**$base);
        $base++;
        $num = int($num / 10);
    }
    return $dec_num;
}

# Convert a binary number to its decimal equivalent using 'oct' function
sub binary_to_decimal_2 {
    my ($num) = @_;

    # oct - interprets EXPR as a binary string and returns the corresponding value
    return oct('0b' . $num);
}

# Test cases
print "Decimal equivalent (Method 1): ", binary_to_decimal_1(1001), "\n";
print "Decimal equivalent (Method 2): ", binary_to_decimal_2(1001), "\n";
