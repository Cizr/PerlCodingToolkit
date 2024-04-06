
use strict;
use warnings;
use IO::Socket::INET;

# Server configuration
my $host = 'localhost';
my $port = 7171;

# File to upload
my $filename = 'file.txt';

# Connect to server
my $client_socket = IO::Socket::INET->new(
    PeerAddr => $host,
    PeerPort => $port,
    Proto    => 'tcp'
) or die "Cannot connect to server: $!";

# Send upload request to server
print $client_socket "upload $filename\n";

# Open file for reading
open(my $fh, '<', $filename) or die "Failed to open file: $!";

# Read file content and send to server
while (my $chunk = <$fh>) {
    print $client_socket $chunk;
}

close $fh;

# Receive response from server
my $response = <$client_socket>;
chomp($response);
print "Server response: $response\n";

# Close socket
$client_socket->close();
