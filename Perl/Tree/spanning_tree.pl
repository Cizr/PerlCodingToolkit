
use strict;
use warnings;

# Function to find the vertex with minimum key value
sub min_key_vertex {
    my ($key, $mst_set, $V) = @_;
    my $min = 999999;  # Initialize min value
    my $min_index = -1;

    for (my $v = 0; $v < $V; $v++) {
        if (!$mst_set->[$v] && $key->[$v] < $min) {
            $min = $key->[$v];
            $min_index = $v;
        }
    }
    return $min_index;
}

# Function to print MST
sub print_mst {
    my ($parent, $graph, $V) = @_;
    print "Edge \tWeight\n";
    for (my $i = 1; $i < $V; $i++) {
        print "$parent->[$i] - $i \t$graph->[$i][$parent->[$i]]\n";
    }
}

# Function to construct MST using Prim's algorithm
sub prim_mst {
    my ($graph, $V) = @_;
    my @parent;   # Array to store constructed MST
    my @key;      # Key values used to pick minimum weight edge in cut
    my @mst_set;  # Array to represent set of vertices not yet included in MST

    # Initialize all keys as INFINITE and mst_set[] as false
    for (my $i = 0; $i < $V; $i++) {
        $key[$i] = 999999;
        $mst_set[$i] = 0;
    }

    # Always include first 1st vertex in MST.
    # Make key 0 so that this vertex is picked as first vertex.
    $key[0] = 0;     # First node is always root of MST
    $parent[0] = -1; # First node is always root of MST

    # The MST will have V vertices
    for (my $count = 0; $count < $V-1; $count++) {
        # Pick the minimum key vertex from the set of vertices not yet included in MST
        my $u = min_key_vertex(\@key, \@mst_set, $V);
        $mst_set[$u] = 1;  # Add the picked vertex to the MST set

        # Update key value and parent index of the adjacent vertices of the picked vertex.
        # Consider only those vertices which are not yet included in the MST
        for (my $v = 0; $v < $V; $v++) {
            # graph[u][v] is non-zero only for adjacent vertices of m
            # mst_set[v] is false for vertices not yet included in MST
            # Update the key only if graph[u][v] is smaller than key[v]
            if ($graph->[$u][$v] && !$mst_set[$v] && $graph->[$u][$v] < $key[$v]) {
                $parent[$v] = $u;
                $key[$v] = $graph->[$u][$v];
            }
        }
    }

    # Print the constructed MST
    print_mst(\@parent, $graph, $V);
}

# Example usage
my $V = 5;  # Number of vertices in graph
my @graph = (
    [0, 2, 0, 6, 0],
    [2, 0, 3, 8, 5],
    [0, 3, 0, 0, 7],
    [6, 8, 0, 0, 9],
    [0, 5, 7, 9, 0]
);

# Print the Minimum Spanning Tree
prim_mst(\@graph, $V);
