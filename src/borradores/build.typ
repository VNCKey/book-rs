
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
