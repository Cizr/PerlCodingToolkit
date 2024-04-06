
use strict;
use warnings;

# Vigenère cipher implementation
sub vigenere_cipher {
    my ($text, $keyword, $decrypt) = @_;
    if (length($text) != length($keyword)) {
        # Make the length of text and keyword equal by repeating the keyword
        foreach my $i (0 .. (length($text) - length($keyword) - 1)) {
            $keyword = $keyword . substr($keyword, $i % length($keyword), 1);
        }
    }
    my $result;
    foreach my $i (0 .. length($text) - 1) {
        if ($decrypt) {
            # Decryption: (encryptedtext - key + 26) mod 26
            my $offset = (ord(substr($text, $i, 1)) - ord(substr($keyword, $i, 1)) + 26) % 26;
            $result .= chr(ord('A') + $offset);
        } else {
            # Encryption: (text + key) mod 26
            my $offset = (ord(substr($text, $i, 1)) + ord(substr($keyword, $i, 1))) % 26;
            $result .= chr(ord('A') + $offset);
        }
    }
    return $result;
}

# Main function
sub main {
    my $plaintext = uc("Perl - The Swiss Army chainsaw of scripting languages");
    my $keyword   = uc("Gaurav");

    # Encryption
    my $encrypted_text = vigenere_cipher($plaintext, $keyword);
    print "\nAfter Encryption: " . $encrypted_text;

    # Decryption
    my $decrypted_text = vigenere_cipher($encrypted_text, $keyword, 'decrypt');
    print "\nAfter Decryption: " . $decrypted_text;
}

# Call the main function
main();
