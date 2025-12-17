= Tipos de datos

En Rust, un tipo de dato define la naturaleza de la información que una
variable puede almacenar y las operaciones que se pueden realizar sobre ella.
El sistema de tipos de Rust es estático y fuertemente tipado, lo que significa
que el compilador conoce el tipo de cada valor en tiempo de compilación y no
permite operaciones entre tipos incompatibles.

Por ejemplo, una variable declarada como i32 solo puede almacenar números
enteros de 32 bits, y no puede ser utilizada como una cadena de texto o un
número decimal sin una conversión explícita.

```rust
let numero: i32 = 10;
```

Los tipos de datos son fundamentales en Rust por varias razones clave:

- Seguridad en tiempo de compilación

  Rust detecta muchos errores comunes como desbordamientos, usos incorrectos de memoria,
  tipos incompatibles, antes de que el programa se ejecute. Esto reduce significativamente
  errores en producción.

- Prevención de errores de memoria

  El sistema de tipos de Rust trabaja junto con el modelo de ownership, borrowing y
  lifetimes para garantizar seguridad de memoria sin necesidad de un
  recolector de basura.

- Rendimiento

  Al conocer los tipos en tiempo de compilación, el compilador puede generar código
  altamente optimizado, comparable o superior a C y C++.

- Claridad y mantenibilidad del código

  Los tipos hacen que el código sea más explícito, fácil de entender y mantener,
  especialmente en proyectos grandes.

== Scalar Types

=== Integer Types

Los enteros son tipos de datos numéricos que representan valores sin parte
decimal. En Rust, los enteros están diseñados para ser explícitos en tamaño y
signo, lo que permite un control preciso sobre el uso de memoria y el
comportamiento del programa.

Clasificación de los enteros en Rust

Rust divide los enteros en dos grandes categorías:

+ Enteros con signo "i"

  Los enteros con signo pueden representar valores positivos, negativos y
  el cero. Utilizan un bit para el signo y siguen la representación en complemento a dos.

  #figure(
  table(
  columns: (auto, auto, auto),
  align: (center, right, right),
  table.header(
    [Tipo],
    [Valor mínimo],
    [Valor máximo]
  ),
  [#raw("i8",lang: "")], [−128], [127],
  [#raw("i16",lang: "")], [−32 768], [32 767],
  [#raw("i32",lang: "")], [−2 147 483 648], [2 147 483 647],
  [#raw("i64",lang: "")], [−9 223 372 036 854 775 808], [9 223 372 036 854 775 807],
  [#raw("i128",lang: "")], [#raw("−2¹²⁷",lang: "")], [#raw("2¹²⁷ − 1",lang: "")],
  [#raw("isize",lang: "")], [#raw("−2³¹ o −2⁶³",lang: "")], [#raw("2³¹ − 1 o 2⁶³ − 1",lang: "")]
),
  caption: [Rangos numéricos de los tipos enteros con signo.],
  supplement: [Tabla]
)

  Ejemplo:
  ```rust
  let temperatura: i8 = -128;
  temperatura = 127
  ```


+ Enteros sin signo "u"

  Los enteros sin signo solo pueden representar valores positivos o cero, ya
  que no reservan bits para el signo. Esto les permite cubrir un rango positivo
  mayor usando la misma cantidad de bits.

  #figure(
  table(
  columns: (auto, auto, auto),
  align: (center, right, right),
  table.header(
    [Tipo],
    [Valor mínimo],
    [Valor máximo]
  ),
  [#raw("u8",lang: "")], [0], [255],
  [#raw("u16",lang: "")], [0], [65 535],
  [#raw("u32",lang: "")], [0], [4 294 967 295],
  [#raw("u64",lang: "")], [0], [18 446 744 073 709 551 615],
  [#raw("u128",lang: "")], [0], [#raw("2¹²⁸ − 1",lang: "")],
  [#raw("usize",lang: "")], [0], [#raw("2³² − 1",lang: "") o #raw("2⁶⁴ − 1",lang: "")],
),
  caption: [Rangos numéricos de los tipos enteros sin signo.],
  supplement: [Tabla]
)

  Ejemplo:
  ```rust
  let mut temperatura: u8 = 0;
  temperatura = 255;
  ```

Integer Overflow

Cuando un entero excede su rango permitido ocurre un desbordamiento.

```rust
let x: u8 = 255;
let y = x + 1; // overflow
```

- En modo debug, Rust detiene el programa con un error.

- En modo release, el valor hace wrap around volviendo a 0.

Inferencia de tipos enteros

Rust infiere tipos enteros cuando es posible:

```rust
let numero = 1000; // i32 por defecto
let numero = 1000i32;
let numero:i32 = 1_000;
```

El tipo por defecto es i32 porque ofrece un buen equilibrio entre rendimiento y rango.

Notación numérica

Rust permite diferentes bases numéricas:
```rust
let decimal = 255;       // base 10
let hexadecimal = 0xff;  // base 16
let octal = 0o377;       // base 8
let binario = 0b1111_1111; // base 2
let byte: u8 = b'A';     // byte literal (ASCII)
```

Conversión entre enteros

Rust no convierte tipos enteros automáticamente, debes hacerlo a mano:

```rust
let a: u16 = 1500;
let b: u32 = a as u32;  // conversión explícita
```

Rangos predefinidos

Todos los tipos enteros tienen constantes MIN y MAX:
```rust
println!("u8: {} - {}", u8::MIN, u8::MAX);
println!("i16: {} - {}", i16::MIN, i16::MAX);
```
