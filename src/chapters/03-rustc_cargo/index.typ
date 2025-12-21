== Compilador y Gestor de Proyectos

Rust proporciona dos herramientas fundamentales para trabajar

=== Compilador: rustc

Transforma archivos `.rs` en ejecutables nativos o bibliotecas.

Compilar un archivo simple

Crea un archivo `main.rs`:

```rust
fn main() {
    println!("Hola desde Rust!");
}
```

Compílalo:

```bash
rustc main.rs
```

Esto genera un ejecutable:
- Linux/macOS: `main`
- Windows: `main.exe`

Ejecuta:

```bash
./main           # Linux/macOS
main.exe         # Windows
```

Resultado:
```yaml
Hola desde Rust!
```

Especificar nombre del ejecutable

```bash
rustc main.rs -o mi_programa
```

Ahora el ejecutable se llama:
  - Linux/macOS: `mi_programa`
  - Windows: `mi_programa.exe`

Usa `rustc` solo cuando:
- Aprendes lo básico de Rust
- Compilas un único archivo `.rs` simple
- Estás experimentando rápidamente

=== Gestor de Proyectos: Cargo

Cargo es el sistema de construcción y gestor de paquetes de Rust. Es la herramienta que usarás el 99% del tiempo.

*¿Por qué existe Cargo?*
- Gestiona dependencias automáticamente
- Organiza la estructura del proyecto
- Compila, ejecuta y prueba código
- Publica paquetes en crates.io
- Gestiona workspaces
