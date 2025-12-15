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
)



#import "../../config.typ": term

== Compilación y Ejecución en Rust

La ejecución de código en Rust puede realizarse mediante dos vías fundamentales:
- Compilador directo, rustc, para tareas sencillas.
- Cargo la herramienta estándar de gestión de proyectos, indispensable para el desarrollo moderno.

=== Usando #term[rustc]

Para comprender la esencia del proceso de compilación, es crucial familiarizarse
con rustc, el compilador de Rust. Este método es ideal para archivos individuales o
para entender cómo el código fuente se traduce en un ejecutable binario.

Fases del Proceso #term[rustc]

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

```rust
fn main() {
    println!("Hola, Rust!");
}
```