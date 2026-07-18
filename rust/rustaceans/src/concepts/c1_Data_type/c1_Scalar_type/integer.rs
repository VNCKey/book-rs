//! # El Universo de los Números Enteros en Rust
//!
//! En el silicio, los números enteros se dividen en tres grandes reinos:
//! 1. **Unsigned (u):** Sin signo. Solo almacenan valores positivos desde el 0.
//! 2. **Signed (i):** Con signo. Almacenan valores negativos y positivos.
//! 3. **Architecture (size):** Su tamaño se amolda a los bits de la CPU (32 o 64 bits).
//!
//! ■ EL TIPO POR DEFECTO: En Rust, si escribes un número entero suelto sin especificar
//!   su tipo (ej. `let x = 5;`), el compilador asume automáticamente que es un [i32].
//!   Esto es porque el i32 ofrece el balance perfecto entre velocidad nativa en los
//!   registros de la CPU y un rango de capacidad seguro para el control del programa.

/// ## REINO 1: Lista de Tipo de Datos Integer Unsigned Positivos
/// Comienzan desde el 0 hasta su capacidad máxima de bits.
pub fn integer_unsigned() {
    // ■ <variable>:u8 = Ocupa 1 Byte (8 bits) en la RAM: 0 a 255u8.
    let min_u8: u8 = u8::MIN; // Límite inferior: 0

    // Formas equivalentes en el silicio para representar el máximo de un u8:
    // u8::MAX | 255_u8 | 255u8 | 255 | ((1_u16 << 8) - 1) as u8
    let max_u8: u8 = u8::MAX;

    // ■ <variable>:u16 = Ocupa 2 Bytes (16 bits) en la RAM: 0 a 65_535_u16.
    // ■■ Fórmula matemática: 2^16 - 1.
    // Usamos 'u32' para el cálculo intermedio y evitar desbordamientos en compilación.
    let max_u16: u16 = (2_u32.pow(16) - 1) as u16;

    // ■ <variable>:u32 = Ocupa 4 Bytes (32 bits) en la RAM: 0 a 4_294_967_295u32.
    // ■■ Fórmula matemática: 2^32 - 1.
    let max_u32: u32 = (2_u64.pow(32) - 1) as u32;

    // ■ <variable>:u64 = Ocupa 8 Bytes (64 bits) en la RAM: 0 a 2^64 - 1.
    let max_u64: u64 = (u64::MAX) as u64;

    // ■ <variable>:u128 = Ocupa 16 Bytes (128 bits) en la RAM: 0 a 2^128 - 1.
    // Operación Bitwise NOT (!): Invierte los ceros de la memoria a unos (1111...).
    // Al usar el sufijo '_u128', le aclaramos al compilador el tamaño exacto del contenedor.
    let integer_u128: u128 = !0_u128;
}

/// ## REINO 2: Lista de Tipo de Datos Integer Signed (Con Signo)
/// Almacenan tanto valores negativos como positivos sacrificando 1 bit para el signo.
pub fn integer_signed() {
    // ■ <variable>:i8 = Ocupa 1 Byte (8 bits) en la RAM: -128 a 127.
    let min_i8: i8 = i8::MIN; // Límite inferior: -128
    let max_i8: i8 = i8::MAX; // Límite superior: 127

    // ■ <variable>:i16 = Ocupa 2 Bytes (16 bits) en la RAM: -32,768 a 32,767.
    // ■■ Fórmula matemática: De -2^15 a (2^15 - 1).
    let min_i16: i16 = -(2_i32.pow(15)) as i16;
    let max_i16: i16 = (2_i32.pow(15) - 1) as i16;

    // ■ <variable>:i32 = Ocupa 4 Bytes (32 bits) en la RAM: -2,147,483,648 a 2,147,483,647.
    // ■■ Fórmula matemática: De -2^31 a (2^31 - 1).
    let i32_min: i32 = i32::MIN;
    let i32_max: i32 = i32::MAX;

    // ■ <variable>:i64 = Ocupa 8 Bytes (64 bits) en la RAM: -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807.
    // ■■ Fórmula matemática: De -2^63 a (2^63 - 1).
    let i64_min: i64 = i64::MIN;
    let i64_max: i64 = i64::MAX;

    // ■ <variable>:i128 = Ocupa 16 Bytes (128 bits) en la RAM: Base de 39 dígitos.
    // ■■ Fórmula matemática: De -2^127 a (2^127 - 1).
    let i128_min: i128 = i128::MIN;
    let i128_max: i128 = i128::MAX;

    // ■■ EL PELIGRO DEL OVERFLOW (DESBORDAMIENTO) AL SUMAR +1
    // ■ Si a un entero en su valor máximo absoluto (ej. u8 en 255) le sumas +1, los bits
    //   no tienen espacio hacia dónde crecer. A este fenómeno se le llama Integer Overflow.
    // ■■ Comportamiento en Desarrollo (Debug / cargo run): Rust inyecta controles de hardware y
    //   detiene el programa de golpe (panics) para evitar que operes con datos falsos o corruptos.
    // ■■ Comportamiento en Producción (Release / cargo run --release): Rust prioriza la velocidad pura,
    //   por lo que el número da la vuelta completa (Wrap around) en el silicio; sumarle +1 a 255
    //   lo convierte destructivamente en 0, lo cual es crítico porque puede romper la lógica del negocio.
    //
    // ■■ LA SOLUCIÓN TÉCNICA: PROMOCIÓN DE TIPO (UPCASTING)
    // ■ Si necesitas sumarle +1 a una variable al borde de su límite y requieres que el resultado
    //   sea correcto (ej. que 255 + 1 de 256), debes expandir el tamaño del contenedor usando 'as'
    //   hacia un tipo con más bits antes de procesar la matemática:
    let contador_u8: u8 = 255;
    let resultado_seguro: u16 = (contador_u8 as u16) + 1; // El silicio añade ceros a la izquierda, dando 256 de forma segura.
}

