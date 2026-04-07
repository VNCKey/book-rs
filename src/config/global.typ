#import "@preview/meander:0.4.2"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/cetz:0.4.2"

#let title = "Diviértete con Rust 🦀"

#let template(doc) = {
  show: codly-init.with()

  show raw.where(block: true): it => {
    codly(
      enabled: true,
      radius: 0pt,
      inset: 0.32em,
      fill: white,
      zebra-fill: white,
      number-placement: "outside",
      lang-format: (_, _, _) => [],
      number-format: none,
      stroke: 1pt + rgb("#c2c2c2"),
    )
    it
  }

  let rust-orange = rgb("#CE412B")
  let rust-dark = rgb("#1C1C1C")
  let rust-mid = rgb("#6B6B6B")

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
        #text(15pt, weight: "bold", fill: rust-orange)[::]
      ],
      align(left + horizon)[
        #text(15pt, weight: "bold", fill: rust-dark)[#it.body]
      ],
    )
    #v(-12pt)
    #line(length: 40%, stroke: 0.6pt + rust-orange.lighten(60%))
    #v(0.4em)
  ]

  show heading.where(level: 3): it => [
    #v(0.6em)
    #text(13pt, weight: "bold", fill: rust-mid)[
      #text(fill: rust-orange)[▸ ]#it.body
    ]
    #v(0.3em)
  ]

  set text(size: 12pt)
  set par(justify: true, leading: 1.2em)
  set heading(numbering: "1.")
  set page(
    margin: (x: 1.8cm, y: 1.5cm),
    header: align(right + horizon, title),
    numbering: "1",
    number-align: right,
  )
  set table(
    stroke: (x, y) => if y == 0 { (bottom: 2pt + white) },
    fill: (x, y) => if x == 0 or y == 0 { rgb("#F8684F") },
    inset: (right: 1.5em),
  )

  show link: underline
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

  doc
}

// ── Funciones utilitarias ─────────────────────────────────
#let importante(texto) = box(width: 100%, height: 60pt)[
  #grid(
    columns: (3pt, 1fr),
    gutter: 8pt,
    [#line(stroke: 3pt + rgb("#EB9468"), end: (0%, 100%))], [#align(horizon)[#text([#texto])]],
  )
]

#let titulo(contenido) = align(
  center,
  box(text(size: 24pt, weight: "bold", fill: red, contenido)),
)

#let sub_titulo(contenido) = align(
  center,
  box(text(size: 18pt, weight: "bold", fill: rgb("#ff4aa1"), contenido)),
)

#let meander_lib(imagen_url, texto) = {
  meander.reflow({
    import meander: *
    placed(top + right, figure(image(imagen_url, width: 140pt)))
    container()
    content[#texto]
  })
}
