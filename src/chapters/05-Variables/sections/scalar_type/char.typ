=== Carácter

El tipo `char` en Rust es una representación completa y segura de cualquier carácter Unicode.

==== Representación de Caracteres

Los literales de tipo `char` se escriben entre comillas simples (`'`), distinguiéndose así de las cadenas de
texto que utilizan comillas dobles (`"`):

```rust
let letra: char = 'A';
let minuscula: char = 'ñ';
let numero: char = '7';
let simbolo: char = '©';
let emoji: char = '😎';
let kanji: char = '字';
let arabe: char = 'ع';
```


==== Métodos de Inspección

Rust proporciona una amplia colección de métodos para analizar las propiedades de un carácter:

===== Clasificación de Caracteres

```rust
let c = 'A';

// Propiedades alfabéticas
println!("¿Alfabético?: {}", c.is_alphabetic());      // true
println!("¿Alfanumérico?: {}", c.is_alphanumeric());  // true
println!("¿Mayúscula?: {}", c.is_uppercase());        // true
println!("¿Minúscula?: {}", c.is_lowercase());        // false

// Propiedades numéricas
let numero = '7';
println!("¿Dígito?: {}", numero.is_numeric());        // true
println!("¿Dígito ASCII?: {}", numero.is_ascii_digit()); // true

// Espacios en blanco
let espacio = ' ';
println!("¿Espacio?: {}", espacio.is_whitespace());   // true

// Control y formato
let tab = '\t';
println!("¿Control?: {}", tab.is_control());          // true
```



==== Secuencias de Escape

Rust soporta varias secuencias de escape para representar caracteres especiales:

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: (center, center, left),
    inset: 10pt,
    table.header(
      [*Secuencia*],
      [*Carácter*],
      [*Descripción*]
    ),
    [`\n`], [Nueva línea], [Line feed (LF)],
    [`\r`], [Retorno de carro], [Carriage return (CR)],
    [`\t`], [Tabulador], [Tabulador horizontal],
    [`\\`], [Barra invertida], [Backslash literal],
    [`\'`], [Comilla simple], [Necesaria en literales char],
    [`\0`], [Carácter nulo], [Byte cero],
    [`\x7F`], [ASCII hex], [Carácter ASCII en hexadecimal (2 dígitos)],
    [`\u{1F680}`], [Unicode], [Carácter Unicode (hasta 6 dígitos hex)],
  ),
  caption: [Secuencias de escape para caracteres],
  supplement: [Tabla]
)

```rust
// Secuencias comunes
let nueva_linea = '\n';
let tab = '\t';
let comilla = '\'';
let backslash = '\\';

// ASCII hexadecimal
let delete = '\x7F';  // Carácter DEL

// Unicode con código
let cohete = '\u{1F680}';  // 🚀
let corazon = '\u{2764}';  // ❤

println!("Cohete: {}", cohete);
println!("Corazón: {}", corazon);
```
