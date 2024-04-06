
use strict;
use warnings;

# Stack class
package Stack {
    sub new {
        my ($class) = @_;
        my $self = {
            data => []
        };
        bless $self, $class;
        return $self;
    }

    # Push operation
    sub push {
        my ($self, $item) = @_;
        push @{$self->{data}}, $item;
    }

    # Pop operation
    sub pop {
        my ($self) = @_;
        return pop @{$self->{data}};
    }

    # Peek operation
    sub peek {
        my ($self) = @_;
        return $self->{data}->[-1];
    }

    # Check if stack is empty
    sub is_empty {
        my ($self) = @_;
        return scalar @{$self->{data}} == 0;
    }
}

# Main program
my $stack = Stack->new();
$stack->push(1);
$stack->push(2);
$stack->push(3);
print "Peek: ", $stack->peek(), "\n"; # Output: 3
print "Pop: ", $stack->pop(), "\n";   # Output: 3
print "Pop: ", $stack->pop(), "\n";   # Output: 2
print "Is empty: ", $stack->is_empty() ? "Yes\n" : "No\n"; # Output: No
