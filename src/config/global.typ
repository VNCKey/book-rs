// ========================================
// Configuración Global del Libro
// Diviértete con Rust 🦀
// ========================================

// ── Imports ────────────────────────────────────────────────────
#import "@preview/meander:0.4.2"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/cetz:0.4.2"
#import "@preview/pinit:0.2.2": *

// ── Variables de tema ─────────────────────────────────────────
#let title = "Diviértete con Rust 🦀"
#let rust-orange = rgb("#CE422B")
#let rust-dark = rgb("#1C1C1C")
#let rust-mid = rgb("#6B6B6B")

// Fuentes globales
#let body-font = ("EB Garamond", "Source Sans Pro")


#let colorsp(height: 2em, pos: bottom, fill: black, highlight-pins, point-pin) = {
  pinit-highlight(
    ..highlight-pins,
    fill: rgb(..fill.components().slice(0, -1), 40),
    radius: 2pt,
    dx: -0.2em,
    dy: -1.0em,
    extended-width: 0.45em,
    extended-height: 1.4em,
  )
}

// ── Template principal ────────────────────────────────────────
#let template(doc) = {
  // Configuración de texto y fuentes globales
  set text(font: body-font, size: 12pt)
  show heading: set text(font: "EB Garamond")
  show raw: set text(font: ("JetBrains Mono", "IBM Plex Mono"))

  // Inicializar syntax highlighting
  show: codly-init.with()

  // ── Código inline y bloques ──────────────────────────────
  show raw.where(block: true): it => {
    codly(
      enabled: true,
      radius: 0pt,
      inset: (left: .5em, right: .5em, top: .5em, bottom: .5em),
      fill: white,
      zebra-fill: white,
      number-placement: "outside",
      lang-format: (_, _, _) => [],
      number-format: none,
      stroke: 1pt + rgb("#c2c2c2"),
    )
    it
  }

  // ── Headings ──────────────────────────────────────────────
  show heading.where(level: 1): it => [
    #grid(
      columns: (6pt, 1fr),
      column-gutter: 2pt,
      rect(width: 2pt, height: 22pt, fill: rust-orange),
      align(left + horizon)[
        #text(22pt, weight: "bold", fill: rust-dark, tracking: -0.5pt)[#it.body]
      ],
    )
    #v(-15pt)
    #line(length: 100%, stroke: 0.4pt + rgb("#E0E0E0"))
  ]

  show heading.where(level: 2): it => [
    #v(0.9em)
    #grid(
      columns: (auto, 1fr),
      column-gutter: 5pt,
      align(left + horizon)[
        #text(15pt, weight: "bold", fill: rust-orange)[]
      ],
      align(left + horizon)[
        #text(15pt, weight: "bold", fill: rust-dark)[#it.body]
      ],
    )
    #v(-10pt)
    #line(length: 80%, stroke: 0.6pt + rust-orange.lighten(60%))
    #v(0.4em)
  ]

  show heading.where(level: 3): it => [
    #v(0.6em)
    #text(13pt, weight: "bold", fill: rust-mid)[
      #text(fill: rust-orange)[▸ ]#it.body
    ]
    #v(0.3em)
  ]

  // ── Párrafos ──────────────────────────────────────────────
  set par(
    justify: true,
    leading: 0.65em,
    spacing: 1.5em,
    first-line-indent: 0em,
  )

  // ── Página ─────────────────────────────────────────────────
  set page(
    margin: (x: 1.8cm, y: 1.5cm),
    header: align(right + horizon, title),
    numbering: "1",
    number-align: right,
  )

  // ── Headings numbering ─────────────────────────────────────
  set heading(numbering: "1.")

  // ── Links ─────────────────────────────────────────────────
  show link: it => {
    set text(fill: rust-orange)
    underline(it)
  }

  // ── Tablas ─────────────────────────────────────────────────
  set table(
    stroke: (paint: rust-orange, thickness: 1pt),
    fill: (x, y) => if y == 0 { rust-orange.lighten(85%) } else if calc.odd(y) { rgb("#fff5f0") } else { white },
    inset: 8pt,
  )

  show table.cell.where(y: 0): set text(weight: "bold")

  show table.cell: it => {
    if it.x == 0 or it.y == 0 {
      set text(white)
      strong(it)
    } else if it.body == [] {
      pad(..it.inset)[_N/A_]
    } else {
      it
    }
  }

  // ── Figuras ────────────────────────────────────────────────
  set figure(
    numbering: "1",
    gap: 1em,
  )

  show figure.caption: it => {
    set text(size: 9.5pt, style: "italic")
    it
  }

  // ── Citas en bloque ────────────────────────────────────────
  show quote.where(block: true): it => {
    block(
      width: 100%,
      inset: (left: 1.2em, right: 1em, top: 1.2em, bottom: 0.8em),
      fill: rgb("#fef9f5"),
    )[
      #set par(first-line-indent: 0em)
      #text(style: "italic", fill: rust-dark)[#it.body]
    ]
  }

  // ── Metadatos del PDF ──────────────────────────────────────
  set document(
  title: "Diviértete con Rust",
  author: ("Alexander Villanueva"),
  date: datetime(year: 2026, month: 7, day: 23, hour: 20, minute: 0, second: 0),
  keywords: ("Rust", "Programación", "2026", "Tutorial"),
)

  // ── Evitar saltos de página incorrectos ───────────────────
  show heading: set block(breakable: false)
  show figure: set block(breakable: false)
  show quote.where(block: true): set block(breakable: false)

  show regex("pin\d+"): it => {
    let n = int(it.text.slice(3))
    pin(n)
  }

  show raw: it => {
    if it.lang == "bash" and not it.block {
      box(it)
    } else {
      it
    }
  }


  doc
}

