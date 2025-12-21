
Solo compilar sin ejecutar
```bash
cargo build
```

El binario se genera en target/debug/:

#figure(
  table(
    columns: (auto, 1fr),
    [*Sistema*], [*Ubicación del ejecutable*],
    [Windows], [`target\debug\hola_mundo.exe`],
    [Linux/macOS], [`target/debug/hola_mundo`]
  ),
  caption: [Ubicación del ejecutable según el sistema operativo]
)

Verificación rápida

El comando más rápido durante el desarrollo:

```bash
cargo check
```

¿Cuándo usar cargo check?

- Mientras escribes código

- Para verificar sintaxis rápidamente

- Si olvidaste un #raw(";", lang: "rust") o cerraste mal una llave #raw(";", lang: "{ }")

- Antes de hacer commit

Limpiar archivos compilados

```bash
cargo clean
```

¿Cuándo usar?

- Liberar espacio en disco, la carpeta target/ puede ocupar cientos de MB

- Forzar una recompilación completa desde cero

- Antes de comprimir/compartir el proyecto

Después de cargo clean, la próxima compilación será más lenta porque
Cargo debe recompilar todo desde cero.

Compilación para Producción

Modo Release

Cuando necesites un binario optimizado para distribuir:

```bash
cargo build --release
```

El ejecutable optimizado se genera en target/release/.


#figure(
  table(
    columns: (auto, 1fr, 1fr),
    [], [Debug (cargo build)], [Release (cargo build --release)],
    [Optimización],[Ninguna (más rápido de compilar)],[Máxima (O3, LTO opcional)],
    [Velocidad de ejecución],[Lenta],[Máximo rendimiento],
    [Tamaño del binario],[Más grande],[Pequeño],
    [Tiempo de compilación],[Rápido],[Lento],
    [Debugging],[Completo],[Limitado],
    [Ubicación],[target/debug/],[target/release/],
    [Cuándo usar],[Desarrollo diario],[Producción, distribución, benchmarks]
  ),
  caption: [Diferencias entre perfiles]
)

Ejecutar en modo release

```bash
cargo run --release
```

Agregar librerías externas con Cargo
#codly(
  highlights : (
    (line:1, start: 11,  fill: rgb("#CBD4FF"), tag: "crate"),
  ),
)
```bash
cargo add rand
```



#text(14pt)[*Comandos esenciales de Cargo*]

*1. Compilar el proyecto*

```bash
cargo build
```

Esto:
- Descarga dependencias si es necesario
- Compila tu código
- Genera el ejecutable en `target/debug/`

*2. Compilar en modo release (optimizado)*

```bash
cargo build --release
```

- Ejecutable optimizado en `target/release/`
- Compilación más lenta, ejecución más rápida
- Usa esto para distribución

*3. Compilar y ejecutar*

```bash
cargo run
```

Equivalente a: `cargo build` + ejecutar el binario

Con argumentos:

```bash
cargo run -- arg1 arg2
```

*4. Verificar que compila (sin generar ejecutable)*

```bash
cargo check
```

- Mucho más rápido que `cargo build`
- Útil durante desarrollo para verificar errores
- No genera ejecutables

*5. Ejecutar tests*

```bash
cargo test
```

Ejecuta todos los tests del proyecto.

Ejecutar un test específico:

```bash
cargo test nombre_del_test
```

*6. Generar documentación*

```bash
cargo doc
```

Genera documentación HTML en `target/doc/`.

Ver en el navegador:

```bash
cargo doc --open
```

*7. Limpiar archivos generados*

```bash
cargo clean
```

Elimina el directorio `target/` completo.

*8. Actualizar dependencias*

```bash
cargo update
```

Actualiza dependencias respetando versiones en `Cargo.toml`.

*9. Formatear código*

```bash
cargo fmt
```

Formatea todo el código según el estilo estándar de Rust.

*10. Analizar código (linter)*

```bash
cargo clippy
```

