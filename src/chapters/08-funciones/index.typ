= Funciones en Rust

Las funciones son bloques de código reutilizables diseñados para realizar una tarea específica. Facilitan la modularidad, el mantenimiento y la reutilización del código al dividir un programa en partes más pequeñas y manejables. En Rust, las funciones se distinguen de los métodos que están asociados a structs o enums mediante impl, aquí nos enfocamos en funciones independientes.

Se declaran con la palabra clave `fn`, y Rust enfatiza la seguridad de tipos: los parámetros siempre requieren tipos explícitos, y los retornos son opcionales pero tipados.

Sintaxis básica:
```rust
fn nombre_funcion(param1: Tipo1, param2: Tipo2) -> TipoRetorno {
    // Cuerpo de la función
    // El último expresión sin ; se devuelve automáticamente
}
```

Ejemplo simple:

```rust
fn saludar() {
    println!("¡Hola, mundo!");
}
fn main() {
    saludar();  // Llama la función
}
```

#text(16pt)[Parámetros]

Los parámetros son entradas a la función y deben especificar su tipo. Rust no infiere tipos en declaraciones de parámetros para evitar ambigüedades.

```rust
/// Suma dos números enteros y los imprime.
fn sumar(a: i32, b: i32) {
    println!("La suma es: {}", a + b);
}

fn main() {
    sumar(5, 3);  // Salida: La suma es: 8
}
```


#text(16pt)[Valores de retorno]


Las funciones pueden devolver valores. Si no se especifica, devuelven "`() (unit type)`".

- Retorno implícito:

  La última expresión sin *"`;`"* se devuelve automáticamente, estilo idiomático de Rust.
```rust
fn cuadrado(x: i32) -> i32 {
    x * x  // Sin ";"  devuelve el resultado
}

fn main() {
    let resultado = cuadrado(4);
    println!("Cuadrado: {}", resultado);  // 16
}
```

Si agregas *"`;`"*:
```rust
fn cuadrado_con_semi(x: i32) -> i32 {
    x * x;  // Con ";"  devuelve ()
    0       // Esto se ignora
}
```

#text(14pt)[return Explícito]

Para salidas tempranas "early returns", usa *"`return expr;`"*. Es opcional al final, pero útil en condicionales.

```rust
fn main() {
    let a = 15;
    let b = 9;

    println!("El valor mayor de {a} y {b} es : {}", valor_mayor(a , b));
}

fn valor_mayor(a:i32, b:i32) -> i32{
    if a > b {
        return a
    }else{
        return b
    }
}
```

Otro ejemplo: Verificar paridad.

```rust
fn es_par(n: i32) -> bool {
    if n % 2 == 0 {
        true  // Expresión
    } else {
        false
    }
}

/// Equivalente con return (más conciso).
fn es_par_ret(n: i32) -> bool {
    return n % 2 == 0;  // Explícito
}
```


#text(16pt)[Funciones anidadas]

Rust permite definir funciones dentro de otras "*inner functions*", pero solo visibles en el scope padre. Útiles para helpers locales.
```rust
fn principal() {
    fn interna(x: i32) -> i32 {  // Anidada
        x + 1
    }
    println!("{}", interna(5));  // 6
}

fn main() {
    principal();
}
```



#text(16pt)[Closures: Funciones Anónimas]

Los closures son funciones anónimas que capturan el entorno "*variables externas*". Son como lambdas en Python/JS, pero con reglas estrictas de captura "*borrow/move*". Ideales para iteradores, callbacks y FP.

Sintaxis:
```rust
let nombre_closure = |param1: Tipo1, param2: Tipo2| -> TipoRetorno {
    // Cuerpo (expresión o bloque)
};
```

Ejemplo básico:
```rust
let resta = |a: i32, b: i32| -> i32 {a - b};  // Explícito
let suma  = |a: i32, b: i32| a + b;  // Infieren tipos si posible
println!("{}", suma(2, 3));         // 5
println!("{}", resta(5, 3));         // 2
```


#text(16pt)[Devolviendo Múltiples Valores: Tuplas]


Las funciones pueden devolver múltiples valores empaquetados en una tupla:

```rust
fn calcular(a: i32, b: i32) -> (i32, i32) {
    (a + b, a * b)  // Tupla como último valor
}

fn main() {
    let (suma, producto) = calcular(4, 5);
    println!("Suma: {}, Producto: {}", suma, producto);  // 9, 20
}
```


#text(16pt)[Devolver un array]


Los arrays en Rust tienen tamaño fijo que se define en el tipo.

```rust
fn crear_array() -> [i32; 3] {
    [10, 20, 30]
}

fn main() {
    let arr = crear_array();
    println!("Array: {:?}", arr);  // [10, 20, 30]
}
```

#text(16pt)[Devolver un vector]


Un vector `Vec<T>` es dinámico y mucho más usado en la práctica:

```rust
/// Crea un vector de strings.
fn crear_vector() -> Vec<String> {
    vec!["Rust".to_string(), "es".to_string(), "genial".to_string()]
}

fn main() {
    let v = crear_vector();
    println!("Vector: {:?}", v);  // ["Rust", "es", "genial"]
}
```

#text(16pt)[Funciones con referencias]

Pasa datos grandes por &T para evitar copias/moves.

