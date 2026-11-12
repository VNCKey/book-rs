#import "/src/config/global.typ": *
#import "@preview/meander:0.4.2"

#let my-img-1 = image("../assets/Cloudflare.svg", width: 45pt)
#let my-img-2 = image("../assets/microsoft.svg", width: 45pt)
#let my-img-3 = image("../assets/Google.svg", width: 45pt)
#let my-img-4 = image("../assets/AWS.svg", width: 45pt)

= El Hardware y los Cimientos del Software<intro>

#columns(2)[
	La programación moderna nos ha acostumbrado a trabajar detrás de múltiples capas de abstracción. Aunque estas capas nos permiten construir software rápidamente sin preocuparnos por los detalles del hardware, también pueden hacernos perder de vista los principios fundamentales de la máquina. Al aprender un lenguaje de bajo nivel como Rust, ignorar estos fundamentos ya no es una opción; comprender qué ocurre en la memoria y en el procesador no solo es necesario, sino indispensable para dominar el lenguaje.

	Porque llego Rust?

	En un comienzo solo era una maquina cuya "programacion" era conectar y desconcetar cables la famosa ENIAC, con el tiempo surgieron los lenguages ensambladores que permitieron escribir instrucciones en un idioma mas comprensible acercando al programador el comportamiento de la maquina de forma legible.

	Esta primera evolucion  dio paso a una cadena de  avances y ideas que nos acercarian a rust como;

	Fortan

	Al comienzo unicamente era una computadora llamada eniac que programar era conecctar y desconcetar cables no llego hasta los lenguages de asembly que pudimos escribir en un idioma mas iterativo y compresnsivo

	#titulo_falso[Historia]
  En 2006, Graydon Hoare llegó a su edificio y encontró el ascensor fuera de servicio por un fallo de software. Obligado a subir 21 pisos a pie, reflexionó sobre cómo muchos sistemas críticos seguían dependiendo de herramientas propensas a errores evitables.

  Aquella experiencia cristalizó una idea: crear un lenguaje que priorizara la fiabilidad sin sacrificar el rendimiento. Lo llamó *Rust*, inspirado en el hongo del mismo nombre, famoso por su resistencia en entornos hostiles.

  *El problema que Hoare identificó no era nuevo, pero su enfoque sí lo sería.*

  // Aprovechamos tu diseño de citas en global.typ para darle máximo impacto
  #quote(
    block: true,
  )[¿Y si fuera posible combinar el rendimiento y el control de C con garantías de seguridad de memoria integradas en el lenguaje?]

  Durante décadas, esa disyuntiva pareció insalvable. Rust demostró lo contrario.

  #titulo_falso[¿Qué es Rust?]
  Rust es un lenguaje de programación de sistemas que permite crear todo tipo de aplicaciones. Integra las abstracciones modernas y la sintaxis expresiva propias de un lenguaje de alto nivel, lo que garantiza una excelente productividad con un control fino sobre el hardware para asegurar la seguridad en memoria, el rendimiento y la eficiencia.

  Esta convergencia da lugar a un nuevo paradigma, concebido para construir software confiable y capaz de manejar concurrencia segura sin temor a errores catastróficos.

  #titulo_falso[¿Qué lo hace diferente?]
  A diferencia de lenguajes de alto nivel como Java o Python, que incorporan un recolector de basura que introduce pausas e imprevisibilidad, Rust opera sin él. Y a diferencia de lenguajes de bajo nivel como C o C++, donde la gestión manual de memoria es poderosa pero propensa a errores fatales, Rust ofrece un enfoque revolucionario: reglas y conceptos verificados en tiempo de compilación que garantizan seguridad sin sacrificar rendimiento.

  Gracias a su compilador estricto, Rust previene problemas como punteros nulos, fugas de memoria, accesos indebidos y, en especial, data races en entornos concurrentes. El resultado es un lenguaje tan cercano al hardware como C, pero con comodidades modernas y la tranquilidad de que gran parte de los errores más difíciles de depurar simplemente no pueden ocurrir.

  #titulo_falso[¿Para qué sirve?]
  Con Rust es posible desarrollar una amplia variedad de aplicaciones: desde programas de consola, servidores web, software embebido e IoT, hasta aplicaciones de escritorio, herramientas CLI, videojuegos, e incluso sistemas operativos y controladores.

  // Usamos 1fr para empujar la imagen al final de la columna si hay espacio
  #v(1fr)
  #align(center)[
    #image("/src/assets/mainlogo.jpg", width: 60%)
  ]
]

// Opcional: Si quieres que la "Adopción" empiece siempre en una página nueva y limpia
// #pagebreak()

// Volvemos a 1 columna
#set page(columns: 1)

#titulo_principal_falso[Adopción en la industria]