// ── Funciones utilitarias ─────────────────────────────────────

#let titulo_principal_falso(texto) = [
  #v(1.5em)
  #block(
    width: 100%, // Esto obliga al bloque a expandirse hasta los márgenes
    fill: rust-orange.lighten(90%),
    inset: (x: 16pt, y: 8pt),
    stroke: (bottom: 1pt + rust-orange),
  )[
    #text(18pt, weight: "bold", fill: rust-dark)[#texto]
  ]
  #v(0.8em)
]

#let titulo_falso(texto) = [
  #v(0.9em)
  #grid(
    columns: (auto, 1fr),
    column-gutter: 5pt,
    align(left + horizon)[
      #text(15pt, weight: "bold", fill: rust-orange)[::]
    ],
    align(left + horizon)[
      #text(15pt, weight: "bold", fill: rust-dark)[#texto]
    ],
  )
  #v(-10pt)
  #line(length: 80%, stroke: 0.6pt + rust-orange.lighten(60%))
  #v(0.4em)
]



// Término destacado en rojo Rust
#let term(content) = {
  text(fill: rust-orange, weight: "semibold", content)
}

// Caja de nota importante
#let importante(texto) = box(width: 100%, height: 60pt)[
  #grid(
    columns: (3pt, 1fr),
    gutter: 8pt,
    [#line(stroke: 3pt + rgb("#EB9468"), end: (0%, 100%))], [#align(horizon)[#text([#texto])]],
  )
]

// Título principal centrado
#let titulo(contenido) = align(
  center,
  box(text(size: 24pt, weight: "bold", fill: red, contenido)),
)

// Subtítulo centrado
#let sub_titulo(contenido) = align(
  center,
  box(text(size: 18pt, weight: "bold", fill: rgb("#ff4aa1"), contenido)),
)

// Diagrama con meander
#let meander_lib(imagen_url, texto) = {
  meander.reflow({
    import meander: *
    placed(top + right, figure(image(imagen_url, width: 140pt)))
    container()
    content[#texto]
  })
}
