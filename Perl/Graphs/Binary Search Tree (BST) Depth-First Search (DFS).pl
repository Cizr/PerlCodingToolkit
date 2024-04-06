
use strict;
use warnings;

# Node class for Binary Search Tree
package Node {
    sub new {
        my ($class, $key) = @_;
        my $self = {
            key   => $key,
            left  => undef,
            right => undef
        };
        bless $self, $class;
        return $self;
    }
}

# Binary Search Tree class
package BST {
    sub new {
        my ($class) = @_;
        my $self = {
            root => undef
        };
        bless $self, $class;
        return $self;
    }

    # Insert operation
    sub insert {
        my ($self, $key) = @_;
        $self->{root} = _insert($self->{root}, $key);
    }

    sub _insert {
        my ($node, $key) = @_;
        unless ($node) {
            return Node->new($key);
        }
        if ($key < $node->{key}) {
            $node->{left} = _insert($node->{left}, $key);
        } elsif ($key > $node->{key}) {
            $node->{right} = _insert($node->{right}, $key);
        }
        return $node;
    }

    # Depth-First Search (In-order traversal)
    sub dfs {
        my ($self) = @_;
        _dfs($self->{root});
    }

    sub _dfs {
        my ($node) = @_;
        return unless $node;
        _dfs($node->{left});
        print $node->{key}, " ";
        _dfs($node->{right});
    }
}

# Main program
my $bst = BST->new();
$bst->insert(50);
$bst->insert(30);
$bst->insert(70);
$bst->insert(20);
$bst->insert(40);
$bst->insert(60);
$bst->insert(80);
print "Depth-First Search (In-order): ";
$bst->dfs(); # Output: 20 30 40 50 60 70 80
print "\n";
