# Shortest Job First (SJF) Scheduling Algorithm in Perl

# Define a list of processes with their arrival time and burst time
my @processes = (
    { id => 1, arrival_time => 0, burst_time => 5 },
    { id => 2, arrival_time => 1, burst_time => 3 },
    { id => 3, arrival_time => 2, burst_time => 8 },
    { id => 4, arrival_time => 3, burst_time => 6 }
);

# Sort processes based on arrival time
@processes = sort { $a->{arrival_time} <=> $b->{arrival_time} } @processes;

# Function to simulate SJF scheduling
sub sjf_scheduling {
    my @scheduled_processes;
    my @remaining_processes = @processes;
    my $current_time = 0;

    while (@remaining_processes) {
        # Sort remaining processes by burst time
        @remaining_processes = sort { $a->{burst_time} <=> $b->{burst_time} } @remaining_processes;

        # Select the process with the shortest burst time
        my $next_process = shift @remaining_processes;

        # Check if the process has arrived
        if ($next_process->{arrival_time} > $current_time) {
            $current_time = $next_process->{arrival_time};
        }

        # Add the process to the scheduled list
        push @scheduled_processes, { %$next_process, start_time => $current_time };

        # Update current time by adding the burst time of the current process
        $current_time += $next_process->{burst_time};
    }

    return @scheduled_processes;
}

# Perform SJF scheduling
my @scheduled_processes = sjf_scheduling();

# Print the schedule
print "Shortest Job First (SJF) Scheduling:\n";
foreach my $process (@scheduled_processes) {
    printf "Process %d: Start Time: %d, End Time: %d\n", $process->{id}, $process->{start_time}, $process->{start_time} + $process->{burst_time};
}
