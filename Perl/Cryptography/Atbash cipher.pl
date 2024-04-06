use strict;
use warnings;

# Atbash cipher implementation
sub atbash_cipher {
    my ($text) = @_;
    my $result = "";
    foreach my $char (split //, $text) {
        if ($char =~ /[A-Za-z]/) {
            my $ascii_offset = $char =~ /[a-z]/ ? ord('a') : ord('A');
            my $distance = ord('z') - ord($char) + ord('a');
            $result .= chr($ascii_offset + $distance);
        } else {
            $result .= $char; # Non-alphabetic characters remain unchanged
        }
    }
    return $result;
}

# Main function
sub main {
    my $plaintext = "Perl - The Swiss Army chainsaw of scripting languages";

    # Encryption
    my $encrypted_text = atbash_cipher($plaintext);
    print "\nAfter Encryption: $encrypted_text";

    # Decryption (Atbash cipher is its own inverse)
    my $decrypted_text = atbash_cipher($encrypted_text);
    print "\nAfter Decryption: $decrypted_text";
}

# Call the main function
main();
