
use strict;
use warnings;

# Define a Node class for Huffman tree
package Node {
    sub new {
        my ($class, %args) = @_;
        my $self = {
            char  => $args{char},
            freq  => $args{freq},
            left  => $args{left},
            right => $args{right}
        };
        bless $self, $class;
        return $self;
    }
}

# Huffman coding function
sub huffman {
    my ($text) = @_;

    # Count frequency of each character
    my %freq;
    $freq{$_}++ foreach split('', $text);

    # Build Huffman tree
    my @queue = map { Node->new(char => $_, freq => $freq{$_}) } keys %freq;
    while (@queue > 1) {
        @queue = sort { $a->{freq} <=> $b->{freq} } @queue;
        my $left = shift @queue;
        my $right = shift @queue;
        my $parent = Node->new(freq => $left->{freq} + $right->{freq}, left => $left, right => $right);
        push @queue, $parent;
    }
    my $root = $queue[0];

    # Generate Huffman codes
    my %codes;
    generate_codes($root, '', \%codes);

    # Encode text using Huffman codes
    my $encoded_text = '';
    $encoded_text .= $codes{$_} foreach split('', $text);

    return ($encoded_text, \%codes);
}

# Helper function to generate Huffman codes
sub generate_codes {
    my ($node, $code, $codes) = @_;
    if ($node->{char}) {
        $codes->{$node->{char}} = $code;
    } else {
        generate_codes($node->{left}, $code.'0', $codes);
        generate_codes($node->{right}, $code.'1', $codes);
    }
}

# Example usage
my $text = "hello world";
my ($encoded_text, $codes) = huffman($text);
print "Original text: $text\n";
print "Encoded text: $encoded_text\n";
print "Huffman codes:\n";
print "$_: $$codes{$_}\n" foreach keys %$codes;
