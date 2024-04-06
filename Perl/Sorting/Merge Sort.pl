sub merge {
    my ($arr, $left, $mid, $right) = @_;
    my @temp = @$arr;
    my $i = $left;
    my $j = $mid + 1;
    my $k = $left;
    while ($i <= $mid && $j <= $right) {
        if ($temp[$i] <= $temp[$j]) {
            $arr->[$k] = $temp[$i];
            $i++;
        } else {
            $arr->[$k] = $temp[$j];
            $j++;
        }
        $k++;
    }
    while ($i <= $mid) {
        $arr->[$k] = $temp[$i];
        $i++;
        $k++;
    }
    return @$arr;
}

sub merge_sort {
    my ($arr, $left, $right) = @_;
    if ($left < $right) {
        my $mid = int(($left + $right) / 2);
        merge_sort($arr, $left, $mid);
        merge_sort($arr, $mid + 1, $right);
        merge($arr, $left, $mid, $right);
    }
    return @$arr;
}

# Example usage
my @arr = (64, 34, 25, 12, 22, 11, 90);
print "Sorted array: ", join(", ", merge_sort(\@arr, 0, scalar(@arr) - 1)), "\n";
