#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#codly(
  languages: (
    rust: (name: "Rust", icon: "🦀", color: rgb("#FFD8C9")),
    bash: (name: "Terminal", icon: "🐧", color: rgb("#E2E2E2")),
    yaml: (name: "Output", icon: "📝", color: rgb("#D6FFCB")),
    toml: (name: "toml", icon: "⚙️", color: rgb("#C7FFFA")),
    py: (name: "Python", icon: "🐍", color: rgb("#C7FFFA")),
    js: (name: "JavaScript", icon: "🌐", color: rgb("#C7FFFA")),
  ),
  number-format: none,
  zebra-fill: none,
  stroke: none,
  fill: rgb("#FBFAFB"),  // 👈 Color de fondo general
)

= Tipos de datos

En Rust, un tipo de dato define la naturaleza de la información que una variable puede almacenar y
las operaciones que se pueden realizar sobre dicha información. El sistema de tipos de Rust es estático
y fuertemente tipado, lo que significa que el compilador conoce el tipo de cada valor en tiempo de compilación y
no permite operaciones entre tipos incompatibles sin una conversión explícita.

Por ejemplo, una variable declarada como #raw("i32",lang:"rust") solo puede almacenar números enteros de 32 bits con signo, y
no puede ser utilizada directamente como una cadena de texto o un número de punto flotante:

```rust
let numero: i32 = 10;
// let texto: String = numero; // Error: tipos incompatibles
```
Importancia del sistema de tipos en Rust

El sistema de tipos de Rust es el eje central que sustenta la seguridad, el rendimiento y la confiabilidad del
lenguaje. Gracias a verificaciones exhaustivas en tiempo de compilación, Rust previene errores comunes como
incompatibilidades de tipos, accesos inválidos a memoria y condiciones de carrera, evitando fallos en tiempo de ejecución.
Este sistema se integra con los conceptos de ownership, borrowing y lifetimes para garantizar seguridad de memoria sin
necesidad de recolector de basura. Además, el conocimiento completo de los tipos permite al compilador generar código
altamente optimizado, logrando un rendimiento comparable a C y C++. Finalmente, los tipos aportan claridad y mantenibilidad
al código, funcionando como documentación implícita y facilitando la evolución de proyectos complejos.

Tipos de Datos en Rust: Escalares y Compuestos

En el ecosistema de Rust, todo valor pertenece a un tipo de dato específico.
Estos se dividen en dos grandes categorías según cómo organizan la información en la memoria: tipos escalares
y tipos compuestos.

- Scalar Types

  Representan un único valor. En Rust, los principales tipos escalares son los enteros,
  los números de punto flotante, el tipo booleano y el tipo carácter. Estos tipos son fundamentales y
  suelen almacenarse directamente en el stack, lo que permite un acceso rápido y eficiente.

- Compound Types

  Los tipos compuestos pueden agrupar múltiples valores en un solo tipo. Son estructuras que
  permiten organizar datos relacionados bajo una misma identidad.

== Scalar Types

#include "sections/integer_type.typ"
#include "sections/floating_type.typ"
#include "sections/boolean_type.typ"
#include "sections/char.typ"

== Compound Types

#include "sections/tuple.typ"
#include "sections/array.typ"
#include "sections/vector.typ"
#include "sections/string.typ"
