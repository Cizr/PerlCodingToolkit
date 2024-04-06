# Exponential Search Algorithm in Perl

# Function to perform binary search
sub binary_search {
    my ($arr, $target, $left, $right) = @_;

    while ($left <= $right) {
        my $mid = int($left + ($right - $left) / 2);

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

# Function to perform exponential search
sub exponential_search {
    my ($arr, $target) = @_;
    my $n = scalar(@$arr);

    # If target is present at first position itself
    return 0 if $arr->[0] == $target;

    # Find range for binary search by repeated doubling
    my $i = 1;
    while ($i < $n && $arr->[$i] <= $target) {
        $i *= 2;
    }

    # Call binary search for the found range
    return binary_search($arr, $target, int($i / 2), min($i, $n - 1));
}

# Example usage
use List::Util qw(min);
my @arr = (1, 3, 5, 7, 9, 11, 13, 15, 17);
my $target = 11;
my $index = exponential_search(\@arr, $target);

if ($index != -1) {
    print "Element $target found at index $index\n";
} else {
    print "Element $target not found in the array\n";
}
