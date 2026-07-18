//! # El Tipo de Dato Booleano (bool) en Rust
//!
//! El tipo de dato booleano es la representación más pura de las compuertas lógicas
//! de la CPU. Solo puede almacenar dos valores posibles: `true` (verdadero) o `false` (falso).
//!
//! ■ LA PARADOJA DEL ESPACIO FÍSICO: Conceptualmente, para guardar un 0 o un 1 solo
//!   se necesita 1 bit de información. Sin embargo, en la memoria RAM, el tipo [bool]
//!   ocupa estrictamente 1 Byte entero (8 bits).
//!
//! ■ ¿POR QUÉ OCUPA 1 BYTE EN LUGAR DE 1 BIT?
//!   La arquitectura de las CPUs modernas no tiene la capacidad física de direccionar o
//!   buscar una celda menor a 1 Byte en la memoria RAM. La CPU no puede pedirle a la memoria
//!   la dirección "0x7fff bit 3". El Byte es la unidad de direccionamiento más pequeña del silicio.
//!   Por lo tanto, Rust reserva un byte completo y apaga o enciende sus transistores internos.

/// ## Laboratorio Práctico del Tipo Booleano y Control Lógico
pub fn boolean_type() {
    // ■ <variable>:bool = Ocupa 1 Byte (8 bits) en la RAM.
    // Representación en bits: true suele ser 00000001 y false suele ser 00000000.
    let estado_activo: bool = true;
    let acceso_denegado: bool = false;

    // ■■ OPERACIONES DE BAJO NIVEL CON COMPUERTAS LÓGICAS (Bits)
    // El tipo bool permite evaluar las operaciones nativas del procesador:
    let condicional_and: bool = estado_activo && acceso_denegado; // Operación AND (Ambos verdaderos)
    let condicional_or: bool = estado_activo || acceso_denegado; // Operación OR (Al menos uno verdadero)
    let condicional_not: bool = !estado_activo; // Operación NOT (Inversión de bits: da false)

    // IMPRESIÓN ANALÍTICA EN CONSOLA
    println!("=== ANALIZADOR DE BOOLEANOS EN LA RAM ===");
    println!(
        "Valor lógico true:  {} (Tamaño en RAM: {} Byte)",
        estado_activo,
        std::mem::size_of_val(&estado_activo)
    );
    println!(
        "Valor lógico false: {} (Tamaño en RAM: {} Byte)",
        acceso_denegado,
        std::mem::size_of_val(&acceso_denegado)
    );

    println!("\n=== RESULTADOS DE COMPUERTAS LÓGICAS ===");
    println!("Evaluación AND (&&): {}", condicional_and);
    println!("Evaluación OR  (||): {}", condicional_or);
    println!("Evaluación NOT (!):  {}", condicional_not);
}
