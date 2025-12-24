= Struct

En Rust, un struct '*estructura*' es una forma de agrupar múltiples valores relacionados bajo un tipo de dato unificado. Funciona como un contenedor organizado que nos permite definir nuestro
 propio tipo de dato personalizado.

Por ejemplo, imagina un Libro como una ficha bibliográfica: en lugar de manejar datos sueltos sobre un libro, reunimos toda la información relevante como el título, autor y año de publicación en un solo registro con campos específicamente etiquetados.

Esto no solo mantiene los datos lógicamente unidos, sino que también le da al compilador de Rust la capacidad de verificar que accedemos a campos válidos, como titulo o autor. Si intentas acceder a un campo no definido, como editorial, Rust te avisará de ese error en tiempo de compilación.


Además, al asignar tipos correctos a cada campo como por ejemplo, String para el título y u32 para el año, prevenimos errores comunes antes de que el programa se ejecute, en lugar de descubrirlos durante la ejecución. Esto hace que el código sea más robusto y fácil de mantener.

== Sintaxis básica

Un struct se declara con la palabra clave #raw("struct",lang:"rust"), seguida del nombre y una lista de campos entre llaves:

```rust
struct Libro {
    titulo: String,
    autor: String,
    anio_publicacion: u32,
}
```
- #raw("Libro",lang:"bash") es el nombre del #raw("struct",lang:"rust").

- titulo, autor y anio_publicacion son los campos.

- Cada campo tiene un nombre y un tipo.

- Los nombres deben usar #raw("PascalCase",lang:"bash"), según la convención oficial de Rust.

== Instanciación de un Struct

Para crear una instancia del #raw("struct",lang:"rust"), se usa las llaves #raw("{ }",lang:"rust") indicando los valores de cada campo.

```rust
fn main() {
    let libro = Libro {
        titulo: String::from("Domina Rust"),
        autor: String::from("Alex Villanueva"),
        anio_publicacion: 2025,
    };
}
```

Reglas importantes:

- Debes inicializar todos los campos.

- El orden no importa.

- Puedes crear structs como let o let mut.

== Acceso a los campos

Los campos se acceden con el operador #raw("`.`",lang:"bash"):
```rust
  // --snip--

  println!("Título: {}", libro.titulo);   // "Domina Rust"
  println!("Autor: {}", libro.autor);     // "Alex Villanueva"
  println!("Año: {}", libro.anio_publicacion);  // 2025
```

== Structs Mutables

Para modificar los campos de un struct, la instancia debe ser mutable #raw("mut",lang:"rust"):

```rust
let mut libro = Libro {
    // --snip--
};

libro.anio_publicacion = 2026; // Modificamos un campo
println!("Año: {}", libro.anio_publicacion);  // Ahora 2026
```
Si la variable no es mutable, sus campos tampoco lo serán.

== Struct Update Syntax

Puedes crear una nueva instancia copiando algunos campos de otro struct con la sintaxis "#raw("..",lang:"rust")":

```rust
// --snip--

let libro2 = Libro {
    titulo: String::from("Aprende RusT"),
    ..libro
};

println!("{}", libro2.titulo); // "Aprende RusT"
println!("{}", libro2.autor); // "Alex Villanueva"
println!("{}", libro2.anio_publicacion);  // 2026
```

Esto copia:

- libro.autor

- libro.anio_publicacion

Si un campo contiene datos que mueven ownership como String, la variable original deja de ser válida para ese campo.

== Tuple Structs

Son structs sin nombre para los campos. Útiles cuando el significado viene implícito:

```rust
struct Punto(i32, i32);

let p = Punto(10, 20);
```

== Unit-like Structs

No tienen campos. Se usan para:

- Implementar traits en tipos sin datos

- Marcar eventos o comportamientos

- Crear tipos fantasma (zero-sized types)

```rust
struct SinDatos;

let x = SinDatos;
```

