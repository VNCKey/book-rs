# Resumen: Code Like a Pro in Rust (Brenden Matthews, 2024)

Este documento es una síntesis de los conceptos clave abordados en el libro *"Code Like a Pro in Rust"*. El libro está diseñado para desarrolladores intermedios que ya conocen la sintaxis básica y buscan escribir código Rust idiomático, eficiente y listo para producción.

## Filosofía Principal
Rust busca ofrecer el rendimiento de C/C++ sin sus problemas de seguridad de memoria. El libro enfatiza el uso agresivo de las herramientas del ecosistema y la comprensión profunda de cómo Rust maneja la memoria para evitar copias innecesarias y maximizar el rendimiento.

---

## 🛠️ Parte 1: Herramientas (Pro Rust)

El dominio de Rust requiere dominar su ecosistema de herramientas.
*   **Cargo & Proyectos:** Gestión de dependencias (`Cargo.toml`), uso de *Feature flags* para dependencias opcionales, parcheo de dependencias y el uso de *Workspaces* para proyectos grandes.
*   **Tooling Esencial:**
    *   `rust-analyzer`: El estándar de facto para integración con IDEs (autocompletado, refactorización).
    *   `rustfmt`: Formateador de código opinionado para mantener un estilo consistente.
    *   `clippy`: Linter avanzado con más de 450 reglas para detectar código no idiomático o problemas de rendimiento.
    *   `sccache`: Caché de compilación para reducir drásticamente los tiempos de *build*.
*   **Toolchains:** Diferencia entre los canales `stable` y `nightly`. Uso de características experimentales (requiere *nightly*).

---

## 🧠 Parte 2: Datos y Memoria

El corazón del rendimiento en Rust.
*   **Strings:** Entender la diferencia crucial entre `String` (asignado en el *heap*, mutable, de longitud variable) y `&str` (slice de cadena, inmutable, a menudo apunta al *stack* o a secciones estáticas de memoria).
*   **Vectores y Slices:** `Vec` es la colección por defecto. Se explora cómo iterar eficientemente y cómo `Vec::with_capacity` evita reasignaciones costosas.
*   **Mapas Hash:** Uso de `HashMap` y cómo implementar funciones de hash personalizadas o derivar traits (`Hash`, `Eq`) para llaves compuestas.
*   **Gestión de Memoria:**
    *   *Stack vs Heap:* Reglas claras de asignación.
    *   *Ownership & Borrowing:* Reglas estrictas de préstamo (múltiples lectores o un solo escritor).
    *   *Clonación:* Cuándo hacer copias profundas (`clone()`) y cuándo evitarlas (pasando referencias).
*   **Smart Pointers:**
    *   `Box<T>`: Asignación básica en el *heap*.
    *   `Rc<T>` / `Arc<T>`: Conteo de referencias (hilo único / multihilo) para propiedad compartida.
    *   `Cow` (Clone-On-Write): Para retornar referencias inmutables cuando sea posible, o datos asignados cuando sea necesario mutar.
    *   *Mutabilidad Interior:* `Cell` y `RefCell` para mutar datos incluso a través de referencias inmutables.
*   **Asignadores Personalizados:** Cómo usar el API de `Allocator` para casos específicos como memoria segura/protegida (ej. criptografía).

---

## ✅ Parte 3: Correctitud (Testing)

Escribir código que no solo compila, sino que hace lo que debe.
*   **Unit Testing:** Uso del módulo `#[cfg(test)]`. Pruebas de lógica atómica.
*   **Integration Testing:** Carpeta `tests/`. Pruebas contra la API pública (caja negra).
*   **Herramientas Avanzadas:**
    *   `proptest`: Property-based testing (genera miles de casos de prueba aleatorios basados en reglas).
    *   `cargo-fuzz`: Fuzzing puro (envía basura binaria para encontrar *panics* o fallos de seguridad).
    *   `cargo-tarpaulin`: Análisis de cobertura de código.

---

## ⚡ Parte 4: Rust Asíncrono

Manejo de concurrencia para I/O sin bloquear el hilo principal.
*   **Conceptos Async:** Diferencia entre paralelismo (ejecución simultánea) y concurrencia asíncrona (intercalado de tareas esperando I/O).
*   **Runtimes:** El libro se centra casi exclusivamente en **Tokio** como el runtime estándar de facto.
*   **Futures & `.await`:** Cómo las funciones `async` devuelven una máquina de estados (Future) que no hace nada hasta que es sondeada (`.await` o `spawn`).
*   **Mix Sync/Async:** Cómo llamar a código bloqueante (síncrono) de forma segura dentro de un contexto asíncrono usando `tokio::task::spawn_blocking()`.
*   **API REST con Axum:** Un ejemplo completo de construcción de un servidor HTTP usando `axum` (framework web moderno basado en Tokio) y `sqlx` (para interacciones asíncronas con bases de datos SQL).

---

## 🚀 Parte 5: Optimizaciones

Llevando el código al límite (el último 3% de rendimiento).
*   **Zero-cost Abstractions:** Confianza en el compilador (LLVM) para optimizar código idiomático.
*   **SIMD (Single Instruction, Multiple Data):** Uso de características experimentales (`std::simd`) para procesar múltiples datos en un solo ciclo de CPU (útil en criptografía y procesamiento masivo de datos).
*   **Paralelismo con Rayon:** Transformar iteradores secuenciales (`.iter()`) en paralelos (`.par_iter()`) casi sin esfuerzo para cálculos intensivos de CPU.
*   **Interoperabilidad:** Breve revisión de cómo usar Rust para acelerar lenguajes como Python, Ruby o JavaScript usando bindings (ej. PyO3, Neon).

---

## 💡 "Tips Pro" Extraídos
*   *No uses `unwrap()` en código de producción.* Maneja siempre los errores explícitamente o usa el operador `?`.
*   *Configura un CI/CD fuerte.* Automatiza `cargo fmt`, `clippy` (configurado para fallar con advertencias) y tests.
*   *Evita bloqueos en Async.* Si una tarea toma más de unas pocas docenas de nanosegundos en cálculo intensivo (sin I/O), sácala del hilo async.
*   *Evita "Clonaciones Defensivas".* Rediseña tus algoritmos para usar referencias o `Cow` en lugar de esparcir `.clone()` solo para satisfacer al *Borrow Checker*.
