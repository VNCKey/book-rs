

== Instalación de Rust

Rust se instala mediante rustup, el instalador oficial que gestiona versiones del compilador y herramientas asociadas.

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

Ejecuta rustup-init.exe y presiona Enter para instalación estándar.

Reinicia tu terminal después de la instalación.

=== Verificación

Confirma que la instalación fue exitosa:

```bash
rustc --version  # rustc 1.89.0 (29483883e 2025-08-04)
cargo --version  # cargo 1.89.0 (c24e10642 2025-06-23)
rustup --version # rustup 1.27.0 (2024-08-14)
```
