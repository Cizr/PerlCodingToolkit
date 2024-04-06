
use strict;
use warnings;

# Queue class
package Queue {
    sub new {
        my ($class) = @_;
        my $self = {
            data => []
        };
        bless $self, $class;
        return $self;
    }

    # Enqueue operation
    sub enqueue {
        my ($self, $item) = @_;
        push @{$self->{data}}, $item;
    }

    # Dequeue operation
    sub dequeue {
        my ($self) = @_;
        return shift @{$self->{data}};
    }

    # Peek operation
    sub peek {
        my ($self) = @_;
        return $self->{data}->[0];
    }

    # Check if queue is empty
    sub is_empty {
        my ($self) = @_;
        return scalar @{$self->{data}} == 0;
    }
}

# Main program
my $queue = Queue->new();
$queue->enqueue(1);
$queue->enqueue(2);
$queue->enqueue(3);
print "Peek: ", $queue->peek(), "\n"; # Output: 1
print "Dequeue: ", $queue->dequeue(), "\n";   # Output: 1
print "Dequeue: ", $queue->dequeue(), "\n";   # Output: 2
print "Is empty: ", $queue->is_empty() ? "Yes\n" : "No\n"; # Output: No
