#include <stdio.h>
#include <stdbool.h>
#include <math.h>

bool is_prime(unsigned int n) {
    if (n <= 1) return false;
    unsigned int limit = (unsigned int)sqrt(n); // Volvemos a sqrt (64-bit double)
    for (unsigned int i = 2; i <= limit; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

int main() {
    int count = 0;
    for (unsigned int i = 1; i < 2000000; i++) {
        if (is_prime(i)) {
            count++;
        }
    }
    printf("Primes found (C): %d\n", count);
    return 0;
}
