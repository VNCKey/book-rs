#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

Fases del Proceso

+ Paso 1: Creación del Módulo Fuente

  Todo comienza con el código fuente, que tradicionalmente lleva la extensión `.rs`.
  #codly(
    highlights : (
      (line:1, start: 1,end: 2,fill: rgb("#D6FFCB"), tag: "A"),
      (line:1, start: 4,end: 7,fill: rgb("#C7FFFA"), tag: "B"),
    ),
  )
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

[dev-dependencies]
# Dependencias solo para desarrollo/testing

[build-dependencies]
# Dependencias para scripts de build
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

+ A: La palabra reservada let se usa para declarar variables inmutables
  por defecto

+ B: Nombre de la variable edad

+ C: Asignación de tipo de valor entero 25

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

  Con documentacion https://doc.rust-lang.org/error_codes/error-index.html
  exacta para el tipo de error y explicacion detallada de ese problema.


variables mutables

Si necesitas cambiar el valor de una variable, debes declararla
explícitamente como mutable usando let mut.

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

+ A: La palabra reservada let mut se usa para declarar variables mutables que
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

  - La variable x y y son válidas dentro del scope en el que fueron declaradas.

  - Terminado el scope, las variables x y y son liberadas.

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

  Las constantes siempre usan SCREAMING_SNAKE_CASE.

+ B:

  El tipo debe ser explícito :f64 en este caso flotante.

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

  Declaramos un valor estatico con static

+ B

  No podemos sombrear un valor estatico con el mismo nombre.

+ C

  No podemos mutar un valor estatico.

```yaml
Protocolo v2
```

Statements & Expressions

Una sentencia es una instrucción que realiza una acción y no devuelve un valor.
En Rust, la mayoría de las sentencias terminan con un punto y coma ;.

Una expresión es cualquier pieza de código que se evalúa y devuelve un valor.

#codly(
  highlights : (
    (line:2, start: 3, fill: rgb("#C7FFFA"), tag: "A"),
    (line:5, start: 3, fill: rgb("#C7FFFA"), tag: "A"),
    (line:3, start: 5, fill: rgb("#FCCBFF"), tag: "B"),
    (line:4, start: 5, fill: rgb("#FFD9CB"), tag: "D"),
    (line:7, start: 3, fill: rgb("#C7FFFA"), tag: "A"),
  ),
)
```rust
fn main() {
  let y = {
    let z = 3;
    z + 1
  };

  println!("y = {}", y);
}
```

+ A:

  - Tenemos la primera Sentencia (statement) #raw("let y = { ... };", lang: "rust"),
    una unidad de ejecución que no produce un valor que pueda ser
    utilizado por otra parte del código.

  - Expresión Asignada: #raw("{ ... }", lang: "rust") La expresión de bloque se
    evalúa y devuelve un valor

+ B:

  - Tenemos la segunda Sentencia (statement)
    La sentencia let realiza la acción de vincular un valor a un nombre y nunca
    devuelve un valor, Rust evita side-effect oculto.

    #raw("let y = (let x = 5); ERROR!!!!",lang:"rust")

    Ejemplos:

    Javascript```js
    let x = 1;
    let y = (x = 2, x++);   // y = 2; x = 3
    console.log(y, x);      // 2 3 = side-effect dentro de la expresión

    if (count = 0) { }   // 0 es falsy = nunca entra, pero *asigna*
    ```

    Python```py
    b = 5
    a = (b := 1) + (b := 2)   # a = 2
    print("Valor de a es: ",a) #Valor de a es: 3
    print("Valor de b es: ",b) #Valor de b es: 2
    ```

  - Rust prohíbe que let devuelva valor y así evita bugs
    clásicos como #raw("if (x = 5)",lang:"rust").

  - #raw("println!",lang:"rust") devuelve unit type (),
    y la llamada como declaración.

  - Rust prohíbe que let sea una expresión para eliminar una
    clase entera de errores que sí existen en lenguajes donde
    la asignación devuelve valor.

  - La regla de oro en Rust es que la mayoría de las sentencias
    terminan con un ; .

+ C:

  - Tenemos la primera Expresión (Expression)
    Cuando omites el punto y coma en la última línea de un bloque, le
    estás diciendo al compilador:

    "Quiero que el valor resultante de esta operación sea el valor de retorno de todo el bloque."

+ D:

  Por ultimo, tenemos un Statement

  Aunque la llamada a la macro println! es técnicamente una expresión
  (ya que se evalúa), su valor de retorno es el tipo unitario () (pronunciado "unit").
```yaml
y = 4
```
En caso de poner ; al final se convierte en una sentencia
(statement) y devuleve un unit type ().
#codly(
  highlights : (
    (line:4, start: 5, fill: rgb("#D6FFCB"), tag: "A"),
  ),
)
```rust
fn main() {
  let y = {
    let z = 3;
    z + 1;
  };
  println!("y = {:?}", y);
}
```

+ A:

  Devuelve unit type ()```yaml
  y = ()
  ```

== Sistema de Memoria

La seguridad de memoria de Rust garantiza que un programa nunca acceda a memoria
inválida ni cometa errores peligrosos al manejar recursos. En lenguajes como C y C++,
esta responsabilidad recae por completo en el programador, lo que abre la puerta a
introducir accidentalmente vulnerabilidades como desbordamientos de búfer,
use-after-free, double free o data races.

Rust elimina estos problemas desde su diseño.

Todo esto sin la necesidad de un garbage collector y sin costo adicional en tiempo
de ejecución. Este enfoque permite escribir software seguro y eficiente.

Los primeros conceptos pilares es comprender como se administra la memoria. Rust
divide la memoria en dos grandes regiones Stack y Heap, su diferencia es
esencial para evitar errores como:

