= Lifetimes

Un lifetime es una etiqueta que describe cuánto tiempo vive una referencia.

No es un valor, no se almacena en memoria, no existe en tiempo de ejecución.

Solo es información estática para que el compilador asegure que no haya referencias colgantes.

Ejemplo de referencia peligrosa:
```rust
let r;

{
    let x = 10;
    r = &x;     // x muere aquí
}

println!("{}", r); // r apunta a algo destruido
```
El compilador detecta este tipo de errores antes de que el programa se ejecute.

*Notación 'a*

Una lifetime se escribe con un apóstrofo:

```rust
&'a i32
```

Se lee:

- “referencia a un i32 que vive al menos tanto como 'a”.

¿Por qué las funciones necesitan lifetimes explícitas?

Cuando una función recibe y devuelve referencias, Rust no sabe por sí solo qué referencia vive más.

Ejemplo:

```rust
fn mayor(a: &str, b: &str) -> &str {
    if a.len() > b.len() { a } else { b }
}
```
Esto produce error:

“la referencia devuelta necesita un lifetime, pero no está claro cuál”.


Para solucionarlo:
```rust
fn mayor<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() > b.len() { a } else { b }
}
```

Significado:

- ambos parámetros viven al menos 'a

- el retorno también vive 'a

- por lo tanto, el retorno es válido


Ejemplo completo de Lifetimes en funciones

```rust
fn el_mas_largo<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
```

uso:

```rust
let s1 = String::from("hola");
let s2 = String::from("rustaceo");

let res = el_mas_largo(s1.as_str(), s2.as_str());

println!("{}", res);
```

*Lifetimes en Structs*

Cuando un struct contiene referencias, debe tener lifetimes explícitas.

```rust
struct Texto<'a> {
    contenido: &'a str,
}

let s = String::from("Hola");
let t = Texto { contenido: &s };
```
El struct vive menos o igual que 'a.

*Lifetimes con métodos*
```rust
struct Contenedor<'a> {
    valor: &'a str,
}

impl<'a> Contenedor<'a> {
    fn obtener(&self) -> &'a str {
        self.valor
    }
}
```

El 'a del método coincide con el 'a del struct.

*Lifetimes en Enum*

```rust
enum Mensaje<'a> {
    Texto(&'a str),
    Numero(i32),
}
```

Funcionan igual que en estructuras.

*Reglas de Lifetime Elision*

Rust aplica estas reglas cuando puede inferir sin ambigüedad:

Regla 1

Cada parámetro de entrada obtiene su propio lifetime.
```rust
fn f(x: &i32, y: &i32);
```

Se convierte en:

```rust
fn f<'a, 'b>(x: &'a i32, y: &'b i32);
```

Regla 2

Si hay un solo parámetro de entrada, el retorno recibe su lifetime.

```rust
fn id(x: &i32) -> &i32;  // lifetime elision
```

Equivalente a:
```rust
fn id<'a>(x: &'a i32) -> &'a i32;
```
Regla 3

Si el método tiene &self o &mut self, el retorno hereda ese lifetime.
```rust
fn valor(&self) -> &str;
```
Equivalente a:
```rust
fn valor<'a>(&'a self) -> &'a str;
```

*Lifetime Bounds*
Puedes usar lifetimes como restricciones:
```rust
fn comparar<'a, T: PartialEq + 'a>(x: &'a T, y: &'a T) -> bool {
    x == y
}
```
T: 'a significa:

- “T vive al menos tanto como 'a”.

*Múltiples lifetimes*

Puede haber varias lifetimes independientes:
```rust
fn elegir<'a, 'b>(a: &'a str, b: &'b str) -> &'b str {
    b
}
```
Significa:

- 'a y 'b no dependen uno del otro

- el retorno depende de 'b

*Static lifetime 'static*

Es el lifetime más largo posible.

Significa:

- vive toda la duración del programa
```rust
let x: &'static str = "cadena literal";
```
Los literales string siempre son 'static.


*Ejemplo Real: dividir texto en partes*
```rust
fn primera_palabra<'a>(s: &'a str) -> &'a str {
    let bytes = s.as_bytes();

    for (i, &c) in bytes.iter().enumerate() {
        if c == b' ' {
            return &s[..i];
        }
    }

    s
}
```
Este patrón aparece muchísimo:

función lee referencia y devuelve una subreferencia válida → lifetime 'a.

*Lifetimes y Traits juntos*

Puedes tener traits parametrizados con lifetimes:
```rust
trait Logger<'a> {
    fn log(&self, msg: &'a str);
}
```
O implementar traits para tipos con lifetimes:
```rust
impl<'a> Default for Texto<'a> {
    fn default() -> Self {
        Self { contenido: "" }
    }
}
```

*Bounds con lifetimes*
```rust
fn mostrar<'a, T>(x: &'a T)
where
    T: Debug + 'a,
{
    println!("{:?}", x);
}
```
