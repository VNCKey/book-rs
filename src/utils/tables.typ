#let rust-orange = rgb("#ff6b35")
#let rust-dark = rgb("#3e2723")

#let apply-rust-style(body) = {
  show table: set table(
    stroke: (paint: rust-orange, thickness: 1.2pt),
    fill: (x, y) => {
      if y == 0 {
        rust-orange.lighten(85%)
      } else if calc.odd(y) {
        rgb("#fff8f5")
      }
    },
    inset: (x: 10pt, y: 8pt),
  )

  show table.cell.where(y: 0): set text(
    weight: "bold",
    fill: rust-dark
  )

  body
}
