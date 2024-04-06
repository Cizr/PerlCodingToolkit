
use strict;
use warnings;
use IO::Socket::INET;

my $host = 'localhost';
my $port = 8080;
my $doc_root = '/path/to/htdocs';

my $server = IO::Socket::INET->new(
    LocalHost => $host,
    LocalPort => $port,
    Proto     => 'tcp',
    Listen    => 5,
    Reuse     => 1
) or die "Cannot create socket: $!";

print "HTTP Server started at http://$host:$port/\n";

while (my $client = $server->accept()) {
    my $request = <$client>;
    my ($method, $uri, $version) = split ' ', $request;
    my $path = "$doc_root$uri";
    
    if (-f $path) {
        open my $file, '<', $path;
        print $client "HTTP/1.1 200 OK\r\n";
        print $client "Content-Type: text/html\r\n\r\n";
        print $client $_ while <$file>;
    } else {
        print $client "HTTP/1.1 404 Not Found\r\n";
        print $client "Content-Type: text/plain\r\n\r\n";
        print $client "404 Not Found - The requested resource was not found on this server.\n";
    }

    close $client;
}
