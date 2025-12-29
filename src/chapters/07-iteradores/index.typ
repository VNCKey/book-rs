= Iteradores


El bucle for es uno de los más utilizados en Rust para iterar de manera segura y eficiente sobre rangos de valores o colecciones de datos. A diferencia de lenguajes como C, Rust no usa for con índices manuales esto para evitar errores comunes como off-by-one, sino que se basa en el trait IntoIterator. Esto hace que el código sea más idiomático, genérico y libre de errores de memoria.

Sintaxis básica:
```rust
for item in iterable {
    // Código que usa `item` en cada iteración
}
```

- *`iterable`*: Cualquier cosa que se pueda convertir en un iterador (rangos, vectores, arrays, etc.).
- *`item`*: Variable que recibe cada elemento por valor, referencia o desestructurada.
- Internamente, el *for* llama a *`into_iter()`* para crear un iterador y usa *`next()`* en un bucle while let Some(...) hasta que devuelve None.

El *for* toma ownership de la colección por defecto, pero puedes iterar por referencia *"`&colección`"* o mutable *"`&mut colección`"* para preservarla. Veremos esto en detalle más adelante.

#text(14pt)[*Rangos*]

Los rangos son iteradores lazy "no crean arrays en memoria" y son perfectos para bucles numéricos.

Se definen con *"`..`"* exclusivo o *"`..=`"* inclusivo.

- `0..5`: *Itera* de 0 a 4.
- `0..=5`: *Itera* de 0 a 5.

Ejemplo básico:

```rust
fn main() {
    for i in 0..5 {
        println!("{}", i);  // Salida: 0 1 2 3 4
    }

    for i in 0..=5 {
        println!("{}", i);  // Salida: 0 1 2 3 4 5
    }
}
```

- Reverso: Usa *"`.rev()`"* para iterar descendente.```rust
fn main() {
    for i in (0..=5).rev() {
        println!("{}", i);  // Salida: 5 4 3 2 1 0
    }
}
```

- Paso personalizado: *"`.step_by(n)`"* salta elementos.
```rust
fn main() {

    for i in (0..10).step_by(2) {

        println!("{}", i);  // Salida: 0 2 4 6 8
    }
}
```
Los rangos implementan *IntoIterator* automáticamente. Son eficientes (O(1) por elemento) y seguros (panic en debug si desbordan en modo checked).



#text(
  14pt
)[*Iterando sobre Colecciones: Arrays y Vectores*]

Las colecciones como arrays *"`[T; N]`"*, tamaño fijo y vectores *"`Vec<T>`"* dinámico, son iterables vía métodos como `into_iter()`, `iter()` y `iter_mut()`.

- *`into_iter()`*: Toma ownership y consume la colección (mueve elementos). Útil cuando quieres destruirla intencionalmente.
- *`iter()`*: Itera por referencias inmutables (&T). Preserva la colección.
- *`iter_mut()`*: Itera por referencias mutables (&mut T). Permite modificaciones sin consumir.

#text(
  14pt
)[*Iterando Arrays en Rust*]

En Rust, los bucles for permiten recorrer los elementos de un array de distintas maneras, dependiendo de cómo se accede a cada elemento:

- Por valor: se obtiene una copia del elemento.

- Por referencia: se accede sin mover ni copiar.

- Por referencia mutable: se accede para modificar los elementos.

#text(
  12pt
)[*Iteración por valor*]

Esta forma recorre los valores del array directamente.

```rust
fn main() {
    let arr1 = [100, 200, 300];

    println!("Iterando con for in (por valor):");
    for x in arr1 {
        println!("{}", x);
    }

    // Los arrays de tipos Copy (como i32) siguen disponibles
    println!("Array original: {:?}", arr1);
}
```

En arrays de tipos que implementan Copy, el array no se mueve.
Pero en colecciones no Copy como *"`Vec<String>`"*, se perdería la propiedad.

#text(
  12pt
)[*Iteración con .into_iter()*]

Convierte el array en un iterador que consume sus elementos.

```rust
fn main() {
    let arr2 = [400, 500, 600];

    println!("Iterando con into_iter():");
    for x in arr2.into_iter() {
        println!("{}", x);
    }

    // En arrays de Copy (como i32) sigue disponible,
    // pero en vectores o structs NO.
    println!("Array original aún usable: {:?}", arr2);
}
```

*"`into_iter()`"* transfiere la propiedad de cada elemento al bucle.

Úsalo cuando ya no necesites el array después.

#text(
  12pt
)[*Iteración con .iter() por referencia*]

