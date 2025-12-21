=== Strings

En Rust, trabajar con texto implica conocer dos tipos principales: `String` y `&str`.

`String` es un tipo dinámico, mutable y con propiedad, que vive en el heap.

`&str` es una referencia inmutable a una secuencia de caracteres UTF-8, generalmente llamada "string slice".

*Características de `String`:*
- Tamaño dinámico
- Almacenado en el heap
- Ownership
- Codificación UTF-8 válida garantizada
- Es básicamente un `Vec<u8>` con garantía de UTF-8

*Características de `&str`:*
- Tamaño fijo
- Inmutable
- Puede vivir en el stack, heap o en el binario
- No tiene propiedad (es una referencia)
- También es UTF-8

#text(14pt)[*Creación de Strings*]

*1. String literal:  `type &str`*

```rust
let s = "Hola Mundo";  // tipo: &str
println!("{}", s);
```

Los string literals están en el binario y viven durante todo el programa.

*2. Crear `String` desde un literal*

```rust
let s1 = String::from("Hola");
let s2 = "Hola".to_string();
let s3 = "Hola".to_owned();

println!("{}, {}, {}", s1, s2, s3);
```

Todas estas formas crean un `String` en el heap.

*3. String vacío*

```rust
let mut s = String::new();
println!("Vacío: '{}'", s);  // ''
println!("Longitud: {}", s.len());  // 0
```

*4. String con capacidad reservada*

```rust
let mut s = String::with_capacity(10);
println!("len: {}, cap: {}", s.len(), s.capacity());
// len: 0, cap: 10
```

*5. String desde bytes*

```rust
let bytes = vec![72, 111, 108, 97];  // "Hola" en UTF-8
let s = String::from_utf8(bytes).unwrap();

println!("{}", s);  // Hola
```

*6. String repetido*

```rust
let s = "Rust".repeat(3);
println!("{}", s);  // RustRustRust
```

#text(14pt)[*Diferencia entre String y &str*]

```rust
fn main() {
    let s1: String = String::from("Hola");  // owned, heap
    let s2: &str = "Mundo";                 // borrowed, puede estar en binario

    println!("{} {}", s1, s2);
}
```

*Conversión entre String y &str:*

```rust
// De String a &str (fácil, solo tomar prestado)
let s = String::from("Hola");
let slice: &str = &s;
let slice2: &str = s.as_str();

// De &str a String (requiere asignación)
let literal = "Hola";
let owned = literal.to_string();
let owned2 = String::from(literal);
```

#text(14pt)[*Longitud y capacidad*]

```rust
let mut s = String::with_capacity(10);

println!("len: {}, cap: {}", s.len(), s.capacity());
// len: 0, cap: 10

s.push_str("Hola");

println!("len: {}, cap: {}", s.len(), s.capacity());
// len: 4, cap: 10
```

`len()` retorna el número de bytes, no el número de caracteres:

```rust
let s = String::from("Hola");
println!("Bytes: {}", s.len());  // 4

let s = String::from("Hölä");
println!("Bytes: {}", s.len());  // 6 (ö y ä usan 2 bytes cada uno)
```

Para contar caracteres:

```rust
let s = "Hölä";
println!("Caracteres: {}", s.chars().count());  // 4
```

#text(14pt)[*Agregar contenido*]

*1. Agregar un string con `push_str()`*

```rust
let mut s = String::from("Hola");

s.push_str(" Mundo");

println!("{}", s);  // Hola Mundo
```

*2. Agregar un carácter con `push()`*

```rust
let mut s = String::from("Hol");

s.push('a');
s.push('!');

println!("{}", s);  // Hola!
```

*3. Concatenar con `+`*

```rust
let s1 = String::from("Hola");
let s2 = String::from(" Mundo");

let s3 = s1 + &s2;  // s1 se mueve, s2 se presta

// println!("{}", s1);  // Error: s1 fue movido
println!("{}", s2);     // s2 sigue disponible
println!("{}", s3);     // Hola Mundo
```

El operador `+` mueve el primer operando y toma prestado el segundo.

*4. Concatenar múltiples strings con `format!`*

```rust
let s1 = String::from("Hola");
let s2 = String::from("Mundo");
let s3 = String::from("Rust");

let resultado = format!("{} {} {}", s1, s2, s3);

println!("{}", resultado);  // Hola Mundo Rust

// Todos siguen disponibles
println!("{}, {}, {}", s1, s2, s3);
```

`format!` no mueve ningún valor, solo toma prestado.

*5. Insertar en una posición específica*

```rust
let mut s = String::from("Hola Rust");

s.insert(5, 'a');  // inserta en índice de byte 5

println!("{}", s);  // Holaa Rust
```

```rust
let mut s = String::from("Hola");

s.insert_str(4, " Mundo");

println!("{}", s);  // Hola Mundo
```

