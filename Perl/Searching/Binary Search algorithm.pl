# Binary Search Algorithm in Perl

# Function to perform binary search
sub binary_search {
    my ($arr, $target) = @_;
    my $left = 0;
    my $right = scalar(@$arr) - 1;

    while ($left <= $right) {
        my $mid = int(($left + $right) / 2);
        
        if ($arr->[$mid] == $target) {
            return $mid;  # Element found, return its index
        } elsif ($arr->[$mid] < $target) {
            $left = $mid + 1;  # Search in the right half
        } else {
            $right = $mid - 1;  # Search in the left half
        }
    }

    return -1;  # Element not found
}

# Example usage
my @arr = (1, 3, 5, 7, 9, 11, 13, 15, 17);
my $target = 11;
my $index = binary_search(\@arr, $target);

if ($index != -1) {
    print "Element $target found at index $index\n";
} else {
    print "Element $target not found in the array\n";
}
