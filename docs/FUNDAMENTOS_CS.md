# 📖 PARTE 0 (Suplemento Teórico): Fundamentos de Ciencias de la Computación y Hardware (El Silicio y los Bits)

### Capítulo 1: La Anatomía del Bit y el Idioma del Hardware
* **1.1 El Sistema Binario y Hexadecimal**: Representación física de la información y estados eléctricos en los registros de la CPU.
  * 🚀 _Cápsula de Aplicación (Ciberseguridad)_: Anatomía de un Shellcode. Cómo los analistas de malware usan el sistema hexadecimal para auditar bytes crudos en memoria y evadir firmas de antivirus.
* **1.2 Memoria RAM, Direccionamiento y Memoria Virtual**: Mapeo del espacio físico de almacenamiento por el sistema operativo.
  * 🚀 _Cápsula de Aplicación (Kernel de Linux)_: Aislamiento del Núcleo. Por qué escribir controladores (drivers) en Rust dentro del Kernel evita los pánicos de sistema y los ataques de escalada de privilegios.
* **1.3 La Jerarquía de Memoria**: Memoria RAM vs. Caché de la CPU ($L1, L2, L3$). El impacto crítico de los Cache Hits y Cache Misses.
  * 🚀 _Cápsula de Aplicación (Alta Disponibilidad)_: La hazaña de Discord. Cómo la eliminación del Garbage Collector y el diseño de estructuras alineadas a la caché permitieron procesar millones de usuarios reduciendo drásticamente la factura de servidores.
* **1.4 Los Límites del Contenedor**: Anatomía del almacenamiento de datos y el peligro latente del Desbordamiento de Enteros (Integer Overflow).
  * 🚀 _Cápsula de Aplicación (Automoción e IoT)_: El bug que destruye hardware. Cómo un desbordamiento de enteros puede descalibrar un microcontrolador en el sistema de frenos de un auto autónomo, y cómo Rust lo previene en compilación.
* **1.5 Operaciones Lógicas a Nivel de Bits (Bitwise)**: Control total de compuertas con AND, OR, XOR y NOT.
  * 🚀 _Cápsula de Aplicación (Inteligencia Artificial)_: Cuantización de Modelos de IA. Cómo el bitwise permite recortar los pesos de una Red Neuronal de 32 bits a solo 4 bits para correr inferencia a velocidad ráfaga en hardware limitado.
* **1.6 Desplazamientos de Bits (<< y >>)**: Multiplicación y división por hardware, truncamiento y la caída de bits al vacío.

### Capítulo 2: Teoría de Números Aplicada a la Infraestructura de Sistemas
* **2.1 Aritmética Modular**: La lógica de reloj y el operador residuo (`%`).
  * 🚀 _Cápsula de Aplicación (WebAssembly)_: Buffers Circulares e I/O Eficiente. Diseño de estructuras de datos criptográficas en la RAM que reutilizan el mismo espacio de memoria infinitamente dentro de sandboxes web.
* **2.2 Motores de Optimización Aritmética**: El Máximo Común Divisor (MCD) mediante el Algoritmo de Euclides y su aplicación en el diseño de buffers de memoria.
* **2.3 El Mínimo Común Múltiplo (MCM)**: Predicción de colisiones y sincronización de tareas.
  * 🚀 _Cápsula de Aplicación (Backend)_: Estrategias de Reintento con Jitter. Cómo evitar el colapso de frecuencias (Thundering Herd Problem) cuando miles de hilos asíncronos intentan acceder al mismo recurso de hardware a la vez.

### Capítulo 3: Los Ladrillos Atómicos de la Ciberseguridad
* **3.1 Números Primos y Factorización**: El corazón matemático de la Criptografía Asimétrica y el algoritmo RSA.
  * 🚀 _Cápsula de Aplicación (Ethical Hacking)_: Generación e Interceptación de llaves. El proceso matemático real detrás de las llaves SSH y el protocolo de enrutamiento criptográfico de WireGuard mediante curvas elípticas.
* **3.2 Funciones de Trampa (Trapdoor Functions)**: Por qué es computacionalmente instantáneo multiplicar pero imposible de revertir por fuerza bruta.
* **3.3 Mitigación en el Servidor**: Introducción a los ataques de canal lateral (Side-Channel Attacks).
  * 🚀 _Cápsula de Aplicación (Hacking Avanzado)_: Ataques de Sincronización. Cómo los atacantes miden los ciclos de reloj que tarda la CPU en procesar un byte para robar credenciales, y cómo mitigarlo escribiendo código de tiempo constante $O(1)$.

### Capítulo 4: Análisis de Algoritmos y la Eficiencia del Código
* **4.1 Sucesiones y Progresiones**: Crecimiento aritmético (lineal) frente a crecimiento geométrico (exponencial).
* **4.2 Introducción a la Notación Big O**: Medición del comportamiento de funciones a nivel de registros de la CPU y uso de memoria física.
* **4.3 El Superpoder de los Logaritmos**: Anatomía de la Búsqueda Binaria y optimización extrema de la caché evitando saltos erráticos en la RAM.
