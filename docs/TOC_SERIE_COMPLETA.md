# 🦀 Serie: Software seguro con Rust  
## Tabla de contenidos canónica (completa y por volúmenes)

> **Título de serie (propuesto):** *Software seguro con Rust*  
> **Eslogan:** *Diviértete reescribiendo el mundo*  
> **Autor:** Luis Alexander Villanueva Alarcón (VNCKey)  
> **Enfoque:** de cero absoluto a ingeniería real · claridad radical · hardware cuando importa · sin culto

---

## Cómo está pensada esta serie

Muchos libros intentan ser **todo a la vez** y se vuelven interminables o aplastan al novato.  
Esta serie separa **competencias** en volúmenes independientes, pero **encadenados**:

| Volumen | Nombre corto | Pregunta que responde | ¿Se puede leer solo? |
|--------:|--------------|------------------------|----------------------|
| **0** | *Mapa y mentalidad* | ¿Cómo aprendo sin perderme? | Sí (corto, gratis/intro) |
| **I** | *Core Rust* | ¿Cómo habla y piensa Rust? | Sí (el libro principal) |
| **II** | *Construyendo programas* | ¿Cómo hago software de verdad? | Tras I (o con bases de otro lado) |
| **III** | *Rust en backend y sistemas* | ¿Cómo corro servicios concurrentes? | Tras I (+ II recomendado) |
| **IV** | *Bajo el capó* | ¿Cómo toco silicio, unsafe, FFI, WASM? | Tras I–III según capítulo |

**Regla de producto:** el Volumen I debe poder publicarse y enseñarse **sin** esperar al IV.  
Las *cápsulas* (🚀) son side-quests: enriquecen, no bloquean.

**Lentes de cada sección (estilo del autor):**

1. **Calle** — analogía + ejemplo mínimo  
2. **Taller** — reglas + error del compilador  
3. **Sótano** — memoria / costo / por qué Rust eligió esto *(opcional)*

---

# VOLUMEN 0 — El mapa (prólogo de la serie)

*Extensión objetivo: 20–40 páginas. No es un libro de teoría: es el GPS.*

### 0.1 Para quién es esta serie (y para quién no)
- Nunca programaste  
- Vienes de Python / JavaScript / Go  
- Vienes de C / C++  
- Solo quieres “un backend en un fin de semana” (te redirigimos con honestidad)

### 0.2 Por qué existe Rust (sin sermón)
- El problema de la confianza en el software  
- La crisis de seguridad en memoria (el “~70%”) sin moralina  
- Qué promete Rust de verdad: **seguridad + control + concurrencia sin data races**  
- Por qué algunos lo odian (fricción, evangelismo, identidad) y cómo usarlo sin culto

### 0.3 El mapa mental del ingeniero
- **8 bases:** Intención · Máquina · Programa · Lenguaje · Compilador · Correctitud · Costo · Ingeniería  
- **5 pilares de Rust:** Ownership · Tipos · Exhaustividad · Zero-cost · Fearless concurrency  
- **3 lentes del lenguaje:** Sintaxis · Semántica · Pragmática

### 0.4 Cómo usar la serie
- Rutas de lectura por perfil (4 caminos)  
- Qué es Core / Cápsula / Lab  
- Tooling mínimo: `rustup`, editor, `cargo`, mentalidad del error del compilador  
- Contrato con el lector: micro-victorias, no misterios aplazados 5 capítulos

### 0.5 Qué vas a poder construir
- Al final de I, II, III, IV (lista concreta de proyectos)

---

# VOLUMEN I — Core Rust  
## *El lenguaje, la memoria y el compilador*

> **Objetivo:** que el lector piense en Rust, no solo “escriba sintaxis”.  
> **Al terminar:** puede leer crates medianos, modelar con tipos, manejar errores, organizar un crate y explicar ownership con un diagrama de stack/heap.  
> **Proyecto final del volumen:** un CLI o crate de dominio pequeño (parser de config, agenda, contador de stats, etc.) con tests.

---

## Parte I-A — Primer contacto y entorno

