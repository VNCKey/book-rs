// Importar configuración
#import "src/config.typ": *

// ========================================
// PORTADA
// ========================================
#include "src/portada.typ"

#pagebreak()


// Tabla de contenidos
#outline(
  title: [Contenido],
  indent: 1em,
  depth: 3
)

#pagebreak()

// ========================================
// CONFIGURACIÓN PARA CONTENIDO PRINCIPAL
// ========================================

// Header solo en páginas de contenido
#set page(
  header: [
    #set text(size: 9pt, fill: gray)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [Diviértete con Rust 🦀],
      context [Capítulo #counter(heading).display()]
    )
    #v(-0.7em)
    #line(length: 100%, stroke: 0.5pt + gray)
  ]
)
// ========================================
// CAPÍTULO 1: PRIMEROS PASOS
// ========================================
#import "src/utils/tables.typ": apply-rust-style

#show: apply-rust-style
= Introducción a Rust

#v(1em)


#include "src/chapters/01-Intro/index.typ"

#include "src/chapters/02-Instalacion/index.typ"

#include "src/chapters/03-rustc_cargo/index.typ"

#include "src/chapters/04-Programa/index.typ"

#include "src/chapters/05-Variables/index.typ"

#include "src/chapters/06-Controlflow/index.typ"

#include "src/chapters/07-iteradores/index.typ"
