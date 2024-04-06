
use strict;
use warnings;
use Win32::TieRegistry(Delimiter => "/", ArrayValues => 0);

# Define the path to the Windows Registry hive file
my $hive_file = 'C:/Windows/System32/config/SYSTEM';

# Open the Windows Registry hive file
my $hive = $Registry->{"//$hive_file"} || die "Failed to open Registry hive: $!";

# Print the keys and their values recursively
print_keys($hive);

# Function to recursively print keys and their values
sub print_keys {
    my ($key) = @_;
    
    # Print the key path
    print "Key: ", $key->{""}, "\n";
    
    # Print the values in the key
    my %values = %$key;
    foreach my $value_name (keys %values) {
        next if $value_name eq "";
        my $value_data = $values{$value_name};
        print "Value: $value_name => $value_data\n";
    }
    
    # Recursively print subkeys
    foreach my $subkey_name (keys %$key) {
        next if $subkey_name eq "";
        my $subkey = $key->{$subkey_name};
        print_keys($subkey);
    }
}
