// Colores temáticos de Rust
#let rust-orange = rgb("#CE422B")      // Naranja característico de Rust
#let rust-dark = rgb("#2B2B2B")        // Gris oscuro para texto
#let rust-light-bg = rgb("#FFF8F5")    // Fondo claro cálido
#let rust-header-bg = rgb("#FFE8E0")   // Fondo del encabezado

// Función para aplicar estilo a las tablas
#let apply-rust-style(body) = {
  show table: set table(
    stroke: (paint: rust-orange, thickness: 1pt),
    fill: (x, y) => {
      if y == 0 {
        // Encabezado con color naranja suave
        rust-header-bg
      } else if calc.odd(y) {
        // Filas impares con fondo alterno
        rust-light-bg
      } else {
        // Filas pares blancas
        white
      }
    },
    inset: (x: 12pt, y: 10pt),
  )

  // Estilo para celdas del encabezado
  show table.cell.where(y: 0): set text(
    weight: "bold",
    fill: rust-dark,
    size: 10.5pt
  )

  // Estilo para el resto de celdas
  show table.cell: set text(
    fill: rust-dark,
    size: 10pt
  )

  body
}
