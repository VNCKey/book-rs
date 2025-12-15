#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let rust-orange = rgb("#ff6b35")
#let rust-blue = rgb("#5bc0de")
#let rust-purple = rgb("#9b59b6")

#let phase(pos, label, desc, tint: white) = node(
  pos,
  align(left)[
    #text(weight: "bold", size: 9.5pt, label) \
    #text(size: 7.5pt, desc)
  ],
  width: 50mm,
  fill: tint.lighten(60%),
  stroke: 1.5pt + tint.darken(20%),
  corner-radius: 5pt,
  inset: 8pt,
)

#figure(
  kind: "diagram",
  supplement: [Diagrama],
  caption: [Pipeline completo de compilación de Rust con descripciones],

  diagram(
    spacing: 7mm,
    edge-stroke: 1.5pt,
    mark-scale: 80%,

    phase((0,0), [1. Lexing], [Convierte texto en tokens], tint: rust-orange),
    edge("-|>"),

    phase((0,1), [2. Parsing], [Crea el AST (Abstract Syntax Tree)], tint: rust-orange),
    edge("-|>"),

    phase((0,2), [3. Expansion], [Expande macros y atributos], tint: rust-orange),
    edge("-|>"),

    phase((0,3), [4. Resolution], [Resuelve nombres y paths], tint: rust-blue),
    edge("-|>"),

    phase((0,4), [5. Type Check], [Verifica tipos y borrow checker], tint: rust-blue),
    edge("-|>"),

    phase((0,5), [6. MIR], [Mid-level Intermediate Representation], tint: rust-purple),
    edge("-|>"),

    phase((0,6), [7. LLVM IR], [Representación de LLVM], tint: purple),
    edge("-|>"),

    phase((0,7), [8. Codegen], [Generación de código máquina nativo], tint: green),
  )
) <diag-pipeline>
