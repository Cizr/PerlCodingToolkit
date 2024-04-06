
use strict;
use warnings;

# Function to solve the knapsack problem using dynamic programming
sub knapsack {
    my ($capacity, $weights_ref, $values_ref, $n) = @_;

    # Initialize the DP table
    my @dp;
    for (my $i = 0; $i <= $n; $i++) {
        for (my $w = 0; $w <= $capacity; $w++) {
            if ($i == 0 || $w == 0) {
                $dp[$i][$w] = 0;
            } elsif ($weights_ref->[$i - 1] <= $w) {
                $dp[$i][$w] = max($values_ref->[$i - 1] + $dp[$i - 1][$w - $weights_ref->[$i - 1]], $dp[$i - 1][$w]);
            } else {
                $dp[$i][$w] = $dp[$i - 1][$w];
            }
        }
    }

    # Trace back to find the selected items
    my $max_value = $dp[$n][$capacity];
    my $remaining_capacity = $capacity;
    my @selected_items;
    for (my $i = $n; $i > 0 && $max_value > 0; $i--) {
        if ($max_value != $dp[$i - 1][$remaining_capacity]) {
            push @selected_items, $i - 1;
            $max_value -= $values_ref->[$i - 1];
            $remaining_capacity -= $weights_ref->[$i - 1];
        }
    }

    # Return the maximum value and the indices of selected items
    return ($dp[$n][$capacity], \@selected_items);
}

# Helper function to find the maximum of two values
sub max {
    my ($a, $b) = @_;
    return $a > $b ? $a : $b;
}

# Main subroutine
sub main {
    # Example knapsack capacity and items
    my $capacity = 50;
    my @weights = (10, 20, 30);
    my @values = (60, 100, 120);
    my $n = scalar @weights;

    # Solve the knapsack problem
    my ($max_value, $selected_items_ref) = knapsack($capacity, \@weights, \@values, $n);

    # Print the results
    print "Maximum value that can be obtained: $max_value\n";
    if (@$selected_items_ref) {
        print "Selected items:\n";
        foreach my $index (@$selected_items_ref) {
            print "Item $index (weight: $weights[$index], value: $values[$index])\n";
        }
    } else {
        print "No items selected.\n";
    }
}

# Call the main subroutine to execute the program
main();
