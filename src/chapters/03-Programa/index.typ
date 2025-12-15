#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#codly(
  languages: (
    rust: (name: "Rust", icon: "🦀", color: rgb("#FFD8C9")),
    bash: (name: "Terminal", icon: "🐧", color: rgb("#E2E2E2")),
    yaml: (name: "Output", icon: "📝", color: rgb("#D6FFCB")),
    toml: (name: "toml", icon: "⚙️", color: rgb("#C7FFFA")),
  ),
  number-format: none,
  zebra-fill: none,
  stroke: none,
  fill: rgb("#FBFAFB"),  // 👈 Color de fondo general
)



#import "../../config.typ": term

== Compilación y Ejecución en Rust

La ejecución de código en Rust puede realizarse mediante dos vías fundamentales:
- Compilador directo, rustc, para tareas sencillas.
- Cargo la herramienta estándar de gestión de proyectos, indispensable para el desarrollo moderno.

=== Usando rustc

rustc es el compilador oficial de Rust. Es el programa que transforma
tu código fuente (archivos .rs) en ejecutables que tu computadora puede ejecutar.

Entender #term[rustc] te ayuda a comprender mejor lo que sucede "bajo el capó".

Imagina que escribes una receta en español, pero tu horno solo entiende instrucciones
en lenguaje de máquina. El compilador #term[rustc] es el traductor que convierte tu
receta #term[código Rust] en instrucciones que el horno #term[CPU] puede ejecutar.

Proceso de Compilación

#include "../../utils/diagrama_rustc.typ"

Fases del Proceso

+ Paso 1: Creación del Módulo Fuente

  Todo comienza con el código fuente, que tradicionalmente lleva la extensión #term[.rs].

  ```rust
  fn main() {
      println!("Compilador directo rustc."); //Archivo: main.rs
  }
  ```

+ Paso 2: Compilación

  Desde la terminal, se invoca a rustc, apuntando al archivo de entrada.
  El compilador lee el código y genera un archivo binario ejecutable en el mismo directorio.

  ```bash
  rustc main.rs
  ```

  En este proceso, rustc maneja internamente la verificación de tipos, el borrow checker y
  la generación del código máquina optimizado, utilizando LLVM.

+ Ejecución

  Esto genera un ejecutable.

  - Windows: ```bash
  .\main.exe
  ```

  - Linux/macOS: ```bash
  ./main
  ```

  Resultado:```yaml
  Compilador directo rustc.
  ```

=== Tu Primer Proyecto con Cargo

Crear un nuevo proyecto

#codly(
  highlights : (
    (line:2, start:1, end:9, fill: rgb("#C7FFFA"),tag:"a"),
    (line:2, start:11, end:20, fill: rgb("#C7FFD4"),tag:"b"),
  ),
)
```bash
# Crear un proyecto binario (aplicación)
cargo new hola_mundo
```
- a: Crear un nuevo proyecto Rust

- b: Nombre del proyecto

```bash
# Entrar al directorio
cd hola_mundo
```

Estructura creada:
#codly(
  highlights : (
    (line:1, start:1, end:14, fill: rgb("#CBD4FF"),tag:"Raíz del proyecto"),
    (line:2, start:11, end:21, fill: rgb("#C7FFFA"),tag:"Registra las versiones específicas"),
    (line:3, start:11, end:21, fill: rgb("#C7FFD4"),tag:"Define las dependencias"),
    (line:5, start:17, end:23, fill: rgb("#FCCBFF"),tag:"Código fuente principal"),
    (line:6, start:11, end:18, fill: rgb("#FFD9CB"),tag:"Destino de la Compilación"),
    (line:10, start:20, fill: rgb("#FFF0CB"),tag:"El ejecutable de tu aplicación"),
  ),
)

```yaml
hello_world/
╠── Cargo.lock
╠── Cargo.toml
╠── src/
│   ╚── main.rs
╚── target/
    ╚── debug/
        ╠── build/
        ╚── deps/
          ╚── hello_world
```


Anatomía del Proyecto: Cargo.toml

Contenido inicial de Cargo.toml

#codly(
  highlights : (
    (line:1, start:1, fill: rgb("#CBD4FF")),
    (line:2, start:1,fill: rgb("#CBD4FF"),tag:"Nombre del proyecto"),
    (line:3, start:1,fill: rgb("#CBD4FF"),tag:"Versión siguiendo"),
    (line:4, start:1,fill: rgb("#CBD4FF"),tag:"Edición estable de Rust 2021"),
    (line:6, start:1,fill: rgb("#FCCBFF"),tag:"crates"),
  ),
  annotations: (
    (
      start: 2, end : 4 ,
      content: block(
        width: 2em,
        rotate(-90deg, reflow: true, align(center)[Metadatos])
      )
    ),
    (
      start: 7, end : 9,
      content: block(
        width: 2em,
        rotate(-90deg, reflow: true, align(center)[Librerías externas])
      )
    ),
  ),
)
```toml
[package]
name = "hola_mundo"
version = "0.1.0"
edition = "2021"

[dependencies]
# Ejmplos
# rand = "0.8.5" Permite generar números aleatorios
# serde = "1.0.130" Permite serializar y deserializar datos
```