Los índices son posiciones de bytes, no de caracteres.

#text(14pt)[*Acceso a caracteres*]

No puedes acceder directamente por índice:

```rust
let s = String::from("Hola");
// let c = s[0];  // Error: String no soporta indexación
```

Usa `chars()` para acceder:

```rust
let s = String::from("Hola");

// Obtener el primer carácter
if let Some(primero) = s.chars().nth(0) {
    println!("Primer carácter: {}", primero);  // H
}

// Recorrer todos los caracteres
for c in s.chars() {
    println!("{}", c);
}
```

*Acceder a bytes (no recomendado para texto)*

```rust
let s = String::from("Hola");

for byte in s.bytes() {
    println!("{}", byte);
}
// 72, 111, 108, 97
```

#text(14pt)[*Slicing de strings*]

Puedes obtener slices usando rangos de bytes:

```rust
let s = String::from("Hola Mundo");

let hola = &s[0..4];   // "Hola"
let mundo = &s[5..10]; // "Mundo"

println!("{}", hola);
println!("{}", mundo);
```

*Cuidado con caracteres multi-byte:*

```rust
let s = "Hölä";

// let slice = &s[0..2];  // Panic: corta en medio de 'ö'
let slice = &s[0..3];     // "Hö" (ö usa 2 bytes)

println!("{}", slice);
```

Para slicing seguro, verifica límites de caracteres:

```rust
let s = "Hölä Mundo";

if s.is_char_boundary(3) {
    println!("{}", &s[0..3]);  // Hö
}
```

#text(14pt)[*Métodos de verificación*]

```rust
let s = String::from("Hola Mundo");

// Verificar si está vacío
println!("{}", s.is_empty());  // false

// Verificar si empieza con...
println!("{}", s.starts_with("Hola"));  // true

// Verificar si termina con...
println!("{}", s.ends_with("Mundo"));  // true

// Verificar si contiene...
println!("{}", s.contains("la"));  // true

// Comparar (case insensitive)
let s1 = "HOLA";
let s2 = "hola";
println!("{}", s1.eq_ignore_ascii_case(s2));  // true
```

#text(14pt)[*Búsqueda*]

*1. Buscar primera ocurrencia con `find()`*

```rust
let s = "Hola Mundo Hola";

if let Some(pos) = s.find("Mundo") {
    println!("Encontrado en posición: {}", pos);  // 5
}
```

*2. Buscar última ocurrencia con `rfind()`*

```rust
let s = "Hola Mundo Hola";

if let Some(pos) = s.rfind("Hola") {
    println!("Última ocurrencia en: {}", pos);  // 11
}
```

*3. Buscar con patrón*

```rust
let s = "Rust 2025";

if let Some(pos) = s.find(char::is_numeric) {
    println!("Primer dígito en posición: {}", pos);  // 5
}
```

*4. Contar ocurrencias*

```rust
let s = "Hola Mundo Hola Rust";
let count = s.matches("Hola").count();

println!("'Hola' aparece {} veces", count);  // 2
```

#text(14pt)[*Dividir strings*]

*1. Dividir por un delimitador con `split()`*

```rust
let s = "Rust,Python,JavaScript";

for parte in s.split(',') {
    println!("{}", parte);
}
// Rust
// Python
// JavaScript
```

Recoger en un vector:

```rust
let s = "uno,dos,tres";
let partes: Vec<&str> = s.split(',').collect();

println!("{:?}", partes);  // ["uno", "dos", "tres"]
```

*2. Dividir por espacios en blanco*

```rust
let s = "Hola   Mundo  Rust";

let palabras: Vec<&str> = s.split_whitespace().collect();

println!("{:?}", palabras);  // ["Hola", "Mundo", "Rust"]
```

*3. Dividir en líneas*

```rust
let texto = "Primera línea\nSegunda línea\nTercera línea";

for linea in texto.lines() {
    println!("{}", linea);
}
```

*4. Dividir en n partes con `splitn()`*

```rust
let s = "uno:dos:tres:cuatro";

let partes: Vec<&str> = s.splitn(2, ':').collect();

println!("{:?}", partes);  // ["uno", "dos:tres:cuatro"]
```

*5. Dividir desde el final con `rsplit()`*

```rust
let s = "uno,dos,tres";

for parte in s.rsplit(',') {
    println!("{}", parte);
}
// tres
// dos
// uno
```

#text(14pt)[*Reemplazar contenido*]

*1. Reemplazar todas las ocurrencias con `replace()`*

```rust
let s = "Hola Mundo Hola";

let nuevo = s.replace("Hola", "Adiós");

println!("{}", nuevo);  // Adiós Mundo Adiós
```

*2. Reemplazar n ocurrencias con `replacen()`*

