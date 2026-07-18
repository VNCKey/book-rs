//! # El Tipo Compuesto Tupla (Tuple) en Rust
//!
//! La tupla es el primer tipo compuesto primitivo de Rust. Su propósito fundamental
//! es agrupar múltiples valores de **diferentes tipos de datos** (heterogéneos)
//! dentro de una sola variable.
//!
//! ■ REGLAS INMUTABLES DEL SILICIO:
//!   1. **Longitud Fija:** Una tupla no puede crecer ni encogerse en tiempo de ejecución.
//!      Su tamaño en bytes se calcula al compilar y se reserva fijamente en el Stack.
//!   2. **Asignación en la RAM:** El procesador acomoda cada elemento de la tupla
//!      uno seguido del otro en la memoria, respetando la alineación de bytes de la CPU.
//!
//! ■ SINTAXIS TÁCTICA: Se definen estrictamente usando paréntesis `()` y separando
//!   los valores por comas. Para extraer sus datos individuales se utiliza la
//!   "indexación por punto" (ej. `variable.0`).

/// ## Laboratorio Práctico del Tipo Compuesto Tupla
pub fn tuple_type() {
    // ■ <variable>:(tipo1, tipo2, tipo3) = Estructura mixta fija en el Stack.
    // Creamos una tupla que simula la radiografía de un componente del sistema.
    let componente: (&str, u32, f64, char) = ("Alacritty", 2026, 4.0, '🥷');

    // ■■ ACCESO DIRECTO EN LA RAM (Indexación por punto)
    // El índice comienza estrictamente desde 0.
    let nombre = componente.0;
    let version = componente.1;
    let peso_mb = componente.2;
    let insignia = componente.3;

    // ■■ RECOMPENSA DE DOPAMINA: Desestructuración (Destructuring)
    // Rust permite romper la tupla por hardware y asignar todos sus elementos
    // a variables individuales de un solo golpe.
    let (prog, anio, ram, icono) = componente;

    // IMPRESIÓN ANALÍTICA EN CONSOLA
    println!("=== ANALIZADOR DE TUPLAS EN EL STACK ===");
    println!("Tupla Completa: {:?}", componente);
    println!(
        "Tamaño total de la tupla en la RAM: {} Bytes",
        std::mem::size_of_val(&componente)
    );

    println!("\n=== EXTRACCIÓN POR INDEXACIÓN MATEMÁTICA ===");
    println!("Elemento .0 (Nombre):   {}", nombre);
    println!("Elemento .1 (Versión):  {}", version);
    println!("Elemento .2 (Peso MB):  {}", peso_mb);
    println!("Elemento .3 (Insignia): {}", insignia);

    println!("\n=== EXTRACCIÓN POR DESESTRUCTURACIÓN DE COMPILADOR ===");
    println!(
        "Programa: {} | Año: {} | RAM: {} MB | Icono: {}",
        prog, anio, ram, icono
    );
}
