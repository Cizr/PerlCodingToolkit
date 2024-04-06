
use strict;
use warnings;
use IO::Socket::INET;
use threads;
use Thread::Queue;

# Server configuration
my $host = 'localhost';
my $port = 7171;

# Shared queue for inter-thread communication
my $queue = Thread::Queue->new();

# Subroutine to handle client connections
sub handle_client {
    my ($client_socket) = @_;
    my $client_address = $client_socket->peerhost;
    my $client_port    = $client_socket->peerport;
    print "Connection established with client $client_address:$client_port\n";

    # Add client socket to the queue
    $queue->enqueue($client_socket);

    # Receive and broadcast messages
    while (my $message = <$client_socket>) {
        chomp($message);
        last if $message eq 'exit'; # Exit loop if client sends 'exit'
        print "Received from $client_address:$client_port: $message\n";

        # Broadcast message to all connected clients
        foreach my $sock ($queue->peek) {
            next if $sock == $client_socket;
            print $sock $message . "\n";
        }
    }

    # Remove client socket from the queue
    $queue->dequeue($client_socket);
    close $client_socket;
    print "Client $client_address:$client_port disconnected\n";
}

# Create server socket
my $server_socket = IO::Socket::INET->new(
    LocalHost => $host,
    LocalPort => $port,
    Proto     => 'tcp',
    Listen    => 5,
    Reuse     => 1
) or die "Cannot create socket: $!";

print "Server started, waiting for client connection...\n";

# Accept client connections
while (my $client_socket = $server_socket->accept()) {
    # Create a new thread for each client
    threads->create(\&handle_client, $client_socket)->detach();
}
