
use strict;
use warnings;
use Net::Pcap;

# Define the network interface to sniff
my $interface = 'eth0';

# Open the network interface for sniffing
my $err;
my $pcap = Net::Pcap::open_live($interface, 1024, 1, 0, \$err);
die "Cannot open interface: $err" unless $pcap;

# Define the packet callback function
my $packet_callback = sub {
    my ($user_data, $header, $packet) = @_;
    # Process the packet here
    print "Packet captured: ", length($packet), " bytes\n";
};

# Start packet capture loop
Net::Pcap::loop($pcap, -1, $packet_callback, '') or die "Error in packet capture loop: $!";

# Close the network interface
Net::Pcap::close($pcap);