Se usa para prestar los valores sin moverlos.

```rust
fn main() {
    let arr3 = [700, 800, 900];

    println!("Iterando con iter():");
    for &x in arr3.iter() {  // Desreferenciamos (&i32 → i32)
        println!("{}", x);
    }

    println!("Array original: {:?}", arr3);
}
```

*"`iter()`"* devuelve referencias `&T`, por lo que puedes leer los datos sin consumirlos.

#text(
  12pt
)[*Iteración con *"`.iter_mut()`"* por referencia mutable*]

Permite modificar los elementos del array durante la iteración.

```rust
fn main() {
    let mut arr4 = [1, 2, 3];

    println!("Iterando con iter_mut():");
    for x in arr4.iter_mut() {
        *x *= 10; // Desreferenciamos para modificar el valor
    }

    println!("Array modificado: {:?}", arr4);
}
```

- `iter_mut()` devuelve `&mut T`.

- Debes declarar el array como mut para usarlo.

- Es la única forma segura de modificar los valores dentro del bucle for.


#text(
  14pt
)[*Iterando Vectores en Rust*]

En Rust, los vectores *`Vec<T>`* se recorren con bucles *for* de distintas maneras, dependiendo de cómo se accede a los elementos:

- Por valor *`for x in vec`*, consume el vector.

- Por referencia *`.iter()`*, solo lectura.

- Por referencia mutable *`.iter_mut()`*, permite modificar.

- Por propiedad *`.into_iter()`*, transfiere la propiedad de los elementos.

#text(14pt)[Iteración por valor `for x in vec`]

Cuando usamos `for x in vec`, Rust mueve el vector.

Después del bucle, ya no puedes usarlo.

```rust
fn main() {
    let vec1 = vec![10, 20, 30];

    println!("Iterando con for in <valor>:");
    for x in vec1 {
        println!("{}", x);
    }

    // Error si intentas usar vec1 después:
    // println!("{:?}", vec1); // Moved value
}
```

En vectores, a diferencia de los arrays, los valores no se copian automáticamente, se mueven.


#text(14pt)[Iteración con `.into_iter()`]

`into_iter()` convierte el vector en un iterador que toma la propiedad de cada elemento.

```rust
fn main() {
    let vec2 = vec!["Rust", "es", "genial"];

    println!("→ Iterando con into_iter():");
    for palabra in vec2.into_iter() {
        println!("{}", palabra);
    }

    // El vector ya no está disponible:
    // println!("{:?}", vec2); // Error
}
```

- Similar a `for x in vec`, pero más explícito.

- Útil cuando deseas consumir el vector completamente, por ejemplo al mover datos.

#text(14pt)[Iteración con `.iter()` por referencia]

*`iter()`* presta referencias a los elementos del vector, sin moverlo.

```rust
fn main() {
    let vec3 = vec![100, 200, 300];

    println!("Iterando con iter():");
    for valor in vec3.iter() {
        println!("{}", valor);
    }

    println!("Vector original sigue disponible: {:?}", vec3);
}
```

- El tipo de valor es &i32 "referencia".

- Si quieres el valor directo, puedes desreferenciar: for &valor in *`vec3.iter() { ... }`*.

#text(14pt)[Iteración con `.iter_mut()` por referencia mutable]

`iter_mut()` permite modificar los elementos directamente en el bucle.

```rust
fn main() {
    let mut vec4 = vec![1, 2, 3];

    println!("Iterando con iter_mut():");
    for valor in vec4.iter_mut() {
        *valor *= 10; // modificamos directamente
    }

    println!("Vector modificado: {:?}", vec4);
}
```

- El tipo de valor es `&mut i32`.

- Debes declarar el vector como `mut`.

- Los cambios se aplican directamente al vector original.

#text(14pt)[Iterar con índices cuando lo necesitas]

A veces, también puedes iterar manualmente con índices si necesitas acceder a la posición.

```rust
fn main() {
    let vec5 = vec!["A", "B", "C"];

    println!("Iterando con índices:");
    for i in 0..vec5.len() {
        println!("Índice: {}, Valor: {}", i, vec5[i]);
    }
}
```

El acceso con *`vec[i]`* puede causar pánico si el índice está fuera del rango.
Para evitarlo, usa *`vec.get(i)`* que devuelve *`Option<&T>`*.


#text(
  14pt
)[*For con Tuplas*]

Una tupla en sí no es iterable.

No puedes hacer directamente:

```rust
for x in (1, 2, 3) { } // Error
```