Analiza el código y sugiere mejoras.

⚠️ Requiere instalar: `rustup component add clippy`

*11. Ver árbol de dependencias*

```bash
cargo tree
```

Muestra todas las dependencias y sus relaciones.

*12. Buscar crates*

```bash
cargo search nombre_crate
```

Busca crates en crates.io desde la terminal.

#text(14pt)[*Agregar dependencias*]

*Forma 1: Editar Cargo.toml manualmente*

```toml
[dependencies]
serde = "1.0"
tokio = "1.36"
```

*Forma 2: Usando cargo add (Rust 1.62+)*

```bash
cargo add serde
cargo add tokio --features full
```

Esto actualiza `Cargo.toml` automáticamente.

*Eliminar dependencia:*

```bash
cargo remove serde
```

#text(14pt)[*Especificar versiones de dependencias*]

```toml
[dependencies]
# Versión exacta
serde = "=1.0.195"

# Versión mínima (compatible)
serde = "1.0"          # Acepta >=1.0.0 <2.0.0

# Rango de versiones
serde = ">=1.0, <1.5"

# Versión desde git
mi_crate = { git = "https://github.com/usuario/repo" }

# Versión desde git con branch/tag
mi_crate = { git = "https://github.com/usuario/repo", branch = "dev" }

# Dependencia local
mi_crate = { path = "../mi_crate" }

# Con features específicos
tokio = { version = "1.36", features = ["full"] }

# Sin features por defecto
serde = { version = "1.0", default-features = false }
```

#text(14pt)[*Profiles de compilación*]

Cargo tiene perfiles predefinidos que controlan cómo se compila:

*Profile dev (por defecto con `cargo build`):*
- Optimización: Baja
- Debug info: Completa
- Compilación: Rápida
- Ejecución: Lenta

*Profile release (con `cargo build --release`):*
- Optimización: Máxima
- Debug info: Ninguna
- Compilación: Lenta
- Ejecución: Rápida

*Personalizar profiles en Cargo.toml:*

```toml
[profile.dev]
opt-level = 0        # Sin optimización
debug = true         # Info de debug completa

[profile.release]
opt-level = 3        # Optimización máxima
debug = false        # Sin info de debug
lto = true           # Link Time Optimization
codegen-units = 1    # Mejor optimización, compilación más lenta
```

*Profile de test:*

```toml
[profile.test]
opt-level = 0
```

*Profile personalizado:*

```toml
[profile.bench]
inherits = "release"
debug = true
```

Usar:
```bash
cargo build --profile bench
```

#text(14pt)[*Features*]

Los features permiten compilación condicional:

```toml
[features]
default = ["feature1"]
feature1 = []
feature2 = ["dependency/feature"]
```

Compilar con feature específico:

```bash
cargo build --features feature1
cargo build --features "feature1,feature2"
```

Sin features por defecto:

```bash
cargo build --no-default-features
```

#text(14pt)[*Workspaces*]

Para proyectos grandes con múltiples crates:

Estructura:
```
mi_workspace/
├── Cargo.toml          # Workspace root
├── crate1/
│   ├── Cargo.toml
│   └── src/
└── crate2/
    ├── Cargo.toml
    └── src/
```

`Cargo.toml` del workspace:

```toml
[workspace]
members = [
    "crate1",
    "crate2",
]
```

Todos los crates comparten `target/` y `Cargo.lock`.

Compilar todo el workspace:

```bash
cargo build --workspace
```

Compilar un crate específico:

```bash
cargo build -p crate1
```

#text(14pt)[*Variables de entorno*]

Cargo respeta varias variables de entorno:

```bash
# Cambiar nivel de optimización
RUSTFLAGS="-C opt-level=2" cargo build

# Compilar para otro target
cargo build --target x86_64-unknown-linux-gnu

# Ver todos los targets disponibles
rustc --print target-list
```

#text(14pt)[*Caché y compilación incremental*]

