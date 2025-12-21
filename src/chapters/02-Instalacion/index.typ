#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#import "../../config.typ": term

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
  fill: rgb("#FBFAFB"),
)

== Instalación de Rust

Rust se instala mediante #term[rustup], el instalador oficial que gestiona versiones del compilador y herramientas asociadas.

=== Linux y macOS

Ejecuta en tu terminal:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Esto instalará:
- El compilador: rustc
- Gestor de paquetes: Cargo
- Documentación estándar
- Herramientas de desarrollo

Presiona Enter para la instalación estándar. Luego reinicia tu terminal o ejecuta:

```bash
source $HOME/.cargo/env
```

=== Windows

*Requisito previo:* Visual Studio Build Tools con MSVC

*Paso 1: Instalar Build Tools*

Descarga desde: https://visualstudio.microsoft.com/es/downloads/

Selecciona uno de estos:
- *Opción completa:* Workload "Desktop Development with C++"
- *Opción mínima:* En "Componentes individuales" selecciona:
  - MSVC v143 – VS 2022 C++ x64/x86 build tools
  - Windows 11 SDK (10.0.22621.0)

*Paso 2: Instalar Rust*

Descarga desde: https://www.rust-lang.org/tools/install

Selecciona el instalador según tu arquitectura (32-bit, x64, o ARM64).

Ejecuta #term[rustup-init.exe] y presiona Enter para instalación estándar.

Reinicia tu terminal después de la instalación.

=== Verificación

Confirma que la instalación fue exitosa:

```bash
rustc --version  # rustc 1.89.0 (29483883e 2025-08-04)
cargo --version  # cargo 1.89.0 (c24e10642 2025-06-23)
rustup --version # rustup 1.27.0 (2024-08-14)
```