Esto se debe a que una tupla es una estructura de longitud fija y heterogénea, no una secuencia.

Sin embargo, puedes iterar colecciones que contienen tuplas, como vectores o arrays, y desestructurarlas dentro del for.

Ejemplo:
```rust
let pares = vec![(1, "uno"), (2, "dos"), (3, "tres")];

for (n, palabra) in pares {
    println!("{} -> {}", n, palabra); // consume pares
}
```

- *`for (n, palabra)`* in pares desestructura cada tupla del vector.

- El vector pares es consumido "moved" porque no usamos referencias.

Si queremos conservarlo:

```rust
let mapa = vec![(1, 2), (3, 4)];

for (a, b) in &mapa { // iterando por referencia
    println!("{} + {} = {}", a, b, a + b);
}
```

Aquí, a y b son referencias *`&i32`*, y el vector mapa sigue disponible después del bucle.

#text(14pt)[For con Strings (&str y String)]

Las cadenas de texto pueden recorrerse de distintas formas, según qué desees iterar:
caracteres, bytes o graphemes (combinaciones visuales de caracteres).

Ejemplo:
```rust
let s = "hola 😊";

for c in s.chars() {
    println!("{}", c);
}

for b in s.bytes() {
    println!("{}", b);
}
```

Detalles importantes:

- `for c in s.chars()`, itera sobre caracteres Unicode (char).

  Ejemplo de salida: `h`, `o`, `l`, `a`, , `😊`.

- `for b in s.bytes()`, itera sobre bytes *u8*, mostrando la codificación UTF-8.

  Ejemplo: `104`, `111`, `108`, `97`, `32`, `240`, `159`, `152`, `138`.

#text(
  14pt
)[*break y continue*]

- `break` : termina el bucle actual.

- `continue` : salta a la siguiente iteración.


```rust
for i in 0..6 {
    if i == 3 {
        continue; // se salta el 3
    }
    if i == 5 {
        break; // rompe el bucle
    }
    println!("{}", i);
}
```


#text(
  14pt
)[*Etiquetas en For*]

Rust permite etiquetar bucles para romper o continuar desde un nivel específico.
```rust
'outer: for i in 1..=3 {
    for j in 1..=3 {
        if i == 2 && j == 2 {
            break 'outer; // rompe el bucle externo
        }
        println!("i={}, j={}", i, j);
    }
}
```

Salida:
```yaml
i=1, j=1
i=1, j=2
i=1, j=3
i=2, j=1
```
#text(
  14pt
)[*Ownership en for*]

Por defecto, for consume "mueve" la colección.

Para evitarlo, se itera por referencia `& o &mut`.

Ejemplo mutable:
```rust
fn main() {
    let mut vec = vec![1, 2, 3];
    for num in vec.iter_mut() {  // Itera con mut borrow
        *num += 1;
    }
    println!("{:?}", vec); // [2, 3, 4]
}
```

#text(14pt)[*Iteradores Avanzados*]

Los iteradores son una parte esencial de Rust:
permiten recorrer datos de forma inmutable, segura y funcional, sin necesidad de bucles imperativos.

Cualquier tipo que implemente el trait *Iterator* puede usarse en un *for*, o manipularse mediante sus métodos.

Creación de iteradores

```rust
let v = vec![10, 20, 30];
let mut it = v.iter(); // &i32

println!("{:?}", it.next()); // Some(&10)
println!("{:?}", it.next()); // Some(&20)
println!("{:?}", it.next()); // Some(&30)
println!("{:?}", it.next()); // None
```

Cada llamada a `.next()` devuelve `Option<T>`, hasta que se agotan los elementos.

Métodos comunes:

- *`map()`* : transforma```rust
let v = vec![1, 2, 3];
let doblados: Vec<_> = v.iter().map(|x| x * 2).collect();
println!("{:?}", doblados); // [2, 4, 6]
```
- *`filter()`* : filtra según condición```rust
let v = vec![1, 2, 3, 4, 5];
let pares: Vec<_> = v.iter().filter(|x| *x % 2 == 0).collect();
println!("{:?}", pares); // [2, 4]
```
- *`fold()`* : acumula (reduce)```rust
let suma = (1..=5).fold(0, |acc, x| acc + x);
println!("{}", suma); // 15
```
- *`take()  skip()`*```rust
let v = vec![10, 20, 30, 40, 50];

for n in v.iter().skip(1).take(3) {
    println!("{}", n);
}
// Imprime: 20, 30, 40
```
- *`rev()`* : invierte el orden```rust
for n in (1..=3).rev() {
    println!("{}", n);
}
// 3, 2, 1
```
Combinaciones poderosas
```rust
let datos = vec![1, 2, 3, 4, 5, 6];

let resultado: Vec<_> = datos
    .iter()
    .filter(|x| *x % 2 == 0) // pares
    .map(|x| x * x)          // al cuadrado
    .rev()                   // orden inverso
    .collect();

println!("{:?}", resultado); // [36, 16, 4]
```

