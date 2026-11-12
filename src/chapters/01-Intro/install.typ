== Preparando el Laboratorio: Instalación

Antes de escribir nuestra primera línea de código, necesitamos nuestras herramientas. No vamos a instalar "un programa"; vamos a configurar un **entorno de ingeniería**.

Rust utiliza un gestor llamado #term[rustup]. Piensa en él como el centro de mando: no solo instala el lenguaje, sino que gestiona las versiones y las herramientas de análisis que nos mantendrán a salvo de errores de memoria.

=== Linux y macOS: El poder de la terminal

Si estás en un entorno basado en Unix, la instalación es una declaración de intenciones. Abre tu terminal y ejecuta:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#importante("Durante el proceso, se te preguntará por el tipo de instalación. Presiona **1** (default) para que rustup configure todo por ti.")

Al terminar, activa las herramientas en tu sesión actual con:
```bash
source $HOME/.cargo/env
```

=== Windows: El cimiento de hierro

En Windows, Rust necesita un "traductor" para comunicarse con el hardware de forma eficiente. Este traductor son las herramientas de compilación de C++.

==== Paso 1: El Enlazador (MSVC)
Rust no puede crear ejecutables solo. Necesita el *linker* de Microsoft. 
1. Ve a #link("https://visualstudio.microsoft.com/visual-cpp-build-tools/")[Visual Studio Build Tools].
2. Durante la instalación, asegúrate de marcar la casilla **"Desarrollo para el escritorio con C++"**.

*Nota de Ingeniero:* Si sientes que es una descarga pesada, tienes razón. Estamos instalando los cimientos que permiten a Rust generar binarios nativos ultra-rápidos en Windows.

==== Paso 2: El Instalador de Rust
1. Descarga #link("https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe")[rustup-init.exe].
2. Ejecútalo y sigue las instrucciones en pantalla. **Reinicia tu terminal** al terminar para que los cambios surtan efecto.

=== La Primera Victoria: Verificación

Vamos a confirmar que tu laboratorio está listo. Escribe estos comandos y observa cómo el sistema te responde:

```bash
rustc --version  # El cerebro (Compilador)
cargo --version  # El brazo ejecutor (Gestor de paquetes)
```

Si ves números de versión en pantalla, felicidades: **Oficialmente eres un Rustacean en fase de despliegue.** Ya tienes el poder de construir software indestructible en tu máquina.

#v(1em)
#align(center)[
  #image("/src/assets/rustperu.png", width: 40%) \
  #text(gray, size: 9pt)[El viaje ha comenzado.]
]