```rust
let s = "Hola Hola Hola";

let nuevo = s.replacen("Hola", "Hey", 2);

println!("{}", nuevo);  // Hey Hey Hola
```

*3. Reemplazar un rango*

```rust
let mut s = String::from("Hola Mundo");

s.replace_range(5..10, "Rust");

println!("{}", s);  // Hola Rust
```

⚠️ `replace_range()` modifica el String original (requiere `mut`).

#text(14pt)[*Eliminar contenido*]

*1. Eliminar el último carácter con `pop()`*

```rust
let mut s = String::from("Hola!");

let ultimo = s.pop();

println!("{:?}", ultimo);  // Some('!')
println!("{}", s);          // Hola
```

*2. Eliminar un carácter en posición específica con `remove()`*

```rust
let mut s = String::from("Hola");

let eliminado = s.remove(1);

println!("Eliminado: {}", eliminado);  // o
println!("String: {}", s);              // Hla
```

⚠️ Índice debe ser un límite de carácter válido.

*3. Eliminar un rango con `drain()`*

```rust
let mut s = String::from("Hola Mundo");

let drenado: String = s.drain(5..10).collect();

println!("Drenado: {}", drenado);  // Mundo
println!("String: {}", s);          // Hola
```

*4. Eliminar caracteres del final con `truncate()`*

```rust
let mut s = String::from("Hola Mundo");

s.truncate(4);

println!("{}", s);  // Hola
```

*5. Vaciar completamente con `clear()`*

```rust
let mut s = String::from("Hola Mundo");

s.clear();

println!("Vacío: '{}'", s);  // ''
println!("Longitud: {}", s.len());  // 0
```

#text(14pt)[*Transformaciones*]

*1. Convertir a mayúsculas*

```rust
let s = "hola mundo";

let mayus = s.to_uppercase();

println!("{}", mayus);  // HOLA MUNDO
```

*2. Convertir a minúsculas*

```rust
let s = "HOLA MUNDO";

let minus = s.to_lowercase();

println!("{}", minus);  // hola mundo
```

*3. Eliminar espacios al inicio y final con `trim()`*

```rust
let s = "   Hola Mundo   ";

let limpio = s.trim();

println!("'{}'", limpio);  // 'Hola Mundo'
```

*4. Eliminar espacios solo al inicio con `trim_start()`*

```rust
let s = "   Hola Mundo   ";

let limpio = s.trim_start();

println!("'{}'", limpio);  // 'Hola Mundo   '
```

*5. Eliminar espacios solo al final con `trim_end()`*

```rust
let s = "   Hola Mundo   ";

let limpio = s.trim_end();

println!("'{}'", limpio);  // '   Hola Mundo'
```

*6. Eliminar caracteres específicos con `trim_matches()`*

```rust
let s = "###Hola###";

let limpio = s.trim_matches('#');

println!("{}", limpio);  // Hola
```

```rust
let s = "123Hola456";

let limpio = s.trim_matches(char::is_numeric);

println!("{}", limpio);  // Hola
```

#text(14pt)[*Parseo de strings*]

*1. Convertir string a número*

```rust
let s = "42";

let num: i32 = s.parse().unwrap();

println!("{}", num + 10);  // 52
```

Con manejo de errores:

```rust
let s = "42";

match s.parse::<i32>() {
    Ok(num) => println!("Número: {}", num),
    Err(e) => println!("Error: {}", e),
}
```

*2. Convertir número a string*

```rust
let num = 42;

let s1 = num.to_string();
let s2 = format!("{}", num);

println!("{}, {}", s1, s2);  // 42, 42
```

#text(14pt)[*Repetir strings*]

```rust
let s = "Rust";

let repetido = s.repeat(3);

println!("{}", repetido);  // RustRustRust
```

```rust
let linea = "-".repeat(50);
println!("{}", linea);
// --------------------------------------------------
```

#text(14pt)[*Comparaciones*]

```rust
let s1 = "Hola";
let s2 = "Hola";
let s3 = "Mundo";

println!("{}", s1 == s2);  // true
println!("{}", s1 != s3);  // true
println!("{}", s1 < s3);   // true (orden lexicográfico)
```

*Comparación case-insensitive:*

```rust
let s1 = "HOLA";
let s2 = "hola";

println!("{}", s1.eq_ignore_ascii_case(s2));  // true
```

#text(14pt)[*Concatenar múltiples strings*]

*1. Usando `format!` (recomendado)*

```rust
let nombre = "Ana";
let edad = 25;

let mensaje = format!("Me llamo {} y tengo {} años", nombre, edad);

println!("{}", mensaje);
```

*2. Usando el método `join()` para slices*

```rust
let palabras = vec!["Hola", "desde", "Rust"];

let frase = palabras.join(" ");

println!("{}", frase);  // Hola desde Rust
```

