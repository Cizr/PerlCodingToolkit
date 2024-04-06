# Linear Search Algorithm in Perl

# Function to perform linear search
sub linear_search {
    my ($arr, $target) = @_;
    my $n = scalar(@$arr);

    for (my $i = 0; $i < $n; $i++) {
        if ($arr->[$i] == $target) {
            return $i;  # Element found, return its index
        }
    }

    return -1;  # Element not found
}

# Example usage
my @arr = (1, 3, 5, 7, 9, 11, 13, 15, 17);
my $target = 11;
my $index = linear_search(\@arr, $target);

if ($index != -1) {
    print "Element $target found at index $index\n";
} else {
    print "Element $target not found in the array\n";
}
