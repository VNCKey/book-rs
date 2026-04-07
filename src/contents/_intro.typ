#import "/src/config/global.typ": *


= Introducción: Cuando el ascensor se detuvo

#columns(2)[
  #align(center)[
    #text(16pt)[*Historia*]
  ]

  En 2006, Graydon Hoare subía en el ascensor de su apartamento cuando el sistema se detuvo debido a un error de software.
  Esa frustrante experiencia lo motivó a crear un lenguaje que resolviera ese tipo de problemas, llamándolo Rust en honor al grupo de
  hongos del mismo nombre, organismos que sobreviven en condiciones extremas gracias a su diseño inteligente.

  *El problema que Hoare identificó no era nuevo, pero su solución sí lo sería.*

  _¿Y si fuera posible unificar la velocidad y el control del lenguaje C con la seguridad y la sintaxis limpia de Python?_.

  Durante décadas,
  esa disyuntiva pareció insalvable. Rust demostró lo contrario.

  #align(center)[
    #text(16pt)[*¿Qué es Rust?*]
  ]

  Rust es un lenguaje de programación de sistemas que permite crear todo tipo de aplicaciones. Integra las abstracciones modernas y la
  sintaxis expresiva propias de un lenguaje de alto nivel, lo que garantiza una excelente productividad con un control fino sobre el
  hardware que asegura la seguridad en memoria, el rendimiento y la eficiencia.

  Esta convergencia da lugar a un nuevo paradigma de lenguaje, concebido para construir software confiable y eficiente, capaz de manejar
  concurrencia segura sin temor a errores catastróficos.

  \
  \
  \
  #align(center)[
    #text(16pt)[*¿Qué lo hace diferente?*]
  ]

  A diferencia de lenguajes de alto nivel como Java o Python —que incorporan un recolector de basura que introduce pausas e imprevisibilidad,
  Rust opera sin él. Y a diferencia de lenguajes de bajo nivel como C o C++ donde la gestión manual de memoria es poderosa pero propensa a
  errores catastróficos, Rust ofrece un enfoque revolucionario: reglas y conceptos verificados en tiempo de compilación que garantizan seguridad
  sin sacrificar rendimiento.

  Gracias a su compilador estricto, Rust previene problemas como punteros nulos, fugas de memoria, accesos indebidos y en especial data races en
  entornos concurrentes. El resultado es un lenguaje tan cercano al hardware como C, pero con comodidades modernas y la tranquilidad de que gran
  parte de los errores más difíciles de depurar simplemente no pueden ocurrir.

  #align(center)[
    #text(16pt)[*¿Para qué sirve?*]
  ]

  Con Rust es posible desarrollar una amplia variedad de aplicaciones: desde programas de consola, servidores web, software embebido e IoT, hasta
  aplicaciones de escritorio, herramientas CLI, videojuegos, e incluso sistemas operativos y controladores.


]

#set page(columns: 1)
#text(16pt)[*Adopción en la industria*]

En 2024, Rust fue nombrado el "lenguaje más querido" por octavo año consecutivo en la encuesta de Stack Overflow. Pero más allá de la popularidad,
su adopción responde a hechos concretos: Amazon, Google, Microsoft y Meta lo utilizan en producción para componentes donde la seguridad y el
rendimiento son innegociables.

Ejemplos de empresas que usan Rust:

