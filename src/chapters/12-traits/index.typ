
= Traits

Un trait es un conjunto de métodos que un tipo puede implementar.
Es similar a interfaces en otros lenguajes, pero más poderoso.

Sirve para:

- Definir comportamientos comunes para distintos tipos.

- Permitir polimorfismo.

- Exigir que un tipo tenga cierto método para poder usarse en una función genérica.

- Poder escribir código genérico sin importar el tipo mientras cumpla el trait.

*Traits Comunes de la Librería Estándar*

Antes de crear tus propios traits, es importante conocer algunos de los traits más utilizados que vienen incluidos en la Standard Library.

Muchos tipos los implementan automáticamente y aparecen con frecuencia en código real.

+ Trait Debug

  Permite imprimir un valor para depuración con #raw("{:?}",lang: "rust") o #raw("{:#?}",lang: "rust").
```rust
#[derive(Debug)]
struct Persona {
    nombre: String,
    edad: u32,
}

fn main() {
    let p = Persona { nombre: "Ana".into(), edad: 30 };
    println!("{:?}", p);
}
```
  Útil para inspeccionar valores rápidamente.

+ Trait Clone

  Permite clonar un valor: crear una copia profunda
  ```rust
#[derive(Clone)]
struct Punto {
    x: i32,
    y: i32,
}

let a = Punto { x: 1, y: 2 };
let b = a.clone();
```
  clone() crea una copia real del contenido.

+ Trait Copy

  Una extensión de Clone para tipos livianos y triviales de copiar.

  Ejemplos:

  - enteros

  - booleanos

  - caracteres

  - flotantes

  - tuplas pequeñas con solo tipos Copy
  ```rust
#[derive(Copy, Clone)]
struct Coordenada(i32, i32);

let a = Coordenada(1,2);
let b = a; // copia automática
```

+ Trait PartialEq

  Permite comparar valores con == y !=.
  ```rust
#[derive(PartialEq)]
struct Usuario {
    id: u32,
}

let a = Usuario { id: 1 };
let b = Usuario { id: 1 };

assert!(a == b);
```
+ Trait Eq

  Indica que la igualdad es “total”:

  Casi siempre aparece junto a PartialEq.
  ```rust
#[derive(PartialEq, Eq)]
struct Dni(u32);
```

+ Trait PartialOrd y Ord

  Permite usar <, >, <=, >= y ordenar colecciones.

  ```rust
#[derive(PartialOrd, Ord, PartialEq, Eq)]
struct Numero(i32);

let a = Numero(3);
let b = Numero(5);

assert!(a < b);
```

  Ord permite ordenamiento total (necesario para sort()).



*Definición básica de un Trait*

```rust
trait Saludo {
    fn saludar(&self) -> String;
}
```

Aquí no hay implementación, solo se define el requisito:

Si un tipo implementa #raw("Saludo",lang: "bash"), debe tener el método saludar.

*Implementando un Trait en un Struct*

```rust
struct Persona {
    nombre: String,
}

impl Saludo for Persona {
    fn saludar(&self) -> String {
        format!("Hola, soy {}", self.nombre)
    }
}
```

uso:

```rust
let p = Persona { nombre: "Luis".into() };
println!("{}", p.saludar());
```

*Un Trait como Interface de Comportamiento*

Puedes tener muchos structs diferentes con el mismo trait:

```rust
struct Robot {
    id: u32,
}

impl Saludo for Robot {
    fn saludar(&self) -> String {
        format!("Unidad {} reportándose", self.id)
    }
}
```

Así tienes polimorfismo:

```rust
fn presentar(s: &impl Saludo) {
    println!("{}", s.saludar());
}

presentar(&Persona { nombre: "Ana".into() });
presentar(&Robot { id: 42 });
```

*Sintaxis alternativa de generics para Traits*

Estas dos formas son equivalentes:

+ Forma corta (impl Trait)```rust
fn presentar(s: &impl Saludo) { ... }
```

+ Forma larga (generics + trait bound)```rust
fn presentar<T: Saludo>(s: &T) { ... }
```
Las dos hacen lo mismo:

permiten que la función acepte cualquier tipo que implemente el trait.


*Traits con Métodos por Defecto*

Un trait puede contener implementaciones por defecto:

```rust
trait Animal {
    fn sonido(&self) -> &str;

    fn hablar(&self) {
        println!("El animal hace: {}", self.sonido());
    }
}
```

Si tu struct implementa Animal pero no hablar,
la versión por defecto se usará.

*Traits con métodos estáticos*

Los traits pueden tener métodos que no reciben self:

```rust
trait Identificable {
    fn tipo() -> &'static str;
}
```

*Implementar un Trait genérico*

Puedes usar generics dentro de los traits:
```rust
trait Sumar<T> {
    fn sumar(&self, otro: T) -> T;
}
```
Esto permite traits más flexibles.

*Traits en Enums*

Sí, los enums pueden implementar traits igual que los structs:

```rust
enum Estado {
    Activo,
    Inactivo,
}

impl Saludo for Estado {
    fn saludar(&self) -> String {
        match self {
            Estado::Activo => "Estoy activo".into(),
            Estado::Inactivo => "Estoy inactivo".into(),
        }
    }
}
```
*Supertraits*

Un trait puede depender de otro:

```rust
trait A: B { }
```

== Trait Bounds

Una restricción que indica que un tipo genérico debe implementar un trait específico.

Sin bounds, un genérico no puede usar ninguna funcionalidad del trait.

Sintaxis básica:
```rust
fn mostrar<T: Debug>(x: T) {
    println!("{:?}", x);
}
```
*Múltiples bounds*
```rust
fn procesar<T: Clone + PartialEq>(x: T, y: T) -> bool {
    x == y
}
```
*Sintaxis alternativa con where*

Útil cuando hay varios bounds:
```rust
fn combinar<T, U>(t: T, u: U)
where
    T: Debug,
    U: Clone + Debug,
{
    println!("{:?}", t);
}
```
*Bounds en structs*
```rust
struct Punto<T: Copy> {
    x: T,
    y: T,
}
```
*Bounds en impl*
```rust
impl<T: PartialOrd> Maximo<T> {
    fn max(a: T, b: T) -> T {
        if a > b { a } else { b }
    }
}
```
*Bounds en enums*
```rust
enum Contenedor<T: Debug> {
    Valor(T),
}
```
*Bounds súper-traits*
Un trait que requiere otro trait:
```rust
trait Imprimible: Display {
    fn imprimir(&self) {
        println!("{}", self);
    }
}
```
