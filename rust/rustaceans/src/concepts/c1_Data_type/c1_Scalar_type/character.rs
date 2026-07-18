//! # El Tipo de Dato Carácter (char) en Rust
//!
//! En el bajo nivel tradicional, un carácter ocupa solo 1 Byte
//! y está limitado al alfabeto inglés clásico (ASCII).
//!
//! ■ LA REVOLUCIÓN DE RUST: En Rust, el tipo [char] ocupa estrictamente 4 Bytes
//!   (32 bits) en la memoria RAM. Esto es porque almacena un valor Unicode Escalar.
//!   Al tener un contenedor de 4 Bytes, Rust puede representar de forma nativa
//!   cualquier carácter del lenguaje humano (acentos, letras cirílicas, kanjis japoneses)
//!   e incluso símbolos gráficos complejos como los emojis.
//!
//! ■ REGLA SINTÁCTICA: Un literal de tipo 'char' se escribe OBLIGATORIAMENTE
//!   utilizando comillas simples (ej. 'A'). Las comillas dobles ("A") quedan
//!   reservadas exclusivamente para cadenas de texto (Strings).

/// ## Laboratorio Práctico del Tipo Carácter Unicode
pub fn character_type() {
    // ■ <variable>:char = Ocupa 4 Bytes en la RAM gracias al estándar Unicode universal.
    let letra_clasica: char = 'A';
    let letra_acentuada: char = 'á'; // El español se procesa de forma nativa sin romper la memoria

    // ■■ DEMOSTRACIÓN EXÓTICA: Kanjis y caracteres orientales
    // Ocupan los mismos 4 Bytes en el silicio que una letra común
    let kanji_fuego: char = '火';

    // ■■ RECOMPENSA DE DOPAMINA: Emojis nativos en el hardware
    // Un emoji NO es un dibujo, es un número asignado en la tabla Unicode que cabe en un char.
    let mascota_rust: char = '🦀';

    // IMPRESIÓN ANALÍTICA EN CONSOLA
    println!("=== ANALIZADOR DE CARACTERES UNICODE ===");
    println!(
        "Carácter Clásico: {} (Tamaño en RAM: {} Bytes)",
        letra_clasica,
        std::mem::size_of_val(&letra_clasica)
    );
    println!(
        "Carácter con Acento: {} (Tamaño en RAM: {} Bytes)",
        letra_acentuada,
        std::mem::size_of_val(&letra_acentuada)
    );
    println!(
        "Carácter Oriental: {} (Tamaño en RAM: {} Bytes)",
        kanji_fuego,
        std::mem::size_of_val(&kanji_fuego)
    );
    println!(
        "Carácter Emoji: {} (Tamaño en RAM: {} Bytes)",
        mascota_rust,
        std::mem::size_of_val(&mascota_rust)
    );
}
