== Errores NO Recuperables

¿Qué es un error no recuperable?

Un error no recuperable es cuando la única opción segura es detener el programa inmediatamente
para evitar corrupción de datos o comportamiento impredecible.

Ejemplos:

- Índice fuera de rango en un vector

- Dividir entre cero

- Usar unwrap() sobre None o Err

- Violaciones lógicas del código (invariantes imposibles)

Rust usa panic! para estos casos.

=== panic!

Detener el programa de forma controlada

panic! es una macro que termina la ejecución y muestra un mensaje.

```rust
fn main() {
    panic!("Ocurrió un error inesperado");
}
```
Salida típica:
```rust
thread 'main' panicked at 'Ocurrió un error inesperado', src/main.rs:2:5
```

¿Cuándo ocurre un panic automáticamente?
+ Índices fuera de rango
```rust
let v = vec![1, 2, 3];
println!("{}", v[10]); // panic!
```
+ unwrap() sobre None
```rust
let x: Option<i32> = None;
x.unwrap(); // panic
```
+ expect() también provoca panic
```rust
let r: Result<i32, _> = "hola".parse();
r.expect("No se pudo convertir"); // panic con mensaje personalizado
```
Cuándo no usar  unwrap() y expect()

Ambos métodos causan panic si:

- Option es None

- Result es Err

¿Por qué existen entonces?

Porque en prototipos, scripts rápidos y tests es conveniente usarlos.

Cuándo evitar unwrap/expect:

- En producción

- En código que maneja errores del usuario

- En operaciones de I/O, red, archivos

- Cuando el valor puede no existir o fallar

=== Backtrace

seguir el origen del panic

Rust puede mostrar la ruta de llamadas que llevó al error.

Para activarlo:
```rust
RUST_BACKTRACE=1 cargo run
```
Ejemplo de salida:
```rust
thread 'main' panicked at 'fallo X', src/main.rs:12:9
stack backtrace:
   0: rust_begin_unwind
   1: core::panicking::panic_fmt
   2: my_project::funcion
   3: my_project::main
```
Esto es útil para depurar.
