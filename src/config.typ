// ========================================
// Curso de Rust 2026
// ========================================

// ----------------------------------------
// 1. FUENTES
// ----------------------------------------
//#let crimson = "Crimson Pro"

#set text(
  //font: crimson,
  size: 12pt,
  lang: "es",
  hyphenate: true,
  fallback: true
)

// ----------------------------------------
// 2. CONFIGURACIÓN DE PÁGINA
// ----------------------------------------
#set page(
  paper: "a4",          // Tamaño estándar de libro (también puedes usar "a4")

  // Márgenes profesionales para impresión
  margin: (
    inside: 2.5cm,      // Margen interno (lado del lomo) - más ancho
    outside: 2cm,       // Margen externo
    top: 2.5cm,
    bottom: 2.5cm,
  ),

  // Numeración de páginas
  numbering: "1",
  number-align: center + bottom,
)

// ----------------------------------------
// 3. CONFIGURACIÓN DE DOCUMENTO
// ----------------------------------------
#set document(
  title: "Diviértete con Rust",
  author: "Alexander Villanueva",
  date: datetime.today(),
  keywords: ("Rust", "Programación", "2026", "Tutorial")
)

// ----------------------------------------
// 4. CONFIGURACIÓN DE PÁRRAFOS
// ----------------------------------------
#set par(
  justify: true,            // ⭐ Texto justificado (esencial en libros)
  leading: 0.65em,          // Espaciado entre líneas (0.65em es ideal para lectura)
  spacing: 0.65em,          // Espaciado entre párrafos
  first-line-indent: 1.5em, // ⭐ Sangría en primera línea (típico de libros)
)

// ----------------------------------------
// 5. CONFIGURACIÓN DE TÍTULOS
// ----------------------------------------

// Numeración de capítulos y secciones
#set heading(numbering: "1.1")

// ?
#show heading.where(level: 1): it => {
  pagebreak(weak: true)   // Nueva página para cada capítulo
  v(3cm)                  // Espacio arriba

  block[
    #set text(size: 24pt, weight: "bold")
    #if it.numbering != none [
      Capítulo #counter(heading).display()
      #v(0.5em)
    ]
    #text(size: 28pt)[#it.body]
  ]

  v(2cm)  // Espacio después del título
}

// Secciones (Nivel 2)
#show heading.where(level: 2): it => {
  v(1.5em)
  block[
    #set text(size: 16pt, weight: "semibold")
    #it
  ]
  v(0.8em)
}

// Subsecciones (Nivel 3)
#show heading.where(level: 3): it => {
  v(1em)
  block[
    #set text(size: 13pt, weight: "semibold")
    #it
  ]
  v(0.5em)
}

// IMPORTANTE: Quitar sangría después de títulos
#show heading: it => {
  it
  par(first-line-indent: 0pt)[#text(size: 0pt)[.]]
}

// ----------------------------------------
// 6. LISTAS (Bullets y Numeradas)
// ----------------------------------------
#set list(
  indent: 1em,
  body-indent: 0.5em,
  spacing: 0.5em
)

#set enum(
  indent: 1em,
  body-indent: 0.5em,
  spacing: 0.5em,
  numbering: "1.a."  // Formato: 1.a. 1.b. etc.
)


// ----------------------------------------
// 8. CITAS Y BLOQUES ESPECIALES
// ----------------------------------------

// Citas en bloque
#show quote.where(block: true): it => {
  set par(first-line-indent: 0em)
  block(
    width: 100%,
    inset: (left: 1em, rest: 0.5em),
    stroke: (left: 3pt + rgb("#CE422B")),
    fill: rgb("#fef9f5"),
    [#it.body]
  )
}

// ----------------------------------------
// 9. NOTAS AL PIE
// ----------------------------------------
#set footnote(numbering: "*")

#show footnote.entry: it => {
  block[
    #set text(size: 9pt)
    #it
  ]
}

// ----------------------------------------
// 10. LINKS
// ----------------------------------------
#show link: it => {
  set text(fill: rgb("#0066cc"))
  underline(it)
}

// ----------------------------------------
// 11. FIGURAS E IMÁGENES
// ----------------------------------------
#set figure(
  numbering: "1",
  gap: 1em,
)

#show figure.caption: it => {
  set text(size: 9.5pt, style: "italic")
  it
}

// ----------------------------------------
// 12. TABLAS
// ----------------------------------------
#set table(
  stroke: 0.5pt + gray,
  inset: 6pt,
  align: left + horizon,
)

#show table.cell.where(y: 0): set text(weight: "bold")

// ----------------------------------------
// 13. ELEMENTOS ESPECIALES PARA RUST
// ----------------------------------------

// Función para destacar términos importantes
#let term(content) = {
  text(fill: rgb("#CE422B"), weight: "semibold", content)
}



// ----------------------------------------
// 14. CONTROL DE VIUDAS Y HUÉRFANAS
// ----------------------------------------
// (Líneas solas al inicio/fin de página)
//#set par(orphan: 3, widow: 3) ERROR

// ----------------------------------------
// 15. EVITAR SALTOS DE PÁGINA INAPROPIADOS
// ----------------------------------------
#show heading: set block(breakable: false)
#show figure: set block(breakable: false)

// ----------------------------------------
// FIN DE CONFIGURACIÓN
// ----------------------------------------

#show table: set table(
  stroke: (paint: rgb("#ff6b35"), thickness: 1pt),
  fill: (x, y) => if y == 0 { rgb("#ff6b35").lighten(85%) } else if calc.odd(y) { rgb("#fff5f0") } else { white },
  inset: 8pt,
)




#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

// Función que aplica TODA la configuración
#let setup-document(doc) = {
  // Inicializar Codly
  show: codly-init.with()

  codly(
    languages: (
      rust: (name: "Rust", icon: "🦀", color: rgb("#FFD8C9")),
      bash: (name: "Terminal", icon: "🐧", color: rgb("#E2E2E2")),
      yaml: (name: "Output", icon: "📝", color: rgb("#D6FFCB")),
      toml: (name: "toml", icon: "⚙️", color: rgb("#C7FFFA")),
      py: (name: "Python", icon: "🐍", color: rgb("#C7FFFA")),
      js: (name: "JavaScript", icon: "🌐", color: rgb("#C7FFFA")),
    ),
    number-format: none,
    zebra-fill: none,
    stroke: none,
    fill: rgb("#FBFAFB"),
  )

  // Estilos inline
  show raw.where(block: false): it => box(
    fill: rgb("#F5F5F5"),
    inset: (x: 4pt, y: 2pt),
    outset: (y: 2pt),
    radius: 2pt,
    text(
      fill: rgb("#D73A49"),
      size: 0.95em,
      it
    )
  )

  doc
}

#let term(content) = text(weight: "bold", content)
