
use strict;
use warnings;
use IO::Socket::INET;

my $host = 'localhost';
my $port = 7171;

my $server_socket = IO::Socket::INET->new(
    LocalHost => $host,
    LocalPort => $port,
    Proto     => 'udp'
) or die "Cannot create socket: $!";

print "UDP Server started, waiting for client messages...\n";

while (1) {
    my $data;
    $server_socket->recv($data, 1024);
    print "Received from client: $data\n";
}