### Capítulo 1. Génesis y primer binario
- 1.1 Historia breve (Graydon, Mozilla, edición actual) — lo justo  
- 1.2 ¿Qué es Rust en una página?  
- 1.3 ¿Dónde brilla y dónde no? (tabla honesta)  
- 1.4 Instalación: `rustup`, toolchains, Windows/Linux/macOS  
- 1.5 El arsenal: `rustc`, `cargo`, `rustfmt`, `clippy`, `rust-analyzer`, `rustdoc`  
- 1.6 Hola, mundo: `main`, `println!`, comentarios  
- 1.7 Anatomía de un proyecto Cargo (`Cargo.toml`, `src/`, perfiles dev/release)  
- 1.8 El pipeline mental: fuente → rustc → (MIR) → LLVM → máquina  
  - 🚀 Cápsula: por qué el compilador es “estricto y útil”, no “enemigo”

### Capítulo 2. Cómo se lee un programa Rust
- 2.1 Declaraciones vs expresiones (el `;` importa)  
- 2.2 Bloques y scopes `{}`  
- 2.3 Items: funciones, módulos (vista previa), `use`  
- 2.4 Convenciones: `snake_case`, `CamelCase`, `SCREAMING_SNAKE`  
- 2.5 Leer errores del compilador (traductor al español de los 10 errores más comunes al inicio)  
- 2.6 `cargo check` / `run` / `build` / `clean` / `doc` — flujo diario  

**Lab A:** proyecto `mundorust` + checklist de entorno verificado.

---

## Parte I-B — Datos, control y el “ya programo”

### Capítulo 3. Variables y el contrato de inmutabilidad
- 3.1 `let` y la inmutabilidad por defecto  
- 3.2 `mut`: permiso de cambiar, no obligación  
- 3.3 Shadowing (por qué no es lo mismo que mutar)  
- 3.4 `const` vs `static` (y cuándo `static mut` es una trampa)  
- 3.5 Inferencia de tipos vs anotación explícita  
- 3.6 Buenas prácticas de nombres  

### Capítulo 4. Tipos escalares y el sistema binario “justo a tiempo”
- 4.1 Enteros: `i*`, `u*`, `isize`/`usize`, literales, overflow (debug vs release)  
- 4.2 Flotantes: `f32`/`f64`, precisiones y trampas  
- 4.3 `bool` y `char` (Unicode, no “un byte”)  
- 4.4 Operadores aritméticos, comparación, lógicos  
- 4.5 Bitwise y desplazamientos *(intro; profundidad en cápsula)*  
  - 🚀 Overflow en sistemas embebidos / IoT  
  - 🚀 Cuantización ligera con bitwise (IA “de bolsillo”)

### Capítulo 5. Tipos compuestos fijos
- 5.1 Tuplas: agrupar sin nombrar  
- 5.2 Arrays `[T; N]`: contigüidad y tamaño conocido  
- 5.3 Desestructuración básica  
- 5.4 Bounds checking: qué protege Rust (y el costo)  
- 5.5 Type aliases  

### Capítulo 6. Control de flujo
- 6.1 `if` / `else` como expresión  
- 6.2 `loop`, `while`, `for`  
- 6.3 `break` / `continue` con valores  
- 6.4 `match` introductorio (sin enums complejos aún)  
- 6.5 `if let` / `while let` (primer contacto)  

### Capítulo 7. Funciones
- 7.1 `fn`, parámetros, retorno  
- 7.2 Expresión final vs `return`  
- 7.3 Statements vs expressions (refuerzo)  
- 7.4 Documentar con `///` y ejemplos en docs  
- 7.5 Visibilidad mínima (`pub` preview)  
- 7.6 División en funciones: cómo no escribir “main de 200 líneas”  

**Lab B:** programa de consola con menú simple (sin heap dinámico complejo aún).

---

## Parte I-C — Memoria: el corazón de Rust

