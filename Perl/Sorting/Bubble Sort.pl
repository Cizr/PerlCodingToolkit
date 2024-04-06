sub bubble_sort {
    my ($arr) = @_;
    my $n = scalar(@$arr);
    for (my $i = 0; $i < $n-1; $i++) {
        for (my $j = 0; $j < $n-$i-1; $j++) {
            if ($arr->[$j] > $arr->[$j+1]) {
                ($arr->[$j], $arr->[$j+1]) = ($arr->[$j+1], $arr->[$j]);
            }
        }
    }
    return @$arr;
}

# Example usage
my @arr = (64, 34, 25, 12, 22, 11, 90);
print "Sorted array: ", join(", ", bubble_sort(\@arr)), "\n";
