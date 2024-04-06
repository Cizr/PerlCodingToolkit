
use strict;
use warnings;

# Run-Length Encoding function
sub rle_compress {
    my ($text) = @_;
    
    # Initialize variables
    my $encoded_text = '';
    my $count = 1;
    my $prev_char = substr($text, 0, 1);
    
    # Iterate over each character in the text
    for (my $i = 1; $i < length($text); $i++) {
        my $char = substr($text, $i, 1);
        
        # If the current character is equal to the previous one, increment count
        if ($char eq $prev_char) {
            $count++;
        }
        # If the current character is different, append the count and character to the encoded text
        else {
            $encoded_text .= "$count$prev_char";
            $count = 1;
            $prev_char = $char;
        }
    }
    # Append the count and character of the last run to the encoded text
    $encoded_text .= "$count$prev_char";

    return $encoded_text;
}

# Example usage
my $text = "aaabbbbcccddeee";
my $compressed_text = rle_compress($text);
print "Original text: $text\n";
print "Compressed text: $compressed_text\n";