== Desestructuración de Structs

Podemos extraer los campos de un struct en variables individuales:

```rust
// --snip--

let Libro { titulo, autor, anio_publicacion } = libro2;
println!("{} - {} ({})", titulo, autor, anio_publicacion);
```

== Derivaciones automáticas

Rust puede generar implementaciones comunes automáticamente con  #raw("#[derive(...)]",lang:"make").

```rust
#[derive(Debug, Clone, PartialEq)]
struct Libro {
    // --snip--
}

fn main() {
    // --snip--
    let Libro { titulo, autor, anio_publicacion } = libro2.clone();
    // --snip--
    println!("{:?}", libro); // Usa Debug
    println!("{:#?}", libro); // Usa Debug

    let libro3 = Libro{
        titulo: String::from("EFFECTIVE RUST"),
        autor: String::from("David Drysdale"),
        anio_publicacion: 2000,
    };

    println!("{}",libro2 == libro3); // False
}
```

- #raw("Debug",lang:"bash"): permite imprimir structs con {:?}.
- #raw("Clone",lang:"bash"): permite clonar valores.
- #raw("PartialEq",lang:"bash"): permite comparar con ==.

== Métodos en Structs

En Rust, cuando queremos añadir comportamiento a nuestros structs, utilizamos el bloque #raw("impl",lang:"rust") para implementar métodos.

Esto transforma nuestros structs de ser simples contenedores de datos estaticos a tipos de datos inteligentes que saben cómo operar con su propia información, manteniendo todo el código relacionado organizado en un mismo lugar y aprovechando el sistema de tipos de Rust para garantizar que estas operaciones se realicen de manera segura.

Sintaxis:

```rust
impl Libro {
    // Aquí van los métodos y funciones asociadas
}
```

Ejemplo básico:

```rust
// --snip--
impl Libro {
  fn new(titulo: String, autor: String, anio_publicacion: u32) -> Libro {
    Libro {
      titulo,
      autor,
      anio_publicacion
    }
  }

}

fn main() {
  // --snip--
  let libro4 = Libro::new(
    String::from("Domina Rust"),
    String::from("Alex Villanueva"),
    2025
  );
  // Usa :: para métodos asociados
}
```

== Self

Self representa el tipo del #raw("struct",lang:"rust") dentro del bloque #raw("impl",lang:"rust").

Es una forma abreviada de escribir el nombre completo del tipo. #raw("Self = Libro",lang:"yaml").

#grid(
  columns: (1fr,1fr),
  gutter: 12pt,
  [
```rust
fn new(..) -> Self {
  Self {
  ...
  }
}
```
  ],
  [
```rust
fn new(..) -> Libro {
  Libro {
  ...
  }
}
```
  ]
)



*Las Variantes de self*

Todos los métodos de instancia usan #raw("self",lang:"rust") como primer parámetro. Las variantes controlan ownership y mutabilidad. En Rust, los métodos dentro de impl pueden recibir al propio objeto de diferentes formas.

+ Borrow Inmutable #raw("self",lang:"rust")

  - Referencia inmutable al objeto actual.

  - No puede modificar los campos, solo leerlos.

  - Se traduce a: #raw("self: &Self",lang:"rust").

  Ejemplo:```rust
impl Libro {
    fn es_reciente(&self) -> bool {  // &self: solo lee
        self.anio_publicacion >= 2020
    }
}
```

  Forma abreviada de escribir:```yaml
fn es_reciente(&self)  ->  fn es_reciente(self: &Libro)
```

  ```rust
fn main() {
    // --snip--

  let libro4 = Libro::nuevo(
    String::from("Nuevo Libro"),
    String::from("Autor X"),
    2025
  );

  println!("¿Es reciente? {}", libro4.es_reciente());  // true
  // libro sigue intacto, puedes usarlo después
  println!("Año: {}", libro4.anio_publicacion);  // 2026
}
```


