sub partition {
    my ($arr, $low, $high) = @_;
    my $pivot = $arr->[$high];
    my $i = $low - 1;
    for (my $j = $low; $j < $high; $j++) {
        if ($arr->[$j] < $pivot) {
            $i++;
            ($arr->[$i], $arr->[$j]) = ($arr->[$j], $arr->[$i]);
        }
    }
    ($arr->[$i+1], $arr->[$high]) = ($arr->[$high], $arr->[$i+1]);
    return $i + 1;
}

sub quick_sort {
    my ($arr, $low, $high) = @_;
    if ($low < $high) {
        my $pi = partition($arr, $low, $high);
        quick_sort($arr, $low, $pi - 1);
        quick_sort($arr, $pi + 1, $high);
    }
    return @$arr;
}

# Example usage
my @arr = (64, 34, 25, 12, 22, 11, 90);
print "Sorted array: ", join(", ", quick_sort(\@arr, 0, scalar(@arr) - 1)), "\n";
