#import "/src/config/global.typ": *
== Hola Mundo: Anatomía básica y compilación manual con rustc

La tradición dicta que el primer paso al explorar un nuevo lenguaje de programación es hacer que la pantalla imprima un sencillo, pero poderoso, *«¡Hola, Mundo!»* @klabnik2026rust3rd_md. Aunque en el día a día utilizaremos herramientas automatizadas, en este primer encuentro invocaremos directamente a *`rustc`*, el compilador oficial de Rust. Este enfoque manual nos permitirá entender qué ocurre exactamente bajo el capó cuando nuestro código fuente se transforma en un binario ejecutable.

Empezaremos creando una carpeta llamada *`proyecto`* y, dentro de ella, un archivo llamado *`main.rs`*. La extensión *`.rs`* es el estándar innegociable para cualquier código fuente en Rust @klabnik2026rust3rd_md. Por otro lado, la elección del nombre *`main`* tampoco es casualidad: aunque al compilar manualmente con *`rustc`* podrías usar cualquier otro nombre, en la ingeniería de software *`main`* es la convención universal para indicar el punto de entrada principal de un programa.

Si estas en Linux y macOS para crear un archivo uso estos comandos:

#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  stroke: none,
  align: center + horizon,
  rect(
    stroke: none,
  )[
    ```bash
    mkdir ~/project
    cd ~/project
    touch main.rs
    ```
  ],
  rect[#image("assets/tree.svg")],
)

```rust
pin1 fn main() pin2  pin3{pin4
    pin7println!pin8 pin9("¡Hola, mundo!");pin10
pin5}pin6
```
#colorsp((1, 2), (1, 2), height: 3.5em, pos: bottom, fill: rgb("#d93d3d"))
#colorsp((3, 4), (3, 4), height: 3.5em, pos: bottom, fill: rgb("#3d8ed9"))
#colorsp((5, 6), (3, 4), height: 3.5em, pos: bottom, fill: rgb("#3d8ed9"))
#colorsp((7, 8), (3, 4), height: 3.5em, pos: bottom, fill: rgb("#64d93d"))
#colorsp((9, 10), (3, 4), height: 3.5em, pos: bottom, fill: rgb("#d742f5"))


A simple vista, su estructura puede resultar familiar si vienes de lenguajes como C, C++ o Java, pero cada elemento obedece a reglas de diseño muy específicas:


- La función principal '*#raw("fn main()", lang: "rust")*': En Rust, la palabra reservada '*#raw("fn", lang: "rust")*' declara una nueva función. La función main es especial; siempre será el primer código que se ejecute en cualquier programa binario @klabnik2026rust3rd_md. Los paréntesis vacíos '*#raw("()", lang: "rust")*' indican que no recibe parámetros de entrada.

- El cuerpo y el ámbito '*#raw("{ }", lang: "rust")*': Las llaves delimitan los bloques de código y definen su ámbito «*scope*». Todo lo que ocurra aquí dentro pertenece exclusivamente a esta función.

- La macro '*#raw("println!", lang: "rust")*' y las cadenas: Esta instrucción imprime texto en la pantalla. Un detalle fundamental de Rust es que '*#raw("println!", lang: "rust")*' no es una función ordinaria, sino una macro «*lo sabemos por el signo de exclamación '!'*» @klabnik2026rust3rd_md. Las macros escriben código por nosotros antes de compilar. Además, Rust codifica sus cadenas en UTF-8 por defecto, soportando caracteres acentuados y emojis de forma nativa.

- El terminador de sentencias '*`;`*': El punto y coma le indica al compilador que la expresión actual ha terminado y está listo para la siguiente.


=== Compilando nuestra programa
A diferencia de los lenguajes interpretados como Python o JavaScript, Rust es un lenguaje compilado ahead-of-time (AOT). Esto significa que el compilador traduce todo tu código a lenguaje máquina antes de ejecutarlo, generando un archivo independiente que puedes compartir con cualquier persona, ¡incluso si no tienen  instalado Rust! @klabnik2026rust3rd_md.

