//! # Laboratio Alekey Rustaceans
//! Este modulo es el punto de entrada principal del binario

fn main() {
    println!(
        "Tu CPU usa punteros de: {} Bytes ({} bits)",
        std::mem::size_of::<usize>(),
        std::mem::size_of::<usize>() * 8
    );
}
