
use strict;
use warnings;

# Morse code mappings
my %morse_code = (
    "A"  => ".-",
    "B"  => "-...",
    "C"  => "-.-.",
    # Rest of the Morse code mappings...
);

# Reverse Morse code mappings
my %reverse_morse_code = reverse %morse_code;

# Convert text to Morse code
sub convert_to_morse {
    my ($text) = @_;
    my @characters = split(//, $text);
    my $result = "";
    foreach my $character (@characters) {
        if ($character ne " ") {
            if ($morse_code{$character}) {
                $result .= $morse_code{$character} . " ";
            }
            else {
                print "\nUnknown character: " . $character;
            }
        }
        else {
            $result .= " ";
        }
    }
    return $result;
}

# Convert Morse code to text
sub convert_from_morse {
    my ($message) = @_;
    my @characters = split(/ /, $message);
    my $result = "";
    foreach my $character (@characters) {
        if ($reverse_morse_code{$character}) {
            $result .= $reverse_morse_code{$character};
        }
        elsif ($character eq "") {
            $result .= " ";
        }
        else {
            print "\nUnknown character: " . $character;
        }
    }
    return $result;
}

# Main function
sub main {
    my $text = "Perl - The Swiss Army chainsaw of scripting languages";

    # Convert text to uppercase for Morse code encryption
    my $encrypted_morse_code = convert_to_morse(uc($text));
    print "\nEncrypted: " . $encrypted_morse_code;

    # Decrypt Morse code to text
    my $decrypted_morse_code = convert_from_morse($encrypted_morse_code);
    print "\nDecrypted: " . $decrypted_morse_code;
}

# Call the main function
main();
