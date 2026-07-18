# 🎬 Guion de Video: Desmitificando Rust vs C vs Python (Tamaño y Rendimiento)

Este guion está diseñado para un video educativo de YouTube de ritmo dinámico, pero también sirve como estructura de diapositivas para tus alumnos. Combina explicaciones sencillas, analogías cotidianas y código en vivo.

---

## 📌 Datos Técnicos de la Presentación:
*   **Título Sugerido:** "¿Por qué Rust pesa 4MB y C sólo 14KB? (Desmitificando el bajo nivel)"
*   **Enfoque:** Educativo, dinámico y basado en experimentos reales.
*   **Objetivo:** Demostrar que Rust no es pesado, explicar cómo funciona la memoria y cómo optimizar binarios al extremo.

---

## 🎭 Escena 1: El Gancho (The Hook)
**[Visual: Tú en cámara, mostrando dos números gigantes en pantalla o pizarra: "C: 14 KB" y "RUST: 4.3 MB"]**

*   **Locución:** "Seguramente has escuchado que Rust es el lenguaje del futuro: rápido, seguro y moderno. Pero cuando compilas tu primer 'Hola Mundo' en Rust... ¡pesa más de 4 Megabytes! Mientras que el mismo programa en el viejo lenguaje C pesa sólo 14 Kilobytes. ¿Es Rust un lenguaje pesado y lleno de basura? Hoy vamos a meter las manos en el silicio, vamos a hackear el compilador y te voy a demostrar cómo reducir un ejecutable de Rust a tan solo 2 Kilobytes, superando al mismísimo C. ¡Comencemos!"

---

## 📜 Escena 1.5: De Agujeros en Cartón al Silicio (La Evolución de la Abstracción)
**[Visual: Imagen histórica de una tarjeta perforada (punched card) de IBM y luego un plano antiguo de cables de ENIAC]**

*   **Locución:** "Pero antes de hackear el compilador, hagamos un viaje rápido en el tiempo. Programar no siempre fue escribir texto bonito en una pantalla. En los años 40, programar era un trabajo físico: significaba conectar **cables eléctricos en paneles gigantes** (como en la ENIAC) o literalmente hacer **agujeros en tarjetas de cartón**."
*   **La física del cartón:** "Si había un agujero físico en el cartón, la máquina dejaba pasar la corriente eléctrica: un `1`. Si no había agujero, el cartón bloqueaba la electricidad: un `0`. Eso es el código binario en su forma más pura y táctil. Con el tiempo, cambiamos el cartón por transistores de silicio dentro de la CPU, inventamos el Ensamblador, luego el lenguaje C para no tener que escribir instrucciones de procesador a mano, y finalmente lenguajes seguros como Rust. Pero al final del día, todo sigue reduciéndose a lo mismo: decirle a la CPU cuándo dejar pasar la corriente."

---

## 🛠️ Escena 1.8: El Viaje del Código (Assembly: El Paso Antes del Binario)
**[Visual: Gráfico animado mostrando una flecha que viaja: main.rs ➔ main.ll ➔ main.s ➔ main.o ➔ main (ejecutable)]**

*   **Locución:** "Pero, ¿cómo pasa tu código en Rust a convertirse en esos impulsos eléctricos? El compilador no hace magia instantánea; hace un viaje de cinco paradas:"
*   **Las cinco paradas del compilador:**
    1.  **Código Fuente (`.rs`):** "El código de alto nivel que escribimos nosotros ([main.rs](file:///home/alek/VNC/book-rs/rust/rustc/main.rs))."
    2.  **Representación Intermedia (`.ll`):** "Rust lo traduce a LLVM IR ([main.ll](file:///home/alek/VNC/book-rs/rust/rustc/main.ll)), un lenguaje intermedio para optimizar el rendimiento."
    3.  **Código Assembly (`.s`):** "LLVM traduce el código intermedio a instrucciones físicas específicas de tu chip Intel, AMD o ARM ([main.s](file:///home/alek/VNC/book-rs/rust/rustc/main.s)). **Assembly es el paso justo antes del binario; el último lenguaje legible por humanos.**"
    4.  **Código Objeto (`.o`):** "El ensamblador traduce el Assembly a binario crudo (ceros y unos) dentro de un archivo objeto ([main.o](file:///home/alek/VNC/book-rs/rust/rustc/main.o))."
    5.  **El Ejecutable (`main`):** "El enlazador (linker) une tu código objeto con las funciones del sistema y las librerías, y genera el archivo ejecutable listo para correr en el procesador."