### Capítulo 8. Stack, heap y el modelo físico
- 8.1 La ilusión del “solo variables”  
- 8.2 Stack: frames, LIFO, tamaño conocido  
- 8.3 Heap: asignación dinámica, por qué cuesta  
- 8.4 Metadatos en stack + bytes en heap (`String` como primer ejemplo)  
- 8.5 Jerarquía de caché en 1 idea (locality)  
  - 🚀 Discord / estructuras alineadas a caché (historia breve)

### Capítulo 9. Ownership (propiedad)
- 9.1 Las tres reglas de oro  
- 9.2 Move semantics: transferir, no “copiar en silencio”  
- 9.3 `Copy` vs `Clone` vs move  
- 9.4 Ownership y funciones (pasar / devolver valores)  
- 9.5 Scope y `Drop` (RAII en una página)  
- 9.6 Diagramas antes/después (el sello del libro)  
- Analogía canónica: las llaves de la casa  

### Capítulo 10. Borrowing y referencias
- 10.1 `&T` y `&mut T`  
- 10.2 Regla de exclusión: muchos lectores **o** un escritor  
- 10.3 Referencias no pueden sobrevivir al dueño (dangling)  
- 10.4 Borrow checker: cómo leer sus errores  
- 10.5 Referencias y funciones  
- 10.6 Slices: `&[T]`, `&str`  

### Capítulo 11. Lifetimes (sin terror)
- 11.1 Qué problema resuelven (en una frase humana)  
- 11.2 Elididos vs explícitos  
- 11.3 Firmas con `'a`  
- 11.4 Estructuras que guardan referencias  
- 11.5 `'static` (lo que es y lo que la gente cree que es)  
- 11.6 Cuándo **no** pelear lifetimes: `clone`, poseer datos, rediseñar  
  - Pragmatismo: hecho > perfecto  

**Lab C:** “mapa de memoria” de un programa que mueve, presta y devuelve `String`/`&str`.

---

## Parte I-D — Modelar el mundo con tipos

### Capítulo 12. Structs
- 12.1 Definición e instanciación  
- 12.2 Campos, mutabilidad, update syntax  
- 12.3 Tuple structs y unit structs  
- 12.4 `impl`, métodos, `Self`  
- 12.5 Métodos encadenados  
- 12.6 `#[derive(Debug, Clone, …)]`  
- 12.7 Padding y layout *(sótano breve)*  

### Capítulo 13. Enums y pattern matching
- 13.1 Enums con y sin datos  
- 13.2 `match` exhaustivo  
- 13.3 Match guards, `@` bindings  
- 13.4 `if let` / `while let` en profundidad  
- 13.5 Enums como máquinas de estado  
- Por qué esto reemplaza muchos “bool flags” y nulls  

### Capítulo 14. Option y Result: la ausencia y el fallo
- 14.1 Por qué no hay `null`  
- 14.2 `Option<T>`: API esencial (`map`, `and_then`, `unwrap_or`, …)  
- 14.3 `Result<T, E>`: el camino del software serio  
- 14.4 El operador `?` y la conversión de errores (intro)  
- 14.5 `panic!`, unwinding vs abort  
- 14.6 Cuándo `unwrap`/`expect` es aceptable (tests, prototipos, invariantes)  

### Capítulo 15. Colecciones del estándar
- 15.1 `String` vs `&str` (la confusión eterna, resuelta)  
- 15.2 `Vec<T>`: crecimiento, capacidad, iteración  
- 15.3 `HashMap` / `HashSet`  
- 15.4 `VecDeque`, `BTreeMap` *(mapa de cuándo)*  
- 15.5 Big O práctico: elegir estructura  
- 15.6 Iterar: `iter` / `iter_mut` / `into_iter`  

### Capítulo 16. Iteradores y estilo idiomático
- 16.1 El trait `Iterator` y la pereza (laziness)  
- 16.2 Adaptadores: `map`, `filter`, `enumerate`, `zip`, …  
- 16.3 Consumidores: `collect`, `fold`, `sum`, `any`, `find`  
- 16.4 Iteradores vs bucles: cuándo cada uno  
- 16.5 Zero-cost: por qué no “parece lento”  

