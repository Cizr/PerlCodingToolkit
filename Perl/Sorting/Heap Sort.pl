sub heapify {
    my ($arr, $n, $i) = @_;
    my $largest = $i;
    my $left = 2 * $i + 1;
    my $right = 2 * $i + 2;
    if ($left < $n && $arr->[$left] > $arr->[$largest]) {
        $largest = $left;
    }
    if ($right < $n && $arr->[$right] > $arr->[$largest]) {
        $largest = $right;
    }
    if ($largest != $i) {
        ($arr->[$i], $arr->[$largest]) = ($arr->[$largest], $arr->[$i]);
        heapify($arr, $n, $largest);
    }
}

sub heap_sort {
    my ($arr) = @_;
    my $n = scalar(@$arr);
    for (my $i = int($n / 2) - 1; $i >= 0; $i--) {
        heapify($arr, $n, $i);
    }
    for (my $i = $n - 1; $i >= 0; $i--) {
        ($arr->[0], $arr->[$i]) = ($arr->[$i], $arr->[0]);
        heapify($arr, $i, 0);
    }
    return @$arr;
}

# Example usage
my @arr = (64, 34, 25, 12, 22, 11, 90);
print "Sorted array: ", join(", ", heap_sort(\@arr)), "\n";