---

## 🕵️‍♂️ Escena 2: Los Andamios de la Compilación (Debug Info y Strip)
**[Visual: Captura de pantalla de la terminal corriendo `ls -lh main` y `file main`]**

*   **Locución:** "Para entender por qué pesa 4.3 MB, tenemos que correr el comando `file` en Linux. Este comando nos revela que el binario tiene `debug_info` y `not stripped`."
*   **Explicación con Analogía:** "Imagina que estás construyendo una casa. El compilador de Rust no sólo te da la casa; te deja puestos los andamios, las escaleras de obra y los planos del arquitecto por si algo falla. Eso es el `debug_info`."
*   **El comando de magia:** "Si corremos el comando de Linux `strip main`, tiramos los andamios a la basura. Y... ¡bum! El archivo cae de **4.3 MB a 340 KB**. Ese es el peso real de nuestro código junto con la librería estándar de Rust."

---

## 🍳 Escena 3: La Anatomía de la Memoria (.text, .data, .bss)
**[Visual: Gráfico simple en pantalla dividiendo la memoria en tres bloques]**

*   **Locución:** "Cuando ejecutamos el comando `size main`, la computadora nos divide el programa en tres cajones de memoria RAM. Y aquí es donde ocurre una analogía muy sabrosa: la cocina."
*   **La analogía:**
    1.  **`.text` (El Recetario):** "Aquí están las instrucciones de la CPU. Es de sólo lectura por seguridad para que nadie pueda envenenar la receta."
    2.  **`.data` (Ingredientes Listos):** "Son variables globales que ya tienen valor desde el inicio (como `static IVA: f64 = 0.18;`). Ocupan espacio físico en el disco duro porque el compilador debe guardar ese '0.18' en el archivo."
    3.  **`.bss` (Platos Vacíos):** "Son variables globales que inician en cero. El compilador es inteligente: no guarda millones de ceros en tu disco. Guarda una nota que dice: 'Cuando abras el programa en la RAM, aparta espacio vacío'. ¡El segmento `.bss` pesa 0 bytes en tu disco!"

---

## 💀 Escena 4: Modo "Puro Metal" en Rust (El Reto de los 2.2 KB)
**[Visual: Código de `#![no_std]` y `#![no_main]` en pantalla con colores llamativos]**

*   **Locución:** "Muchos dicen que C es más ligero porque Rust necesita su librería estándar. Así que... ¿por qué no apagamos el motor de Rust? Con las directivas `#![no_std]` y `#![no_main]` le decimos a Rust: 'No quiero tu ayuda, yo mismo hablaré con el procesador'."
*   **Ensamblador en Rust:** "Escribimos las llamadas al sistema (syscalls) de Linux directamente en Ensamblador usando `asm!`. Cargamos el número `1` en la CPU para escribir 'Hola Mundo' y el número `60` para salir."
*   **Compilación extrema:** "Compilamos desactivando los archivos de inicio de C con `-nostartfiles`. ¿El resultado? Un binario ejecutable que pesa **¡2.2 Kilobytes!** Es tan pequeño que el 95% del archivo son sólo las cabeceras obligatorias de Linux. Hemos vencido a C en su propio juego."

---

## 📦 Escena 5: La Ilusión de Python y las Mudanzas
**[Visual: Tabla comparativa de tamaños en pantalla]**

