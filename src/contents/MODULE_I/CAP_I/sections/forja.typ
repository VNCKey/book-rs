#import "/src/config/global.typ": *

= Instalación y Herramientas

La forma oficial y recomendada de instalar Rust es a través de #link("https://rustup.rs")[*rustup*],
una herramienta que gestiona versiones del compilador y del ecosistema de herramientas asociadas.
A diferencia de instalaciones manuales, #raw("rustup", lang: "bash") permite actualizar, cambiar
de versión y desinstalar Rust con un solo comando.

== Linux y macOS

Abre una terminal y ejecuta el siguiente comando para descargar e iniciar el instalador:
```bash
  curl pin1--protopin2 '=https' pin3--tlsv1.2pin4 -sSf https://sh.rustup.rs | sh
```

El flag `--tlsv1.2` garantiza que la descarga se realice sobre una conexión segura.

+ El instalador presentará tres opciones. Selecciona la opción `1` para proceder con la instalación estándar, que incluye todo lo necesario para comenzar.

+ Al finalizar, el instalador mostrará el mensaje: _"Rust is installed now. Great!"_

+ Para que la terminal reconozca los nuevos comandos, recarga las variables de entorno
  sin necesidad de cerrarla:
```bash
  source $HOME/.cargo/env
```

Alternativamente, cierra y vuelve a abrir la terminal.

== Windows

En Windows, Rust requiere las herramientas de compilación de C++ de Microsoft, ya que el
compilador las utiliza internamente para generar ejecutables nativos.

+ Descarga e instala *Visual Studio Build Tools* desde:
  #link("https://visualstudio.microsoft.com/es/downloads/")[visualstudio.microsoft.com]

+ Durante la instalación, selecciona el componente *"Desktop Development with C++"*.
  Si prefieres una instalación minimalista, ve a la pestaña _"Componentes individuales"_
  y selecciona únicamente:

  - MSVC v143 — VS 2022 C++ x64/x86 build tools
  - Windows 11 SDK (10.0.22621.0)

Nota: Si prefieres trabajar en un entorno de desarrollo Unix desde Windows, puedes habilitar WSL (Windows Subsystem for Linux) y seguir las instrucciones de instalación para Linux.

+ Una vez instaladas las herramientas, descarga y ejecuta el instalador oficial de Rust
  desde #link("https://rustup.rs")[rustup.rs]. Sigue el mismo proceso que en Linux y macOS.

+ Al finalizar, cierra y vuelve a abrir la terminal para que Windows reconozca los comandos
  #raw("rustc", lang: "bash"), #raw("cargo", lang: "bash") y #raw("rustup", lang: "bash").

Independientemente del sistema operativo, ejecuta los siguientes comandos para confirmar que la instalación fue exitosa:
```bash
rustc --version
cargo --version
```

Una salida similar a la siguiente indica que todo está en orden:
```bash
rustc 1.92.0 (d1d5c06gf 2025-12-08)
cargo 1.92.0 (314c456gc 2025-10-21)
```

== Actualización y desinstalación

Actualizar a una versión recién lanzada es fácil.

```bash
rustup update
```

Si en algún momento decides que necesitas desinstalar Rust y todas sus herramientas asociadas. Abre tu terminal y ejecuta el siguiente comando:

```bash
rustup self uninstall
```

== Documentación local

La instalación de Rust también incluye una copia local de la documentación para que puedas leerla sin conexión @klabnik2026rust3rd_md.
Ejecuta el comando en tu terminal para abrir la documentación local en tu navegador.

```bash
rustup doc --book
```

== ¿Qué acabamos de instalar?

Al instalar Rust a través de `rustup`, tu sistema no solo ha descargado el lenguaje, sino que ha configurado las herramientas fundamentales que utilizarás en tu día a día como desarrollador:

- *Cargo:* Es el gestor de paquetes y el sistema de construcción oficial del ecosistema de Rust. Mientras que `rustc` hace el trabajo pesado de compilación, Cargo es una herramienta multipropósito que orquesta todo el proceso: crea los proyectos, descarga las librerías de terceros y llama a `rustc` por ti de forma automatizada.

- *`rustup`:* El gestor del ecosistema. Te permite actualizar Rust, cambiar entre versiones y añadir nuevos componentes @matthews2024idiomatic_md.

- *`rustc`:* Es el compilador oficial de Rust. Su trabajo consiste en tomar tu código fuente escrito en texto plano y transformarlo en un archivo binario ejecutable que la máquina pueda entender y ejecutar.

- *Herramientas de calidad:* La instalación estándar incluye *Clippy* (un asistente que revisa tu código buscando errores y áreas de mejora) y *rustfmt* (un formateador automático de código) @matthews2024idiomatic_md.

- *Biblioteca y documentación:* Por último, se ha instalado la biblioteca estándar (`rust-std`) y una copia local de la documentación (`rust-docs`) para que puedas consultarla sin conexión @klabnik2026rust3rd_md.

A lo largo de los próximos apartados, aprenderemos a utilizar ambas herramientas paso a paso para crear nuestros primeros programas.



// HOLA
// HOLA
// HOLA
// HOLA
// HOLA
// HOLA
// HOLA
// HOLA
// HOLA
// HOLA
// HOLAHOLA55555
// #import "@preview/plotsy-3d:0.2.1": plot-3d-parametric-surface

// #let xfunc(u, v) = u * calc.cos(v)
// #let yfunc(u, v) = u * calc.sin(v)
// #let zfunc(u, v) = 2.5 * calc.cos(u * 1.5) * calc.exp(-0.2 * u)

// #let color-func(x, y, z, x-lo, x-hi, y-lo, y-hi, z-lo, z-hi) = {
//   let z-range = if z-hi == z-lo { 1.0 } else { z-hi - z-lo }
//   let factor = (z - z-lo) / z-range
//   return rgb("#00f0ff").transparentize(10%).darken((1.0 - factor) * 55%)
// }

// // -- TAMAÑO AJUSTADO AQUÍ (Punto intermedio: 0.35) --
// #let scale-factor = 0.35
// #let (xscale, yscale, zscale) = (0.3, 0.3, 0.3)
// #let scale-dim = (xscale * scale-factor, yscale * scale-factor, zscale * scale-factor)

// == Pulso Electromagnético (Onda de Propagación)
// $ x(u,v) = u cos(v), quad y(u,v) = u sin(v), quad z(u,v) = 2.5 cos(1.5u) e^(-0.2u) $

// #plot-3d-parametric-surface(
//   xfunc,
//   yfunc,
//   zfunc,
//   xaxis: (-8, 8),
//   yaxis: (-8, 8),
//   zaxis: (-3, 3),
//   color-func: color-func,
//   subdivisions: 25,
//   scale-dim: scale-dim,
//   udomain: (0, 8),
//   vdomain: (0, 7),

//   axis-step: (2, 2, 1),
//   dot-thickness: 0em,
//   front-axis-thickness: 0em,
//   front-axis-dot-scale: (0, 0),
//   rear-axis-dot-scale: (0, 0),
//   rear-axis-text-size: 0em,
//   axis-label-size: 0em,
//   xyz-colors: (rgb(0, 0, 0, 0), rgb(0, 0, 0, 0), rgb(0, 0, 0, 0)),
// )