#columns(2)[
  En 2024, Rust fue nombrado el "lenguaje más querido" por octavo año consecutivo en la encuesta de Stack Overflow. Pero más allá de la popularidad, su adopción responde a hechos concretos: Amazon, Google, Microsoft y Meta lo utilizan en producción para componentes donde la seguridad y el rendimiento son innegociables.

  Ejemplos de empresas que usan Rust:

  #v(1em)

  // Grid 2x2 para un look de tarjetas modernas
  #grid(
    columns: 1,
    gutter: 16pt,
    align: top,

    // Tarjeta Cloudflare
    block(
      inset: 12pt,
      stroke: 1pt + rust-orange.lighten(40%),
      fill: rgb("#FAFAFA"),
      width: 100%,
    )[
      #stack()[
        #text(size: 14pt, fill: rgb("#fc0048"), weight: "bold")[Cloudflare]

        #meander.reflow({
          import meander: *

          // As many obstacles as you want
          placed(top + right, my-img-1)
          // The container wraps around all
          container()
          content[
            #set par(justify: true)
            Reemplazó su proxy NGINX por Pingora, un marco de trabajo propio escrito en Rust. El resultado fue una reducción del 70% en el uso de CPU y del 67% en el uso de memoria para el mismo volumen de tráfico#cite(<cloudflare2022pingora>).
          ]
        })
      ]
    ],

    // Tarjeta Microsoft
    block(
      inset: 12pt,
      stroke: 1pt + rust-orange.lighten(40%),
      fill: rgb("#FAFAFA"),
      width: 100%,
    )[
      #stack()[
        #text(size: 14pt, fill: rgb("#fc0048"), weight: "bold")[Microsoft]

        #meander.reflow({
          import meander: *

          // As many obstacles as you want
          placed(top + right, my-img-2)
          // The container wraps around all
          container()
          content[
            #set par(justify: true)
            Está adoptando Rust para componentes del kernel de Windows 11. Su CTO señaló que el código en Rust es "más fácil de mantener, más fiable y más sencillo de evolucionar" en comparación con C++.
          ]
        })
      ]
    ],

    // Tarjeta Google
    block(
      inset: 12pt,
      stroke: 1pt + rust-orange.lighten(40%),
      fill: rgb("#FAFAFA"),
      width: 100%,
    )[
      #stack()[
        #text(size: 14pt, fill: rgb("#fc0048"), weight: "bold")[Google]

        #meander.reflow({
          import meander: *

          // As many obstacles as you want
          placed(top + right, my-img-3)
          // The container wraps around all
          container()
          content[
            #set par(justify: true)
            Dentro de Android, la adopción de Rust ha logrado una reducción del 68% en las vulnerabilidades de seguridad de memoria, y hasta la fecha no se ha reportado ni una sola en su nuevo código de Rust.
          ]
        })
      ]
    ],
    v(1em),
    // Tarjeta AWS
    block(
      inset: 12pt,
      stroke: 1pt + rust-orange.lighten(40%),
      fill: rgb("#FAFAFA"),
      width: 100%,
    )[
      #stack()[
        #text(size: 14pt, fill: rgb("#fc0048"), weight: "bold")[AWS]

        #meander.reflow({
          import meander: *

          // As many obstacles as you want
          placed(top + right, my-img-4)
          // The container wraps around all
          container()
          content[
            #set par(justify: true)
            Utiliza Firecracker, un entorno de virtualización ligero escrito en Rust, para ejecutar trillones de funciones Lambda al mes. Su código base es de solo ~50k líneas, frente a las >1.4M de líneas.
          ]
        })
      ]
    ],
  )

  Más allá de las grandes corporaciones, la comunidad de desarrollo está impulsando un movimiento masivo conocido coloquialmente como _"Rewrite it in Rust"_ (Reescríbelo en Rust). Lo que comenzó como una tendencia de internet se ha convertido en una estrategia de ingeniería legítima para modernizar la infraestructura de software global.

  * *El Kernel de Linux:* Durante más de 30 años, C fue el único lenguaje permitido para escribir el núcleo del sistema operativo más usado del mundo. Eso cambió recientemente. Linus Torvalds aprobó oficialmente la integración de Rust en el kernel para escribir controladores de dispositivos sin los clásicos errores de memoria. Es un hito histórico en la informática.
  * *La revolución del Frontend y la Web:* El ecosistema de desarrollo web está siendo reconstruido. Herramientas históricas están siendo reemplazadas por alternativas nativas en Rust; por ejemplo, compiladores como SWC y empaquetadores como Turbopack están reduciendo los tiempos de construcción de proyectos web de minutos a simples milisegundos. Además, entornos de ejecución modernos como Deno confían en un núcleo de Rust para garantizar su rendimiento.

  Rust ya no es solo una promesa del futuro; es el motor de la infraestructura moderna.
]
