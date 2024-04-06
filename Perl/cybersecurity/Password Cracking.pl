
use strict;
use warnings;

# Define the hash to crack
my $hash_to_crack = "5f4dcc3b5aa765d61d8327deb882cf99"; # MD5 hash of "password"

# Open the dictionary file for reading
open my $fh, '<', 'dictionary.txt' or die "Cannot open dictionary file: $!";

# Read each line of the dictionary and check if its hash matches the target hash
while (my $password = <$fh>) {
    chomp $password;
    if (md5($password) eq $hash_to_crack) {
        print "Password cracked: $password\n";
        exit;
    }
}

# Close the dictionary file
close $fh;

# MD5 hash function
sub md5 {
    my ($string) = @_;
    use Digest::MD5 qw(md5_hex);
    return md5_hex($string);
}
