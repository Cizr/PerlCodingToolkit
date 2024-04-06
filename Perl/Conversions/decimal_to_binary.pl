
use strict;
use warnings;

# Convert a decimal number to its binary equivalent using a loop
sub decimal_to_binary_1 {
    my ($num) = @_;
    my $bin_num;
    while ($num > 0) {
        my $remainder = $num % 2;
        if (defined $bin_num) {
            $bin_num = $remainder . $bin_num;
        }
        else {
            $bin_num = $remainder;
        }
        $num = int($num / 2);
    }
    return $bin_num;
}

# Convert a decimal number to its binary equivalent using 'sprintf'
sub decimal_to_binary_2 {
    my ($num) = @_;
    my $bin_num = sprintf("%b", $num);
    return $bin_num;
}

# Test cases
print "Binary equivalent (Method 1): ", decimal_to_binary_1(9), "\n"; # 1001
print "Binary equivalent (Method 2): ", decimal_to_binary_2(9), "\n"; # 1001
