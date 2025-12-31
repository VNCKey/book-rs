== Errores Recuperables

Rust trata el manejo de errores como una parte esencial del lenguaje.

Para evitar fallos inesperados, Rust propone una estrategia distinta a otros lenguajes: tratar los errores como valores, no como excepciones.

¿Qué es un error recuperable?

Un error recuperable es aquel que:

- Podemos anticipar

- Podemos manejar

- No requiere terminar el programa

Ejemplos:

- Un archivo que no existe

- Una conexión de red que falla

- Un número que no se puede convertir

- Un usuario que podría o no estar registrado

Rust usa #raw("Option",lang:"rust") y#raw("Result",lang:"rust") para estos casos.


=== Option\<T\>

valor o ausencia de valor

```rust
enum Option<T> {
    Some(T),
    None,
}
```

Sirve para modelar cosas que pueden o no existir.

*Obtener el primer elemento de un vector*
```rust
fn obtener_primero(nums: &Vec<i32>) -> Option<i32> {
    nums.first().copied()
}
```
Uso:
```rust
match obtener_primero(&vec![10, 20, 30]) {
    Some(n) => println!("Primer número: {}", n),
    None => println!("El vector está vacío"),
}
```

Métodos importantes de Option\<T\>

- .unwrap()

  Obtiene el valor o hace panic
- .unwrap_or(x)

  Valor por defecto
- .unwrap_or_else()

  Llama una función para obtener un valor
- .map()

  Transforma Some
- .and_then()

  Encadena operaciones que también devuelven Option

Ejemplo: evitar panic usando unwrap_or

```rust
let nombre = Some("Juan");
let n = nombre.unwrap_or("Invitado");
```

=== Result\<T, E\>

operación que puede fallar

Definición:

```rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```

Ejemplos: abrir archivos, parsear strings, convertir tipos.

*Convertir un string en número*

```rust
fn convertir(s: &str) -> Result<i32, std::num::ParseIntError> {
    s.parse::<i32>()
}
```

Uso:

```rust
match convertir("42") {
    Ok(n) => println!("Número: {}", n),
    Err(e) => println!("Error: {}", e),
}
```
Métodos importantes de Result<\T, E>

- .unwrap()

  Obtiene T o panic
- .expect(msg)

  Igual que unwrap pero con mensaje
- .map()

  Transforma Ok
- .map_err()

  Transforma Err
- .ok()

  Convierte Result a Option
- .err()

  Obtiene la parte Err

=== El operador ?

El operador ?:

- Si es Ok, devuelve el valor

- Si es Err, retorna inmediatamente de la función

Ejemplo sin ?

```rust
fn leer_archivo() -> Result<String, std::io::Error> {
    let mut archivo = File::open("hola.txt");
    match archivo {
        Ok(mut f) => {
            let mut contenido = String::new();
            match f.read_to_string(&mut contenido) {
                Ok(_) => Ok(contenido),
                Err(e) => Err(e),
            }
        }
        Err(e) => Err(e),
    }
}
```
Ejemplo con ?
```rust
fn leer_archivo() -> Result<String, std::io::Error> {
    let mut contenido = String::new();
    File::open("hola.txt")?.read_to_string(&mut contenido)?;
    Ok(contenido)
}
```

Patrones para manejar errores correctamente

match

```rust
match archivo {
    Ok(a) => println!("Abierto"),
    Err(e) => println!("Error: {}", e),
}
```

if let
```rust
if let Some(n) = x {
    println!("El número es {}", n);
}
```

while let

Ideal para iteradores:
```rust
let mut iter = vec![1,2,3].into_iter();
while let Some(v) = iter.next() {
    println!("{}", v);
}
```
