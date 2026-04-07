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
  display-icon: false,
  zebra-fill: none,
  stroke: none,
  fill: rgb("#FBFAFB"), // 👈 Color de fondo general
)

= Tipos de datos

Los tipos de datos son uno de los pilares fundamentales de cualquier lenguaje de programación,
y Rust no es la excepción. En esencia, un tipo de dato define qué clase de información puede
almacenar una variable o una expresión, así como las operaciones que se pueden realizar sobre ella.

Rust, al ser un lenguaje con tipado estático, requiere que el compilador conozca el tipo de cada valor
en tiempo de compilación. Esto significa que los tipos se verifican antes de que el programa se ejecute,
lo que permite detectar muchos errores potenciales de manera temprana.

¿Por qué son tan importantes los tipos en Rust?

La respuesta radica en sus principios del lenguaje mismo.

- Seguridad de memoria y de tipos: Rust utiliza su sistema de tipos para prevenir clases enteras
  de errores comunes en otros lenguajes, como el acceso a memoria no inicializada, desbordamientos de
  búfer o el uso incorrecto de valores nulos. Gracias al tipo estricto, el compilador puede garantizar
  que tu código no realice operaciones inválidas sin necesidad de un recolector de basura o de verificaciones
  en tiempo de ejecución costosas.

- Rendimiento: Al conocer los tipos en tiempo de compilación, Rust puede optimizar el código generado de forma
  muy eficiente. Cada tipo tiene un tamaño y un alineamiento conocidos, lo que permite al compilador generar
  código máquina cercano al que escribirías en C o C++, pero con muchas más garantías de seguridad.

- Legibilidad y mantenibilidad: Al declarar explícitamente los tipos,
  el código estara mejor documentado y entender rápidamente
  qué tipo de datos se está manipulando y qué comportamiento se espera.

En Rust, los tipos se dividen en categorías:

- Tipos escalares "scalar types", en esta categoria representa un único valor.
- Tipos compuestos "compound types", pueden agrupar múltiples valores en una sola estructura.


== Scalar Types

Los tipos escalares en Rust representan un único valor básico. Son los bloques de construcción
más simples del lenguaje y cubren los datos más comunes como los números enteros, números de punto flotante,
valores booleanos y caracteres.

Rust es estricto con los tipos escalares, ya que cada uno tiene un tamaño definido por defecto, pero también te
permite elegir variantes con tamaños explícitos según las necesidades.

#include "sections/scalar_type/integer.typ"
#include "sections/scalar_type/floating.typ"
#include "sections/scalar_type/boolean.typ"
#include "sections/scalar_type/char.typ"

== Compound Types

En Rust, los tipos compuestos son aquellos que combinan varios valores en una sola unidad de datos.

A diferencia de los tipos escalares, los compuestos pueden agrupar o contener múltiples valores de uno o varios tipos.

Rust tiene dos tipos compuestos principales:

- Tuplas "tuple"

- Arreglos "array"

#include "sections/compound_type/tuple.typ"
#include "sections/compound_type/array.typ"

== Collections

A diferencia de los tipos de datos escalares y compuestos, cuyos
tamaños son conocidos en tiempo de compilación y que se almacenan generalmente en el stack, las colecciones
de Rust están diseñadas para manejar datos de tamaño dinámico y utilizan memoria asignada en el heap.

Una colección es una estructura de datos capaz de almacenar múltiples valores, pero, a diferencia de los
arrays o las tuplas, su contenido puede crecer o reducirse dinámicamente durante la ejecución del programa.
Esto permite trabajar con cantidades de datos que no se conocen de antemano, como entradas de usuario,
resultados de cálculos, datos provenientes de archivos o redes.


#include "sections/collections/vec.rs"
#include "sections/collections/string.rs"
#include "sections/collections/hashmap.rs"


// #include "sections/vector.typ"
// #include "sections/string.typ"


= Control flow