Cargo usa compilación incremental por defecto (solo recompila lo que cambió).

Ver estadísticas de compilación:

```bash
cargo build --timings
```

Genera reporte HTML en `target/cargo-timings/`.

Limpiar solo artefactos de compilación (mantener dependencias):

```bash
cargo clean -p mi_proyecto
```

#text(14pt)[*Publicar en crates.io*]

*1. Crear cuenta en crates.io*

Visita: https://crates.io

*2. Obtener API token*

```bash
cargo login
```

*3. Preparar el paquete*

Asegúrate que `Cargo.toml` tenga:
- `name` único
- `version`
- `license`
- `description`

*4. Verificar que todo está listo*

```bash
cargo package --list
```

*5. Publicar*

```bash
cargo publish
```

⚠️ **No puedes eliminar versiones publicadas**, solo deprecarlas.

*Deprecar versión:*

```bash
cargo yank --vers 0.1.0
```

#text(14pt)[*Configuración global*]

Cargo se puede configurar globalmente en:
- Linux/macOS: `~/.cargo/config.toml`
- Windows: `%USERPROFILE%\.cargo\config.toml`

Ejemplo de configuración:

```toml
[build]
jobs = 4                    # Compilación paralela
target-dir = "target"       # Directorio de salida

[term]
color = "auto"              # Colorear output

[net]
git-fetch-with-cli = true   # Usar git CLI
```

=== rustc vs Cargo

#table(
  columns: (auto, 1fr, 1fr),
  align: (center, left, left),

  [*Aspecto*], [*rustc*], [*cargo*],

  [Uso principal],
  [Compilar archivos individuales],
  [Gestionar proyectos completos],

  [Dependencias],
  [Manual y complicado],
  [Automático y simple],

  [Estructura],
  [No impone estructura],
  [Estructura estándar],

  [Testing],
  [Manual],
  [Integrado (`cargo test`)],

  [Optimización],
  [Flags manualmente],
  [Profiles automáticos],

  [Documentación],
  [No genera],
  [`cargo doc`],

  [Publicación],
  [No soporta],
  [`cargo publish`],

  [Cuándo usar],
  [Archivos simples, aprendizaje],
  [Proyectos reales (siempre)],
)

=== Cuándo usar cada herramienta

*Usa rustc cuando:*
- Estás aprendiendo Rust con ejemplos de un libro
- Tienes un único archivo `.rs` para compilar rápido
- Necesitas experimentar con flags de compilación específicos
- Estás en un entorno muy restringido sin cargo

*Usa cargo cuando:*
- Trabajas en cualquier proyecto real (pequeño o grande)
- Necesitas dependencias externas
- Quieres tests automáticos
- Trabajas en equipo
- Planeas publicar tu código
- **En el 99% de los casos**

=== Comandos más usados (referencia rápida)

*rustc:*
```bash
rustc archivo.rs              # Compilar
rustc -O archivo.rs           # Optimizado
rustc -o nombre archivo.rs    # Con nombre específico
rustc --version               # Ver versión
```

*cargo:*
```bash
cargo new proyecto            # Crear proyecto
cargo build                   # Compilar
cargo build --release         # Compilar optimizado
cargo run                     # Compilar y ejecutar
cargo check                   # Verificar errores
cargo test                    # Ejecutar tests
cargo doc --open              # Generar y ver docs
cargo clean                   # Limpiar
cargo add dependencia         # Agregar dependencia
cargo update                  # Actualizar dependencias
cargo fmt                     # Formatear código
cargo clippy                  # Analizar código
```

=== Resumen

- `rustc` es el compilador real de Rust
- `cargo` es la herramienta de alto nivel que usa rustc internamente
- Para aprender: usa rustc con archivos simples
- Para proyectos reales: **siempre usa cargo**
- Cargo gestiona dependencias, testing, documentación y publicación
- La combinación de ambos hace a Rust muy productivo