/// ## REINO 3: Lista de Tipo de Datos que dependen de la Arquitectura (Pointer Size)
/// Su capacidad en bits varía si la CPU es de 32 bits o 64 bits.
pub fn integer_architecture() {
    // ■ <variable>:usize = Entero Sin Signo con el tamaño de un puntero de la CPU.
    // ■■ En sistemas de 64 bits equivale a un u64. Se usa para indexar Arrays y Vectores.
    let min_usize: usize = usize::MIN; // Límite inferior: 0
    let max_usize: usize = usize::MAX; // Dinámico: 2^64 - 1 en arquitecturas de 64 bits.

    // ■ <variable>:isize = Entero Con Signo con el tamaño de un puntero de la CPU.
    // ■■ En sistemas de 64 bits equivale a un i64. Se usa para compensaciones de punteros (offsets).
    let min_isize: isize = isize::MIN; // Dinámico: -2^63 en 64 bits.
    let max_isize: isize = isize::MAX; // Dinámico: (2^63 - 1) en 64 bits.

    // ■■■ ¿POR QUÉ EXISTEN USIZE E ISIZE EN EL UNIVERSO DE LOS ENTEROS? ■■■
    // La memoria RAM se organiza como una cuadrícula de celdas, y cada celda tiene una dirección (un puntero).
    // El tamaño de esa dirección depende enteramente de la arquitectura de la CPU:
    // - En una CPU antigua o embebida de 32 bits, una dirección de memoria mide 32 bits (4 Bytes).
    // - En una CPU moderna de 64 bits (como tu Linux Debian), mide 64 bits (8 Bytes).
    //
    // 'usize' e 'isize' son enteros cuyo tamaño en bits NO es fijo, sino que se amolda automáticamente
    // al tamaño de los punteros de la CPU donde se compila el programa.
    //
    // ■ ¿Por qué son vitales para medir colecciones de datos (Arrays y Vectores)?
    // Rust exige obligatoriamente usar 'usize' para medir e indexar el tamaño de las colecciones.
    // Si usáramos un entero fijo pequeño (como u32) en una máquina de 64 bits, el número se quedaría corto
    // y no podría apuntar a las celdas de memoria más altas si la RAM es muy grande.
    // Al usar 'usize', Rust garantiza la máxima velocidad por hardware y la seguridad absoluta de que
    // el entero podrá direccionar cualquier espacio físico disponible en la memoria RAM.

    // IMPRESIÓN ANALÍTICA DE HARDWARE
    println!("■■■ ANALIZADOR DE ARQUITECTURA DE CPU ■■■");
    println!(
        "Tu CPU usa punteros de: {} Bytes ({} bits)",
        std::mem::size_of::<usize>(),
        std::mem::size_of::<usize>() * 8
    );
    println!("Rango usize: De {} a {}", min_usize, max_usize);
    println!("Rango isize: De {} a {}", min_isize, max_isize);
}
