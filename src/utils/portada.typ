//-----------PORTADA A4 - VNCKEY "DIVIÉRTETE CON RUST" (La Tríada Borromeo Premium)-----------

#import "@preview/cetz:0.5.2": canvas, draw

#set page(
  paper: "a4",
  margin: (inside: 0cm, outside: 0cm, top: 0cm, bottom: 0cm),
)

// Paleta de la Tríada de Rust (Refinada para alto contraste)
#let c-black = rgb("#030305")
#let c-rust = rgb("#CE422B")    // Ownership
#let c-gold = rgb("#F5C07A")    // Borrowing
#let c-blue = rgb("#4B90D6")    // Lifetimes
#let c-white = rgb("#FFFFFF")
#let sub-title = rgb("#f7d186")

// ============================================================
// FONDO NEGRO PURO
// ============================================================
#place(top, rect(width: 100%, height: 100%, fill: c-black))

// ============================================================
// MARCA VNCKEY (Branding Minimalista)
// ============================================================
#place(top + left, dx: 2.2cm, dy: 3cm)[
  #text(size: 24pt, weight: "black", fill: c-white, tracking: 3pt, font: "EB Garamond")[VNCKey]
]

#place(bottom + right, dx: -1cm, dy: -1cm)[
  #text(size: 24pt, fill: c-white, tracking: 3pt, font: "EB Garamond")[Villanueva, Alex]
]

// ============================================================
// TÍTULO PRINCIPAL (Composición de Impacto)
// ============================================================
#place(top + left, dx: 2.2cm, dy: 5.5cm)[
  #stack(
    dir: ttb,
    spacing: 10pt,
    text(
      size: 48pt,
      weight: "black",
      fill: c-white,
      font: "EB Garamond",
      tracking: -2pt,
    )[Software seguro],

    text(
      size: 72pt,
      weight: "black",
      fill: gradient.linear(c-rust, c-gold, angle: 10deg),
      font: "EB Garamond",
      tracking: -2pt,
    )[Rust],

    v(25pt),
    text(
      size: 22pt,
      weight: "bold",
      fill: sub-title,
      font: "EB Garamond",
    )[Diviértete reescribiendo el mundo],
  )
]

#place(center + horizon, dx: 0cm, dy: 6.5cm)[
  #canvas({
    import draw: *

    let s = 0.45cm

    let proj(x, y, z) = {
      let ax = 60deg
      let az = 40deg
      let rx = x * calc.cos(az) - y * calc.sin(az)
      let ry = x * calc.sin(az) + y * calc.cos(az)
      let f_y = ry * calc.cos(ax) + z * calc.sin(ax)
      return (rx * s, f_y * s)
    }

    let n_total = 360 // Resolución longitudinal
    let steps_v = 15 // Resolución del volumen (longitudinal)
    let r_tube = 1.2 // Radio del cuerpo del anillo (Grosor 3D)

    // Función para dibujar un segmento de Toro 3D con luz especular
    let draw_torus_segment(transform_fn, t_start, t_end, base_col) = {
      let n_seg = int(n_total * calc.abs(t_end - t_start) / 360) + 1

      // Dibujamos la malla del volumen
      for j in range(steps_v) {
        let v = float(j) / float(steps_v) * 360deg
        let pts = ()
        for i in range(n_seg + 1) {
          let t = (t_start + (t_end - t_start) * float(i) / float(n_seg)) * 1deg

          let x0 = 10.0 * calc.cos(t)
          let y0 = 10.0 * calc.sin(t)
          let z0 = 0.0

          let (x1, y1, z1) = transform_fn(x0, y0, z0)

          // Ecuación paramétrica de Toro (Anillo con volumen)
          let tx = x1 + r_tube * calc.cos(v) * calc.cos(t)
          let ty = y1 + r_tube * calc.sin(v) * calc.sin(t)
          let z_off = r_tube * calc.cos(v + t * 2.0) // Efecto de torsión visual
          let tz = z1 + z_off

          pts.push(proj(tx, ty, tz))
        }

        // Cálculo de iluminación especular (Brillo en la parte superior del tubo)
        let light_factor = calc.pow(calc.max(0.0, calc.cos(v - 45deg)), 3)
        let col = base_col.mix((c-white, light_factor * 50%))

        line(..pts, stroke: 0.8pt + col.transparentize(15%), cap: "round")
      }
    }

    // Definición de Planos Ortogonales para los anillos
    let ring_r(x, y, z) = (x, y, z)
    let ring_g(x, y, z) = (z, x, y)
    let ring_b(x, y, z) = (y, z, x)

    // ---- Resplandor central atmosférico ----
    circle(
      proj(0, 0, 0),
      radius: 5.5cm,
      fill: gradient.radial(c-rust.transparentize(90%), c-black.transparentize(100%)),
      stroke: none,
    )

    // ================================================================
    // Z-ORDERING BORROMEO (6 Cruces Perfectos)
    // Orden de dibujo para simular que los anillos se entrelazan físicamente:
    // ================================================================

    // 1. Mitad Trasera: Los anillos se dibujan en orden de alejamiento
    draw_torus_segment(ring_r, 180, 360, c-rust) // Ownership back
    draw_torus_segment(ring_g, 0, 180, c-gold) // Borrowing back
    draw_torus_segment(ring_b, 180, 360, c-blue) // Lifetimes back

    // 2. Mitad Delantera: En orden inverso para que pasen POR ENCIMA
    draw_torus_segment(ring_b, 0, 180, c-blue) // Lifetimes front (over red)
    draw_torus_segment(ring_r, 0, 180, c-rust) // Ownership front (over gold)
    draw_torus_segment(ring_g, 180, 360, c-gold) // Borrowing front (over blue)
  })
]


//-----------FIN DE LA PORTADA REFINADA-----------

// ============================================================
// DECORACIONES TÉCNICAS ADICIONALES (Detallitos)
// ============================================================
