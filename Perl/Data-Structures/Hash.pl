
use strict;
use warnings;

# Hash declaration and initialization
my %hash = (
    'name' => 'John',
    'age'  => 30,
    'city' => 'New York'
);

# Accessing elements
print "Name: $hash{'name'}\n";
print "Age: $hash{'age'}\n";

# Modifying elements
$hash{'age'} = 35;
$hash{'city'} = 'Los Angeles';

# Printing hash
foreach my $key (keys %hash) {
    print "$key: $hash{$key}\n";
}
