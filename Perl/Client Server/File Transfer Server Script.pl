
use strict;
use warnings;
use IO::Socket::INET;

# Server configuration
my $host = 'localhost';
my $port = 7171;
my $upload_dir = 'uploads';

# Create upload directory if it doesn't exist
mkdir $upload_dir unless -d $upload_dir;

# Subroutine to handle file upload
sub handle_upload {
    my ($client_socket, $filename) = @_;
    my $file_path = "$upload_dir/$filename";

    # Open file for writing
    open(my $fh, '>', $file_path) or return "Failed to open file: $!";
    
    # Receive file content from client and write to file
    while (my $chunk = <$client_socket>) {
        print $fh $chunk;
    }

    close $fh;
    return "File uploaded successfully: $file_path";
}

# Subroutine to handle file download
sub handle_download {
    my ($client_socket, $filename) = @_;
    my $file_path = "$upload_dir/$filename";

    # Open file for reading
    open(my $fh, '<', $file_path) or return "Failed to open file: $!";
    
    # Read file content and send to client
    while (my $chunk = <$fh>) {
        print $client_socket $chunk;
    }

    close $fh;
    return "File downloaded successfully: $file_path";
}

# Create server socket
my $server_socket = IO::Socket::INET->new(
    LocalHost => $host,
    LocalPort => $port,
    Proto     => 'tcp',
    Listen    => 5,
    Reuse     => 1
) or die "Cannot create socket: $!";

print "File Transfer Server started, waiting for client connections...\n";

# Accept client connections
while (my $client_socket = $server_socket->accept()) {
    my $client_address = $client_socket->peerhost;
    my $client_port    = $client_socket->peerport;
    print "Connection established with client $client_address:$client_port\n";

    # Receive client request (upload or download)
    my $request = <$client_socket>;
    chomp($request);
    my ($action, $filename) = split(/\s+/, $request);

    my $response;
    if ($action eq 'upload') {
        $response = handle_upload($client_socket, $filename);
    } elsif ($action eq 'download') {
        $response = handle_download($client_socket, $filename);
    } else {
        $response = "Invalid action";
    }

    # Send response to client
    print $client_socket $response . "\n";

    # Close client socket
    close $client_socket;
    print "Client $client_address:$client_port disconnected\n";
}
