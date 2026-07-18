# 🛠️ Guía Avanzada de Compilación y Optimización de Binarios (C vs Rust)

Esta guía documenta los experimentos prácticos de bajo nivel realizados en el laboratorio. Sirve como material de referencia para tu libro y guiones de video para YouTube.

---

## 🎯 1. ¿Por qué mi binario de Rust pesa 4.3 MB? (El "Equipaje" de Desarrollo)

Cuando compilas un archivo simple en Rust (`rustc main.rs`), el compilador genera un archivo grande de unos **4.3 Megabytes**. Esto se debe a dos cosas:
1.  **Andamios de desarrollo (Debug Info):** Contiene mapas gigantes (DWARF) que asocian las instrucciones de la CPU con las líneas de tu archivo `.rs` (para que los depuradores sepan dónde ocurrió un error).
2.  **Tabla de Símbolos (`not stripped`):** Mantiene los nombres legibles de todas tus funciones (`main`, `info_escuderia`, etc.).

### ✂️ La Limpieza con `strip`
Al ejecutar el comando `strip`, eliminamos todos estos metadatos que la CPU no necesita para ejecutar el programa:
```bash
strip main
```
*   **Resultado:** El peso cae drásticamente a unos **~340 KB** (esto incluye el ejecutable y la librería estándar `std`).

---

## 💾 2. Estructura de Memoria: ¿Qué miden `size` y `file`?

El comando `size main` nos muestra tres secciones fundamentales de memoria que se cargan en la RAM:

| Sección | Concepto | Analogía (La Cocina) | ¿Ocupa espacio físico en Disco? |
| :--- | :--- | :--- | :--- |
| **`.text`** | Código máquina (instrucciones de CPU). | **El recetario de cocina.** Pasos a seguir. Es de sólo lectura por seguridad. | Sí |
| **`.data`** | Variables globales inicializadas. | **Ingredientes preparados desde casa.** (Ej: `static IVA: f64 = 0.18;`). | Sí |
| **`.bss`** | Variables globales vacías o en cero. | **Platos y envases vacíos.** (Ej: `static mut CONTADOR: i32 = 0;`). | **No (0 bytes)** (El compilador sólo guarda una nota para crearlas en la RAM al iniciar). |

---

## 💀 3. Rust en Modo "Puro Metal" (2.2 KB)

Para igualar o superar el tamaño mínimo de C, podemos apagar toda la infraestructura automática de Rust (la librería estándar `std` y el runtime de inicio) y comunicarnos directamente con el Kernel de Linux usando **Llamadas al Sistema (Syscalls) en Ensamblador**.

### El Código (`main_nostd.rs`):
```rust
#![no_std]   // Apaga la librería estándar (quita el soporte de I/O, hilos, etc.)
#![no_main]  // Apaga el inicio automático estándar de Rust

use core::arch::asm;

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}  // En caso de pánico, congelamos el procesador
}

// Punto de entrada crudo para el Kernel de Linux
#[no_mangle]
pub extern "C" fn _start() -> ! {
    let msg = b"Hola Mundo desde Puro Metal!\n";
    unsafe {
        // 1. Syscall sys_write (Escribir en pantalla)
        asm!(
            "syscall",
            in("rax") 1,                  // Código syscall (1 = sys_write)
            in("rdi") 1,                  // stdout (1 = pantalla)
            in("rsi") msg.as_ptr(),       // Puntero del mensaje
            in("rdx") msg.len(),          // Tamaño del mensaje
            out("rcx") _,
            out("r11") _,
            clobber_abi("system")
        );

        // 2. Syscall sys_exit (Cerrar programa limpiamente)
        asm!(
            "syscall",
            in("rax") 60,                 // Código syscall (60 = sys_exit)
            in("rdi") 0,                  // Código de salida (0 = éxito)
            options(noreturn)
        );
    }
}
```