#grid(
  columns: 1,
  gutter: 12pt,
  align: horizon,

  // Columna 1
  block(
    inset: 8pt,
    radius: 2pt,
    stroke: rgb("#ff836e"),
    breakable: false,
    width: 100%,
  )[

    #grid(
      columns: 2,
      gutter: 10pt,
      block()[
        #text(size: 14pt, fill: rgb("#fc0048"))[Cloudflare]

        Reemplazó su proxy NGINX por Pingora, un marco de trabajo propio escrito en Rust. El resultado fue una reducción del 70% en el uso de CPU y del 67% en el uso de memoria para el mismo volumen de tráfico.
      ],
      block()[
        #image("../assets/Cloudflare.svg", width: 50pt)
      ],
    )

  ],

  // Columna 2
  block(
    inset: 8pt,
    radius: 2pt,
    stroke: rgb("#ff836e"),
    breakable: false,
    width: 100%,
  )[

    #grid(
      columns: 2,
      gutter: 10pt,
      block()[
        #text(size: 14pt, fill: rgb("#fc0048"))[Microsoft]

        Está adoptando Rust para componentes del kernel de Windows 11. Su CTO señaló que el código en Rust es "más fácil de mantener, más fiable y más sencillo de evolucionar" en comparación con C++.
      ],
      block()[
        #image("../assets/microsoft.svg", width: 50pt)
      ],
    )
    #sub_titulo[]


  ],

  block(
    inset: 8pt,
    radius: 2pt,
    stroke: rgb("#ff836e"),
    breakable: false,
    width: 100%,
  )[

    #grid(
      columns: 2,
      gutter: 10pt,
      block()[
        #text(size: 14pt, fill: rgb("#fc0048"))[Google]

        Dentro de Android, la adopción de Rust ha logrado una reducción del 68% en las vulnerabilidades de seguridad de memoria, y hasta la fecha no se ha reportado ni una sola en su nuevo código de Rust.
      ],
      block()[
        #image("../assets/Google.svg", width: 50pt)
      ],
    )

  ],

  block(
    inset: 8pt,
    radius: 2pt,
    stroke: rgb("#ff836e"),
    breakable: false,
    width: 100%,
  )[

    #grid(
      columns: 2,
      gutter: 10pt,
      block()[
        #text(size: 14pt, fill: rgb("#fc0048"))[AWS]

        Utiliza Firecracker, un entorno de virtualización ligero escrito en Rust, para ejecutar trillones de funciones Lambda al mes. Su código base es de solo ~50k líneas, frente a las >1.4M de líneas.
      ],
      block()[
        #image("../assets/AWS.svg", width: 50pt)
      ],
    )
  ],
)

Si esta introducción ha despertado tu interés, te invito a dar el siguiente paso. Nuestro cimiento
será instalar Rust: un proceso sencillo de un par de minutos que nos dejará con todas las
herramientas listas para escribir código que no falla en silencio.

== Instalaciónas

La forma oficial y recomendada de instalar Rust es a través de #link("https://rustup.rs")[*rustup*],
una herramienta que gestiona versiones del compilador y del ecosistema de herramientas asociadas.
A diferencia de instalaciones manuales, #raw("rustup", lang: "bash") permite actualizar, cambiar
de versión y desinstalar Rust con un solo comando.

=== Linux y macOS

+ Abre una terminal y ejecuta el siguiente comando para descargar e iniciar el instalador:
```bash
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

El flag `--tlsv1.2` garantiza que la descarga se realice sobre una conexión segura.

+ El instalador presentará tres opciones. Selecciona la opción `1` para proceder con la
  instalación estándar, que incluye todo lo necesario para comenzar:
```text
  1) Proceed with standard installation (default - just press enter)
  2) Customize installation
  3) Cancel installation
  >1
```

+ Al finalizar, el instalador mostrará el mensaje: _"Rust is installed now. Great!"_

+ Para que la terminal reconozca los nuevos comandos, recarga las variables de entorno
  sin necesidad de cerrarla:
```bash
  source $HOME/.cargo/env