Abre tu terminal en el directorio donde guardaste '*`main.rs`*' y ejecuta el compilador:

```bash
rustc main.rs
```
Si no hay errores tipográficos, el comando terminará en silencio. Sin embargo, si revisas tu directorio, verás que el compilador ha creado un nuevo archivo ejecutable llamado '*#raw("main", lang: "rust")*' en Linux/macOS, o '*#raw("main.exe", lang: "rust")*' en Windows junto a tu código fuente @klabnik2026rust3rd_md.

Ha llegado el momento de la verdad. Ejecuta tu programa llamando a este nuevo archivo:

#block(
  inset: 8pt,
)[
  #columns(2, gutter: 8pt)[
    En Linux y macOS:

    ```bash
    ./main
    ```

    #colbreak()

    En Windows:
    ```bash
    .\main.exe
    ```
  ]
]

Verás aparecer el esperado saludo en tu terminal:

```
¡Hola, mundo!
```
== De rustc a Cargo: Automatizando el flujo de trabajo

Compilar un código con '#raw("rustc", lang: "rust")' es perfecto para entender las bases, pero ¿qué sucede cuando tu software crece? Imagina tener que descargar librerías externas manualmente, compilar decenas de archivos en un orden específico y vincularlos uno por uno. Ese proceso manual sería una pesadilla logística.

Gracias a Cargo, crear, construir y ejecutar programas complejos se vuelve un proceso estandarizado, sencillo y altamente organizado. En el mundo real, los desarrolladores de Rust casi nunca invocan a rustc directamente; dejan que Cargo haga todo el trabajo pesado.

Para ver a Cargo en acción y entender cómo organiza las carpetas por nosotros, vamos a generar nuestro primer proyecto oficial. En tu terminal, ejecuta el siguiente comando:

#block(
  stroke: black,
)[
  #grid(
    columns: (1fr, 1fr),
    rows: (auto, auto),
    gutter: 3pt,
    align: center + horizon,
    rect(
      stroke: none,
    )[
      ```bash
      cargo new rustaseans
      ```
      ```bash
      cd mundorust
      ```
    ],
    rect(
      stroke: none,
    )[
      #image("assets/cargo_directory.svg")
    ],
  )
]

Al explorar la carpeta generada, el corazón del proyecto reside en un archivo llamado Cargo.toml. Es el manifiesto oficial de tu software.

Rust fue diseñado con una obsesión por la estabilidad y la reproducibilidad. Si le envías tu proyecto a otra persona, o si un servidor necesita compilar tu código dentro de cinco años, el resultado debe ser exactamente el mismo, sin fallos por versiones incompatibles. Para lograr esta magia, Cargo necesita una fuente de la verdad absoluta que dicte cómo debe ensamblarse todo. Ese contrato inquebrantable es el Cargo.toml.

=== Contenido de Cargo.toml

```bash
[package]
name = "rustaceans"
version = "0.1.0"
edition = "2024"

[dependencies]
# Dependencia para generar un numero aleatorio
# rand = "1.0"

```
+ #raw("[package]", lang: "toml"): El DNI del proyecto

  Contiene los metadatos del proyecto como nombre, versión, autor y edición de Rust.

  - *#raw("name", lang: "toml")*: Es el nombre oficial de tu proyecto.
  - *#raw("version", lang: "toml")*: Rust es muy estricto con el Semantic Versioning (SemVer). Ese #raw("0.1.0", lang: "toml") le dice al mundo que tu proyecto está en desarrollo inicial.
  - *#raw("edition", lang: "toml")*: Esta es una de las piezas arquitectónicas más brillantes de Rust. No hay un "Rust 2.0" que rompa el código viejo. En su lugar, hay "ediciones" (2015, 2018, 2021, y la actual 2024). Al poner #raw("2024", lang: "toml"), le dices a `rustc`: «Usa las reglas y características más modernas del lenguaje». Si otro paquete usa la edición 2015, Cargo los compila ambos sin problemas y los hace funcionar juntos.

