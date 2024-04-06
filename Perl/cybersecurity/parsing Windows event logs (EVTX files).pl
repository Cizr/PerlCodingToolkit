
use strict;
use warnings;
use Win32::EventLog::Carp;

# Define the path to the EVTX file
my $evtx_file = 'example.evtx';

# Open the EVTX file for reading
my $eventlog = Win32::EventLog::Carp->new;
$eventlog->Open($evtx_file) || die "Failed to open EVTX file: $^E";

# Read and print each event record from the EVTX file
while (my $record = $eventlog->Read) {
    print_event_record($record);
}

# Close the EVTX file
$eventlog->Close;

# Function to print event record details
sub print_event_record {
    my ($record) = @_;
    
    print "Event ID: ", $record->{EventID}, "\n";
    print "Source: ", $record->{Source}, "\n";
    print "Computer: ", $record->{Computer}, "\n";
    print "Category: ", $record->{Category}, "\n";
    print "Time Generated: ", scalar localtime($record->{TimeGenerated}), "\n";
    
    # Print additional fields as needed
    # Example: print "Event Data: ", $record->{Data}, "\n";
    
    print "\n";
}
