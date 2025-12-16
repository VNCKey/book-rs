
# Prerrequisitos

## Instalar Rust

Typst está construido con Rust, y la mejor forma de instalarlo es a través de Cargo (el gestor de paquetes de Rust).

### Linux y macOS

Abre tu terminal y ejecuta:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Sigue las instrucciones en pantalla. Cuando termine, reinicia tu terminal o ejecuta:

```bash
source $HOME/.cargo/env
```

### Windows

**Opción 1: Instalador oficial (Recomendado)**

1. Descarga el instalador desde: https://rustup.rs/
2. Ejecuta `rustup-init.exe`
3. Sigue las instrucciones (opción por defecto está bien)
4. Reinicia tu terminal

**Opción 2: winget**

```powershell
winget install Rustlang.Rustup
```

#### ✅ Verificar instalación

```bash
rustc --version
cargo --version
```

Deberías ver algo como `rustc 1.x.x` y `cargo 1.x.x`.

## Instalar Typst con Cargo

Una vez que tengas Rust instalado, instalar Typst es muy sencillo:

```bash
cargo install --locked typst-cli
```

Este proceso puede tomar unos minutos la primera vez. Cuando termine, verifica:

```bash
typst --version
```

## Instalar Zed Editor

Zed es un editor de código moderno y rápido, construido con Rust, ideal para trabajar con Typst.

### Linux

```bash
curl -f https://zed.dev/install.sh | sh
```

### macOS

```bash
brew install zed
```

O descarga desde: https://zed.dev/

### Windows

Descarga el instalador desde: https://zed.dev/

## Configurar Typst en Zed

1. Abre Zed
2. Presiona `Ctrl+Shift+X` (Windows/Linux) o `Cmd+Shift+X` (macOS) para abrir el panel de extensiones
3. Busca "**typst**"
4. Instala la extensión oficial de Typst
5. ¡Listo! Tinymist (el language server) se instalará automáticamente

### Configuración recomendada (Opcional)

Para compilar automáticamente al guardar, abre la configuración de Zed (`Ctrl+,` o `Cmd+,`) y agrega:

```json
{
  "lsp": {
    "tinymist": {
      "settings": {
        "exportPdf": "onSave",
        "outputPath": "$root/$name"
      }
    }
  }
}
```

# Cómo usar este proyecto

## Clonar el repositorio

```bash
git clone https://github.com/VNCKey/book-rs.git
cd TU-REPO
```

## Abrir en Zed

```bash
zed .
```

O arrastra la carpeta a Zed.

## Compilar un documento

**Opción 1: Compilación manual**
```bash
typst compile main.typ
```

**Opción 2: Modo watch (recompila automáticamente)**
```bash
typst watch main.typ
```
o
```bash
ypst watch main.typ output/main.pdf
```

**Opción 3: En Zed**
Si configuraste `exportPdf: "onSave"`, solo guarda el archivo (`Ctrl+S` o `Cmd+S`) y el PDF se generará automáticamente.
