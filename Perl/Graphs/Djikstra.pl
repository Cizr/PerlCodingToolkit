
use strict;
use warnings;

# Graph class for Dijkstra's algorithm
package Graph {
    sub new {
        my ($class) = @_;
        my $self = {
            vertices => {},
            edges    => {}
        };
        bless $self, $class;
        return $self;
    }

    # Add vertex
    sub add_vertex {
        my ($self, $vertex) = @_;
        $self->{vertices}->{$vertex} //= [];
    }

    # Add directed edge
    sub add_edge {
        my ($self, $from, $to, $weight) = @_;
        push @{$self->{edges}->{$from}}, {to => $to, weight => $weight};
    }

    # Dijkstra's algorithm
    sub dijkstra {
        my ($self, $start) = @_;
        my %distances = map { $_ => ($start eq $_ ? 0 : 'inf') } keys %{$self->{vertices}};
        my %visited;
        while (keys %visited != keys %{$self->{vertices}}) {
            my $current_vertex = undef;
            my $min_distance = 'inf';
            foreach my $vertex (keys %{$self->{vertices}}) {
                if (!$visited{$vertex} && $distances{$vertex} ne 'inf' && $distances{$vertex} < $min_distance) {
                    $current_vertex = $vertex;
                    $min_distance = $distances{$vertex};
                }
            }
            last unless defined $current_vertex;
            $visited{$current_vertex} = 1;
            if (exists $self->{edges}->{$current_vertex}) {
                foreach my $edge (@{$self->{edges}->{$current_vertex}}) {
                    my $alt_distance = $distances{$current_vertex} + $edge->{weight};
                    if ($alt_distance < $distances{$edge->{to}}) {
                        $distances{$edge->{to}} = $alt_distance;
                    }
                }
            }
        }
        return \%distances;
    }
}

# Main program
my $graph = Graph->new();
$graph->add_vertex('A');
$graph->add_vertex('B');
$graph->add_vertex('C');
$graph->add_vertex('D');
$graph->add_edge('A', 'B', 3);
$graph->add_edge('A', 'C', 2);
$graph->add_edge('B', 'D', 5);
$graph->add_edge('C', 'D', 1);
my $distances = $graph->dijkstra('A');
print "Dijkstra's shortest distances from A: ";
foreach my $vertex (sort keys %$distances) {
    print "$vertex: ", ($distances->{$vertex} eq 'inf' ? 'inf' : $distances->{$vertex}), " ";
}
print "\n";