*3. Concatenar con `+` múltiples veces (no recomendado)*

```rust
let s1 = String::from("Hola");
let s2 = String::from(" Mundo");
let s3 = String::from(" Rust");

let resultado = s1 + &s2 + &s3;

println!("{}", resultado);  // Hola Mundo Rust
```

#text(14pt)[*Capacidad y optimización*]

```rust
let mut s = String::with_capacity(10);

println!("cap: {}", s.capacity());  // 10

s.push_str("Hola");

println!("len: {}, cap: {}", s.len(), s.capacity());
// len: 4, cap: 10
```

*Reservar más capacidad:*

```rust
let mut s = String::from("Hola");

s.reserve(10);  // reserva al menos 10 bytes adicionales

println!("cap: {}", s.capacity());
```

*Reducir capacidad al mínimo:*

```rust
let mut s = String::with_capacity(100);

s.push_str("Hola");

s.shrink_to_fit();

println!("cap después: {}", s.capacity());  // ≈4
```

*Reservar exactamente:*

```rust
let mut s = String::new();

s.reserve_exact(10);

println!("cap: {}", s.capacity());  // exactamente 10
```

#text(14pt)[*Validación UTF-8*]

Rust garantiza que todo `String` es UTF-8 válido:

```rust
let bytes = vec![72, 111, 108, 97];  // "Hola"

let s = String::from_utf8(bytes).unwrap();

println!("{}", s);  // Hola
```

Con bytes inválidos:

```rust
let bytes = vec![0, 159, 146, 150];  // UTF-8 inválido

match String::from_utf8(bytes) {
    Ok(s) => println!("{}", s),
    Err(e) => println!("Error: {}", e),
}
```

Para strings con UTF-8 inválido, usa `from_utf8_lossy()`:

```rust
let bytes = vec![72, 111, 255, 108, 97];

let s = String::from_utf8_lossy(&bytes);

println!("{}", s);  // Ho�la (� reemplaza bytes inválidos)
```

#text(14pt)[*Strings multilínea*]

```rust
let poema = "
    Roses are red,
    Violets are blue,
    Rust is awesome,
    And so are you!
";

println!("{}", poema);
```

Sin espacios al inicio:

```rust
let texto = "\
Primera línea
Segunda línea
Tercera línea
";

println!("{}", texto);
```

#text(14pt)[*Secuencias de escape*]

```rust
let s = "Primera línea\nSegunda línea";
println!("{}", s);

let s = "Tab\taqui";
println!("{}", s);

let s = "Comillas: \"Hola\"";
println!("{}", s);

let s = "Backslash: \\";
println!("{}", s);

// Unicode
let s = "Corazón: \u{2764}";
println!("{}", s);  // Corazón: ❤
```

#text(14pt)[*Raw strings*]

Para strings literales sin procesar secuencias de escape:

```rust
let s = r"C:\Users\nombre\Documents";
println!("{}", s);  // C:\Users\nombre\Documents
```

Con comillas:

```rust
let s = r#"Él dijo: "Hola Mundo""#;
println!("{}", s);
```

Con múltiples `#`:

```rust
let s = r##"Este string tiene "comillas" y #hashtags"##;
println!("{}", s);
```

#text(14pt)[*Copia y movimiento*]

`String` NO implementa `Copy`, solo `Clone`:

```rust
let s1 = String::from("Hola");
let s2 = s1;  // s1 se mueve

// println!("{}", s1);  // ✗ Error: valor movido
println!("{}", s2);     // ✓ Hola
```

Para copiar, usa `clone()`:

```rust
let s1 = String::from("Hola");
let s2 = s1.clone();

println!("{}", s1);  // Hola
println!("{}", s2);  // Hola
```

`&str` sí es `Copy`:

```rust
let s1 = "Hola";
let s2 = s1;

println!("{}", s1);  // ✓ Hola
println!("{}", s2);  // ✓ Hola
```

#text(14pt)[*Cuándo usar String vs &str*]

*Usa `String` cuando:*
- Necesitas modificar el texto
- Necesitas propiedad del texto
- El tamaño cambiará dinámicamente
- Construyes strings en tiempo de ejecución

*Usa `&str` cuando:*
- El texto es de solo lectura
- Quieres prestar texto sin tomar propiedad
- Trabajas con string literals
- Pasas texto a funciones sin modificarlo

*Ejemplo en funciones:*

```rust
// Mejor: acepta &str (más flexible)
fn imprimir(texto: &str) {
    println!("{}", texto);
}

fn main() {
    let s1 = String::from("Hola");
    let s2 = "Mundo";

    imprimir(&s1);  // ✓ String → &str
    imprimir(s2);   // ✓ &str → &str
}
```
