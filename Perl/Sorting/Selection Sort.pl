sub selection_sort {
    my ($arr) = @_;
    my $n = scalar(@$arr);
    for (my $i = 0; $i < $n-1; $i++) {
        my $min_index = $i;
        for (my $j = $i+1; $j < $n; $j++) {
            if ($arr->[$j] < $arr->[$min_index]) {
                $min_index = $j;
            }
        }
        ($arr->[$i], $arr->[$min_index]) = ($arr->[$min_index], $arr->[$i]);
    }
    return @$arr;
}

# Example usage
my @arr = (64, 34, 25, 12, 22, 11, 90);
print "Sorted array: ", join(", ", selection_sort(\@arr)), "\n";
