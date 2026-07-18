//! # El Tipo Compuesto Arreglo (Array) en Rust
//!
//! El array es el segundo tipo compuesto primitivo de Rust. A diferencia de la tupla,
//! el array obliga a que todos los elementos que almacena sean del **mismo tipo de dato** //! (homogéneos), ordenándolos en una secuencia física pura.
//!
//! ■ LAS REGLAS DE ORO DEL HARDWARE:
//!   1. **Tamaño Estricto en Compilación:** La longitud de un array es fija y forma parte
//!      de su propio tipo (ej. `[i32; 4]`). No puede crecer ni encogerse en ejecución.
//!   2. **Localidad de Datos Contigua:** Físicamente en la memoria RAM, los elementos se
//!      guardan uno exactamente al lado del otro. Esto permite a la CPU meter todo el
//!      bloque en su memoria caché ultra-rápida (Cache Hit), eliminando la lentitud.
//!
//! ■ SINTAXIS TÁCTICA: Se definen usando corchetes `[]`. Para extraer sus elementos
//!   individuales se utiliza la indexación por corchetes (ej. `variable[0]`).

/// ## Laboratorio Práctico del Tipo Compuesto Arreglo
pub fn array_type() {
    // ■ <variable>:[tipo; longitud] = Secuencia homogénea fija en el Stack.
    // Creamos un array que guarda los códigos de error de seguridad del sistema.
    let codigos_error: [u32; 4] = [401, 403, 404, 500];

    // ■■ FORMA EQUIVALENTE DE INICIALIZACIÓN:
    // Si quieres un array con 100 elementos y que todos comiencen valiendo 0:
    // let buffer_vacio = [0; 100]; // Crea [0, 0, 0, ..., 0] en una sola línea

    // ■■ ACCESO DIRECTO EN EL SILICIO (Indexación por corchetes)
    // El índice comienza estrictamente desde 0.
    let no_autorizado = codigos_error[0];
    let prohibido = codigos_error[1];

    // IMPRESIÓN ANALÍTICA EN CONSOLA
    println!("=== ANALIZADOR DE ARRAYS EN EL STACK ===");
    println!("Array Completo: {:?}", codigos_error);

    // ■■ DEMOSTRACIÓN DE ARQUITECTURA DE MEMORIA:
    // Como cada u32 mide 4 Bytes y tenemos 4 elementos: 4 * 4 = 16 Bytes exactos en la RAM.
    println!(
        "Tamaño total del array en la RAM: {} Bytes",
        std::mem::size_of_val(&codigos_error)
    );
    println!(
        "Tamaño de cada elemento individual: {} Bytes",
        std::mem::size_of::<u32>()
    );

    println!("\n=== EXTRACCIÓN POR INDEXACIÓN DE REGISTROS ===");
    println!("Índice [0] (Error): {}", no_autorizado);
    println!("Índice [1] (Error): {}", prohibido);

    // ■■ CONTROL DE SEGURIDAD EN TIEMPO DE COMPILACIÓN (PREVENCIÓN DE BUFFER OVERFLOW)
    // En lenguajes inseguros como C, si pides el índice [5] (que no existe), la CPU lee
    // memoria prohibida de otro programa. Rust te protege:
    // Si descompareas esta línea:
    // let error = codigos_error[5];
    // El compilador de Rust detendrá la ejecución del binario inmediatamente con un pánico.
}