Punto de entrada: main.rs

#codly(
  highlights : (
    (line:1, start: 1 , end: 9 ,  fill: rgb("#CBD4FF"), tag: "A"),
    (line:2, start: 5 , end: 12 ,  fill: rgb("#C7FFFA"), tag: "B"),
    (line:1, start: 11 , end: 12 ,  fill: rgb("#FFD9CB"), tag: "C"),
    (line:3, start: 1 ,  fill: rgb("#FFD9CB"), tag: "C"),
  ),
)
```rust
fn main() {
    println!("Hola, Rust!");
}
```

+ A: Define la función principal del programa
+ B: Es una macro que imprime texto en la consola
+ C: Delimitan el bloque de código de la función


Compilar y Ejecutar

```bash
cargo run
```


#codly(
  highlights : (
    (line:1, start: 1 , fill: rgb("#CBD4FF"), tag: "A"),
    (line:2, start: 2 , fill: rgb("#C7FFFA"), tag: "B"),
    (line:3, start: 3 , fill: rgb("#FFD9CB"), tag: "C"),
    (line:4, start: 1 , fill: rgb("#FCCBFF"), tag: "D"),
  ),
)
```bash
Compiling hola_mundo v0.1.0 (/ruta/hola_mundo)
 Finished `dev` profile [unoptimized + debuginfo] target(s) in 3.42s
  Running `target/debug/hola_mundo`
Hola, Rust!
```

+ A: Cargo compila el proyecto (solo la primera vez o si hay cambios)
+ B: Perfil de compilación: dev (desarrollo, sin optimizaciones)
+ C: Ruta del ejecutable que se está ejecutando
+ D: Output de tu programa

Si no modificaste el código, la segunda ejecución será instantánea:
```bash
Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.01s
 Running `target/debug/hola_mundo`
Hola, Rust!
```

=== Variables con Rust

Let

#codly(
  highlights : (
    (line:2, start: 3,end:5, fill: rgb("#CBD4FF"), tag: "A"),
    (line:2, start: 7,end:10, fill: rgb("#FFD9CB"), tag: "B"),
    (line:2, start: 14,end:15, fill: rgb("#FCCBFF"), tag: "C"),
  ),
)
```rust
fn main() {
  let edad = 25;
  println!("Mi edad es {}", edad);
}
```

+ A: La palabra reservada #term[let] se usa para declarar variables inmutables
  por defecto

+ B: Nombre de la variable #term[edad]

+ C: Asignación de tipo de valor entero #term[25]

```yaml
Mi edad es 25
```

Que pasa si queremos modificar el valor de una variable inmutable?

#codly(
  highlights : (
    (line:3, start: 3,end:13, fill: rgb("#FCCBFF"), tag: "ERROR!!"),
  ),
)
```rust
fn main() {
  let edad = 25;
  edad = 26;
  println!("Mi edad es {}", edad);
}
```

Gracias a herramientas inteligentes como rust-analyzer y rustc, nuestros
editores de código pueden analizar información avanzada e interactiva a través del
Language Server Protocol (LSP). De esta manera, es posible visualizar errores,
comprender por qué el código es incorrecto e incluso recibir sugerencias automáticas
para corregirlo.

```bash
error[E0384]: No se puede asignar dos veces a la variable inmutable `edad`
 --> src/main.rs:3:3
3 |   edad = 26;
  |
help: consider making this binding mutable
  |
2 |   let mut edad = 25;
  |       +++
For more information about this error, try `rustc --explain E0384`.
```

+ El Código de Error: [E0384]

  Este es el identificador único y universal del problema.

  Con documentacion #term[https://doc.rust-lang.org/error_codes/error-index.html]
  exacta para el tipo de error y explicacion detallada de ese problema.


variables mutables

Si necesitas cambiar el valor de una variable, debes declararla
explícitamente como mutable usando #term[let mut].

#codly(
  highlights : (
    (line:2, start: 3,end:9, fill: rgb("#FCCBFF"), tag: "A"),
    (line:4, start: 3, fill: rgb("#C7FFFA")),
  ),
)
```rust
fn main() {
  let mut carro = "Toyota";
  println!("Mi carro es {}", carro);
  carro = "Honda";
  println!("Mi nuevo carro es {}", carro);
}
```

