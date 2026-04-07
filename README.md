# Diviértete con Rust 🦀

Un libro sobre programación en Rust, escrito en [Typst](https://typst.app/).

## Requisitos

- **Rust + Cargo**: [rustup.rs](https://rustup.rs/)
- **Typst**: `cargo install --locked typst-cli`
- **Just**: `cargo install just`
- **Zed** (opcional, recomendado): [zed.dev](https://zed.dev/)

## Inicio rápido

```bash
git clone https://github.com/VNCKey/book-rs.git
cd book-rs
just
```

Abre **http://localhost:8080/** en tu navegador.

## Comandos

| Comando | Descripción |
|---------|-------------|
| `just` | Compila + sirve en http://localhost:8080 + auto-refresh |
| `just build` | Solo compilar a `output/libro.pdf` |
| `just clean` | Limpiar PDFs generados |

## Workflow

1. Ejecuta `just` - abre el visor en el navegador
2. Edita archivos `.typ` en tu editor
3. Guarda (`Ctrl+S`) - el navegador se actualiza automáticamente
4. ¡Escribe!

## Estructura

```
book-rs/
├── main.typ          # Entry point del libro
├── justfile          # Comandos (just)
├── portada.typ       # Portada del libro
├── src/
│   ├── config/       # Configuración global
│   ├── chapters/     # Capítulos del libro
│   ├── contents/     # Contenido principal
│   └── utils/        # Helpers (diagramas, tablas)
└── output/
    └── libro.pdf     # PDF compilado
```

## Editor recomendado

[Zed](https://zed.dev/) tiene soporte nativo para Typst con auto-compile:

1. Instala la extensión "typst" (`Ctrl+Shift+X`)
2. Configura en `settings.json`:

```json
{
  "lsp": {
    "tinymist": {
      "settings": {
        "exportPdf": "onSave"
      }
    }
  }
}
```
