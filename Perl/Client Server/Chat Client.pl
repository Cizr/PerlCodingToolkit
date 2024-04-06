use strict;
use warnings;
use IO::Socket::INET;

# Server configuration
my $host = 'localhost';
my $port = 7171;

# Connect to server
my $client_socket = IO::Socket::INET->new(
    PeerAddr => $host,
    PeerPort => $port,
    Proto    => 'tcp'
) or die "Cannot connect to server: $!";

print "Connected to server.\n";
print "Enter 'exit' to quit.\n";

# Send and receive messages
while (1) {
    print "Enter message: ";
    my $message = <STDIN>;
    chomp($message);
    last if $message eq 'exit'; # Exit loop if user enters 'exit'

    # Send message to server
    $client_socket->send($message);

    # Receive response from server
    my $response = "";
    $client_socket->recv($response, 1024);
    print "Server response: $response\n";
}

# Close socket
$client_socket->close();