#text(
  14pt
)[*Iterar múltiples colecciones
*]

```rust
fn main() {
    let a = vec![1, 2, 3];

    let b = vec!["uno", "dos", "tres"];

    for (num, texto) in a.iter().zip(b.iter()) {  // Tupla (i32, &str)
        println!("{}: {}", num, texto);
    }

    // Salida: 1: uno, 2: dos, 3: tres
    // Se detiene en el más corto.
}
```

#text(
  14pt
)[*Búsqueda de Iteradores
*]


Estos métodos trabajan sobre iteradores y devuelven valores booleanos o resultados parciales en lugar de colecciones completas.

No consumen todos los elementos si no es necesario, paran cuando encuentran el resultado.

- *`any()`*

  Devuelve true si al menos un elemento cumple la condición.

  Es equivalente a decir:

  “¿Existe alguno que cumpla esto?”

  ```rust
fn main() {
    let numeros = vec![1, 2, 3, 4, 5];

    let hay_par = numeros.iter().any(|&x| x % 2 == 0);
    println!("¿Hay algún número par? {}", hay_par); // true

    let mayor_a_diez = numeros.iter().any(|&x| x > 10);
    println!("¿Alguno mayor a 10? {}", mayor_a_diez); // false
}
  ```

  `any()` deja de iterar en cuanto encuentra un true.

  Ejemplo: no sigue buscando más pares cuando ya encontró uno.

- *`all()`*

  Devuelve true si todos los elementos cumplen la condición.

  Es equivalente a decir:

  “¿Todos cumplen esto?”

  ```rust
fn main() {
    let edades = vec![18, 22, 25, 30];

    let todos_mayores = edades.iter().all(|&x| x >= 18);
    println!("¿Todos son mayores de edad? {}", todos_mayores); // true

    let todos_pares = edades.iter().all(|&x| x % 2 == 0);
    println!("¿Todos son pares? {}", todos_pares); // false
}
  ```

  `all()` también detiene la iteración en cuanto encuentra un false.

- *`find()`*

  Busca el primer elemento que cumpla una condición y devuelve Option<T>.

  Es equivalente a decir:

  “Encuentra el primer elemento que cumpla esto”.

  ```rust
fn main() {
    let numeros = vec![10, 20, 30, 40, 50];

    if let Some(x) = numeros.iter().find(|&&n| n > 25) {
        println!("El primero mayor a 25 es: {}", x); // 30
    } else {
        println!("No hay ninguno mayor a 25");
    }

    // Otro ejemplo: buscar una palabra
    let palabras = vec!["rust", "golang", "python"];

    match palabras.iter().find(|&&p| p.starts_with('p')) {
        Some(p) => println!("Encontrado: {}", p),  // python
        None => println!("No encontrado"),
    }
}
  ```

  - `find()` devuelve una referencia `Option<&T>` si usas `.iter()`.

  - Si usas `.into_iter()`, moverá los elementos `Option<T>`.

Ejemplo combinado

Estos métodos se pueden combinar para expresiones potentes:

```rust
fn main() {
    let nums = vec![1, 2, 3, 4, 5];

    // ¿Existe algún impar mayor a 3?
    let resultado = nums.iter().any(|&x| x % 2 == 1 && x > 3);
    println!("¿Impar > 3?: {}", resultado); // true (5)

    // Verificar todos menores que 10
    println!("¿Todos < 10?: {}", nums.iter().all(|&x| x < 10)); // true

    // Buscar primer número divisible por 4
    if let Some(x) = nums.iter().find(|&&x| x % 4 == 0) {
        println!("Divisible por 4: {}", x); // 4
    }
}
```

Concepto clave

Los iteradores en Rust son lazy (perezosos):
no ejecutan nada hasta que se consumen, por ejemplo con:

- collect()

- for

- count()

- sum()

- any(), all(), find()

Ejemplo:
```rust
let v = vec![1, 2, 3];
let it = v.iter().map(|x| x * 10); // aún no se ejecuta
println!("{}", it.sum::<i32>());   // se ejecuta aquí
```


Detallar los iteradores con javascript!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
