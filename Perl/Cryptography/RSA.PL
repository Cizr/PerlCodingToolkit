#cpan install Math::BigInt
#cpan install Crypt::Primes

use strict;
use warnings;
use Math::BigInt;
use Crypt::Primes;

# Generate random prime numbers
sub generate_primes {
    my ($bits) = @_;
    my $p = Crypt::Primes::random_prime($bits);
    my $q = Crypt::Primes::random_prime($bits);
    return ($p, $q);
}

# Compute Euler's totient function
sub euler_totient {
    my ($p, $q) = @_;
    return ($p - 1) * ($q - 1);
}

# Find modular multiplicative inverse
sub mod_inverse {
    my ($a, $m) = @_;
    my ($x, $y) = extended_gcd($a, $m);
    return ($x % $m + $m) % $m if $y == 1;
    return undef;
}

# Extended Euclidean algorithm
sub extended_gcd {
    my ($a, $b) = @_;
    return (0, $b, 1) if $a == 0;
    my ($x, $y, $d) = extended_gcd($b % $a, $a);
    return ($y - int($b / $a) * $x, $x, $d);
}

# RSA encryption
sub rsa_encrypt {
    my ($message, $e, $n) = @_;
    my $m = Math::BigInt->new($message);
    return $m->bmodpow($e, $n);
}

# RSA decryption
sub rsa_decrypt {
    my ($ciphertext, $d, $n) = @_;
    my $c = Math::BigInt->new($ciphertext);
    return $c->bmodpow($d, $n);
}

# Main function
sub main {
    # Generate primes
    my ($p, $q) = generate_primes(512);

    # Compute n and euler's totient
    my $n = $p * $q;
    my $phi = euler_totient($p, $q);

    # Choose public exponent
    my $e = 65537;

    # Compute private exponent
    my $d = mod_inverse($e, $phi);

    # Encrypt and decrypt a message
    my $plaintext = 123456789;
    my $encrypted = rsa_encrypt($plaintext, $e, $n);
    my $decrypted = rsa_decrypt($encrypted, $d, $n);

    print "Original: $plaintext\n";
    print "Encrypted: $encrypted\n";
    print "Decrypted: $decrypted\n";
}

# Call the main function
main();