- use-after-free
- double free
- dangling pointers
- data races

Stack

El Stack es una región de la memoria RAM para almacenar datos cuya vida
útil y tamaño son conocidos en tiempo de compilación.


```rust
fn main() {
    let numero: u8 = 5;
    let numero2 = numero;
}
```

#include "../../utils/stack.typ"


Heap

El Heap es una región de la memoria RAM para almacenar datos cuya vida útil
y tamaño son conocidos en tiempo de ejecución.



#codly(
  highlights : (
    (line:2, start: 12, end: 19, fill: rgb("#C7FFFA"), tag: "A"),
    (line:2, start: 23, fill: rgb("#CBD4FF"), tag: "B"),
    (line:3, start: 3, fill: rgb("#FFD9CB"), tag: "C"),
    (line:6, start: 3, fill: rgb("#FCCBFF"), tag: "D"),
  ),
)
```rust
fn main() {
  let texto: String = String::from("Rûst");
  let texto2: String = texto;

  println!("{texto2}");
  //println!("{texto1}");
}
```

+ A:

  - String es un tipo de dato que se almacena en el Heap y su tamaño es
    desconocido en tiempo de compilación.

  - Se usa para representar texto dinámico, cuya longitud o
    contenido puede cambiar en tiempo de ejecución.


+ B:

  - Sirve para construir una String a partir de un &str por ejemplo un "Hola"
    u otros tipos convertibles, como otro mismo String.

  - Es equivalente a .to_string() en muchos casos, pero se prefiere String::from()
    por ser más explícito y genérico.

+ C:

  - texto tiene un comportamiento llamado Move cuando texto2 la consume.

  - Después de la asignación, texto ya no es válido, puesto que el compilador no te
    dejará usarlo, move semantics.

  - Primera regla de Ownership solo puede haber un único propietario y es por esta razon
    que Rust no permite que dos variables apunten al mismo dato en el Heap.

  - texto2 es ahora el propietario del String "Rûst"

  - println!("{texto}");

+ D:

  - El uso de la variable texto es invalido, ya que fue movida a texto2.


  #import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

  #let rust-orange = rgb("#ff6b35")
  #let stack-blue = rgb("#4a90e2")
  #let heap-green = rgb("#27ae60")

  #let stack-box(pos, var-name, ptr, len, cap, valid: true) = {
    let fill-color = if valid { stack-blue.lighten(90%) } else { gray.lighten(80%) }
    let text-color = if valid { black } else { gray }

    node(
      pos,
      align(left)[
        #text(size: 9pt, weight: "bold", fill: if valid { rust-orange } else { gray })[#var-name]
        #if not valid { text(size: 7pt, fill: red)[ ✗] } \
        #line(length: 100%, stroke: 0.5pt + gray) \
        #text(size: 7pt, fill: text-color)[ptr: #text(font: "monospace", fill: stack-blue)[#ptr]] \
        #text(size: 7pt, fill: text-color)[len: #text(font: "monospace")[#len]] \
        #text(size: 7pt, fill: text-color)[cap: #text(font: "monospace")[#cap]]
      ],
      width: 35mm,
      fill: fill-color,
      stroke: 2pt + if valid { stack-blue } else { gray },
      corner-radius: 5pt,
      inset: 8pt,
    )
  }

  #let heap-box(pos, content, bytes, addr) = node(
    pos,
    align(left)[
      #text(size: 8pt, weight: "bold", fill: heap-green)[Datos en Heap] \
      #line(length: 100%, stroke: 0.5pt + gray) \
      #text(size: 7.5pt, font: "monospace")[#content] \
      #text(size: 6.5pt, fill: gray)[bytes: #bytes] \
      #text(size: 6.5pt, fill: gray)[addr: #text(font: "monospace")[#addr]]
    ],
    width: 38mm,
    fill: heap-green.lighten(90%),
    stroke: 2pt + heap-green,
    corner-radius: 5pt,
    inset: 8pt,
  )

  #figure(
    kind: "diagram",
    supplement: [Diagrama],
    caption: [Move semántico: el ownership se transfiere de `texto` a `texto2`],

    diagram(
      spacing: (15mm, 10mm),
      edge-stroke: 1.5pt,
      edge-corner-radius: 5pt,
      mark-scale: 80%,

      // Stack label
      node((0.5, -0.5), text(size: 10pt, weight: "bold", fill: stack-blue)[STACK]),

      // texto (inválido después del move)
      stack-box((0, 0), [texto], [0x582...3d00], [5], [5], valid: false),

      // Flecha de move
      edge((0, 0), (1, 0), "-|>",
        label: text(size: 8pt, fill: rust-orange, weight: "bold")[Move 📦],
        stroke: rust-orange + 2pt
      ),

      // texto2 (nuevo owner)
      stack-box((1, 0), [texto2], [0x582...3d00], [5], [5], valid: true),

      // Flecha al heap
      edge((1, 0), (1, 1), "-|>",
        label: text(size: 7pt)[ptr],
        stroke: heap-green + 1.5pt
      ),

      // Heap label
      node((1, 0.5),
        place(dx: 45mm)[
          #text(size: 10pt, weight: "bold", fill: heap-green)[HEAP]
        ]
      ),

      // Datos en heap
      heap-box((1, 1), [`[R,û,s,t]`], [[82,195,187,115,116]], [0x582...3d00]),

      // Nota explicativa
      node((0, 0.8),
        text(size: 7pt, fill: red, style: "italic")[
          ✗ texto inválido \
          (ownership movido)
        ]
      ),
    )
  ) <diag-string-move>


  // Falta agregar mas detalles
