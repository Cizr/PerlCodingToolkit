
use strict;
use warnings;

# Convert a hexadecimal number to its decimal equivalent using a loop
sub hexa_to_decimal_1 {
    my ($num) = @_;
    my $dec_num;
    my $base = 0;

    # Splitting the hex string into hex characters, can use "" or // as delimiter
    # Also we will start with the rightmost bit hence reverse to start from it.
    my @chars = reverse(split("", $num));
    while ($base < scalar(@chars)) {
        my $temp_dec;

        if ($chars[$base] ge "A" and $chars[$base] le "F") {

            # if the bit is between 'A' and 'F' get the equivalent decimal number
            $temp_dec = ord($chars[$base]) - 55;
        }
        else {
            # else the bit is less than or equal to 9 which is same in decimal
            $temp_dec = $chars[$base];
        }
        $dec_num += $temp_dec * (16**$base);
        $base++;
    }
    return $dec_num;
}

# Convert a hexadecimal number to its decimal equivalent using 'oct' function
sub hexa_to_decimal_2 {
    my ($num) = @_;

    # oct - interprets EXPR as a hex string and returns the corresponding value
    my $dec_num = oct("0x" . $num);
    return $dec_num;
}

# Convert a hexadecimal number to its decimal equivalent using 'hex' function
sub hexa_to_decimal_3 {
    my ($num) = @_;

    # hex - interprets EXPR as a hex string and returns the corresponding decimal value
    my $dec_num = hex($num);
    return $dec_num;
}

# Test cases
print "Decimal equivalent (Method 1): ", hexa_to_decimal_1("2D"), "\n"; # 45
print "Decimal equivalent (Method 2): ", hexa_to_decimal_2("2D"), "\n"; # 45
print "Decimal equivalent (Method 3): ", hexa_to_decimal_3("2D"), "\n"; # 45
