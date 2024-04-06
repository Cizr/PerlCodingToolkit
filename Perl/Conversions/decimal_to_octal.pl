
use strict;
use warnings;

# Convert a decimal number to its octal equivalent using a loop
sub decimal_to_octal_1 {
    my ($num) = @_;
    my $octal_num;
    while ($num > 0) {
        my $remainder = $num % 8;
        if (defined $octal_num) {
            $octal_num = $remainder . $octal_num;
        }
        else {
            $octal_num = $remainder;
        }
        $num = int($num / 8);
    }
    return $octal_num;
}

# Convert a decimal number to its octal equivalent using 'sprintf'
sub decimal_to_octal_2 {
    my ($num) = @_;
    my $octal_num = sprintf("%o", $num);
    return $octal_num;
}

# Test cases
print "Octal equivalent (Method 1): ", decimal_to_octal_1(45), "\n"; # 55
print "Octal equivalent (Method 2): ", decimal_to_octal_2(45), "\n"; # 55
