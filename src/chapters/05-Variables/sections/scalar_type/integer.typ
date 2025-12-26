


=== Enteros

Los enteros son tipos de datos numéricos que representan valores sin parte decimal. Están diseñados
para ser explícitos tanto en su tamaño como en su signo, proporcionando
un control preciso sobre el uso de memoria y garantizando un comportamiento predecible del programa.

Clasificación de los Enteros

Rust organiza los tipos enteros en dos categorías principales según cual se adapte a las necesidades
en términos de rango de valores y consumo de memoria.

===== Enteros con Signo

Los enteros con signo son aquellos tipos enteros que pueden representar tanto valores
positivos como negativos, además del cero. En Rust, se identifican por el prefijo #raw("i",lang:"rust")
seguido del número de bits: i8, i16, i32, i64 y i128.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (center, right, right),
    table.header(
      [*Tipo*],
      [*Valor mínimo*],
      [*Valor máximo*]
    ),
    [#raw("i8", lang: "")], [−128], [127],
    [#raw("i16", lang: "")], [−32 768], [32 767],
    [#raw("i32", lang: "")], [−2 147 483 648], [2 147 483 647],
    [#raw("i64", lang: "")], [−9 223 372 036 854 775 808], [9 223 372 036 854 775 807],
    [#raw("i128", lang: "")], [#raw("−2¹²⁷", lang: "")], [#raw("2¹²⁷ − 1", lang: "")],
  ),
  caption: [Rangos numéricos de los tipos enteros con signo],
  supplement: [Tabla]
) <tabla-enteros-signados>

El número en el nombre del tipo indica la cantidad de bits utilizados para almacenar el valor. Por ejemplo, `i8` utiliza 8 bits, mientras que `i128` utiliza 128 bits.

```rust
let temperatura: i8 = -15;
let poblacion: i32 = -2_147_483_648;
let deuda: i64 = -9_223_372_036_854_775_808;
```

===== Enteros sin Signo (`u`)

Los enteros sin signo representan exclusivamente valores no negativos (positivos y cero). Al no reservar un bit para el signo, pueden almacenar números positivos de mayor magnitud utilizando la misma cantidad de bits que sus equivalentes con signo.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (center, right, right),
    table.header(
      [*Tipo*],
      [*Valor mínimo*],
      [*Valor máximo*]
    ),
    [#raw("u8", lang: "")], [0], [255],
    [#raw("u16", lang: "")], [0], [65 535],
    [#raw("u32", lang: "")], [0], [4 294 967 295],
    [#raw("u64", lang: "")], [0], [18 446 744 073 709 551 615],
    [#raw("u128", lang: "")], [0], [#raw("2¹²⁸ − 1", lang: "")],
  ),
  caption: [Rangos numéricos de los tipos enteros sin signo],
  supplement: [Tabla]
) <tabla-enteros-no-signados>

Estos tipos son ideales para contadores, índices de arrays, y cualquier magnitud que por definición no pueda ser negativa.

```rust
let edad: u8 = 25;
let habitantes: u32 = 8_000_000;
let bytes_procesados: u64 = 18_446_744_073_709_551_615;
```

===== Tipos Dependientes de Arquitectura: `usize` e `isize`

A diferencia de los tipos de tamaño fijo, `usize` e `isize` tienen un tamaño que se adapta automáticamente a la arquitectura del procesador donde se compila el programa. En sistemas de 32 bits, estos tipos equivalen a `u32` e `i32` respectivamente; en sistemas de 64 bits, a `u64` e `i64`.

#figure(
  table(
    columns: (auto, auto, auto),
    align: (center, right, right),
    inset: 10pt,
    stroke: 0.5pt + black,
    table.header(
      [*Tipo*],
      [*Valor mínimo*],
      [*Valor máximo*]
    ),
    [#raw("usize", lang: "")], [0], [#raw("2³² − 1", lang: "") o #raw("2⁶⁴ − 1", lang: "")],
    [#raw("isize", lang: "")], [#raw("−2³¹", lang: "") o #raw("−2⁶³", lang: "")], [#raw("2³¹ − 1", lang: "") o #raw("2⁶³ − 1", lang: "")],
  ),
  caption: [Rangos numéricos de los tipos enteros dependientes de arquitectura],
  supplement: [Tabla]
) <tabla-enteros-arquitectura>

Estos tipos se utilizan principalmente para:
- Indexar colecciones (vectores, arrays, slices)
- Representar tamaños de memoria y longitudes
- Realizar aritmética de punteros

```rust
let indice: usize = 2;
```

Esta adaptabilidad permite que el mismo código funcione eficientemente tanto en microcontroladores de 32 bits como en servidores de 64 bits, sin modificaciones.

==== Inferencia de Tipos Enteros

Cuando no se especifica explícitamente el tipo de un literal entero, Rust aplica la inferencia de tipos y asume `i32` como valor predeterminado. Esta elección se fundamenta en que `i32` ofrece un equilibrio óptimo entre rango numérico y rendimiento en la mayoría de las arquitecturas modernas.

```rust
let numero = 42;        // Tipo inferido: i32
let negativo = -100;    // Tipo inferido: i32
let resultado = numero + negativo;  // i32
```

==== Especificación Explícita de Tipos

===== Anotación de Tipo

La forma más común de especificar el tipo es mediante anotaciones:

```rust
let byte: u8 = 255;
let contador: u32 = 1_000_000;
let timestamp: i64 = 1_234_567_890;
```

===== Sufijos de Tipo en Literales

Rust permite especificar el tipo directamente en el literal numérico mediante sufijos:

```rust
let a = 100i32;      // i32 explícito
let b = 255u8;       // u8 explícito
let c = 1_000i64;    // i64 explícito
let d = 500usize;    // usize explícito
```

Esta sintaxis es especialmente útil en expresiones donde la inferencia de tipos podría ser ambigua.

==== Representación de Literales Enteros

===== Separadores Visuales

Para mejorar la legibilidad de números grandes, Rust permite el uso del guion bajo (`_`) como separador visual. Este separador no afecta el valor numérico y puede colocarse en cualquier posición:

```rust
let millones = 1_000_000;
let billion = 1_000_000_000;
let bits = 0b1111_0000_1010_1010;
let hex = 0xdead_beef;
```

===== Bases Numéricas

Rust soporta la representación de enteros en cuatro bases numéricas diferentes mediante prefijos específicos:

```rust
let decimal = 255;           // Base 10 (predeterminada)
let hexadecimal = 0xff;      // Base 16 (prefijo 0x)
let octal = 0o377;           // Base 8 (prefijo 0o)
let binario = 0b1111_1111;   // Base 2 (prefijo 0b)
```

Adicionalmente, Rust proporciona literales de byte para representar valores ASCII:

```rust
let byte_a: u8 = b'A';       // Equivale a 65
let byte_newline: u8 = b'\n'; // Equivale a 10
```

==== Desbordamiento de Enteros

El desbordamiento ocurre cuando una operación aritmética produce un resultado que excede el rango permitido por el tipo. El comportamiento de Rust ante el desbordamiento depende del perfil de compilación:

*Modo debug*:

Rust inserta verificaciones automáticas que provocan un pánico en tiempo de ejecución cuando se detecta un desbordamiento, facilitando la detección temprana de errores.

```rust
let x: u8 = 255;
let y = x + 1;  // Pánico: intento de sumar con desbordamiento
```

*Modo release*:

Por razones de rendimiento, las verificaciones se eliminan y el desbordamiento produce un comportamiento
de *wrapping*, donde el valor "da la vuelta" al rango válido.

```rust
let x: u8 = 255;
let y = x + 1;  // y = 0 (wrapping sin pánico)
```

===== Control Explícito del Desbordamiento

Para manejar el desbordamiento de forma predecible independientemente del perfil de compilación, Rust proporciona métodos específicos:

```rust
let x: u8 = 255;

// Wrapping: siempre da la vuelta
let a = x.wrapping_add(1);  // 0

// Checked: devuelve Option<T>
let b = x.checked_add(1);   // None

// Saturating: se detiene en el límite
let c = x.saturating_add(1); // 255

// Overflowing: retorna valor y flag booleano
let (d, overflow) = x.overflowing_add(1); // (0, true)
```

==== Conversiones entre Tipos Enteros

Rust no realiza conversiones implícitas entre tipos enteros, incluso cuando la conversión sería segura. Todas las conversiones deben ser explícitas utilizando el operador `as`:

```rust
let a: u8 = 100;
let b: u16 = a as u16;  // Conversión segura (widening)
let c: u32 = b as u32;

let x: u32 = 1000;
let y: u8 = x as u8;    // Conversión potencialmente peligrosa (narrowing)
                        // y = 232 (se truncan los bits superiores)
```

#box(
  fill: rgb("#fff3cd"),
  inset: 10pt,
  radius: 4pt,
  [
    *Advertencia:* Las conversiones que reducen el tamaño del tipo (*narrowing*) pueden resultar en pérdida de datos si el valor excede el rango del tipo destino. Rust trunca los bits superiores sin advertencia.
  ]
)



==== Constantes de Rango

Todos los tipos enteros proporcionan constantes asociadas que definen sus límites numéricos:

```rust
println!("Rango de u8: {} a {}", u8::MIN, u8::MAX);
println!("Rango de i16: {} a {}", i16::MIN, i16::MAX);
println!("Rango de u32: {} a {}", u32::MIN, u32::MAX);
println!("Rango de isize: {} a {}", isize::MIN, isize::MAX);
```
==== Operaciones y métodos comunes

```rust
let x: i32 = 42;

println!("Abs: {}", x.abs());        // valor absoluto
println!("Pow: {}", x.pow(3));       // potencia (42^3)
println!("{}",x.is_positive());      // es positivo?
println!("{}",x.is_negative());      // es negativo?
println!("{}",x.to_string());        // convierte a una cadena de texto
println!("{}",x.signum());
```

#figure(
table(
  columns: (auto,auto,auto,1fr),
  inset: 10pt,
  stroke: 0.5pt + black,
  align: horizon,
  [Operador],[Descripción],[Ejemplo],[Resultado],
  [#raw("+",lang: "")],[Suma],[#raw("let numero = 15 + 5;",lang: "rust")],[#raw("20",lang: "rust")],
  [#raw("-",lang: "")],[Resta],[#raw("let numero = 15 - 5; ",lang: "rust")],[#raw("10",lang: "rust")],
  [#raw("*",lang: "")],[Multiplicación],[#raw("let numero = 15 * 5;",lang: "rust")],[#raw("75",lang: "rust")],
  [#raw("/",lang: "")],[División],[#raw("let numero = 15 / 5;",lang: "rust")],[#raw("3",lang: "rust")],
  [#raw("%",lang: "")],[Módulo],[#raw("let numero = 15 % 5;",lang: "rust")],[#raw("0",lang: "rust")],
),
  caption: [Operadores aritméticos],
  supplement: [Tabla]
)

#figure(
  table(
  columns: (auto,auto,1fr),
  stroke: 0.5pt + black,
  align: horizon,
  inset: 10pt,
  [Operador],[Equivalente a],[Ejemplo],
  [#raw("+=",lang: "")],[`x = x + y`],[#raw("x += 2;",lang: "rust")],
  [#raw("-=",lang: "")],[`x = x - y`],[#raw("x -= 3;",lang: "rust")],
  [#raw("*=",lang: "")],[`x = x * y`],[#raw("x *= 5;",lang: "rust")],
  [#raw("/=",lang: "")],[`x = x / y`],[#raw("x /= 2;",lang: "rust")],
  [#raw("%=",lang: "")],[`x = x % y`],[#raw("x %= 3;",lang: "rust")],
),
  caption: [Operadores de asignación compuesta],
  supplement: [Tabla]
)
