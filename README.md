# 📝 Proyecto Typst

Bienvenido a nuestro proyecto de documentación con Typst. Este README te guiará para configurar tu entorno de desarrollo y empezar a colaborar.

## 🚀 ¿Qué es Typst?

Typst es un sistema moderno de composición de documentos basado en marcado, similar a LaTeX pero más rápido y fácil de usar. Es perfecto para crear documentos técnicos, papers académicos, reportes y más.

## 📋 Prerrequisitos

### 1️⃣ Instalar Rust

Typst está construido con Rust, y la mejor forma de instalarlo es a través de Cargo (el gestor de paquetes de Rust).

#### 🐧 Linux y 🍎 macOS

Abre tu terminal y ejecuta:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Sigue las instrucciones en pantalla. Cuando termine, reinicia tu terminal o ejecuta:

```bash
source $HOME/.cargo/env
```

#### 🪟 Windows

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

### 2️⃣ Instalar Typst con Cargo

Una vez que tengas Rust instalado, instalar Typst es muy sencillo:

```bash
cargo install --locked typst-cli
```

Este proceso puede tomar unos minutos la primera vez. Cuando termine, verifica:

```bash
typst --version
```

### 3️⃣ Instalar Zed Editor

Zed es un editor de código moderno y rápido, construido con Rust, ideal para trabajar con Typst.

#### 🐧 Linux

```bash
curl -f https://zed.dev/install.sh | sh
```

#### 🍎 macOS

```bash
brew install zed
```

O descarga desde: https://zed.dev/

#### 🪟 Windows

Descarga el instalador desde: https://zed.dev/

### 4️⃣ Configurar Typst en Zed

1. Abre Zed
2. Presiona `Ctrl+Shift+X` (Windows/Linux) o `Cmd+Shift+X` (macOS) para abrir el panel de extensiones
3. Busca "**typst**"
4. Instala la extensión oficial de Typst
5. ¡Listo! Tinymist (el language server) se instalará automáticamente

#### Configuración recomendada (Opcional)

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

## 🛠️ Cómo usar este proyecto

### Clonar el repositorio

```bash
git clone https://github.com/TU-USUARIO/TU-REPO.git
cd TU-REPO
```

### Abrir en Zed

```bash
zed .
```

O arrastra la carpeta a Zed.

### Compilar un documento

**Opción 1: Compilación manual**
```bash
typst compile main.typ
```

**Opción 2: Modo watch (recompila automáticamente)**
```bash
typst watch main.typ
```

**Opción 3: En Zed**
Si configuraste `exportPdf: "onSave"`, solo guarda el archivo (`Ctrl+S` o `Cmd+S`) y el PDF se generará automáticamente.

## 🤝 Cómo contribuir

1. **Actualiza tu repositorio local:**
   ```bash
   git pull origin main
   ```

2. **Haz tus cambios** en los archivos `.typ` usando Zed

3. **Revisa tus cambios:**
   ```bash
   git status
   git diff
   ```

4. **Confirma tus cambios:**
   ```bash
   git add .
   git commit -m "Descripción clara de tus cambios"
   ```

5. **Sube tus cambios:**
   ```bash
   git push origin main
   ```

## 📁 Estructura del proyecto

```
.
├── main.typ              # Documento principal
├── chapters/             # Capítulos o secciones (opcional)
│   └── intro.typ
├── assets/               # Imágenes y recursos
│   └── images/
├── .gitignore            # Archivos ignorados por Git
└── README.md             # Este archivo
```

## 📚 Recursos útiles

- [Documentación oficial de Typst](https://typst.app/docs/)
- [Tutorial de Typst](https://typst.app/docs/tutorial/)
- [Referencia de Typst](https://typst.app/docs/reference/)
- [Documentación de Tinymist](https://github.com/Myriad-Dreamin/tinymist)
- [Guía de Zed](https://zed.dev/docs)

## ❓ Preguntas frecuentes

**P: ¿Necesito saber Rust para usar Typst?**  
R: No. Rust solo es necesario para instalar Typst. Los documentos se escriben en el lenguaje de marcado de Typst.

**P: ¿Los PDFs se suben a GitHub?**  
R: No. El `.gitignore` está configurado para ignorar los archivos PDF. Solo el código fuente `.typ` se sincroniza.

**P: ¿Puedo usar otro editor?**  
R: Sí, pero Zed ofrece la mejor integración con Typst a través de Tinymist. También puedes usar VS Code con la extensión de Typst.

## 🐛 Problemas comunes

**Error: "typst: command not found"**  
Solución: Asegúrate de que `~/.cargo/bin` esté en tu PATH. Reinicia tu terminal después de instalar Rust.

**Error al compilar en Zed**  
Solución: Verifica que la extensión de Typst esté instalada y que Tinymist se haya descargado correctamente.

## 📄 Licencia

[Especifica tu licencia aquí, ej: MIT, GPL, etc.]

## 👥 Autores

- [Tu nombre]
- [Colaboradores]

---

¿Tienes dudas? Abre un issue o contacta a los mantenedores del proyecto.
