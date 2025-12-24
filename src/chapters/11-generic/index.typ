= Generic Types


Los genéricos permiten escribir código que funciona con múltiples tipos sin duplicar lógica.
Son fundamentales en Rust porque habilitan:

- Reutilización de código

- Flexibilidad sin perder seguridad

- Rendimiento máximo gracias a la monomorfización

*¿Qué son los genéricos?*

Un generic type es un "comodín de tipos" que le permite al compilador crear múltiples versiones de una misma estructura, enum o función, una por cada tipo concreto que uses, sin que tengas que escribir el código una y otra vez.

- En lugar de decir:

  "Esta estructura solo sirve para i32"

- Dices:

  "Esta estructura sirve para cualquier tipo y le pondré de nombre T y tú como compilador, generas la versión correcta cuando se use con i32, String, User, etc."

Sintaxis:
```rust
fn identidad<T>(valor: T) -> T {
    valor
}
```

#raw("<T>",lang:"rust") es un parámetro de tipo genérico.
Esto significa que la función funciona para:

- #raw("i32",lang:"rust"), #raw("String",lang:"rust"), #raw("bool",lang:"rust")  etc

- incluso para tipos definidos por el usuario.

Ejemplo:

```rust
let n = identidad(10);
let s = identidad("hola");
let b = identidad(true);
```

Rust genera una versión optimizada para cada tipo utilizado *monomorfización*.

*Genéricos en estructuras*

Puedes declarar un struct que acepte tipos genéricos:

```rust
struct Punto<T> {
    x: T,
    y: T,
}
```

Uso:

```rust
let p1 = Punto { x: 10, y: 20 };
let p2 = Punto { x: 3.5, y: 6.1 };
let p3 = Punto { x: "hola", y: "mundo" };
```

Incluso diferentes tipos en un mismo struct:

```rust
struct Par<T, U> {
    a: T,
    b: U,
}

let par = Par { a: "edad", b: 24 };
```

*Métodos genéricos* #raw("impl<T>",lang:"rust")

También puedes definir métodos dentro de un impl genérico:

```rust
struct Contenedor<T> {
    valor: T,
}

impl<T> Contenedor<T> {
    fn obtener(&self) -> &T {
        &self.valor
    }
}
```

Incluso métodos adicionales para un tipo concreto:

```rust
impl Contenedor<i32> {
    fn es_par(&self) -> bool {
        self.valor % 2 == 0
    }
}
```

Funciones con múltiples genéricos

Una función puede tener dos, tres o más tipos genéricos, cada uno con sus propias restricciones.

```rust
fn mezclar<T, U, V>(a: T, b: U, c: V) -> (T, U, V) {
    (a, b, c)
}
```
