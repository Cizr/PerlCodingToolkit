# 8queens.pl

use strict;
use warnings;

my $N = 8; # Size of the chessboard

# Function to check if placing a queen at position (row, col) is safe
sub is_safe {
    my ($board, $row, $col) = @_;
    
    # Check the row on the left side
    for (my $i = 0; $i < $col; $i++) {
        return 0 if $board->[$row][$i];
    }
    
    # Check upper diagonal on the left side
    for (my $i = $row, my $j = $col; $i >= 0 && $j >= 0; $i--, $j--) {
        return 0 if $board->[$i][$j];
    }
    
    # Check lower diagonal on the left side
    for (my $i = $row, my $j = $col; $j >= 0 && $i < $N; $i++, $j--) {
        return 0 if $board->[$i][$j];
    }
    
    return 1; # Position is safe
}

# Function to solve the N-Queens problem recursively
sub solve_n_queens {
    my ($board, $col) = @_;
    
    # Base case: If all queens are placed, return true
    if ($col >= $N) {
        return 1;
    }
    
    # Consider this column and try placing the queen in all rows one by one
    for (my $i = 0; $i < $N; $i++) {
        if (is_safe($board, $i, $col)) {
            # Place the queen at position (i, col)
            $board->[$i][$col] = 1;
            
            # Recur to place rest of the queens
            if (solve_n_queens($board, $col + 1)) {
                return 1; # Queen can be placed successfully
            }
            
            # If placing queen in board[i][col] doesn't lead to a solution
            # then remove queen from board[i][col]
            $board->[$i][$col] = 0;
        }
    }
    
    # If the queen can't be placed in any row of this column, return false
    return 0;
}

# Function to print the solved board
sub print_board {
    my ($board) = @_;
    for (my $i = 0; $i < $N; $i++) {
        for (my $j = 0; $j < $N; $j++) {
            print $board->[$i][$j] ? "Q " : ". ";
        }
        print "\n";
    }
}

# Main subroutine
sub main {
    # Initialize the chessboard
    my @board = ();
    for (my $i = 0; $i < $N; $i++) {
        for (my $j = 0; $j < $N; $j++) {
            $board[$i][$j] = 0;
        }
    }
    
    # Call the recursive function to solve the N-Queens problem
    if (solve_n_queens(\@board, 0)) {
        print "Solution found:\n";
        print_board(\@board);
    } else {
        print "No solution exists for $N-Queens problem.\n";
    }
}

# Call the main subroutine to execute the program
main();
