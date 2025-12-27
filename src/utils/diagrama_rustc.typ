#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

// Definir colores
#let rust-orange = rgb("#ff6b35")
#let rust-blue = rgb("#5bc0de")

// Definir función blob
#let blob(pos, label, tint: white, ..args) = node(
  pos,
  align(center, label),
  width: 28mm,
  fill: tint.lighten(60%),
  stroke: 1.5pt + tint.darken(20%),
  corner-radius: 5pt,
  ..args,
)

#figure(
  kind: "diagram",
  supplement: [Diagrama],
  caption: [Flujo de compilación en Rust: desde el código fuente hasta el ejecutable],

  diagram(
    spacing: (15mm, 12mm),
    edge-stroke: 1.5pt,
    edge-corner-radius: 5pt,
    mark-scale: 80%,

    blob((0,0), text(size: 10pt, [Código\ Fuente]), tint: rust-orange),
    edge("-|>", label: [compilar]),
    blob((1,0), [rustc], tint: rust-blue, width: 25mm),
    edge("-|>", label: [genera]),
    blob((2,0), [Ejecutable], tint: green),
  )
) <diag-compilacion>

Como vemos en el @diag-compilacion, el compilador `rustc` es el encargado
de transformar nuestro código.