```

Alternativamente, cierra y vuelve a abrir la terminal.

=== Windows

En Windows, Rust requiere las herramientas de compilación de C++ de Microsoft, ya que el
compilador las utiliza internamente para generar ejecutables nativos.

+ Descarga e instala *Visual Studio Build Tools* desde:
  #link("https://visualstudio.microsoft.com/es/downloads/")[visualstudio.microsoft.com]

+ Durante la instalación, selecciona el componente *"Desktop Development with C++"*.
  Si prefieres una instalación minimalista, ve a la pestaña _"Componentes individuales"_
  y selecciona únicamente:

  - MSVC v143 — VS 2022 C++ x64/x86 build tools
  - Windows 11 SDK (10.0.22621.0)

+ Una vez instaladas las herramientas, descarga y ejecuta el instalador oficial de Rust
  desde #link("https://rustup.rs")[rustup.rs]. Sigue el mismo proceso que en Linux y macOS.

+ Al finalizar, cierra y vuelve a abrir la terminal para que Windows reconozca los comandos
  #raw("rustc", lang: "bash"), #raw("cargo", lang: "bash") y #raw("rustup", lang: "bash").

=== Verificación

Independientemente del sistema operativo, ejecuta los siguientes comandos para confirmar
que la instalación fue exitosa:
```bash
rustc --version
cargo --version
```

Una salida similar a la siguiente indica que todo está en orden:
```text
rustc 1.87.0 (17067e9ac 2025-05-09)
cargo 1.87.0 (0aad5d9a4 2025-05-09)
```

#importante[
  Si alguno de los comandos no es reconocido, asegúrate de haber reiniciado la terminal
  después de la instalación. En casos excepcionales, puede ser necesario agregar manualmente
  `$HOME/.cargo/bin` a la variable de entorno `PATH`.
]

#text(14pt, [Cargo])

Es el administrador de compilación y dependencias, además de la herramienta de propósito general de Rust. Se utiliza para crear nuevos proyectos, compilar, ejecutar y administrar bibliotecas externas "dependencias".

```bash
cargo new mi_proyecto
```

#text(14pt, [Rustc]) es el compilador de Rust convierte tu código fuente en Rust a código máquina ejecutable.
Aunque normalmente lo usamos a través de Cargo, rustc resulta útil para compilar archivos individuales o hacer pruebas rápidas sin crear un proyecto completo.
```bash
rustc mi_archivo.rs
```
#text(14pt, [Rustdoc]) es la herramienta de documentación de Rust. Si escribes comentarios de documentación con `///`, rustdoc puede generar automáticamente páginas HTML bien formateadas.
```bash
cargo doc --open
```

#text(14pt, [Rustup]) es el gestor del entorno Rust que permite actualizar, cambiar entre diferentes versiones del compilador "stable, beta o nightly" y administrar toolchains.

Rust se actualiza con facilidad gracias a *rustup*.

```bash
rustup update
```




#figure(
  table(
    columns: 2,
    align: (left + horizon, center),
    [Herramienta], [Uso Rápido],
    [cargo], [cargo new / build / run],
    [rustc], [rustc archivo.rs],
    [rustdoc], [cargo doc],
    [rustup], [rustup update],
  ),
  caption: [Resumen de comandos esenciales. ¡Practícalos en tu terminal!],
)

== Hola Mundo

Rust se integra con Cargo, su herramienta oficial para gestionar proyectos, dependencias y compilaciones.

Gracias a Cargo, crear, construir y ejecutar programas se vuelve mucho más sencillo y organizado.

*Creando nuestro primer proyecto*

En la terminal ejecuta:

```bash
cargo new mundorust
```

```bash
cd mundorust
```


El comando #raw("cargo new mundorust", lang: "yaml") crea un nuevo proyecto desde cero con la estructura básica lista para programar.

```bash
mundorust/
├── Cargo.toml      # Archivo de configuración del proyecto
└── src/
    └── main.rs     # Archivo principal; contiene la función main()
```

*Contenido de Cargo.toml*

```bash
[package]
name = "mundorust"
version = "0.1.0"
edition = "2021"  # Edición estable actual 2021

[dependencies]
rand = "0.8"  # Ejemplo: Librería para números aleatorios
```
- #raw("[package]", lang: "toml"):

  Contiene los metadatos del proyecto como nombre, versión, autor y edición de Rust.

- #raw("[dependencies]", lang: "toml"):

  Lista las bibliotecas externas llamadas crates y Cargo las gestiona automáticamente.


*El punto de entrada* #raw("main.rs", lang: "toml")

El archivo #raw("src/main.rs", lang: "bash") contiene:

+ #raw("fn main()", lang: "rust")

  - Define la función principal del programa.

+ #raw("{ ... }", lang: "rust")

  - Delimita el bloque de código de la función.

