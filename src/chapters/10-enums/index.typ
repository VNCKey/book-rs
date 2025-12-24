= Enums y Patrones

Rust ofrece una poderosa combinación entre enumeraciones "enums" y el sistema de patrones "pattern matching".

Juntos permiten representar datos complejos de forma segura y expresiva.

*Enum*

Un enum te permite definir un tipo que puede ser uno entre varios valores posibles.

Ejemplo basico:
```rust
enum Color {
    Rojo,
    Verde,
    Azul,
}
```

Los enum son muy útiles para representar estados, opciones y variaciones de datos.

*Enums con Datos*

A diferencia de otros lenguajes, Rust permite que cada variante del enum tenga datos asociados.

- Con valores simples```rust
enum Ip {
    V4(String),
    V6(String),
}
```

- Con estructuras diferentes```rust
enum Mensaje {
    Texto(String),
    Coordenada { x: i32, y: i32 },
    Salir,
}
```

*match: La herramienta principal para enums*

match permite comparar un valor contra patrones.

Ejemplo básico:

```rust
fn imprimir_color(color: Color) {
    match color {
        Color::Rojo => println!("Rojo!"),
        Color::Verde => println!("Verde!"),
        Color::Azul => println!("Azul!"),
    }
}
```
*Patrones con Enums que tienen datos*

- Extraer valores

  ```rust
enum Mensaje {
    Texto(String),
    Numero(i32),
}

fn procesar(m: Mensaje) {
    match m {
        Mensaje::Texto(t) => println!("Texto: {}", t),
        Mensaje::Numero(n) => println!("Número: {}", n),
    }
}
```

- Con estructura
  ```rust
enum Comando {
    Mover { x: i32, y: i32 },
}

fn ejecutar(c: Comando) {
    match c {
        Comando::Mover { x, y } => {
            println!("Moviendo a la posición ({}, {})", x, y);
        }
    }
}
```

*Patrones con rangos*

```rust
enum Evento {
    Nivel(i32),
}

match Evento::Nivel(5) {
    Evento::Nivel(n @ 1..=10) => println!("Nivel bajo: {}", n),
    Evento::Nivel(n) => println!("Nivel alto: {}", n),
}
```

*Enums con Métodos*

Los enums también pueden tener métodos.

```rust
enum Estado {
    Online,
    Offline,
}

impl Estado {
    fn esta_activo(&self) -> bool {
        matches!(self, Estado::Online)
    }
}
```

Uso:

```rust
let e = Estado::Online;

println!("{}", e.esta_activo()); // true
```

*Imprimir Enum*

```rust
#[derive(Debug)]
enum Direccion {
    Norte,
    Sur,
    Este,
    Oeste,
}

fn main() {
    let dir = Direccion::Norte;
    println!("{:?}", dir);
}
```