### Compilación y Limpieza:
Debemos indicarle al compilador que aborte en caso de pánico y al enlazador que no use los archivos de inicio de C (`-nostartfiles`):
```bash
rustc -C panic=abort -C link-arg=-nostartfiles main_nostd.rs
strip main_nostd
```
*   **Resultado final en disco:** **2.2 KB** (El mínimo absoluto para un archivo ELF ejecutable).

---

## 🏎️ 4. La Gran Comparativa: C vs Rust

A menudo se dice que C genera ejecutables más pequeños que Rust. Aquí desmontamos ese mito comparando ambos lenguajes bajo las mismas reglas del juego:

### A. Enlace Dinámico (Dejando las librerías en el Sistema Operativo)
El programa no lleva código dentro; le pide prestada la librería estándar `libc.so` (de ~2 MB) a Linux en tiempo de ejecución.
*   **C Dinámico (`gcc main.c -o main_c_dynamic && strip main_c_dynamic`):** **14.4 KB**
*   **Rust Dinámico (Por defecto tras `strip`):** **~340 KB** (Rust mete su motor de seguridad estáticamente por portabilidad).

### B. Enlace Estático (Empaquetando todo dentro del ejecutable)
El ejecutable es 100% independiente y autónomo. No necesita tener nada preinstalado en el sistema de destino.
*   **C Estático (`gcc -static main.c -o main_c_static && strip main_c_static`):** **758.4 KB**
*   **Rust Estático (Optimizado para tamaño):** **288.3 KB**

> 🏆 **Conclusión:** Cuando ambos se compilan de forma estática, **Rust es casi 3 veces más pequeño que C**. Esto se debe a que Rust (mediante LLVM) realiza Link-Time Optimization (LTO) para borrar todo el código de la librería estándar que no utilices, mientras que C copia bloques enteros de la librería de C estándar sin poder recortarlos de forma tan eficiente.

### C. Bandera de optimización extrema en Rust (con `std`):
Si quieres exprimir tu código de Rust estándar al mínimo tamaño, usa este comando:
```bash
rustc -C opt-level=z -C lto -C codegen-units=1 -C panic=abort -C strip=symbols main.rs
```

---

## 🗺️ 5. Portabilidad del Binario Generado

Una pregunta clave: **¿El binario generado sólo sirve para otra máquina Linux?**

**Sí, este binario es específico.** Está atado a dos factores:

1.  **El Formato del Sistema Operativo (ELF):** 
    Este binario compilado en Linux genera un formato **ELF** (Executable and Linkable Format). Sólo los sistemas operativos basados en el Kernel de Linux saben cómo leer e iniciar este archivo. No funcionará nativamente en:
    *   **Windows** (que requiere formato PE/`.exe`).
    *   **macOS** (que requiere formato Mach-O).
2.  **La Arquitectura del Procesador (x86-64):**
    El código máquina generado (`.text`) está escrito con instrucciones específicas para procesadores Intel o AMD de 64 bits. No funcionará nativamente en:
    *   **Procesadores ARM** (como la Raspberry Pi, iPhones, o los procesadores Apple Silicon M1/M2/M3), a menos que uses un emulador como QEMU.

### Diferencia de Portabilidad entre Dinámico y Estático (dentro de Linux):
*   **El binario dinámico (`main_c_dynamic`):** Sólo funcionará en otras distribuciones de Linux que tengan exactamente la misma versión (o una más nueva) de la librería de C (`glibc`). Si lo llevas a un Linux muy viejo o a un sistema minimalista como Alpine Linux (que usa `musl` en vez de `glibc`), el programa fallará al abrirse.
*   **El binario estático (`main_c_static` o tu Rust de 288 KB):** Es **altamente portable**. Como lleva todo su código por dentro y no depende de ningún archivo del sistema, funcionará en **cualquier distribución de Linux con procesador x86-64**, desde un Ubuntu de hace 10 años hasta el contenedor Docker más minimalista.
