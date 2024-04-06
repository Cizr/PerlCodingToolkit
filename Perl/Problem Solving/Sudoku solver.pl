
use strict;
use warnings;

# Function to find an empty cell in the Sudoku grid
sub find_empty_cell {
    my ($grid, $row, $col) = @_;
    for (my $i = 0; $i < 9; $i++) {
        for (my $j = 0; $j < 9; $j++) {
            if ($grid->[$i][$j] == 0) {
                ($row, $col) = ($i, $j);
                return ($row, $col); # Found empty cell
            }
        }
    }
    return (-1, -1); # No empty cell found, Sudoku is solved
}

# Function to check if a value is safe to place in the Sudoku grid at given position
sub is_safe {
    my ($grid, $row, $col, $num) = @_;
    return !is_in_row($grid, $row, $num) && !is_in_col($grid, $col, $num) && !is_in_box($grid, $row - $row % 3, $col - $col % 3, $num);
}

# Function to check if a value is present in a row of the Sudoku grid
sub is_in_row {
    my ($grid, $row, $num) = @_;
    for (my $col = 0; $col < 9; $col++) {
        return 1 if $grid->[$row][$col] == $num;
    }
    return 0;
}

# Function to check if a value is present in a column of the Sudoku grid
sub is_in_col {
    my ($grid, $col, $num) = @_;
    for (my $row = 0; $row < 9; $row++) {
        return 1 if $grid->[$row][$col] == $num;
    }
    return 0;
}

# Function to check if a value is present in the 3x3 box of the Sudoku grid
sub is_in_box {
    my ($grid, $start_row, $start_col, $num) = @_;
    for (my $row = 0; $row < 3; $row++) {
        for (my $col = 0; $col < 3; $col++) {
            return 1 if $grid->[$row + $start_row][$col + $start_col] == $num;
        }
    }
    return 0;
}

# Function to solve the Sudoku puzzle using backtracking
sub solve_sudoku {
    my ($grid) = @_;
    
    # Find an empty cell
    my ($row, $col) = find_empty_cell($grid);
    
    # If no empty cell is found, Sudoku is solved
    if ($row == -1 && $col == -1) {
        return 1;
    }
    
    # Try placing numbers from 1 to 9 in the empty cell
    for (my $num = 1; $num <= 9; $num++) {
        if (is_safe($grid, $row, $col, $num)) {
            # Place the number in the cell
            $grid->[$row][$col] = $num;
            
            # Recur to solve the rest of the Sudoku puzzle
            if (solve_sudoku($grid)) {
                return 1; # Puzzle solved successfully
            }
            
            # If placing the number in the cell does not lead to a solution, backtrack
            $grid->[$row][$col] = 0;
        }
    }
    
    # No number can be placed in the cell, backtrack
    return 0;
}

# Function to print the solved Sudoku grid
sub print_grid {
    my ($grid) = @_;
    for (my $i = 0; $i < 9; $i++) {
        for (my $j = 0; $j < 9; $j++) {
            print $grid->[$i][$j], " ";
        }
        print "\n";
    }
}

# Main subroutine
sub main {
    # Input Sudoku grid
    my @grid = (
        [5, 3, 0, 0, 7, 0, 0, 0, 0],
        [6, 0, 0, 1, 9, 5, 0, 0, 0],
        [0, 9, 8, 0, 0, 0, 0, 6, 0],
        [8, 0, 0, 0, 6, 0, 0, 0, 3],
        [4, 0, 0, 8, 0, 3, 0, 0, 1],
        [7, 0, 0, 0, 2, 0, 0, 0, 6],
        [0, 6, 0, 0, 0, 0, 2, 8, 0],
        [0, 0, 0, 4, 1, 9, 0, 0, 5],
        [0, 0, 0, 0, 8, 0, 0, 7, 9]
    );

    # Call the solve_sudoku function to solve the Sudoku puzzle
    if (solve_sudoku(\@grid)) {
        print "Sudoku puzzle solved successfully:\n";
        print_grid(\@grid);
    } else {
        print "No solution exists for the Sudoku puzzle.\n";
    }
}

# Call the main subroutine to execute the program
main();
