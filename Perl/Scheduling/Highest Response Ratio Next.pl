# Highest Response Ratio Next (HRRN) Scheduling Algorithm in Perl

# Define a list of processes with their arrival time and burst time
my @processes = (
    { id => 1, arrival_time => 0, burst_time => 5 },
    { id => 2, arrival_time => 1, burst_time => 3 },
    { id => 3, arrival_time => 2, burst_time => 8 },
    { id => 4, arrival_time => 3, burst_time => 6 }
);

# Function to calculate the response ratio of a process
sub calculate_response_ratio {
    my ($process, $current_time) = @_;
    my $waiting_time = $current_time - $process->{arrival_time};
    my $response_ratio = ($waiting_time + $process->{burst_time}) / $process->{burst_time};
    return $response_ratio;
}

# Function to simulate Highest Response Ratio Next (HRRN) scheduling
sub hrrn_scheduling {
    my @scheduled_processes;
    my @remaining_processes = @processes;
    my $current_time = 0;

    while (@remaining_processes) {
        # Calculate response ratios for all remaining processes
        my @response_ratios;
        foreach my $process (@remaining_processes) {
            push @response_ratios, { id => $process->{id}, response_ratio => calculate_response_ratio($process, $current_time) };
        }

        # Sort processes by response ratio in descending order
        @response_ratios = sort { $b->{response_ratio} <=> $a->{response_ratio} } @response_ratios;

        # Select the process with the highest response ratio
        my $next_process_id = $response_ratios[0]->{id};
        my ($next_process) = grep { $_->{id} == $next_process_id } @remaining_processes;

        # Check if the process has arrived
        if ($next_process->{arrival_time} > $current_time) {
            $current_time = $next_process->{arrival_time};
        }

        # Add the process to the scheduled list
        push @scheduled_processes, { %$next_process, start_time => $current_time };

        # Update current time by adding the burst time of the current process
        $current_time += $next_process->{burst_time};

        # Remove the process from the list of remaining processes
        @remaining_processes = grep { $_ != $next_process } @remaining_processes;
    }

    return @scheduled_processes;
}

# Perform Highest Response Ratio Next (HRRN) scheduling
my @scheduled_processes = hrrn_scheduling();

# Print the schedule
print "Highest Response Ratio Next (HRRN) Scheduling:\n";
foreach my $process (@scheduled_processes) {
    printf "Process %d: Start Time: %d, End Time: %d\n", $process->{id}, $process->{start_time}, $process->{start_time} + $process->{burst_time};
}
