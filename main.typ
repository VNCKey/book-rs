// ▓ PORTADA EXTERIOR
#include "/src/utils/portada.typ"


// HOJA DE RESPETO
#pagebreak()
#pagebreak()
#pagebreak()
// FIN HOJA DE RESPETO

// ▓ CONFIGURACION GLOBAL
#import "/src/config/global.typ": *
#show: template

#include "/src/contents/frond_matter.typ"

#pagebreak()


#outline(depth: 3)

#pagebreak()

//Módulos:
#include "/src/contents/mod.typ"

#bibliography("/refs.bib")