+ #raw("println!(\"¡Hola, mundo!\")", lang: "rust")

  - Es una macro que imprime texto en la consola.

*Compilación simple sin cargo*

Para pruebas rápidas, usa el compilador directo:
```bash
rustc main.rs
```
Esto genera un ejecutable.

- Windows:
  ```bash
  .\main.exe
  ```
- Linux/macOS:
  ```bash
  ./main
  ```

Resultado:
```bash
¡Hola, mundo!
```


*Compilar y ejecutar con* #raw("Cargo", lang: "toml")

Dentro de la carpeta del proyecto, puedes compilar y ejecutar en un solo paso con:
```bash
cargo run
```
Salida típica:
```bash
   Compiling mundorust v0.1.0 (D:\VNC\RUST\mundorust)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 3.42s
     Running `target\debug\mundorust.exe`
Hello, world!
```
Si la compilación fue exitosa, ejecuta el binario generado en #raw("target/debug/", lang: "toml").

*Compilar sin ejecutar*

Útil para verificar que el proyecto no tenga errores:
```bash
cargo build
```
Esto solo compila, no ejecuta.


*Verificar errores rápidamente*

```bash
cargo check
```

Ideal mientras editas el código y quieres confirmar que sigue compilando.

Ejemplo: si te olvidas un #raw(";", lang: "bash") o cierras mal una llave #raw("{ }", lang: "rust"), #raw("cargo check", lang: "toml") te avisará inmediatamente.

*Eliminar archivos generados*
```bash
cargo clean
```

Este comando borra los archivos creados durante las compilaciones anteriores.

*Compilar para producción*

Cuando necesites un binario optimizado:

```bash
cargo build --release
```

Esto genera una versión mucho más rápida y eficiente, ubicada en #raw("target/release/", lang: "toml").


#figure(
  table(
    columns: (auto, 1fr, 1fr),
    // Columna 1 fija, otras expansibles
    align: (left, left, left),
    [*Comando*], [*Uso principal*], [*Cuándo usarlo*],
    [cargo new \<name\>], [Crea un nuevo proyecto con estructura básica], [Inicio de cualquier proyecto],
    [cargo run], [Compila y ejecuta en un paso], [Desarrollo diario, pruebas rápidas],
    [cargo build], [Solo compila (sin ejecutar)], [Verificar código sin correrlo],
    [cargo check], [Chequea errores de sintaxis/tipos (rápido)], [Iteración mientras editas],
    [cargo clean], [Borra archivos generados en target/], [Liberar espacio o recompilar limpio],
    [cargo build --release], [Compila optimizado para producción], [Distribuir o medir rendimiento],
  ),
  caption: [Resumen rápido de comandos Cargo. ¡Ejecuta `cargo --help` para más!],
  supplement: [Tabla],
)


== Primeros Pasos en Rust

En Rust, las variables son el mecanismo básico para vincular nombres a valores. Pero, a diferencia de lenguajes dinámicos como Python o JavaScript, Rust aplica una disciplina estricta desde el primer momento haciendo que las variables sean inmutables por defecto.

Esto no es una limitación, sino una característica de diseño intencional que contribuye directamente a:

- Seguridad de memoria sin recolector de basura
- Ausencia de data races en concurrencia
- Optimizaciones agresivas por parte del compilador

=== Variables con let

La palabra clave #raw("let", lang: "rust") declara una variable y le asigna un valor inicial.

Rust infiere el tipo automáticamente en la mayoría de casos, pero puedes especificarlo explícitamente para claridad.

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    #line(
      length: 100%,
      stroke: 2pt + green,
    )
    ```rust
    let saludo: &str = "¡Hola, Rust!";
    ```
  ],
  [
    #line(
      length: 100%,
      stroke: 2pt + red,
    )
    ```rust
    saludo = "¡Hola, Rust!"; //ERROR
    ```
  ],
)

=== Mutabilidad con mut

Si quieres que una variable pueda cambiar su valor, debes declararla con #raw("let mut", lang: "rust").

