
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let rust-orange = rgb("#ff6b35")
#let memory-blue = rgb("#4a90e2")

#let mem-cell(pos, var-name, value, address, ..args) = node(
  pos,
  align(left)[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 8pt,
      row-gutter: 2pt,

      text(weight: "bold", size: 9pt)[Variable:],
      text(size: 9pt, fill: rust-orange)[#var-name],

      text(weight: "bold", size: 8pt)[Valor:],
      text(size: 8pt, font: "monospace")[#value],

      text(weight: "bold", size: 8pt)[Dirección:],
      text(size: 7pt, font: "monospace", fill: memory-blue)[#address],
    )
  ],
  width: 45mm,
  fill: white,
  stroke: 2pt + memory-blue,
  corner-radius: 5pt,
  inset: 8pt,
  ..args,
)

#figure(
  kind: "diagram",
  supplement: [Diagrama],
  caption: [Representación del stack de memoria en Rust],

  diagram(
    spacing: 10mm,
    edge-stroke: 1.5pt,
    mark-scale: 80%,

    // Título del stack
    node((0.5, -0.5), text(size: 11pt, weight: "bold", fill: memory-blue)[STACK]),

    // Variable numero
    mem-cell((0,0), [numero], [42], [0x7fff5fbff8c0]),

    edge((0,0), (1,0), "-|>", label: text(size: 8pt)[Copy]),

    // Variable numero2
    mem-cell((1,0), [numero2], [42], [0x7fff5fbff8c4]),

    // Anotación
    node((0.5, 1),
      rect(
        fill: yellow.lighten(80%),
        inset: 6pt,
        radius: 4pt,
        text(size: 8pt, style: "italic")[
          Los valores se copian porque `i32` implementa `Copy`
        ]
      )
    ),
  )
) <diag-stack>