```rust
/// Calcula longitud sin tomar ownership.
fn longitud(texto: &String) -> usize {  // &String (o &str para más flex)
    texto.len()
}

fn main() {
    let s = String::from("Hola Rust");
    let l = longitud(&s);  // Borrow
    println!("'{}' tiene {} caracteres", s, l);  // s intacto
}
```

#text(16pt)[Funciones por referencia y mutables]

```rust
fn incrementar(x: &mut i32) {
    *x += 1; // se desreferencia con *
}

fn main() {
    let mut num = 10;
    incrementar(&mut num);
    println!("{}", num); // 11
}
```

Explicación rápida:

- *"`&mut`"*, referencia mutable (permite modificar la variable original).

- *"`*x`"*, desreferencia: accede al valor real dentro de la referencia.

Ejemplos prácticos de funciones con *`&mut`*

Ahora veamos casos más útiles y aplicables.

#text(14pt)[Ejemplo 1: Modificar un vector desde una función]

Supongamos que queremos agregar elementos a un vector existente.

```rust
fn agregar_elemento(v: &mut Vec<i32>, nuevo: i32) {
    v.push(nuevo);
}

fn main() {
    let mut numeros = vec![1, 2, 3];
    agregar_elemento(&mut numeros, 4);
    agregar_elemento(&mut numeros, 5);

    println!("{:?}", numeros); // [1, 2, 3, 4, 5]
}
```

Aquí:

- Modifica directamente el vector original gracias a la referencia mutable.

- Sin &mut, el push() fallaría porque Rust no permitiría modificarlo.

#text(14pt)[Ejemplo 2: Convertir texto a mayúsculas]

```rust
fn a_mayusculas(texto: &mut String) {
    *texto = texto.to_uppercase();
}

fn main() {
    let mut saludo = String::from("hola rust");
    a_mayusculas(&mut saludo);
    println!("{}", saludo); // HOLA RUST
}
```

Explicación:

- `to_uppercase()` crea un nuevo `String`.

- Lo reasignamos sobre el mismo valor usando *"`*texto = ....`"*

#text(14pt)[Ejemplo 3: Restablecer valores en un arreglo mutable]

```rust
fn resetear(arr: &mut [i32]) {
    for x in arr.iter_mut() {
        *x = 0;
    }
}

fn main() {
    let mut datos = [3, 7, 9];
    resetear(&mut datos);
    println!("{:?}", datos); // [0, 0, 0]
}
```

Puntos clave:

- `&mut [i32]` es un slice mutable del array.

#text(14pt)[Ejemplo 4: Intercambiar valores (swap)]

```rust
fn intercambiar(a: &mut i32, b: &mut i32) {
    let temp = *a;
    *a = *b;
    *b = temp;
}

fn main() {
    let mut x = 10;
    let mut y = 20;
    intercambiar(&mut x, &mut y);
    println!("x = {}, y = {}", x, y); // x = 20, y = 10
}
```

Útil cuando quieres manipular variables sin devolver múltiples valores.


#text(16pt)[Funciones genéricas]

Una función genérica permite que el tipo de sus parámetros no esté fijo.

En lugar de hacer una función solo para `i32` o `f64`, puedes hacer una que funcione con cualquier tipo.

Ejemplo sin genéricos

```rust
fn mostrar_i32(x: i32) {
    println!("El valor es: {}", x);
}

fn main() {
    mostrar_i32(10);
}
```

Esta función solo acepta `i32`.

Si intentas pasarle un `f64`, no compila.

Ejemplo genérico básico

```rust
fn mostrar<T>(x: T) {
    println!("Tengo un valor!");
}

fn main() {
    mostrar(10);        // i32
    mostrar(3.14);      // f64
    mostrar("hola");    // &str
}
```

#text(16pt)[Retorno genérico]
```rust
fn devolver_mismo<T>(x: T) -> T {
    x
}

fn main() {
    let n = devolver_mismo(5);

    let t = devolver_mismo("texto");

    println!("{} - {}", n, t);
}
```

Esta función devuelve exactamente el mismo tipo que recibe.

#text(14pt)[Ejemplo 1: Intercambiar valores]

Una función genérica puede manipular cualquier tipo, no solo devolverlo.

Veamos cómo intercambiar dos valores de cualquier tipo (sin importar si son i32, String, etc.):

```rust
fn intercambiar<T>(a: &mut T, b: &mut T) {
    let temp = *a;     // mueve el valor de a
    *a = *b;           // reemplaza a por b
    *b = temp;         // reemplaza b por temp
}

fn main() {
    let mut x = 10;
    let mut y = 20;

    intercambiar(&mut x, &mut y);
    println!("x = {}, y = {}", x, y); // x = 20, y = 10
}
```

Aquí:

- `T` puede ser cualquier tipo (numérico, texto, struct…).

- `&mut T` indica que tomamos referencias mutables (podemos modificarlas).

- No necesitamos saber qué tipo es `T`, Rust se encarga en tiempo de compilación.


#text(14pt)[Ejemplo 4: Genéricos + funciones que retornan otro tipo genérico]

```rust
fn convertir_en_vec<T>(x: T) -> Vec<T> {
    vec![x]
}

fn main() {
    let numeros = convertir_en_vec(42);
    let palabras = convertir_en_vec("hola");

    println!("{:?}", numeros);  // [42]
    println!("{:?}", palabras); // ["hola"]
}
```

Esta función:

- Toma un valor de tipo T

- Devuelve un `Vec<T>` (vector del mismo tipo)
