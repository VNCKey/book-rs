//! # El Universo de los Números Decimales (Floating-Point) en Rust
//!
//! En el silicio, los números con punto decimal se conocen como "Punto Flotante".
//! A diferencia de los enteros, la CPU no los lee en binario directo; utiliza un
//! estándar matemático llamado IEEE 754 que divide los bits en tres partes:
//! 1. El Signo (si es positivo o negativo).
//! 2. La Mantisa (los dígitos significativos del número).
//! 3. El Exponente (qué tan a la izquierda o derecha rueda el punto decimal).
//!
//! ■ EL TIPO POR DEFECTO: En Rust, si escribes un decimal suelto sin especificar
//!   su tipo (ej. `let x = 3.14;`), el compilador asume automáticamente que es un [f64].
//!   Esto es porque las CPUs modernas de 64 bits procesan el f64 con la misma velocidad
//!   que un f32, pero ofreciendo una precisión matemática infinitamente superior.

/// ## Lista de Tipo de Datos de Punto Flotante (Decimales)
pub fn decimales_flotantes() {
    // ■ <variable>:f32 = Ocupa 4 Bytes (32 bits) en la RAM. Precisión simple.
    // ■■ Ofrece aproximadamente 7 dígitos de precisión decimal exacta.
    let min_f32: f32 = f32::MIN;
    let max_f32: f32 = f32::MAX;

    // ■ <variable>:f64 = Ocupa 8 Bytes (64 bits) en la RAM. Precisión doble.
    // ■■ Ofrece aproximadamente 15 a 17 dígitos de precisión decimal exacta.
    let min_f64: f64 = f64::MIN;
    let max_f64: f64 = f64::MAX;

    // ■■ EL PELIGRO MÁXIMO DE LOS DECIMALES: LA PÉRDIDA DE PRECISIÓN ■■
    // En el sistema binario (ceros y unos), es físicamente imposible representar
    // fracciones humanas exactas como el 0.1 o el 0.2 sin perder decimales por el camino.
    // Al operar con flotantes, la CPU redondea el resultado en el último bit.
    let x: f64 = 0.1;
    let y: f64 = 0.2;
    let suma = x + y;

    println!("=== ANALIZADOR DE PUNTO FLOTANTE ===");
    println!("f32 Máximo: {}", max_f32);
    println!("f64 Máximo: {}", max_f64);

    // ■■ RECOMPENSA DE DOPAMINA / ERROR CLÁSICO DE SISTEMAS:
    // ¡Tus alumnos verán que 0.1 + 0.2 NO da 0.3 exacto en la computadora!
    println!("\n¿Cuánto es 0.1 + 0.2 en el silicio?: {}", suma);
    // Imprimirá algo como: 0.30000000000000004
}