+ #raw("[dependencies]", lang: "toml"): El Arsenal

  A diferencia de otros lenguajes, la librería estándar de Rust es pequeña por diseño. Para tareas específicas (como conectar a una base de datos o generar números aleatorios), recurrimos a librerías de la comunidad llamadas *Crates*, alojadas en el registro oficial `crates.io`.

=== Contenido de main.rs

Si abres el archivo src/main.rs generado por Cargo, notarás un código que ya conoces a la perfección: nuestra función principal que imprime el saludo en pantalla.

Ya sabemos cómo funciona ese código bloque por bloque. Sin embargo, lo verdaderamente importante aquí no es el código en sí, sino dónde está ubicado.

Cargo es una herramienta que prioriza la convención sobre la configuración. Esto significa que espera que las cosas estén en un lugar específico por defecto, ahorrándote el trabajo de decírselo.

- La carpeta #raw("src/", lang: "bash") (Source): Cargo exige de manera estricta que todo tu código fuente viva dentro de esta carpeta. El nivel principal del proyecto queda reservado exclusivamente para archivos de configuración como el Cargo.toml, archivos de lectura y el control de versiones. Esta separación mantiene tu proyecto inmaculadamente limpio sin importar qué tan grande se vuelva.

- El punto de entrada por defecto: Cuando construyes un programa ejecutable (un binario), Cargo buscará automáticamente el archivo #raw("src/main.rs", lang: "bash"). Lo reconoce al instante como el punto de inicio de tu aplicación. Si lo renombras o lo mueves fuera de src, Cargo se negará a compilar a menos que modifiques la configuración para indicarle el nuevo nombre.

=== Compilar con Cargo

Dentro de la carpeta del proyecto, puedes compilar y ejecutar en un solo paso con:

```bash
~/rustaceans
> pin3cargo runpin4
pin1   Compiling rustaceans v0.1.0 (/home/alek/rustaceans)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.29s
     Running `target/debug/rustaceans`                                  pin2
pin5Hola, mundo!pin6
```
#colorsp((1, 2), (1, 2), height: 3.5em, pos: bottom, fill: rgb("#53e055"))
#colorsp((3, 4), (1, 2), height: 3.5em, pos: bottom, fill: rgb("#a853e0"))
#colorsp((5, 6), (1, 2), height: 3.5em, pos: bottom, fill: rgb("#5395e0"))

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

=== Los Rastros de Cargo: .lock y target

Al trabajar con Cargo, notarás que aparecen archivos y carpetas que tú no creaste. En la ingeniería de software, nada es azar; cada uno tiene una misión específica para garantizar que tu código sea robusto y reproducible.

==== Cargo.lock: El Contrato de Versiones
Mientras que el `Cargo.toml` es donde tú escribes tus intenciones (ej. "quiero la librería de números aleatorios"), el archivo #term[Cargo.lock] es donde Cargo anota la realidad técnica.

- **¿Qué es?** Un registro exacto de las versiones exactas de cada librería utilizada.
- **¿Por qué existe?** Para asegurar que si compartes tu código con otro ingeniero, Cargo descargue *exactamente los mismos bytes* que tú usaste. Esto evita el clásico error de "en mi máquina sí funciona".
- **Regla de Ingeniero:** **No lo edites manualmente.** Cargo lo gestiona por ti.

==== La carpeta target/: El Taller de Ensamblaje
Notarás una carpeta llamada `target/`. Es el lugar donde ocurre la magia de la compilación sin ensuciar tu código fuente.

- **target/debug/:** Contiene tu ejecutable cuando usas `cargo build` o `cargo run`. Está diseñado para ser rápido de compilar y fácil de depurar (incluye símbolos que le dicen a las herramientas en qué línea falló tu código).
- **¿Es pesada?** Sí, puede llegar a pesar GB en proyectos grandes. Por eso existe `cargo clean`, para vaciar el taller cuando necesites espacio.
- **Regla de Ingeniero:** Esta carpeta nunca se sube a Git. Cargo crea automáticamente un archivo `.gitignore` para recordártelo.









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