### Capítulo 17. Generics
- 17.1 Funciones y structs genéricos  
- 17.2 Por qué monomorfización = costo cero (idea)  
- 17.3 Restricciones: hacia traits  

### Capítulo 18. Traits
- 18.1 Definir e implementar traits  
- 18.2 Trait bounds y `where`  
- 18.3 Traits del preludio: `Debug`, `Display`, `Clone`, `Default`, `From`/`Into`, `PartialEq`, …  
- 18.4 Trait objects `dyn Trait` vs estático  
- 18.5 Orphan rules *(taller)*  
- 18.6 Supertraits y associated types *(intro)*  

### Capítulo 19. Closures
- 19.1 Sintaxis y captura del entorno  
- 19.2 `Fn` / `FnMut` / `FnOnce`  
- 19.3 `move` closures  
- 19.4 Closures + iteradores (el dúo del día a día)  

### Capítulo 20. Módulos, crates y el mapa del proyecto
- 20.1 Packages, crates, modules  
- 20.2 Árbol de módulos y archivos  
- 20.3 `use`, `pub use`, paths (`crate::`, `super::`, `self::`)  
- 20.4 Visibilidad como diseño de API (y “seguridad de interfaz”)  
- 20.5 Workspaces *(preview)*  
- 20.6 Leer `docs.rs` y documentar tu crate  

### Capítulo 21. Tests en el lenguaje
- 21.1 `#[test]`, `#[cfg(test)]`  
- 21.2 Unit vs integration tests  
- 21.3 Assertions  
- 21.4 Doc-tests  
- 21.5 Organización de tests en un crate real  

### Capítulo 22. Smart pointers esenciales
- 22.1 `Box<T>`  
- 22.2 `Rc<T>` y ciclos + `Weak<T>`  
- 22.3 `RefCell<T>` e interior mutability  
- 22.4 `Deref` / `Drop`  
- 22.5 Cuándo **no** usar smart pointers  

### Capítulo 23. Cierre del Core: el programa “completo pequeño”
- 23.1 Diseño con tipos (enums + structs + Result)  
- 23.2 Separar módulos  
- 23.3 Tests  
- 23.4 CLI de argumentos *(mínimo: `std::env` o `clap` ligero)*  
- 23.5 Checklist idiomático (Clippy, fmt, errores, nombres)  

**Proyecto final Volumen I (elige una pista):**
- Pista A: gestor de tareas en CLI con persistencia JSON  
- Pista B: analizador de logs / contador de palabras avanzado  
- Pista C: mini-crate publicable (utilidad + tests + docs)

---

### Apéndices del Volumen I
- A. Tabla de keywords y operadores  
- B. Los 25 errores de compilador más frecuentes (con traducción)  
- C. Cheat sheet ownership / borrow / slice  
- D. Glosario EN↔ES  
- E. Recursos oficiales y cómo no ahogarse (Book, Reference, Rust by Example, rustlings)

---

# VOLUMEN II — Construyendo programas  
## *Ingeniería, arquitectura y software que se mantiene*

> **Objetivo:** pasar de “sé Rust” a “entrego programas”.  
> **Al terminar:** CLI/TUI/libs con diseño limpio, errores de producción, tests serios, features de Cargo, patrones idiomáticos.  
> **Prerrequisito:** Volumen I (o equivalente).

---

### Capítulo 1. De ejercicio a producto
- 1.1 El ciclo: idea → MVP → feedback → refactor  
- 1.2 Hecho > perfecto (pragmatismo radical)  
- 1.3 Definir el problema y los invariantes  
- 1.4 Cuándo clonar y seguir  

### Capítulo 2. Diseño de crates y APIs
- 2.1 Límites del crate: qué exportas  
- 2.2 Newtypes y type state pattern  
- 2.3 Builder pattern  
- 2.4 Errores como parte de la API (`thiserror` / `anyhow` — cuándo cada uno)  
- 2.5 Feature flags en `Cargo.toml`  
- 2.6 SemVer práctico para humanos  

