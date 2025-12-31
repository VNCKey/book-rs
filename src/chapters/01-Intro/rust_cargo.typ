#import "@preview/codly:1.3.0": *

== Compilador y Gestor de Proyectos

Un lenguaje de programación moderno no se define únicamente por su sintaxis, sino también por las
herramientas que lo rodean. En Rust, el compilador y su gestor de proyectos forman parte esencial
del ecosistema y están diseñados para trabajar de manera integrada. Comprender su función desde el
inicio permite entender por qué Rust ofrece una experiencia de desarrollo
distinta a la de muchos otros lenguajes.

El compilador de Rust

En muchos lenguajes, el compilador se limita a traducir el código fuente a un programa ejecutable y
a señalar errores básicos de sintaxis. En Rust, en cambio, el compilador asume un papel mucho
más activo, ya que su propósito es ayudar al programador a escribir código correcto, seguro y eficiente.

Además de verificar el código, el compilador de Rust transforma los archivos fuente con extensión `.rs`
en ejecutables nativos o en bibliotecas reutilizables, según el tipo de proyecto.
Este proceso puede aplicarse tanto a proyectos completos como a archivos simples,
lo que permite compilar desde pequeños programas de prueba hasta aplicaciones y
bibliotecas de gran escala.

Para ello, el compilador analiza no solo la estructura del programa, sino también el uso de la memoria,
los tiempos de vida de los datos y el acceso concurrente a los recursos. Gracias a este enfoque, Rust puede
detectar en tiempo de compilación errores que en otros lenguajes suelen aparecer únicamente en ejecución o en producción.

Aunque esta rigurosidad puede resultar exigente al inicio, cumple una función pedagógica fundamental y es
enseñar a pensar correctamente sobre la memoria y la seguridad desde el primer día. A esto se suma la calidad
de los mensajes de error del compilador, que no solo indican qué está mal, sino que explican por
qué ocurre el problema y cómo corregirlo, convirtiéndose en una herramienta de aprendizaje continuo.

Proceso de Compilación

#include "../../utils/diagrama_rustc.typ"

Todo comienza con el código fuente `main.rs`:

#codly(
  highlights : (
    (line:1, start: 1,end: 2,fill: rgb("#D6FFCB"),),
    (line:1, start: 4,end: 9,fill: rgb("#C7FFFA")),
  ),
)
```rust
fn main() {
    println!("Compilador directo rustc"); //Archivo: main.rs
}
```



- `fn`: Define la función principal y obligatoria de un programa ejecutable en Rust.

- `main()`: Es un nombre reservado y especial que el compilador de Rust y el sistema operativo
  buscan para saber dónde empezar a ejecutar el código.

Podemos compilarlo:

```bash
rustc main.rs
```

Esto genera un ejecutable:
- Linux/macOS: `main`
- Windows: `main.exe`

Ejecuta:

```bash
./main           # Linux/macOS
main.exe         # Windows
```

Resultado:
```yaml
Hola desde Rust!
```

Gestor de Proyectos Cargo

Junto al compilador, Rust incorpora de forma nativa Cargo, su gestor de proyectos y paquetes.
Cargo se encarga de tareas fundamentales como la creación de proyectos, la compilación del código,
la gestión de dependencias, la ejecución de pruebas y la generación de documentación, todo bajo una
estructura clara y coherente.

Para quienes se inician en la programación, Cargo elimina gran parte de la complejidad asociada a
la configuración del entorno y al manejo manual de librerías. Para los usuarios avanzados,
ofrece control preciso de versiones, reproducibilidad y una integración fluida con el ecosistema
de bibliotecas de Rust, disponibles a través del repositorio central crates.io.
