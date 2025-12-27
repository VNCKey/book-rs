Durante más de cinco décadas, los lenguajes de programación de bajo nivel como C y C++ han sido la base
sobre la cual se construyeron componentes críticos de la computación moderna, incluyendo sistemas operativos,
kernels, navegadores y software de alto rendimiento. Su principal fortaleza radica en el control preciso que
ofrecen sobre la memoria y el hardware, lo que permitió alcanzar niveles de eficiencia difíciles de igualar
por otros lenguajes.

Sin embargo, esta misma libertad expuso a los desarrolladores a una realidad compleja y costosa.
La gestión manual de memoria y la falta de garantías de seguridad en el propio lenguaje facilitaron
la introducción accidental de errores graves como buffer overflow, use-after-free, double free y data races.
Estos problemas no solo son difíciles de detectar, sino que han sido históricamente responsables de una gran
parte de las vulnerabilidades de seguridad más críticas en la industria del software.

Frente a este panorama, Graydon Hoare un brillante Ingeniero con amplia experiencia en la corrección de errores
en C y C++ formuló una pregunta tan simple como disruptiva.

¿Por qué los lenguajes de programación permiten errores que, conceptualmente, no deberían ser posibles?

De esta reflexión nació Rust, un lenguaje de programación moderno diseñado desde sus cimientos para prevenir
clases enteras de errores antes de que el programa llegue siquiera a ejecutarse.

Rust introduce un modelo de seguridad de memoria verificado en tiempo de compilación, sin depender de recolectores
de basura del cual se sacrifica rendimiento. El resultado es un lenguaje capaz de ofrecer un desempeño
comparable al de C y C++, pero con garantías mucho más sólidas en términos de seguridad, concurrencia y corrección.

¿Por qué las empresas están apostando por Rust?

La adopción de Rust en la industria no es una moda pasajera, sino una respuesta directa a problemas reales y costosos.
Grandes empresas tecnológicas han comprobado que una proporción significativa de sus vulnerabilidades de seguridad
provienen de errores de memoria. Reducir estos fallos no solo mejora la seguridad, sino que también disminuye
costos de mantenimiento, parches y auditorías.

Empresas como Mozilla, Microsoft, Google, Amazon y Cloudflare han incorporado Rust en componentes críticos de sus sistemas.
En muchos casos, Rust se ha utilizado para reescribir partes sensibles del código originalmente escritas en C o C++,
logrando mejoras sustanciales en seguridad sin perder rendimiento.

Por ejemplo:

- Mozilla desarrolló partes del motor de Firefox en Rust para reducir fallos de memoria.

- Microsoft ha promovido activamente Rust como alternativa segura para el desarrollo de componentes del sistema operativo.

- Google ha integrado Rust en Android y en proyectos de infraestructura donde la seguridad es prioritaria.

- Cloudflare utiliza Rust en servicios de red de alto rendimiento expuestos directamente a Internet.

Estos casos de éxito demuestran que Rust no solo es un lenguaje académico o experimental,
sino una herramienta probada en producción a gran escala.


#include "install.typ"
#include "rust_cargo.typ"
