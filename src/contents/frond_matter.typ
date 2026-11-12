#import "/src/config/global.typ": *

// 1. PORTADILLA
#page(numbering: none)[
  #set align(center)

  #v(15%)

  #text(32pt, weight: "bold")[Software seguro con Rust]

  #v(1em)

  #text(18pt, style: "italic")[Diviértete reescribiendo el mundo]

  #v(4em)

  #text(16pt, weight: "medium")[Villanueva Alarcon, Luis Alexander]

  #v(1fr)

  #image("../assets/rustLogo.svg", width: 50%)

  #v(2em)

  #text(20pt, fill: gray)[Edición 2026]
]

// ... (mantener página de título y copyright) ...

// 2. DEDICATORIA
#page(numbering: none)[
  #v(25%)
  #set align(center)
  #set text(style: "italic", size: 11pt)

  Para aquellos que ven en el código una forma de arte \
  y en la seguridad de memoria una virtud.

  Y mi gran amigo y padre del codigo Benjamin una gran persona que me enseno todo lo que se
]

// 3. PREFACIO
#page[
  #set align(left)

  // Diseño moderno con CeTZ para el título
  #cetz.canvas({
    import cetz.draw: *
    line((0, 1.9), (0, 2.5), stroke: (paint: rust-orange, thickness: 2pt, cap: "round"))
    content((0.3, 2.2), anchor: "west", [#text(24pt, weight: "bold", fill: rust-dark)[PREFACIO]])
    circle((0, 2.5), radius: 0.08, fill: rust-orange, stroke: none)
  })

  #v(1em)

  #columns(2, gutter: 8pt)[
    #par(
      justify: true,
    )[
      Con este libro quiero llevarte a conocer un grandioso lenguage de Programacion en el que muy pronto te sumergiras con las fasinantes capacidades que tiene y resolverte las dudas mas basicas hasta las mas complejas dandote todos los pilares para que tu mismo puedas construir increibles aplicaciones del que quizas no te imagines aun. Te mostrare conceptos pilares estraegias para comenzar con este libro y guiarte de la mejor manera para que estructures tu tiempo metodologia de aprendizaje y que estudies de la mejor manera me dirigire a ty de una forma particular ya que pretendo que Rust sea tu primer lenguage y aunque digan que eso es imposible para nosotros no lo sera descubriras la computacion misma con Rust desde el punto de entrada donde todo no tiene sentido y donde mas adelante todo tendra sentido, no obstante si ya tienes experiencia con el mundo de la programacion este libro tambien es para ty mi enfoque es abarcar todos los escenarios y aunnque no lo creas descubriras que la metodologia de este libro se adapta a ty, solo confia en ty que no solamente yo como autor te guiare sino alguien mucho mas confiable Rust sera tu maestro shaolin jjaja. Tambien quiero aclararte de este libro porque al final decide hacerlo en este viaje bajaremos al sotano de la informatica al reino del hardware crudo y los bits fisicos. No pretendo de que pienses que unicamente te quedes Rust todos son muy importantes y nacieron para resolver una necesidad, lo impresionante de rust esque te deja claro que la computacion no es magica de recursos infinitos, te ensenare lo importante de cada concepto. Posiblemente jugaste algun videojuego te intereso como son los hackers como se hacen ciertas aplicaciones como las protegen lo importante que es que tengas una aplicacion rapida y que no se cuelge o mayor aun un video juego que nose lagee, la computadora es un conjunto masivo de interruptores electricos un cero y un 1 todo lo que se pueda construir procesa millones de transacciones es una danza coordinada de electrones moviendose a travez de registros buses y compuertas logicas. Ser un programador de elite significa entender este idioma discreto. Significa saber que cuando guardas datos en la memoria , estas reclamando fisicamente un spacio de transistores reales.
      Humanamente somos capaces de hacer algo incorrecto por accidente como por ejemplo durante mucho tiempo la unica manera para buscar crear cosas de bajo nivel era con el lenguage de programacion C/c++ ahsta el dia de hoy son muy buenos lenguages sin embargo nos permiten intencionalmnete aveces cometer errores ya que no hay nadie quien nos controles y advierta de las posibles fugas errores para nuestros sistemas se sentia la ausencia de seguridad haciendo que tu programa se combierta en una mina de oro para un hacker permitiendole inyectar acciones y tomar el control de tu sistema.
      RUst es un nuevo paradigma que resuelve la tension hisorica de la informatica de sistemas
    ]
    #v(2em)
    #align(right)[
      --- Alex Villanueva (VNCKey) \
      Lima, Mayo 2026
    ]
  ]

]

// 4. SOBRE EL AUTOR
#page[
  #cetz.canvas({
    import cetz.draw: *

    line((0, 0), (0, 2.0), stroke: (paint: rust-orange, thickness: 3pt, cap: "round"))

    content(
      (0.3, 1.2),
      anchor: "west",
      [
        #text(24pt, weight: "bold", fill: rust-dark)[Sobre el Autor]
      ],
    )

    circle((0, 2.0), radius: 0.08, fill: rust-orange, stroke: none)
  })


  #v(2em)

  #grid(
    columns: (1fr, 2fr),
    gutter: 2em,
    [
      #circle(radius: 40pt, fill: gray.lighten(50%)) // Espacio para tu foto
    ],
    [
      [Tu Nombre] es un apasionado de la tecnología con experiencia en [tu área]. Ha dedicado los últimos años a investigar [tu interés] y a compartir sus conocimientos con la comunidad de Rust.

      Puedes contactar con el autor en [Tu Web/Email/LinkedIn].
    ],
  )
]

// 5. PROLOGO
#page[
  #v(2em)
  #align(center)[
    #text(18pt)[PROLOGO]
  ]
]