### Capítulo 3. Manejo de errores de producción
- 3.1 Taxonomía de fallos  
- 3.2 Errores recuperables en profundidad  
- 3.3 Contextos y trazas (`anyhow`, `eyre`, o enfoque std)  
- 3.4 Logging vs tracing (intro; profundidad en Vol III)  
- 3.5 Panics: política de un servicio vs un CLI  

### Capítulo 4. Testing de verdad
- 4.1 Pirámide de tests  
- 4.2 Fixtures y organización  
- 4.3 Tests de propiedades *(intro opcional)*  
- 4.4 Snapshot tests  
- 4.5 Cobertura sin fetish  
- 4.6 CI mental: qué debe pasar antes de merge  

### Capítulo 5. I/O, archivos y texto
- 5.1 `std::fs`, bufers, paths  
- 5.2 Lectura eficiente línea a línea  
- 5.3 Serde: JSON/TOML/YAML  
- 5.4 Encoding y Unicode en la práctica  
- 5.5 Manejo de configuración  

### Capítulo 6. CLI profesionales
- 6.1 Diseño de UX de terminal  
- 6.2 `clap` (derive)  
- 6.3 Códigos de salida, stderr vs stdout  
- 6.4 Colores y progreso *(crates comunes)*  
- 6.5 Empaquetado y distribución básica  

### Capítulo 7. TUI (laboratorio visual)
- 7.1 Modelo de aplicación  
- 7.2 `ratatui` + backend de terminal  
- 7.3 Estado, eventos, render loop  
- **Lab:** dashboard simple (CPU fake / lista / editor mínimo)

### Capítulo 8. Patrones en Rust (sin copiar Java)
- 8.1 Composition over inheritance  
- 8.2 Strategy / visitor con traits  
- 8.3 State machines con enums  
- 8.4 ECS / data-oriented *(idea + cuándo)*  
- 8.5 Anti-patrones comunes en Rust  

### Capítulo 9. Programación “orientada a objetos” en Rust
- 9.1 Qué se parece y qué no  
- 9.2 Encapsulación con módulos  
- 9.3 Polimorfismo: estático vs dinámico  
- 9.4 Por qué no hay herencia clásica (y qué usar en su lugar)  

### Capítulo 10. Generics y traits avanzados (uso diario)
- 10.1 Associated types  
- 10.2 Generic bounds complejos  
- 10.3 Extension traits  
- 10.4 Sealed traits  
- 10.5 `From`/`TryFrom` como diseño  

### Capítulo 11. Macros que sí vas a usar
- 11.1 `macro_rules!` para no repetirte  
- 11.2 Macros del ecosistema (`vec!`, `println!`, derive)  
- 11.3 Cuándo **no** hacer macros  
- 11.4 Preview de proc-macros *(puente a Vol IV)*  

### Capítulo 12. Concurrencia de proceso único y paralelismo “simple”
- 12.1 Cuándo necesitas hilos de verdad  
- 12.2 `std::thread` y scoped threads  
- 12.3 Channels (`mpsc`)  
- 12.4 `Mutex` / `RwLock` con cuidado  
- 12.5 Data races: por qué Rust las niega en safe code  
- *(Async profundo → Volumen III)*  

### Capítulo 13. Calidad de código y DevEx
- 13.1 Clippy lints que importan  
- 13.2 `rustfmt` y estilo de equipo  
- 13.3 Documentar el *por qué*  
- 13.4 Benchmarks con `criterion` *(intro)*  
- 13.5 Profiling mental (dónde mirar antes de optimizar)  

### Capítulo 14. Proyecto integrador del Volumen II
**Proyecto (elige una pista):**
- Pista A: CLI + config + tests + release  
- Pista B: TUI de productividad  
- Pista C: biblioteca + binario + features + CI local  

---

### Apéndices del Volumen II
- A. Checklist de release de un crate  
- B. Plantilla de monorepo/workspace  
- C. Mapa de crates del ecosistema “día a día” (serde, clap, anyhow, thiserror, tracing, …)

---

