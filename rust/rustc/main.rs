fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    }
    let limit = (n as f64).sqrt() as u32; // Volvemos a f64 (64-bit double)
    let mut i = 2;
    while i <= limit {
        if n % i == 0 {
            return false;
        }
        i += 1;
    }
    true
}
fn main() {
    let asd = 5;
    let mut count = 0;
    for i in 1..2_000_000 {
        if is_prime(i) {
            count += 1;
        }
    }
    println!("Primes found (Rust): {}", count);
}
