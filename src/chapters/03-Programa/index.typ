#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#codly(
  languages: (
    rust: (name: "Rust", icon: "🦀", color: rgb("#ffffff").lighten(100%)),
  ),
  number-format: none,
  zebra-fill: none
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
  #codly-disable()
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
  languages: (
    rust: (name: "Rust", icon: "🦀", color: rgb("#ffffff").lighten(100%)),
  ),
  number-format: none,
  zebra-fill: none
)
```bash
# Crear un proyecto binario (aplicación)
cargo new hola_mundo

# Entrar al directorio
cd hola_mundo
```