# VOLUMEN III — Rust en backend y sistemas concurrentes  
## *Servicios, async, observación y producción*

> **Objetivo:** construir servicios confiables.  
> **Al terminar:** API HTTP (y opcional gRPC), async idiomático, estado compartido seguro, tracing, despliegue mental de producción.  
> **Prerrequisito:** Volumen I; II muy recomendado.

---

### Capítulo 1. El backend como sistema
- 1.1 Request/response, latencia, throughput, fallos parciales  
- 1.2 Límites de un proceso  
- 1.3 Modelo de amenazas básico (no confíes en la entrada)

### Capítulo 2. Concurrencia en el silicio
- 2.1 Procesos, hilos, cores, scheduling  
- 2.2 `Send` y `Sync`  
- 2.3 Shared-nothing vs shared-memory  
- 2.4 Atomics introductorios *(sin volverse en el libro de atomics)*  
  - 🚀 Thundering herd / retries con jitter  

### Capítulo 3. Async desde cero (sin magia)
- 3.1 Por qué async no es “más hilos mágicos”  
- 3.2 `Future`, polling, waker (modelo mental)  
- 3.3 `async` / `await`  
- 3.4 Runtimes: Tokio (y el mapa del ecosistema)  
- 3.5 `Pin` en una explicación humana  
- 3.6 `spawn`, `JoinHandle`, cancelación  
- 3.7 Errores clásicos: bloquear el runtime, hold de Mutex a través de `.await`  

### Capítulo 4. Tokio en la práctica
- 4.1 Tipos de tasks  
- 4.2 Timers, `select!`, timeouts  
- 4.3 `spawn_blocking`  
- 4.4 Streams  
- 4.5 Recursos: files, TCP  
- 4.6 Graceful shutdown  

### Capítulo 5. HTTP con Axum (o framework equivalente)
- 5.1 Routing y handlers  
- 5.2 Extractors y estado (`Arc`, `State`)  
- 5.3 JSON con Serde  
- 5.4 Middleware  
- 5.5 Validación de entrada  
- 5.6 Errores HTTP bien modelados  
- 5.7 Capas: domain vs transport  

### Capítulo 6. Datos y persistencia
- 6.1 SQL con un cliente idiomático (p. ej. `sqlx`)  
- 6.2 Migraciones  
- 6.3 Pool de conexiones  
- 6.4 Transacciones y fallos  
- 6.5 Caché en proceso vs Redis *(mapa)*  

### Capítulo 7. APIs más allá de REST
- 7.1 gRPC con Tonic *(lab)*  
- 7.2 WebSockets  
- 7.3 Server-sent events *(opcional)*  
- 7.4 Versionado de APIs  

### Capítulo 8. Observabilidad
- 8.1 Por qué `println!` no basta  
- 8.2 `tracing` + subscriber  
- 8.3 Métricas e healthchecks  
- 8.4 Correlación de requests  
- 8.5 Tokio Console *(cápsula)*  

### Capítulo 9. Seguridad de un servicio
- 9.1 Authn/Authz (JWT/sesiones — mapa + un camino)  
- 9.2 Secrets y configuración  
- 9.3 Rate limiting y timeouts  
- 9.4 Dependencias y supply chain (`cargo audit` mental)  
- 9.5 Superficie de ataque y principio de mínimo privilegio  

### Capítulo 10. Rendimiento y robustez
- 10.1 Medir antes de optimizar  
- 10.2 Backpressure  
- 10.3 Timeouts, retries, circuit breaker *(patrones)*  
- 10.4 Load testing básico  
- 10.5 Memory y allocations en hot paths  

### Capítulo 11. Despliegue y operación
- 11.1 Builds release y tamaño del binario  
- 11.2 Contenedores  
- 11.3 Config por entorno  
- 11.4 Señales del SO y shutdown  
- 11.5 Checklist de producción  

### Capítulo 12. Proyecto final Volumen III
**Proyecto canónico:** `tenant-service` o equivalente  
- API Axum  
- Estado compartido seguro  
- Persistencia  
- Tracing  
- Tests de integración  
- Dockerfile  

