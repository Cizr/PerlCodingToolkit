use strict;
use warnings;

# Function to calculate the distance between two points
sub distance {
    my ($x1, $y1, $x2, $y2) = @_;
    return sqrt(($x1 - $x2)**2 + ($y1 - $y2)**2);
}

# Function to solve the TSP using dynamic programming
sub tsp {
    my ($n, $distances_ref) = @_;

    # Initialize the DP table
    my @dp;
    for (my $mask = 0; $mask < (1 << $n); $mask++) {
        for (my $i = 0; $i < $n; $i++) {
            $dp[$mask][$i] = -1;
        }
    }

    # Base case: Starting from city 0
    $dp[1][0] = 0;

    # Iterate over all possible subsets of cities
    for (my $mask = 1; $mask < (1 << $n); $mask++) {
        for (my $i = 0; $i < $n; $i++) {
            # If city $i is not visited yet and is reachable from the current subset
            if (($mask & (1 << $i)) && $dp[$mask][$i] != -1) {
                # Iterate over all cities
                for (my $j = 0; $j < $n; $j++) {
                    # If city $j is not visited yet and is reachable from city $i
                    if (!($mask & (1 << $j))) {
                        my $new_mask = $mask | (1 << $j);
                        if ($dp[$new_mask][$j] == -1 || $dp[$new_mask][$j] > $dp[$mask][$i] + $distances_ref->[$i][$j]) {
                            $dp[$new_mask][$j] = $dp[$mask][$i] + $distances_ref->[$i][$j];
                        }
                    }
                }
            }
        }
    }

    # Find the shortest Hamiltonian cycle
    my $min_distance = -1;
    for (my $i = 1; $i < $n; $i++) {
        if ($dp[(1 << $n) - 1][$i] != -1 && ($min_distance == -1 || $min_distance > $dp[(1 << $n) - 1][$i] + $distances_ref->[$i][0])) {
            $min_distance = $dp[(1 << $n) - 1][$i] + $distances_ref->[$i][0];
        }
    }

    return $min_distance;
}

# Main subroutine
sub main {
    # Example cities and their coordinates
    my @cities = (
        [0, 0],
        [1, 2],
        [3, 1],
        [2, 3]
    );

    # Calculate distances between each pair of cities
    my @distances;
    my $n = scalar @cities;
    for (my $i = 0; $i < $n; $i++) {
        for (my $j = 0; $j < $n; $j++) {
            $distances[$i][$j] = distance($cities[$i][0], $cities[$i][1], $cities[$j][0], $cities[$j][1]);
        }
    }

    # Solve the TSP
    my $min_distance = tsp($n, \@distances);

    # Print the minimum distance
    print "Minimum distance of the TSP: $min_distance\n";
}

# Call the main subroutine to execute the program
main();