+ A: La palabra reservada #term[let mut] se usa para declarar variables mutables que
  cambian su valor a lo largo del programa.

Shadowing

El shadowing permite declarar una nueva variable con el mismo
nombre que una anterior.

La nueva variable "sombrea" a la anterior.

#codly(
  highlights : (
    (line:4, start: 3, fill: rgb("#FCCBFF"), tag: "A"),
  ),
)
```rust
fn main() {
  let mut edad = 25;
  println!("Mi edad es {}", edad);
  let edad = "Mi edad es 35";
  println!("{}", edad);
}
```

- A:

  - Rust permite declarar una nueva variable con el mismo nombre que una anterior.

  - La nueva variable "sombrea" a la anterior.

  - Shadowing permite cambiar el tipo de una variable.

```yaml
Mi edad es 25
Mi edad es 35
```

Lo que no se puede hacer es cambiar el tipo de una variable sin "sombrear".

#codly(
  highlights : (
    (line:2, start: 1, fill: rgb("#FCCBFF"), tag: "ERROR!"),
  ),
)
```rust
let mut texto = "Hola";
texto = 5;
```

Scopes

El scope determina dónde una variable es válida en tu código.
En Rust, el scope está definido por llaves { }.


#codly(
  highlights : (
    (line:9, start: 3, fill: rgb("#C7FFFA"), tag: "A"),
    (line:10, start: 3, fill: rgb("#FCCBFF"), tag: "ERROR!"),
  ),
)
```rust
fn main() {
  let x = 5;
  println!("Valor de x: {x}");
  {
    let x = x * 2;
    let y = x;
    println!("Dentro del scope x: {x}");
    println!("Dentro del scope y: {y}");
  }
  //println!("Valor de y: {y}");
  println!("Valor de x: {x}");
}
```
- A:

  - La variable #term[x] y #term[y] son válidas dentro del scope en el que fueron declaradas.

  - Terminado el scope, las variables #term[x] y #term[y] son liberadas.

  - Ya no se pueden usar fuera del scope en el que fueron declaradas.

Nota: Puedes crear scopes anidados.

```yaml
Valor de x: 5
Dentro del scope x: 10
Dentro del scope y: 10
Valor de x: 5
```

Constantes

Las constantes son valores globales que nunca cambian y deben tener un tipo explícito.
No tienen una dirección de memoria fija. Se utiliza para valores que
son absolutamente fijos y
conocidos de antemano, como constantes matemáticas, límites, o configuraciones fijas.

#codly(
  highlights : (
    (line:1, start: 1,end:8, fill: rgb("#C7FFFA"), tag: "A"),
    (line:1, start: 9,end:13, fill: rgb("#CBD4FF"), tag: "B"),
    (line:4, start: 1, fill: rgb("#C7FFFA"), tag: "C"),
    (line:6, start: 1, fill: rgb("#FCCBFF"), tag: "D"),
  ),
)
```rust
const PI: f64 = 3.14159265359;

fn main() {
  const PI: f64 = 5.14;
  println!("Valor de PI: {}", PI);
  //PI = 3.12;
}
```

+ A:

  Las constantes siempre usan #term[SCREAMING_SNAKE_CASE].

+ B:

  El tipo debe ser explícito #term[:f64] en este caso flotante.

+ C:

  Rust permiten sombrear constantes con el mismo nombre.

+ D:

  Rust no permite mutar constantes.

```yaml
Valor de PI: 5.14
```

Valores estaticos

Las variables estáticas tienen una ubicación fija en memoria y viven
durante toda la ejecución del programa.
Se inicializan al inicio de la ejecución del programa (cuando el programa se carga,
antes de que se ejecute la función main).
#codly(
  highlights : (
    (line:1, start: 1,end:24, fill: rgb("#C7FFFA"), tag: "A"),
    (line:4, start: 3, fill: rgb("#FCCBFF"), tag: "B"),
    (line:5, start: 3, fill: rgb("#FCCBFF"), tag: "C"),
  ),
)
```rust
static PROTOCOLO_VERSION: u8 = 2;

fn main() {
  // let PROTOCOLO_VERSION:u8 = 3;
  // PROTOCOLO_VERSION: u8 = 8;
  println!("Protocolo v{}", PROTOCOLO_VERSION);
}
```

+ A:

  Declaramos un valor estatico con #term[static]

+ B

  No podemos sombrear un valor estatico con el mismo nombre.

+ C

  No podemos mutar un valor estatico.

```yaml
Protocolo v2
```

Statements & Expressions

Una sentencia es una instrucción que realiza una acción y no devuelve un valor. En Rust, la mayoría de las sentencias terminan con un punto y coma (;).