**Pistas alternativas:**
- Gateway/proxy mínimo  
- Worker de cola + API  
- Servicio de webhooks  

---

### Apéndices del Volumen III
- A. Mapa del ecosistema async 2025–2026  
- B. Plantilla de servicio  
- C. “No hagas esto en async” (lista negra)

---

# VOLUMEN IV — Bajo el capó  
## *Unsafe, FFI, WASM, metaprogramación y labs de sistemas*

> **Objetivo:** poder leer y escribir el Rust que toca bordes peligrosos **con disciplina**.  
> **Prerrequisito:** Volumen I; partes de II–III según lab.

---

### Capítulo 1. El contrato de `unsafe`
- 1.1 Qué garantiza safe Rust  
- 1.2 UB: la cosa que no se negocia  
- 1.3 Invariantes que **tú** debes mantener  
- 1.4 Minimizar y encapsular `unsafe`  

### Capítulo 2. Punteros crudos y layout
- 2.1 `*const T` / `*mut T`  
- 2.2 `size_of` / `align_of` / repr  
- 2.3 Alias y stacked borrows *(idea)*  
- 2.4 Escribir un contenedor pequeño con `unsafe` justificado  

### Capítulo 3. FFI con C
- 3.1 `extern "C"`  
- 3.2 `bindgen` / `cc` crate  
- 3.3 Ownership a través del borde  
- 3.4 Patrón estrangulador (reemplazar legado poco a poco)  

### Capítulo 4. WebAssembly
- 4.1 Modelo de memoria WASM  
- 4.2 `wasm-bindgen` / empaquetado  
- 4.3 Cuándo WASM gana (y cuándo no)  
- 4.4 Lab: módulo de cómputo en el navegador  
  - 🚀 Buffers circulares / aritmética modular  

### Capítulo 5. Metaprogramación
- 5.1 AST mental  
- 5.2 `macro_rules!` avanzado  
- 5.3 Derive / attribute / function-like proc macros  
- 5.4 Cuándo generar código vs diseñar mejor la API  

### Capítulo 6. Concurrencia de bajo nivel (selectivo)
- 6.1 Atomics y memory ordering (mapa + un ejemplo)  
- 6.2 Lock-free: promesas y mentiras  
- 6.3 Lectura guiada de `Arc` / channel internals *(opcional)*  

### Capítulo 7. Embedded / no_std *(pista opcional)*
- 7.1 `no_std` y `alloc`  
- 7.2 Target triples y cross-compilation  
- 7.3 Primer binario embebido conceptual  

### Capítulo 8. Laboratorio táctico de seguridad
- 8.1 Mentalidad ofensiva/defensiva  
- 8.2 Escáner de puertos async (proyecto)  
- 8.3 Crypto: lo que debes **usar** (crates auditadas) vs lo que no debes inventar  
- 8.4 Side channels: idea y mitigaciones de tiempo constante  
- 8.5 Lectura de CVEs de memoria y cómo Rust las evita en safe code  

### Capítulo 9. Hacia el compilador y el ecosistema
- 9.1 Ediciones de Rust  
- 9.2 Cómo leer RFCs sin ahogarse  
- 9.3 Contribución open source (primer PR mental)  

---

### Apéndices del Volumen IV
- A. Lista de UB frecuentes  
- B. Checklist de review de `unsafe`  
- C. Mapa “Rustonomicon → capítulos de esta serie”

---

# Mapa de la serie (vista de una página)

```
VOL 0  Mapa y mentalidad
        │
        ▼
VOL I  Core Rust ──────────────────────────────────────────────┐
        │  lenguaje · memoria · tipos · traits · tests · smart ptr
        ▼                                                      │
VOL II Construyendo programas                                  │
        │  APIs · CLI/TUI · errores · patrones · calidad       │
        ▼                                                      │
VOL III Backend y sistemas concurrentes                        │
        │  threads · async · Axum · datos · tracing · prod     │
        ▼                                                      │
VOL IV  Bajo el capó                                           │
           unsafe · FFI · WASM · macros · labs de sistemas     │
                                                               │
        (cápsulas de silicio/CS repartidas JIT en I–IV)  ◄─────┘
```

