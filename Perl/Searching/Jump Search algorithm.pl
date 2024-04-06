# Jump Search Algorithm in Perl

# Function to perform jump search
sub jump_search {
    my ($arr, $target) = @_;
    my $n = scalar(@$arr);
    my $step = int(sqrt($n));
    my $prev = 0;

    # Jumping ahead in steps
    while ($arr->[$step - 1] < $target) {
        $prev = $step;
        $step += int(sqrt($n));
        last if $prev >= $n;  # If the step exceeds the array size, break
    }

    # Linear search in the block starting from prev
    for (my $i = $prev; $i < $step && $i < $n; $i++) {
        return $i if $arr->[$i] == $target;
    }

    return -1;  # Element not found
}

# Example usage
my @arr = (1, 3, 5, 7, 9, 11, 13, 15, 17);
my $target = 11;
my $index = jump_search(\@arr, $target);

if ($index != -1) {
    print "Element $target found at index $index\n";
} else {
    print "Element $target not found in the array\n";
}
