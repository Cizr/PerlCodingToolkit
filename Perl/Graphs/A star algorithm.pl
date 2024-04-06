
use strict;
use warnings;

# A* algorithm class
package AStar {
    sub new {
        my ($class, $grid) = @_;
        my $self = {
            grid => $grid,
            open_list => [],
            closed_list => [],
            start_node => undef,
            end_node => undef
        };
        bless $self, $class;
        return $self;
    }

    # Calculate heuristic (Manhattan distance)
    sub heuristic {
        my ($self, $node) = @_;
        return abs($node->{x} - $self->{end_node}->{x}) + abs($node->{y} - $self->{end_node}->{y});
    }

    # Find neighbors of a node
    sub get_neighbors {
        my ($self, $node) = @_;
        my @neighbors;
        my @directions = (
            [-1, 0], [1, 0], [0, -1], [0, 1]  # Up, Down, Left, Right
        );
        for my $dir (@directions) {
            my ($dx, $dy) = @$dir;
            my $nx = $node->{x} + $dx;
            my $ny = $node->{y} + $dy;
            next if $nx < 0 || $ny < 0 || $nx >= @{$self->{grid}} || $ny >= @{$self->{grid}[0]};
            next if $self->{grid}[$nx][$ny] == 1; # Ignore obstacles
            push @neighbors, {x => $nx, y => $ny};
        }
        return @neighbors;
    }

    # A* algorithm implementation
    sub find_path {
        my ($self, $start, $end) = @_;
        $self->{start_node} = $start;
        $self->{end_node} = $end;
        push @{$self->{open_list}}, $start;
        while (@{$self->{open_list}}) {
            my $current = $self->get_lowest_f_score_node();
            return $self->reconstruct_path($current) if $current->{x} == $end->{x} && $current->{y} == $end->{y};
            push @{$self->{closed_list}}, $current;
            my @neighbors = $self->get_neighbors($current);
            for my $neighbor (@neighbors) {
                next if grep { $_->{x} == $neighbor->{x} && $_->{y} == $neighbor->{y} } @{$self->{closed_list}};
                my $g_score = $current->{g} + 1;
                my $in_open_list = grep { $_->{x} == $neighbor->{x} && $_->{y} == $neighbor->{y} } @{$self->{open_list}};
                if (!$in_open_list || $g_score < $neighbor->{g}) {
                    $neighbor->{g} = $g_score;
                    $neighbor->{h} = $self->heuristic($neighbor);
                    $neighbor->{f} = $neighbor->{g} + $neighbor->{h};
                    $neighbor->{parent} = $current;
                    unless ($in_open_list) {
                        push @{$self->{open_list}}, $neighbor;
                    }
                }
            }
        }
        return []; # No path found
    }

    # Get node with lowest F score from open list
    sub get_lowest_f_score_node {
        my ($self) = @_;
        my $lowest_node;
        my $lowest_f_score = 1e9;
        for my $node (@{$self->{open_list}}) {
            if ($node->{f} < $lowest_f_score) {
                $lowest_node = $node;
                $lowest_f_score = $node->{f};
            }
        }
        my @new_open_list = grep { $_ != $lowest_node } @{$self->{open_list}};
        $self->{open_list} = \@new_open_list;
        return $lowest_node;
    }

    # Reconstruct path from end node to start node
    sub reconstruct_path {
        my ($self, $current) = @_;
        my @path;
        while ($current) {
            push @path, $current;
            $current = $current->{parent};
        }
        return reverse @path;
    }
}

# Main program
my @grid = (
    [0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 0, 0, 0, 0]
);
my $start_node = {x => 0, y => 0, g => 0, h => 0, f => 0, parent => undef};
my $end_node = {x => 4, y => 4, g => 0, h => 0, f => 0, parent => undef};
my $astar = AStar->new(\@grid);
my @path = $astar->find_path($start_node, $end_node);
if (@path) {
    print "Path found: ";
    for my $node (@path) {
        print "($node->{x}, $node->{y}) ";
    }
    print "\n";
} else {
    print "No path found!\n";
}
