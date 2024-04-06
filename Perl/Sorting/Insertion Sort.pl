sub insertion_sort {
    my ($arr) = @_;
    my $n = scalar(@$arr);
    for (my $i = 1; $i < $n; $i++) {
        my $key = $arr->[$i];
        my $j = $i - 1;
        while ($j >= 0 && $arr->[$j] > $key) {
            $arr->[$j + 1] = $arr->[$j];
            $j = $j - 1;
        }
        $arr->[$j + 1] = $key;
    }
    return @$arr;
}

# Example usage
my @arr = (64, 34, 25, 12, 22, 11, 90);
print "Sorted array: ", join(", ", insertion_sort(\@arr)), "\n";
