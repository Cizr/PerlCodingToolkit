# Round Robin (RR) Scheduling Algorithm in Perl

# Define a list of processes with their arrival time and burst time
my @processes = (
    { id => 1, arrival_time => 0, burst_time => 5 },
    { id => 2, arrival_time => 1, burst_time => 3 },
    { id => 3, arrival_time => 2, burst_time => 8 },
    { id => 4, arrival_time => 3, burst_time => 6 }
);

# Define the time quantum for Round Robin
my $time_quantum = 3;

# Function to simulate Round Robin scheduling
sub round_robin_scheduling {
    my @scheduled_processes;
    my @remaining_processes = @processes;
    my $current_time = 0;

    while (@remaining_processes) {
        foreach my $process (@remaining_processes) {
            # Check if the process has arrived
            next if $process->{arrival_time} > $current_time;

            my $burst_time = $process->{burst_time};

            # Execute the process for the time quantum or its remaining burst time, whichever is smaller
            my $execution_time = ($burst_time > $time_quantum) ? $time_quantum : $burst_time;

            # Add the process to the scheduled list
            push @scheduled_processes, { %$process, start_time => $current_time, execution_time => $execution_time };

            # Update burst time for the process
            $process->{burst_time} -= $execution_time;

            # Update current time
            $current_time += $execution_time;

            # Remove the process if it has completed execution
            unless ($process->{burst_time} > 0) {
                @remaining_processes = grep { $_ != $process } @remaining_processes;
            }
        }
    }

    return @scheduled_processes;
}

# Perform Round Robin scheduling
my @scheduled_processes = round_robin_scheduling();

# Print the schedule
print "Round Robin (RR) Scheduling:\n";
foreach my $process (@scheduled_processes) {
    printf "Process %d: Start Time: %d, End Time: %d\n", $process->{id}, $process->{start_time}, $process->{start_time} + $process->{execution_time};
}
