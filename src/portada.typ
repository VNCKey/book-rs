//-----------PORTADA MEJORADA-----------
// Curso de Rust 2026 - Alexander Villanueva
// Versión optimizada con mejor jerarquía visual

#set page(
  paper: "a4",
  margin: 0cm
)

// ========================================
// FONDO BASE CON GRADIENTE DINÁMICO
// ========================================
#place(
  top,
  polygon(
    fill: gradient.linear(
      rgb("#1a1a1a"),      // Negro profundo arriba
      rgb("#2d1b1b"),      // Transición
      rgb("#641616"),      // Rojo oscuro Rust
      angle: 180deg
    ),
    (0%, 0pt),
    (100%, 0pt),
    (100%, 29.7cm),  // Altura A4
    (0%, 29.7cm),
  )
)

// ========================================
// ACENTO NARANJA RUST (lateral izquierdo)
// ========================================
#place(
  top + left,
  polygon(
    fill: gradient.linear(
      rgb("#D55A29").transparentize(30%),
      rgb("#CE422B").transparentize(60%),
      angle: 45deg
    ),
    (0pt, 0pt),
    (8cm, 0pt),
    (4cm, 15cm),
    (0pt, 12cm),
  )
)

// ========================================
// EDITORIAL "VNCKey"
// ========================================
#place(top + left, dx: 2.5cm, dy: 2.5cm)[
  #stack(
    dir: ttb,
    spacing: 5pt,
    // Logo editorial
    text(
      size: 36pt,
      weight: "black",
      fill: rgb("#FEFFFE"),

    )[*VNCKey*],
    // Línea decorativa
    line(
      length: 4.2cm,
      stroke: 1.5pt + rgb("#FEFFFE")
    )
  )
]

// ========================================
// BADGE "RUST PERÚ" - Diseño Premium
// ========================================
#place(top + right, dx: -2.5cm, dy: 2.5cm)[
  #rect(
    fill: gradient.linear(
      rgb("#FFFFFF"),  // Rojo de la bandera peruana
      rgb("#FFFFFF"),  // Blanco
      angle: 90deg
    ),
    inset: (x: 15pt, y: 8pt),
  )[
    #text(
      size: 14pt,
      fill: rgb("#000000"),
      weight: "black",
    )[🦀 RUST PERÚ]
  ]
]

// ========================================
// TÍTULO PRINCIPAL
// ========================================
#place(top + left, dx: 2.5cm, dy: 7cm)[
  #block(
    width: 15cm,
    [
      // "Diviértete"
      #text(
        size: 68pt,
        weight: "black",
        fill: white,
        font: "Libertinus Serif"
      )[Diviértete]

      #v(-0.8cm)

      // "con Rust" con degradado
      #text(
        size: 68pt,
        weight: "black",
        fill: gradient.linear(
          rgb("#D55A29"),
          rgb("#F5A962"),
          angle: 45deg
        ),
        font: "Libertinus Serif"
      )[con Rust]
    ]
  )
]

// ========================================
// SUBTÍTULO
// ========================================
#place(top + left, dx: 2.5cm, dy: 13cm)[
  #block(
    width: 13cm,
    [
      #set text(
        size: 22pt,
        weight: "semibold",
        fill: rgb("#F5A962").lighten(20%),
      )
      Viaja al futuro con el poder de Rust
    ]
  )
]

// ========================================
// ELEMENTOS DECORATIVOS (puntos rust)
// ========================================
#place(left + top, dx: 1cm, dy: 15cm)[
  #stack(
    dir: ttb,
    spacing: 8pt,
    ..range(5).map(i =>
      circle(
        radius: 3pt + i * 1pt,
        fill: rgb("#D55A29").transparentize(i * 15%)
      )
    )
  )
]

// ========================================
// POLÍGONO INFERIOR (más dinámico)
// ========================================


// ========================================
// MASCOTA FERRIS (cangrejo Rust)
// ========================================
#place(bottom + right, dx: -1.5cm, dy: -6cm)[
  #image("../assets/rustperu.png", width: 10cm)
]

// ========================================
// BARRA INFERIOR CON INFORMACIÓN
// ========================================
#place(bottom, dy: -2cm)[
  #rect(
    width: 100%,
    height: 2cm,
    fill: rgb("#1a1a1a").transparentize(20%),
    stroke: none,
  )[
    #grid(
      columns: (auto, auto),
      align: (left + horizon, right + horizon),
      inset: (x: 2.5cm, y: 0pt),

      // Descripción/Tags
      [
        #set text(size: 11pt, fill: rgb("#F5A962"), weight: "semibold")
        #box[🦀 Programación de Sistemas]
        #h(1em)
        #box[⚡ Zero-Cost Abstractions]
        #h(1em)
        #box[🔒 Memory Safety]
      ],

      // Autor
      [
        #text(
          size: 20pt,
          fill: white,
          weight: "black",
        )[Alexander Villanueva]
      ]
    )
  ]
]

// ========================================
// DETALLES FINALES
// ========================================

// Línea decorativa superior derecha
#place(top + right, dx: -0.5cm, dy: 6cm)[
  #rotate(-90deg)[
    #line(
      length: 8cm,
      stroke: 2pt + gradient.linear(
        rgb("#D55A29"),
        rgb("#D55A29").transparentize(100%)
      )
    )
  ]
]

// Círculo decorativo (engranaje conceptual)
#place(right + horizon, dx: -3cm)[
  #circle(
    radius: 0.8cm,
    stroke: 3pt + rgb("#D55A29").transparentize(60%),
    fill: none
  )
]

//-----------FIN DE LA PORTADA--------
