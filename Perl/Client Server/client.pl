
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
    PeerAddr => $hostname,
    PeerPort => $port,
    Proto    => 'tcp',
    Timeout  => 1
) or die "Could not connect: $!";

# Main loop for sending data
while (1) {
    print "\nEnter the data to send: ";
    my $send_data = <STDIN>;
    chomp($send_data);
    if ($send_data) {
        my $size = $socket->send($send_data);
        print "\nSent data of length: $size\n";

        # Receive response from server
        my $response;
        $socket->recv($response, 1024);
        print "Got back: $response\n";
    }
}
$socket->close(); # Close socket
