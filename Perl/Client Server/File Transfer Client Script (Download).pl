
use strict;
use warnings;
use IO::Socket::INET;

# Server configuration
my $host = 'localhost';
my $port = 7171;

# File to download
my $filename = 'file.txt';

# Connect to server
my $client_socket = IO::Socket::INET->new(
    PeerAddr => $host,
    PeerPort => $port,
    Proto    => 'tcp'
) or die "Cannot connect to server: $!";

# Send download request to server
print $client_socket "download $filename\n";

# Open file for writing
open(my $fh, '>', $filename) or die "Failed to open file: $!";

# Receive file content from server and write to file
while (my $chunk = <$client_socket>) {
    print $fh $chunk;
}

close $fh;

# Close socket
$client_socket->close();

print "File downloaded successfully: $filename\n";
