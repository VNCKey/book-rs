# 🛠️ Asistente de Compilación Interactivo (`compiler-ui`)

Este proyecto es una herramienta visual e interactiva para terminal (TUI) diseñada para ser utilizada en talleres de Rust y videos educativos de bajo nivel. Su propósito es ayudar a los alumnos a entender de forma práctica y en tiempo real cómo el compilador `rustc` transforma el código y cómo afectan las optimizaciones al tamaño de los binarios.

---

## 🎯 Objetivo Final del Proyecto

Queremos crear una interfaz interactiva fluida (60 FPS) que permita:
1. **Ejecutar Recetas de Compilación:** Seleccionar mediante un menú y ejecutar diferentes comandos de bajo nivel (`rustc debug`, `strip`, `llvm-ir`, `assembly`, `opt-level=z`, `no_std`).
2. **Visualizar Tamaños en Tiempo Real:** Mostrar el tamaño del archivo resultante, comparándolo con la versión anterior y calculando el porcentaje exacto de reducción (ej. `4.3 MB -> 340 KB [-92.1%]`).
3. **Modo Monitoreo ("Watch Mode"):** Recompilar automáticamente los archivos de origen (`main.rs` o `main_nostd.rs`) cada vez que se detecte un cambio (guardado) desde el editor de código (VS Code, Zed, etc.).
4. **Ejecución Asíncrona (Multihilo):** Ejecutar las compilaciones en un hilo secundario para evitar que la interfaz de la TUI se congele o se trabe durante procesos lentos como LTO (Link-Time Optimization).

---

## 🏗️ Arquitectura de la Aplicación Final

Para lograr un rendimiento óptimo y evitar bloqueos, utilizaremos una arquitectura multihilo con **canales** (`std::sync::mpsc`):

```
┌────────────────────────────────────────────────────────┐
│               Hilo Principal (TUI)                     │
│  - Dibuja la UI a 60 FPS.                              │
│  - Captura eventos de teclado.                         │
│  - Monitorea archivos modificados.                     │
└───────────┬────────────────────────────────┬───────────┘
            │                                ▲
 Envia orden│(mpsc::Sender)                  │Recibe resultado
 de compilar│                                │(mpsc::Receiver)
            ▼                                │
┌───────────┴────────────────────────────────┴───────────┐
│             Hilo de Compilación (Worker)               │
│  - Ejecuta comandos del sistema (rustc, strip) de      │
│    forma bloqueante de fondo.                          │
│  - Calcula el peso del binario generado.               │
└────────────────────────────────────────────────────────┘
```

---

## 🗺️ Mapa de Ruta: Paso a Paso hacia el Objetivo

### 🟢 Paso 1: El Hola Mundo (Completado)
Aprender la estructura más básica posible de Ratatui usando la API moderna (`ratatui::init` y `ratatui::restore`) para abrir una pantalla cruda, renderizar un texto sencillo y cerrarla con la tecla `q`.

### 🟡 Paso 2: Diseño de Layout y Paneles (Siguiente Paso)
Aprender a dividir la terminal en paneles (menú a la izquierda, detalles a la derecha, ayuda abajo) y manejar un estado interactivo simple (como un contador que reacciona a `Up`/`Down`).

### 🔴 Paso 3: Comandos del Sistema y Tamaños de Archivos
Añadir la capacidad de ejecutar comandos reales (`std::process::Command`) y leer metadatos de archivos (`std::fs::metadata`) para obtener los tamaños en bytes.

### 🟣 Paso 4: Evitar el Congelamiento (Multithreading)
Separar la ejecución pesada de `rustc` en un hilo usando `std::thread::spawn` y comunicar los logs de consola y tamaños de archivos de vuelta al hilo principal usando canales.

### 🔵 Paso 5: El Toque Final (Monitoreo de Cambios)
Implementar una rutina en el bucle principal que compare las marcas de tiempo (`SystemTime`) del archivo `main.rs` para disparar compilaciones automáticas y hacer la experiencia 100% interactiva.
