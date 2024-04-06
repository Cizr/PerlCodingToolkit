
use strict;
use warnings;
use IO::Socket::INET;

my $host = 'localhost';
my $port = 7171;

my $client_socket = IO::Socket::INET->new(
    PeerAddr => $host,
    PeerPort => $port,
    Proto    => 'udp'
) or die "Cannot connect to server: $!";

my $message = "Hello from UDP client!";
$client_socket->send($message);
print "Sent message to server: $message\n";
