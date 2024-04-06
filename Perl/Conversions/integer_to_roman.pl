
use strict;
use warnings;

# Mapping of decimal values to Roman numeral symbols
my %rom_sym_val = (
    1     => "I",
    5     => "V",
    10    => "X",
    50    => "L",
    100   => "C",
    500   => "D",
    1000  => "M",
    5000  => "G",
    10000 => "H"
);

# Convert an integer to its Roman numeral representation
sub integer_to_roman {
    my ($decimal_num) = @_;
    my $roman_num = "";

    # Find the most significant digit
    my $divisor = 1;
    while ($decimal_num > $divisor) {
        $divisor *= 10;
    }
    $divisor /= 10;

    while ($decimal_num > 0) {
        my $most_sig_digit = int($decimal_num / $divisor);

        # String operators: concatenation (.), repetition (x)
        if ($most_sig_digit <= 3) {
            $roman_num .= $rom_sym_val{$divisor} x $most_sig_digit;
        }
        elsif ($most_sig_digit == 4) {
            $roman_num .= $rom_sym_val{$divisor} . $rom_sym_val{$divisor * 5};
        }
        elsif ($most_sig_digit >= 5 and $most_sig_digit <= 8) {
            $roman_num .= $rom_sym_val{$divisor * 5} . ($rom_sym_val{$divisor} x ($most_sig_digit - 5));
        }
        else {
            # For number 9
            $roman_num .= $rom_sym_val{$divisor} . ($rom_sym_val{$divisor * 10});
        }
        $decimal_num = int($decimal_num % $divisor);
        $divisor /= 10;
    }
    return $roman_num;
}

# Test cases
print("\n" . integer_to_roman(28));      # XXVIII
print("\n" . integer_to_roman(64));      # LXIV
print("\n" . integer_to_roman(99));      # XCIX
print("\n" . integer_to_roman(414));     # CDXIV
print("\n" . integer_to_roman(595));     # DXCV
print("\n" . integer_to_roman(1511));    # MDXI
