#Import modules to enable strict and warning mode,
#which helps in detecting errors and potential issues in the code.
use strict;
use warnings;

#Define a subroutine called ceaser_cipher to perform Caesar cipher encryption or decryption.
#Parameters:
# - $text: The text to be encrypted or decrypted.
# - $shift: The shift value used in the Caesar cipher.
# - $decrypt: A boolean indicating whether to perform decryption.
sub ceaser_cipher {
    my ($text, $shift, $decrypt) = @_; #Retrieve parameters from the function call.

    #If decryption flag is set, adjust the shift value accordingly.
    if ($decrypt) {
        $shift = 26 - $shift; #Reverse the shift to decrypt.
    }

    #Split the input text into individual characters.
    my @characters = split(//, $text);

    #Initialize an empty string to store the result.
    my $result = "";

    #Iterate over each character in the text.
    foreach my $character (@characters) {

        #Get the ASCII value of the current character.
        my $asciinum = ord($character);

        #Check if the character is uppercase.
        if ($character =~ /[A-Z]/) {
            #Apply Caesar cipher to uppercase letters.
            #ASCII value of 'A' is 65.
            #Perform the shift operation and ensure it wraps around within the range of uppercase letters.
            $result = $result . chr(($asciinum + $shift - 65) % 26 + 65);
        }
        else {
            #Apply Caesar cipher to lowercase letters.
            #ASCII value of 'a' is 97.
            #Perform the shift operation and ensure it wraps around within the range of lowercase letters.
            $result = $result . chr(($asciinum + $shift - 97) % 26 + 97);
        }
    }

    #Return the resulting encrypted or decrypted text.
    return $result;
}

#Define the main subroutine to demonstrate Caesar cipher encryption and decryption.
sub main {
    #Define the text to be encrypted.
    my $text_to_encrypt = "racim";

    #Define the shift value for the Caesar cipher.
    my $shift = 1;

    #Encrypt the text using the ceaser_cipher subroutine.
    my $encrypted_text = ceaser_cipher($text_to_encrypt, $shift);

    #Print the encrypted text.
    print "\nAfter Encryption: " . $encrypted_text;

    #Decrypt the encrypted text using the ceaser_cipher subroutine.
    #Pass 1 as the third argument to indicate decryption.
    my $decrypted_text = ceaser_cipher($encrypted_text, $shift, 1);

    #Print the decrypted text.
    print "\nAfter Decryption: " . $decrypted_text;
}

#Call the main subroutine to execute the program.
main();
