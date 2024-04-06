
# AVL Tree Node definition
package AVLNode;
sub new {
    my ($class, $key) = @_;
    my $self = {
        key => $key,
        left => undef,
        right => undef,
        height => 1
    };
    bless $self, $class;
    return $self;
}

# AVL Tree operations
package AVLTree;
sub new {
    my ($class) = @_;
    my $self = {
        root => undef
    };
    bless $self, $class;
    return $self;
}

sub insert {
    my ($self, $key) = @_;
    $self->{root} = _insert_rec($self->{root}, $key);
}

sub _insert_rec {
    my ($node, $key) = @_;
    unless ($node) {
        return AVLNode->new($key);
    }
    if ($key < $node->{key}) {
        $node->{left} = _insert_rec($node->{left}, $key);
    } elsif ($key > $node->{key}) {
        $node->{right} = _insert_rec($node->{right}, $key);
    } else {
        return $node;  # Duplicate keys are not allowed
    }

    # Update height of the current node
    $node->{height} = 1 + _max(_height($node->{left}), _height($node->{right}));

    # Get the balance factor of this node
    my $balance = _get_balance($node);

    # If the node becomes unbalanced, perform rotations
    # Left Left Case
    if ($balance > 1 && $key < $node->{left}->{key}) {
        return _right_rotate($node);
    }
    # Right Right Case
    if ($balance < -1 && $key > $node->{right}->{key}) {
        return _left_rotate($node);
    }
    # Left Right Case
    if ($balance > 1 && $key > $node->{left}->{key}) {
        $node->{left} = _left_rotate($node->{left});
        return _right_rotate($node);
    }
    # Right Left Case
    if ($balance < -1 && $key < $node->{right}->{key}) {
        $node->{right} = _right_rotate($node->{right});
        return _left_rotate($node);
    }
    return $node;
}

sub _left_rotate {
    my ($z) = @_;
    my $y = $z->{right};
    my $t2 = $y->{left};
    $y->{left} = $z;
    $z->{right} = $t2;
    $z->{height} = _max(_height($z->{left}), _height($z->{right})) + 1;
    $y->{height} = _max(_height($y->{left}), _height($y->{right})) + 1;
    return $y;
}

sub _right_rotate {
    my ($y) = @_;
    my $x = $y->{left};
    my $t2 = $x->{right};
    $x->{right} = $y;
    $y->{left} = $t2;
    $y->{height} = _max(_height($y->{left}), _height($y->{right})) + 1;
    $x->{height} = _max(_height($x->{left}), _height($x->{right})) + 1;
    return $x;
}

sub _max {
    my ($a, $b) = @_;
    return $a > $b ? $a : $b;
}

sub _height {
    my ($node) = @_;
    return $node ? $node->{height} : 0;
}

sub _get_balance {
    my ($node) = @_;
    return $node ? _height($node->{left}) - _height($node->{right}) : 0;
}

# Example usage
my $avl_tree = AVLTree->new();
$avl_tree->insert(10);
$avl_tree->insert(20);
$avl_tree->insert(30);
# Add more insertions if needed

