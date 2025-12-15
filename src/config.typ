// ========================================
// CONFIGURACIÓN PROFESIONAL PARA LIBRO
// config.typ - Curso de Rust 2026
// ========================================

// ----------------------------------------
// 1. FUENTES
// ----------------------------------------
//#let crimson = "Crimson Pro"

#set text(
  //font: crimson,
  size: 11pt,           // 11pt es el estándar para libros (12pt es un poco grande)
  lang: "es",
  hyphenate: true,      // ⭐ IMPORTANTE: Separación silábica
  fallback: true        // Usar fuentes alternativas si falta algún glyph
)

// ----------------------------------------
// 2. CONFIGURACIÓN DE PÁGINA
// ----------------------------------------
#set page(
  paper: "a5",          // Tamaño estándar de libro (también puedes usar "a4")

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

  // Header/Footer (opcional, descomenta si quieres)
  /*
  header: locate(loc => {
    let page-num = counter(page).at(loc).first()
    if page-num > 1 [  // No mostrar en portada
      #set text(size: 9pt, fill: gray)
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [Diviértete con Rust],
        [Capítulo #counter(heading).display()]
      )
      #v(-0.7em)
      #line(length: 100%, stroke: 0.5pt + gray)
    ]
  }),
  */
)

// ----------------------------------------
// 3. CONFIGURACIÓN DE DOCUMENTO (Metadatos)
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
// 5. CONFIGURACIÓN DE TÍTULOS (HEADINGS)
// ----------------------------------------

// Numeración de capítulos y secciones
#set heading(numbering: "1.1")

// ⭐ Capítulos (Nivel 1) - Página nueva
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

// ⭐ IMPORTANTE: Quitar sangría después de títulos
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

// Función para notas/tips
#let note(title: "Nota", content) = {
  block(
    width: 100%,
    fill: rgb("#e8f4f8"),
    stroke: (left: 3pt + rgb("#0066cc")),
    inset: 10pt,
    radius: 2pt,
    [
      *#title:* #content
    ]
  )
}

// Función para advertencias
#let warning(content) = {
  block(
    width: 100%,
    fill: rgb("#fff4e5"),
    stroke: (left: 3pt + rgb("#ff9800")),
    inset: 10pt,
    radius: 2pt,
    [
      *⚠️ Advertencia:* #content
    ]
  )
}

// Función para ejemplos importantes
#let important(content) = {
  block(
    width: 100%,
    fill: gradient.linear(
      rgb("#eff6ff"),
      rgb("#dbeafe"),
      angle: 135deg
    ),
    stroke: none,
    inset: 0pt,
    radius: 0pt,
    [
      #block(
        width: 100%,
        fill: rgb("#3b82f6"),
        inset: (x: 14pt, y: 8pt),
        text(
          size: 9pt,
          weight: 700,
          fill: white,
        )[⚡ IMPORTANTE]
      )
      #block(
        width: 100%,
        inset: 14pt,
        text(
          size: 10pt,
          fill: rgb("#1e40af"),
          weight: 400
        )[#content]
      )
    ]
  )
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

// Nota: Importa este archivo al inicio de tu main.typ con:
// #import "src/config.typ": *
