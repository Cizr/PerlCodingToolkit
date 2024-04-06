
use strict;
use warnings;
use IO::Socket;

# Autoflush
local $| = 1;

# Define server details
my $hostname = 'localhost';
my $port     = 7171;

# Create socket
my $socket = IO::Socket::INET->new(
    LocalHost => $hostname,
    LocalPort => $port,
    Proto     => 'tcp',
    Listen    => 5,
    Reuse     => 1
) or die "Cannot create socket: $!";

print "Waiting for TCP connection from client on port $port\n";

# Main loop for accepting connections
while (1) {
    my $client_socket = $socket->accept();
    my $client_address = $client_socket->peerhost;
    my $client_port    = $client_socket->peerport;

    print "$client_address $client_port has connected\n";

    # Loop for handling client requests
    while (1) {
        my $data;
        $client_socket->recv($data, 1024);
        if ($data) {
            print "Received data: $data\n";

            # Respond to client
            $client_socket->send("OK $data\n");
        }
    }
}

$socket->close; # Close server socket