Una variable mutable es aquella cuyo valor sí puede modificarse durante la ejecución del programa.

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    #line(
      length: 100%,
      stroke: 2pt + green,
    )
    ```rust
    let mut y = 5; // mutable

    y = 20; // permitido
    ```
  ],
  [
    #line(
      length: 100%,
      stroke: 2pt + red,
    )
    ```rust
    let y = 5; // No es mutable

    y = 20; // No se puede modificar
    ```
  ],
)

*mut* no implica que cambiarás el valor, sino que puedes hacerlo. Es una promesa al compilador para habilitar optimizaciones seguras.


=== Const & static

Las constantes #raw("const", lang: "rust") y los valores estáticos #raw("static", lang: "rust") representan datos inmutables que viven durante toda la ejecución del programa, pero no son equivalentes.

+ #raw("const", lang: "rust")

  Una const es un valor:

  - evaluado en tiempo de compilación

  - inmutable

  - copiado directamente en el binario

  - nunca tiene una dirección fija de memoria

  ```rust
  const MAX_PUNTAJE: u32 = 100;
  ```
  Requisitos:

  - Siempre requiere tipo explícito

  - Solo puede almacenar valores que el compilador pueda evaluar como constantes

  - Usa #raw("SCREAMING_SNAKE_CASE", lang: "rust") por convención```rust
    const ESPACIO: &'static str = "rust";
    ```

+ #raw("static", lang: "rust")

  Un valor static:

  + vive durante toda la ejecución del programa

  + tiene una sola ubicación fija en memoria

  + es similar a una variable global

  + puede ser mutable, pero requiere unsafe

  Ejemplo típico:
  ```rust
  static MENSAJE: &str = "Hola desde memoria estática";
  ```
  static se usa para datos globales con vida real en memoria.
=== Shadowing


Rust permite redeclarar una variable con el mismo nombre usando *let*. Esto no modifica el valor original sino que crea una nueva vinculación que la sombrea "shadowing" dentro de su ámbito.

#text(12pt, [¿Por qué es útil?])

- Permite transformar datos paso a paso, sin perder la inmutabilidad.
- Hace que el código sea más seguro y legible, ya que cada transformación es una nueva variable.
- Evita el uso de `mut` cuando solo se necesita cambiar el valor de forma temporal.

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    #line(
      length: 100%,
      stroke: 2pt + green,
    )
    ```rust
    let x = 5;
    let x = x + 1;
    ```
  ],
  [
    #line(
      length: 100%,
      stroke: 2pt + red,
    )
    ```rust
    let x = 5;
    x = x + 1;
    ```
  ],
)

Ventajas:

Permite cambiar el tipo de una variable sin perder inmutabilidad

```rust
let s = "   ";          // &str
let s = s.len();        // usize
```

#text(14pt)[Inferencia de Tipos y Especificación Explícita]

Rust infiere tipos de forma agresiva, pero no adivina. Solo deduce a partir de expresiones concretas.

Inferencia automática:

```rust
let n = 42;       // i32 valor entero sin sufijo
let f = 3.14;     // f64 valor decimal
let s = "hola";   // &str
```

Anotación explícita (recomendada en interfaces públicas):

```rust
let edad: u8 = 24;
let temperatura: f32 = 24.5;
let mensaje: &'static str = "Listo";
```



#text(14pt, [Buenas prácticas al nombrar variables en Rust])

En Rust, los nombres son sensibles a mayúsculas y minúsculas.

La convención oficial es snake_case: minúsculas con guiones bajos.

```rust
let numero_entero = 10;      // Bueno: snake_case