+ Borrow Mutable #raw("&mut self",lang:"rust").

  - Modifica y lee los campos.

  - Solo una mutación a la vez.

  Ejemplo:```rust
impl Libro {
    fn actualizar_año(&mut self, nuevo_año: u32) {  // &mut self: modifica
        self.anio_publicacion = nuevo_año;
    }
}
```

  Forma abreviada de escribir:```
fn actualizar_año(&mut self,..)  ->  fn actualizar_año(self: &mut Libro,..)
```
  Necesitas

    - #raw("let mut libro",lang:"rust")

    - #raw("&mut self",lang:"rust").
  ```rust
fn main() {
    // --snip--

  libro4.actualizar_año(2027);  // Cambia vía método
  println!("Año actualizado: {}", libro.anio_publicacion);  // 2027
  // libro mut sigue vivo y modificado
}
```

+ Tomar Ownership `self`

  Mueve la instancia al método *ownership transferido*.

  Después, no puedes usar el struct original.

  Ejemplo:
  ```rust
impl Libro {

    fn a_string(self) -> String {  // self: consume
        format!("{} por {} ({})",
          self.titulo,
          self.autor,
          self.anio_publicacion
        )
    }
}

fn main() {
    // --snip--

    let descripcion = libro4.a_string();  // Consume libro4
    println!("{}", descripcion);  // Domina Rust por Alex Villanueva (2027)
    //println!("{:?}", libro4);  // Error: moved!
}
```


+ #raw("&Self",lang:"rust") & #raw("&mut Self",lang:"rust")

  Se usan normalmente en las firmas de métodos estáticos o asociados, o cuando defines tipos o traits genéricos, donde Self hace que tu código sea más genérico y expresivo.
  ```rust
impl Libro{

    fn comparar(&self, otro: &Self) -> bool {   // &Self = &Libro
        self.titulo == otro.titulo
    }

    fn incrementar(&mut self, otro: &mut Self) {
        otro.anio_publicacion += self.anio_publicacion;
    }
}
```
  Uso:

  ```rust
fn main(){
  // --snip--

  libro_y.incrementar(&mut libro_x);
  println!("{}", libro_y.anio_publicacion);

  println!("{}",libro_y.comparar(&libro_x));
}
```

== Method Chaining

En Rust, es posible llamar varios métodos de forma consecutiva sobre el mismo valor usando un estilo fluido conocido como encadenamiento de métodos "method chaining".

Este patrón es muy común en APIs modernas, ya que hace el código más expresivo y fácil de leer.

```rust
persona
    .incrementar(1)
    .incrementar(2)
    .resetear();
```

Este estilo solo es posible cuando los métodos están implementados dentro de un bloque #raw("impl",lang:"rust").

#align(center, [¿Qué permite el encadenamiento de métodos?])

Para encadenar métodos, un método debe retornar #raw("Self",lang:"rust"), #raw("&Self",lang:"rust") o #raw("&mut Self",lang:"rust").

Es decir, debe devolver la propia instancia para poder llamar al siguiente método sobre ella.

Rust no tiene un “azúcar sintáctico especial” para esto; es solo una consecuencia natural de devolver el mismo objeto.


Ejemplo básico:
```rust
struct Persona {
    edad: u8,
}

impl Persona {
    fn new(edad: u8) -> Self {
        Self { edad }
    }

    // Permite encadenar gracias a Self
    fn sumar(mut self, x: u8) -> Self {
        self.edad += x;
        self
    }

    // También retorna Self
    fn duplicar(mut self) -> Self {
        self.edad *= 2;
        self
    }

    fn mostrar(&self) {
        println!("Edad: {}", self.edad);
    }
}

fn main() {
    let persona = Persona::new(20)
        .sumar(5)      // 25
        .duplicar();   // 50

    persona.mostrar();
}
```

Salida:
```rust
Edad: 50
```
