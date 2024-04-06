# Ternary Search Algorithm in Perl

# Function to perform ternary search
sub ternary_search {
    my ($arr, $target) = @_;
    my $left = 0;
    my $right = scalar(@$arr) - 1;

    while ($left <= $right) {
        my $mid1 = $left + int(($right - $left) / 3);
        my $mid2 = $right - int(($right - $left) / 3);

        if ($arr->[$mid1] == $target) {
            return $mid1;  # Element found at mid1
        } elsif ($arr->[$mid2] == $target) {
            return $mid2;  # Element found at mid2
        } elsif ($target < $arr->[$mid1]) {
            $right = $mid1 - 1;  # Search in the left one-third
        } elsif ($target > $arr->[$mid2]) {
            $left = $mid2 + 1;  # Search in the right one-third
        } else {
            $left = $mid1 + 1;
            $right = $mid2 - 1;  # Search in the middle one-third
        }
    }

    return -1;  # Element not found
}

# Example usage
my @arr = (1, 3, 5, 7, 9, 11, 13, 15, 17);
my $target = 11;
my $index = ternary_search(\@arr, $target);

if ($index != -1) {
    print "Element $target found at index $index\n";
} else {
    print "Element $target not found in the array\n";
}
