# Interpolation Search Algorithm in Perl

# Function to perform interpolation search
sub interpolation_search {
    my ($arr, $target) = @_;
    my $low = 0;
    my $high = scalar(@$arr) - 1;

    while ($low <= $high && $target >= $arr->[$low] && $target <= $arr->[$high]) {
        my $pos = $low + int(($high - $low) / ($arr->[$high] - $arr->[$low]) * ($target - $arr->[$low]));

        if ($arr->[$pos] == $target) {
            return $pos;  # Element found, return its index
        }

        if ($arr->[$pos] < $target) {
            $low = $pos + 1;  # Search in the right half
        } else {
            $high = $pos - 1;  # Search in the left half
        }
    }

    return -1;  # Element not found
}

# Example usage
my @arr = (1, 3, 5, 7, 9, 11, 13, 15, 17);
my $target = 11;
my $index = interpolation_search(\@arr, $target);

if ($index != -1) {
    print "Element $target found at index $index\n";
} else {
    print "Element $target not found in the array\n";
}