---

# Qué entra en cada “capa de profundidad” (para no abrumar)

| Tema | Vol I | Vol II | Vol III | Vol IV |
|------|:-----:|:-----:|:------:|:------:|
| Ownership / borrow | ●●● | ● | ● | ●● |
| Tipos / enums / traits | ●●● | ●● | ● | ● |
| Tests | ●● | ●●● | ●● | ● |
| CLI / producto | ● | ●●● | ● |  |
| Async / Tokio |  | ● | ●●● | ● |
| HTTP / Axum |  |  | ●●● |  |
| unsafe / FFI |  |  |  | ●●● |
| Crypto / hacking lab | cápsula |  | ● | ●●● |
| Bits / cache / Big O | JIT | ● | ● | ●● |

● = presencia · más puntos = más profundidad

---

# Proyectos “jefes finales” (dopamina de la serie)

| Volumen | Proyecto jefe |
|--------:|---------------|
| I | CLI de dominio + tests + módulos limpios |
| II | CLI o TUI “de producto” + errores + features + checklist release |
| III | Microservicio completo (API + DB + tracing + Docker) |
| IV | Lab dual: crate `unsafe` encapsulado **o** scanner/WASM/FFI |

---

# Correspondencia con lo que ya tienes en el repo

| Material actual | Aterriza en |
|-----------------|-------------|
| `book-old-migrate` + `src/chapters/*` | **Volumen I** (cantera principal) |
| `MODULE_I` (orden didáctico) | **Volumen I**, Partes A–C |
| `docs/TABLA_DE_CONTENIDO.md` (ambiciosa) | Serie completa; Parte II–III del doc viejo → **Vol III**; labs → **Vol IV** |
| `docs/FUNDAMENTOS_CS.md` | **JIT en Vol I** + apéndices/cápsulas; crypto profundo → **Vol IV** |
| `docs/VISION.md` / `AI_CONTEXT.md` | **Volumen 0** + estilo de toda la serie |
| Leptos / interactivos | Acompañamiento web del Vol I–II (no bloquea el PDF) |
| `leptos-tutorial`, demos | Labs y demos, no el hilo del core |

---

# Definición de “completo” (criterio de cierre)

Un volumen está **completo** cuando:

1. Cubre todos los capítulos de su TOC (aunque alguna cápsula quede corta).  
2. Tiene **un proyecto final** real.  
3. Tiene apéndices de supervivencia (errores, glosario, checklist).  
4. Un lector del perfil objetivo puede terminar sin consultar 20 pestañas.  
5. El siguiente volumen no reexplica el core: solo enlaza.

---

# Orden de escritura recomendado (para no eternizarte)

1. **Volumen 0** (corto, cierra la promesa y el mapa)  
2. **Volumen I** completo (tu producto principal)  
3. **Volumen II** (te diferencia del Rust Book puro)  
4. **Volumen III** (backend: lo que mucha gente busca trabajar)  
5. **Volumen IV** (autoridad de sistemas; no frena los anteriores)

---

# Título de trabajo por volumen (portadas)

| Vol | Título | Subtítulo |
|----:|--------|-----------|
| 0 | *El mapa* | Cómo aprender Rust sin perderte |
| I | *Core Rust* | Memoria, tipos y el poder del compilador |
| II | *Construyendo programas* | Del snippet al software que se mantiene |
| III | *Rust en el servidor* | Async, APIs y sistemas que aguantan producción |
| IV | *Bajo el capó* | Unsafe, FFI, WASM y laboratorios de sistemas |

**Nombre de serie unificado:** *Software seguro con Rust* · *Diviértete reescribiendo el mundo*

---

*Documento canónico de la serie. Sustituye la ambigüedad entre `TABLA_DE_CONTENIDO.md` (visión monolítica), `MODULE_I` (camino clásico) y `chapters/` (cantera). Una sola brújula; cuatro (más el mapa) entregables.*
