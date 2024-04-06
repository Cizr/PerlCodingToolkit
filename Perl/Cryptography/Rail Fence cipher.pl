
use strict;
use warnings;

# Rail Fence cipher implementation
sub rail_fence_cipher {
    my ($text, $rails, $decrypt) = @_;
    my @rows = ('') x $rails;
    my $row = 0;
    my $down = 1;

    foreach my $char (split //, $text) {
        $rows[$row] .= $char;
        $down = -$down if $row == 0 || $row == $rails - 1;
        $row += $down;
    }

    my $result = join '', $decrypt ? rail_fence_decrypt(@rows) : @rows;
    return $result;
}

# Decrypt the Rail Fence cipher
sub rail_fence_decrypt {
    my @rows = @_;
    my $text_length = length($rows[0]);
    my $text = '';

    my $row = 0;
    my $down = 1;

    for (my $i = 0; $i < $text_length; $i++) {
        $text .= substr($rows[$row], 0, 1, '');
        $down = -$down if $row == 0 || $row == @rows - 1;
        $row += $down;
    }

    return $text;
}

# Main function
sub main {
    my $plaintext = "Perl - The Swiss Army chainsaw of scripting languages";
    my $rails = 3; # Example number of rails

    # Encryption
    my $encrypted_text = rail_fence_cipher($plaintext, $rails);
    print "\nAfter Encryption: $encrypted_text";

    # Decryption
    my $decrypted_text = rail_fence_cipher($encrypted_text, $rails, 1); # Pass 1 to decrypt
    print "\nAfter Decryption: $decrypted_text";
}

# Call the main function
main();
