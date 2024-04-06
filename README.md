# Perl Scripts Repository

Welcome to the Perl Scripts Repository! This repository contains a diverse collection of Perl scripts covering various topics such as client-server communication, compression algorithms, conversions, cryptography, data structures, graph algorithms, problem-solving, recursion, scheduling, searching, sorting, tree algorithms, web programming, and cybersecurity.

## Table of Contents

1. [Introduction](#introduction)
2. [Client-Server Communication](#client-server-communication)
3. [Compression Algorithms](#compression-algorithms)
4. [Conversions](#conversions)
5. [Cryptography](#cryptography)
6. [Data Structures](#data-structures)
7. [Graphs](#graphs)
8. [Occurences Counter in File](#occurences-counter-in-file)
9. [Problem Solving](#problem-solving)
10. [Recursion](#recursion)
11. [Scheduling](#scheduling)
12. [Searching](#searching)
13. [Sorting](#sorting)
14. [Tree](#tree)
15. [Web Programming](#web-programming)
16. [Cybersecurity](#cybersecurity)

## Introduction

This repository serves as a comprehensive resource for various Perl programming concepts and techniques. Each script is categorized based on its functionality and purpose, making it easy to find and explore different areas of Perl development.

## Client-Server Communication

### Chat Client/Server
- `Chat Client.pl`: Implements a simple chat client script for communicating with a chat server.
- `Chat Server.pl`: Implements a chat server that handles connections from multiple chat clients.

### File Transfer
- `File Transfer Client Script (Download).pl`: Allows downloading files from a file transfer server.
- `File Transfer Client Script (Upload).pl`: Allows uploading files to a file transfer server.
- `File Transfer Server Script.pl`: Implements a file transfer server that facilitates file downloads and uploads.

### HTTP Server
- `Simple HTTP Server.pl`: Implements a basic HTTP server that serves web pages and handles HTTP requests.

### UDP Communication
- `UDP Client.pl`: A UDP client script for sending messages to a UDP server.
- `UDP Server.pl`: A UDP server script for receiving messages from UDP clients.

### Basic Client/Server
- `client.pl`: A basic TCP client script for connecting to a TCP server and sending requests.
- `server.pl`: A basic TCP server script that listens for incoming connections and handles client requests.

## Compression Algorithms

- `RunLength.pl`: Implements the Run-Length Encoding (RLE) compression algorithm.
- `huffman.pl`: Implements the Huffman coding compression algorithm.

## Conversions

- `binary_to_decimal.pl`: Converts binary numbers to decimal.
- `decimal_to_binary.pl`: Converts decimal numbers to binary.
- `decimal_to_hexadecimal.pl`: Converts decimal numbers to hexadecimal.
- `decimal_to_octal.pl`: Converts decimal numbers to octal.
- `hexadecimal_to_decimal.pl`: Converts hexadecimal numbers to decimal.
- `integer_to_roman.pl`: Converts integers to Roman numerals.

## Cryptography

- `Atbash cipher.pl`: Implements the Atbash cipher encryption and decryption algorithm.
- `Morse.pl`: Implements Morse code encryption and decryption.
- `RSA.PL`: Demonstrates RSA encryption and decryption algorithm.
- `Rail Fence cipher.pl`: Implements the Rail Fence cipher encryption and decryption algorithm.
- `cesar_cipher.pl`: Implements the Caesar cipher encryption and decryption algorithm.
- `vigenere_cipher.pl`: Implements the Vigenère cipher encryption and decryption algorithm.

## Data Structures

- `Array.pl`: Demonstrates array operations such as insertion, deletion, and searching.
- `Hash.pl`: Illustrates operations on hash data structures including insertion, deletion, and iteration.
- `Linked List.pl`: Implements a singly linked list data structure with operations like insertion, deletion, and traversal.
- `Queue.pl`: Implements a queue data structure with enqueue, dequeue, and peek operations.
- `Stack.pl`: Implements a stack data structure with push, pop, and peek operations.

## Graphs

- `A star algorithm.pl`: Implements the A* search algorithm for pathfinding.
- `Binary Search Tree (BST) Depth-First Search (DFS).pl`: Demonstrates depth-first search (DFS) on a binary search tree.
- `Djikstra.pl`: Implements Dijkstra's algorithm for finding the shortest path in a graph.

## Occurrences Counter in File

- `Test2 explanation.png`: Provides an explanation for Test2.
- `test2.PL`: Implements the occurrences counter in a file.

## Problem Solving

- `8queens.pl`: Solves the Eight Queens Problem using backtracking algorithm.
- `Knapsack Problem.pl`: Solves the Knapsack Problem using dynamic programming.
- `Sudoku solver.pl`: Solves Sudoku puzzles using backtracking algorithm.
- `Travelling Salesman Problem.pl`: Solves the Travelling Salesman Problem using dynamic programming.

## Recursion

- `Factorial Calculation.pl`: Calculates factorial of a number using recursion.
- `Fibonacci.pl`: Generates Fibonacci sequence using recursion.
- `Power Calculation.pl`: Calculates power of a number using recursion.
- `String Reversal.pl`: Reverses a string using recursion.

## Scheduling

- `FIFO.pl`: Implements First-In-First-Out (FIFO) scheduling algorithm.
- `Highest Response Ratio Next.pl`: Implements Highest Response Ratio Next (HRRN) scheduling algorithm.
- `Priority Scheduling algorithm.pl`: Implements priority scheduling algorithm.
- `Round Robin.pl`: Implements Round Robin scheduling algorithm.
- `Shortest Job First.PL`: Implements Shortest Job First (SJF) scheduling algorithm.

## Searching

- `Binary Search algorithm.pl`: Implements binary search algorithm to find an element in a sorted array.
- `Exponential Search algorithm.pl`: Implements exponential search algorithm to find an element in a sorted array.
- `Interpolation Search algorithm.pl`: Implements interpolation search algorithm to find an element in a sorted array.
- `Jump Search algorithm.pl`: Implements jump search algorithm to find an element in a sorted array.
- `Linear Search algorithm.pl`: Implements linear search algorithm to find an element in an array.
- `Ternary Search algorithm.pl`: Implements ternary search algorithm to find an element in a sorted array.

## Sorting

- `Bubble Sort.pl`: Implements bubble sort algorithm for sorting an array.
- `Heap Sort.pl`: Implements heap sort algorithm for sorting an array.
- `Insertion Sort.pl`: Implements insertion sort algorithm for sorting an array.
- `Merge Sort.pl`: Implements merge sort algorithm for sorting an array.
- `Quick Sort.pl`: Implements quick sort algorithm for sorting an array.
- `Selection Sort.pl`: Implements selection sort algorithm for sorting an array.

| Algorithm      | Best Case | Worst Case | Avg. Case | Remarks                            |
|----------------|-----------|------------|-----------|------------------------------------|
| Bitonic Sort   | log2(n)   | log2(n)    | log2(n)   |                                    |
| Bubble Sort    | n         | n^2        | n^2       |                                    |
| Bucket Sort    | n + r     | n + r      | n^2r      | r is the number of buckets        |
| Comb Sort      | n log(n)  | n^2        | n^2       |                                    |
| Counting Sort  | n + r     | n + r      | n + r     | r is the size of count array      |
| Heap Sort      | n         | n log(n)   | n log(n)  |                                    |
| Insertion Sort | n         | n^2        | n^2       |                                    |
| Merge Sort     | n log(n)  | n log(n)   | n log(n)  |                                    |
| Quick Sort     | n log(n)  | n^2        | n log(n)  |                                    |
| Radix Sort     | nr        | nr         | nr        | r is the max number of digits     |
| Selection Sort | n^2       | n^2        | n^2       |                                    |
| Shell Sort     | n log(n)  |            |           |                                    |

## Tree

- `avl_tree.pl`: Implements AVL tree data structure with insertion, deletion, and balancing operations.
- `spanning_tree.pl`: Generates a spanning tree from a graph using Prim's algorithm.

## Web Programming

- `Template Toolkit to render.pl`: Renders HTML templates using Template Toolkit.
- `how you can use CGI.pm`: Demonstrates usage of CGI.pm for web programming.

## Cybersecurity

- `Network Sniffing.pl`: Demonstrates network packet sniffing using Perl.
- `OpenSSL vulnerability.pl`: Detects OpenSSL vulnerabilities using Perl.
- `Password Cracking.pl`: Implements basic password-cracking techniques in Perl.
- `parsing Windows Registry hive files.pl`: Parses Windows Registry hive files using Perl.
- `parsing Windows event logs (EVTX files).pl`: Parses Windows event logs (EVTX files) using Perl.

## Usage

Each script can be run directly in a Perl environment. Ensure you have Perl installed on your system before running the scripts.

```bash
perl script_name.pl

## Contributing

Contributions to this repository are welcome! If you have any improvements or additional scripts to add, please fork this repository, make your changes, and submit a pull request.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
