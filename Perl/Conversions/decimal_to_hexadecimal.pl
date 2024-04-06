
use strict;
use warnings;

# Convert a decimal number to its hexadecimal equivalent using a loop
sub decimal_to_hexa_1 {
    my ($num) = @_;
    my $hex_num = '';
    while ($num > 0) {
        my $remainder = $num % 16;
        if ($remainder < 10) {
            $hex_num = chr($remainder + 48) . $hex_num;
        }
        else {
            $hex_num = chr($remainder + 55) . $hex_num;
        }
        $num = int($num / 16);
    }
    return $hex_num;
}

# Convert a decimal number to its hexadecimal equivalent using 'sprintf'
sub decimal_to_hexa_2 {
    my ($num) = @_;
    my $hex_num = sprintf("%X", $num);
    return $hex_num;
}

# Test cases
print "Hexadecimal equivalent (Method 1): ", decimal_to_hexa_1(45), "\n"; # 2D
print "Hexadecimal equivalent (Method 2): ", decimal_to_hexa_2(45), "\n"; # 2D