*   **Locución:** "Y si nos vamos al otro extremo... ¿qué pasa con Python? Si empaquetamos un 'Hola Mundo' de Python con PyInstaller para enviárselo a un amigo... ¡el archivo pesa **9.4 Megabytes**!"
*   **Analogía:** "Hacer un ejecutable en Python es como enviar una carta metida dentro de un camión de mudanzas gigantesco. Como la computadora de tu amigo no tiene Python, el archivo tiene que llevar el intérprete (el motor) completo y todas las librerías estándar por dentro. Por eso, para binarios ligeros y portables, los lenguajes de sistemas como Rust y C son insuperables."

---

## 🏎️ Escena 6: La Carrera de Velocidad (Rust vs C con `hyperfine`)
**[Visual: Pantalla dividida con el código de primos en Rust y C. Luego la terminal corriendo `hyperfine`]**

*   **Locución:** "Ya sabemos de tamaños, pero... ¿y la velocidad? Escribimos un algoritmo idéntico en C y Rust para calcular 2 millones de números primos."
*   **Carrera 1 (C gana):** "En la primera carrera, C gana por un 24%. ¿Por qué? Porque en Rust usamos `for i in 2..=limit`. El rango inclusivo `..=` mete validaciones de seguridad internas para evitar desbordamientos. Rust prioriza tu seguridad por defecto."
*   **Optimización (while + f32):** "Hacemos un ajuste quirúrgico: cambiamos el bucle `for` por un `while` directo (quitando la seguridad del iterador) y bajamos la precisión matemática a 32 bits (`f32` / `sqrtf` en C) para que la carrera sea 100% justa."
*   **Carrera 2 (Rust gana):** "Volvemos a correr `hyperfine`... ¡y Rust gana siendo un **6% más rápido** que C!"
*   **La explicación final:** "Rust gana porque usa el optimizador moderno LLVM. Al tener la garantía de que no hay punteros duplicados en memoria (*no-aliasing*), LLVM mantiene los datos en los registros ultra rápidos de la CPU y realiza una inserción en línea (*inlining*) de la función de forma mucho más agresiva que el compilador de C."

---

## 🎬 Escena 7: Conclusión
**[Visual: Tú de nuevo en cámara con un resumen visual]**

*   **Locución:** "La gran paradoja es que la seguridad de Rust no lo hace lento; al contrario, le da tanta información de exclusividad al compilador que este puede generar el código máquina más rápido del planeta. Así que la próxima vez que te digan que Rust genera archivos pesados o que es más lento que C, enséñales este video. ¡Suscríbete para más contenido de bajo nivel y nos vemos en el próximo byte!"

---

## 💡 Detrás de cámaras / Nota técnica (Para el programador)
*   **El misterio de los archivos sueltos en el editor:** Si abres este proyecto en un editor moderno (como Zed) y editas los archivos `main.rs` o `main_nostd.rs` de esta carpeta, notarás que tu analizador de código (`rust-analyzer`) no te marca errores ni autocompleta correctamente.
*   **La explicación técnica:** Esto ocurre porque `rust-analyzer` depende fuertemente de **Cargo** (`Cargo.toml`) para configurar el sysroot, resolver dependencias y analizar el código en su contexto. Como en esta carpeta de experimentos estamos compilando de forma manual usando el compilador de bajo nivel `rustc` directamente, no tenemos un archivo de proyecto de Cargo. ¡Para que las herramientas de ayuda del editor funcionen siempre debemos trabajar dentro de un proyecto gestionado por Cargo!
*   **La portabilidad móvil de Rust (Android e iOS):** Una de las mayores ventajas de la compilación nativa de Rust es que el mismo código de lógica de negocio, criptografía o motores de juegos puede compilarse directamente para teléfonos móviles. Usando destinos de compilación (*targets*) como `aarch64-linux-android` (para Android) y `aarch64-apple-ios` (para iOS), generamos una librería nativa (`.so` o `.dylib`). Luego, la app en Java/Kotlin (Android) o Swift (iOS) carga esta librería y ejecuta el código Rust directamente sobre el procesador ARM del teléfono a la máxima velocidad posible, sin necesidad de intérpretes ni máquinas virtuales.
