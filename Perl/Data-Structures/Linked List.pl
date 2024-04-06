
use strict;
use warnings;

# Node class for linked list
package Node {
    sub new {
        my ($class, $data) = @_;
        my $self = {
            data => $data,
            next => undef
        };
        bless $self, $class;
        return $self;
    }
}

# Linked list class
package LinkedList {
    sub new {
        my ($class) = @_;
        my $self = {
            head => undef
        };
        bless $self, $class;
        return $self;
    }

    # Insert at the end
    sub insert {
        my ($self, $data) = @_;
        my $new_node = Node->new($data);
        if (!$self->{head}) {
            $self->{head} = $new_node;
        } else {
            my $last = $self->{head};
            $last = $last->next while ($last->next);
            $last->next = $new_node;
        }
    }

    # Display the list
    sub display {
        my ($self) = @_;
        my $current = $self->{head};
        while ($current) {
            print $current->{data}, " ";
            $current = $current->{next};
        }
        print "\n";
    }
}

# Main program
my $list = LinkedList->new();
$list->insert(1);
$list->insert(2);
$list->insert(3);
$list->insert(4);
$list->display(); # Output: 1 2 3 4