let numeroEntero = 10;       // Funciona, pero no idiomático
```
Por qué usar snake_case:

- Hace el código más legible y consistente con la comunidad Rust.

- Es la convención usada por el compilador, librerías estándar y la mayoría de proyectos profesionales.

- Ayuda a mantener un estilo uniforme en equipo.

=== println!


println! es una macro incluida en Rust que permite imprimir texto en la consola. Aunque parece simple, tiene un sistema de formato muy poderoso y flexible.


Sintaxis básica:
```rust
println!("Hola mundo");
```
Pero su fuerza real está en los placeholders como {} que permiten insertar valores dentro del texto:
```rust
println!("La edad es: {}", 20);
```

Representan lugares donde Rust insertará valores.

Ejemplo básico:

```rust
let x = 10;
println!("x vale {}", x);
```

#text(14pt, [Argumentos Posicionales])

Puedes usar varios {} y Rust los reemplaza en orden:

```rust
println!("{} + {} = {}", 3, 4, 3 + 4);
```

También puedes reutilizar argumentos usando posiciones:

```rust
println!("{0} ama a {1}, y {1} ama a {0}", "Juan", "Ana");
```

#text(14pt, [Argumentos Nombrados])

Puedes nombrar los valores y usarlos dentro del string:



```rust
println!(
    "Usuario {nombre} tiene {edad} años",
    nombre = "Luis",
    edad = 25
);
```

#text(14pt, [Alineación y Relleno])

Rust permite alinear texto y números dentro de un ancho fijo.

+ Alineación a la derecha```rust
  println!("{:>6}", 42);
  ```

+ Alineación a la izquierda```rust
  println!("{:<6}", 42);
  ```

+ Alineación centrada```rust
  println!("{:^6}", 42);
  ```

+ Relleno con caracteres```rust
  println!("{:*^6}", 42);
  ```

#text(14pt, [Precisión (Flotantes y Strings)])

+ Para flotantes (decimales)```rust
  println!("{:.2}", 3.141592);
  ```

  Ancho + precisión:```rust
  println!("{:>8.3}", 3.141592);
  ```

+ Para strings (longitud máxima)```rust
  println!("{:.5}", "RustLang");
  ```

#text(14pt, [Debug])


Con primitivos:```rust
println!("{:?}", 123);
println!("{:?}", true);
println!("{:?}", "Hola");
```

#figure(
  table(
    columns: (1fr, 1fr),
    align: (left, left),
    [*Tipo de identificador*], [*Convención en Rust*],
    [Variables y funciones], [snake_case],
    [Constantes], [SCREAMING_SNAKE_CASE],
    [Tipos y estructuras], [PascalCase],
  ),
  caption: [Convenciones oficiales de nomenclatura en Rust.],
  supplement: [Tabla],
)

=== Comentarios

Rust soporta dos tipos principales de comentarios:

+ Comentarios de línea "#raw("single-line", lang: "rust")"

  Comienzan con #raw("//", lang: "rust") y se extienden hasta el final de la línea.

  ```rust
  // Esto es un comentario
  let x = 10; // También puede ir al final de una línea
  ```
  Útil para:

  - aclarar partes específicas del código

  - comentarios cortos

  - desactivar temporalmente líneas de código

+ Comentarios de bloque "#raw("multi-line", lang: "rust")"

  Comienzan con #raw("/* y terminan con */", lang: "rust").
  ```rust
  /*
  Esto es un comentario
  de múltiples líneas.
  */
  ```

+ Comentarios de documentación "#raw("triple slash", lang: "rust")"

  ust usa Markdown dentro de la documentación:```rust
  /// Suma dos números.
  ///
  /// # Ejemplo
  /// ``
  /// assert_eq!(sumar(2, 3), 5);
  /// ``
  fn sumar(a: i32, b: i32) -> i32 {
      a + b
  }
  ```
  Estos comentarios:

  - Se procesan con cargo doc

  - Generan documentación HTML profesional

  - Son estándar en librerías y crates públicos

Rust también tiene documentación a nivel de módulo:
```rust
//! Documentación para un módulo entero
```

== Bloques y Alcances (Blocks & Scopes)

En Rust, un bloque es una secuencia de expresiones encerradas entre llaves "{ }". Los bloques definen ámbitos léxicos "lexical scopes", y estos determinan dónde una variable es válida y cuándo se libera su memoria.

Cada bloque crea un scope "alcance", que es el espacio en el que existen las variables. Cuando el programa sale de ese bloque, las variables definidas dentro de él dejan de existir automáticamente.

Dicho de otra manera:

- Bloque : es la parte física del código `{ ... }`.

- Scope : es el concepto lógico, las reglas que dicen hasta dónde vive una variable.

Ejemplo:

```rust
fn main() {
    let x = 10; // "x" vive en el scope principal main

    {
        let y = 20; // "y" solo existe dentro de este bloque
        println!("Dentro del bloque: x = {}, y = {}", x, y);
    }

    // Aquí "y" ya no existe, solo "x" sigue vivo
    println!("Fuera del bloque: x = {}", x);
}
```

- La variable "`x`" se declara en el scope principal de main, por lo tanto existe en todo el cuerpo de la función.

- La variable "`y`" se declara dentro de un bloque adicional `{ ... }`. Vive solo ahí.

Cuando termina el bloque, "`y`" es eliminada automáticamente y ya no puede usarse.

Esto asegura que la memoria se maneje de manera segura y que cada variable tenga una vida útil clara.

#text(16pt, [Shadowing en bloques])

El shadowing permite volver a declarar una variable con el mismo nombre en un scope diferente.
Eso no borra la variable anterior, simplemente la “oculta” o “sombrea” mientras dure el nuevo scope.
```rust
fn main() {
    let numero = 5;
    println!("Scope principal: numero = {}", numero);

    {
        let numero = 20; // sombreado (shadowing)
        println!("Dentro del bloque: numero = {}", numero);
    }

    // Aquí vuelve el valor original
    println!("Fuera del bloque: numero = {}", numero);
}
```

Salida:

```rust
Scope principal: numero = 5
Dentro del bloque: numero = 20
Fuera del bloque: numero = 5
```
En el scope principal, numero vale 5.

Dentro del bloque, se declara otro numero que somete "shadow" al anterior y ahora vale 20.

Al salir del bloque, el numero del bloque desaparece y el original "5" vuelve a estar accesible.

Esto permite reutilizar nombres de variables en contextos diferentes sin conflictos.

== Declaraciones y Expresiones

Rust distingue claramente entre declaraciones "*statements*" y expresiones "*expressions*". Esta distinción es fundamental porque determina cómo se estructura el flujo de control, cómo se infiere el tipo de retorno de una función y cómo se gestionan los valores en tiempo de compilación.

En Rust, casi todo es una expresión. Solo unas pocas construcciones son declaraciones puras y esto es intencional para favorecer la expresividad y reducir efectos secundarios no deseados.

#text(14pt, [*Declaraciones "Statements"*])

- Una declaración es una instrucción que realiza una acción, pero no produce un valor utilizable. Las declaraciones no pueden aparecer en contextos donde se espera un valor , por ejemplo, como inicializador de una variable.

- Terminan normalmente con "*`;`*".

- No pueden ser anidadas dentro de expresiones.

- Son imperativas: describen qué hacer, no qué valor obtener.

- Tipos comunes:

+ Declaraciones de variables : con "`let`", "`const`", etc. ```rust
  let x = 5;          // Vincula el nombre `x` al valor `5`
  ```

  let no es una expresión. No se puede usar en asignaciones anidadas: ```rust
  // Error de compilación
  let y = (let x = 5);  // `let` no devuelve valor, no se puede asignar
  ```


+ Declaraciones de expresiones descartadas. ```rust
  x + y;              // La expresión `x + y` se evalúa, pero su resultado se descarta
  println!("Hola");   // `println!` devuelve `()`, y la llamada como declaración descarta ese valor
  ```

#text(14pt, [*Expresiones "Expressions"*])

Una expresión es cualquier construcción sintáctica que produce un valor y tiene un tipo inferible. Las expresiones no llevan punto y coma.

Características:

- No terminan en "*;*" y si lo hacen, se vuelven declaraciones.
- Se pueden anidar libremente.
- Son funcionales: describen qué valor computar.

Ejemplos comunes:

```rust
5 + 2                // valor: 7, tipo: `i32`
"Rust"               // valor: &str, tipo: `&'static str`
x * 3                // valor dependiente de `x`
{                    // Bloque como expresión
    let a = 2;
    let b = 3;
    a + b            // valor de retorno del bloque: 5
}
```
