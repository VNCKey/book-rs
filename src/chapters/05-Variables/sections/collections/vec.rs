=== Vectores

Un vector en Rust, representado por el tipo `Vec<T>`, es una colección dinámica que permite almacenar una
cantidad variable de valores del mismo tipo en una secuencia contigua de memoria. A diferencia de los arrays,
cuyo tamaño es fijo y debe conocerse en tiempo de compilación, los vectores pueden crecer o reducirse durante la
ejecución del programa.

#text(14pt)[*Creación de vectores*]

*1. Usando la macro `vec![]`*

```rust
let v = vec![1, 2, 3, 4];
println!("{:?}", v);  // [1, 2, 3, 4]
```

*2. Creación explícita con `Vec::new()`*

```rust
let mut v: Vec<i32> = Vec::new();
```

*3. Vector con elementos repetidos*

```rust
let v = vec![0; 5];  // [0, 0, 0, 0, 0]
println!("{:?}", v);
```

*4. Vector a partir de otro vector*

```rust
let v1 = vec![1, 2, 3, 4, 5];
let v2 = v1.clone();  // crea una copia exacta

println!("{:?}", v1);  // [1, 2, 3, 4, 5]
println!("{:?}", v2);  // [1, 2, 3, 4, 5]
```

*5. Vector a partir de un iterador*

```rust
let v: Vec<i32> = (0..5).collect();
println!("{:?}", v);  // [0, 1, 2, 3, 4]
```

*6. Vector con capacidad reservada*

```rust
let mut v = Vec::with_capacity(10);
println!("len: {}, cap: {}", v.len(), v.capacity());
// len: 0, cap: 10
```

Rust reservará espacio en memoria desde el comienzo, evitando realocaciones posteriores.

*7. Vector a partir de un array*

```rust
let arr = [1, 2, 3];
let v1 = arr.to_vec();
let v2 = Vec::from([1, 2, 3]);

println!("{:?}", v1);  // [1, 2, 3]
println!("{:?}", v2);  // [1, 2, 3]
```

#text(14pt)[*Acceso a elementos*]

Cuando accedes a un índice en un vector, puedes hacerlo de dos maneras:

*1. Usando índice directo `[]`*

```rust
let v = vec![10, 20, 30];
       //    0,  1,  2

println!("Primer elemento: {}", v[0]);   // 10
println!("Segundo elemento: {}", v[1]);  // 20
```

Si accedes a un índice fuera de rango, el programa entra en `panic` en tiempo de ejecución:

```rust
let v = vec![10, 20, 30];
// let x = v[5];  // panic: index out of bounds
```

*2. Usando `get()` (recomendado para acceso seguro)*

Con `.get()` es más seguro ya que retorna un `Option`:

```rust
let v = vec![10, 20, 30];

match v.get(1) {
    Some(valor) => println!("Valor: {}", valor),  // Valor: 20
    None => println!("Índice fuera de rango"),
}

println!("{:?}", v.get(5));  // None
```

*3. Primera y última posición*

```rust
let v = vec![10, 20, 30, 40];

println!("{:?}", v.first());  // Some(10)
println!("{:?}", v.last());   // Some(40)
```

Ambos retornan `Option<&T>`.

#text(14pt)[*Mutabilidad*]

Los vectores pueden modificarse si se declaran con `mut`:

```rust
let mut v = vec![10, 20, 30];

v[1] = 50;  // cambia 20 => 50

println!("{:?}", v);  // [10, 50, 30]
```

También puedes obtener referencias mutables:

```rust
let mut v = vec![1, 2, 3];

if let Some(primer) = v.first_mut() {
    *primer = 100;
}

println!("{:?}", v);  // [100, 2, 3]
```

#text(14pt)[*Agregar elementos*]

*1. Agregar al final con `push()`*

```rust
let mut v = vec![1, 2];

v.push(3);
v.push(4);

println!("{:?}", v);  // [1, 2, 3, 4]
```

*2. Agregar múltiples elementos con `extend()`*

```rust
let mut v = vec![1, 2, 3];

v.extend([4, 5, 6]);

println!("{:?}", v);  // [1, 2, 3, 4, 5, 6]
```

*3. Mover todos los elementos de otro vector con `append()`*

```rust
let mut vec1 = vec![1, 2, 3];
let mut vec2 = vec![4, 5, 6];

vec1.append(&mut vec2);

println!("{:?}", vec1);  // [1, 2, 3, 4, 5, 6]
println!("{:?}", vec2);  // [] (quedó vacío)
```

`append()` mueve todos los elementos, dejando el segundo vector vacío.

*4. Cambiar tamaño con `resize()`*

```rust
let mut v = vec!["hola"];

v.resize(3, "mundo");

println!("{:?}", v);  // ["hola", "mundo", "mundo"]
```

Si el nuevo tamaño es menor, trunca el vector:

```rust
let mut v = vec![1, 2, 3, 4, 5];

v.resize(2, 0);

println!("{:?}", v);  // [1, 2]
```

#text(14pt)[*Insertar elementos*]

Insertar en una posición específica con `insert()`:

```rust
let mut v = vec![10, 20, 30, 40, 50];
         //      0,  1,  2,  3,  4

v.insert(2, 25);  // inserta 25 en índice 2

println!("{:?}", v);  // [10, 20, 25, 30, 40, 50]
```

⚠️ `insert()` desplaza todos los elementos siguientes, por lo que es una operación O(n).

#text(14pt)[*Eliminar elementos*]

*1. Eliminar por índice con `remove()`*

```rust
let mut v = vec![10, 20, 30, 40];

let eliminado = v.remove(1);  // elimina el elemento en índice 1

println!("Eliminado: {}", eliminado);  // 20
println!("{:?}", v);  // [10, 30, 40]
```

*2. Eliminar el último elemento con `pop()`*

```rust
let mut v = vec![1, 2, 3];

let ultimo = v.pop();  // retorna Option<T>

println!("{:?}", ultimo);  // Some(3)
println!("{:?}", v);       // [1, 2]
```

Si el vector está vacío, `pop()` retorna `None`:

```rust
let mut v: Vec<i32> = vec![];
println!("{:?}", v.pop());  // None
```

*3. Eliminar un rango con `drain()`*

```rust
let mut v = vec![10, 20, 30, 40, 50];
         //      0,  1,  2,  3,  4

let drenado: Vec<i32> = v.drain(1..4).collect();

println!("Drenado: {:?}", drenado);  // [20, 30, 40]
println!("Vector: {:?}", v);          // [10, 50]
```

`drain()` retorna un iterador con los elementos eliminados.

*4. Vaciar todo el vector con `clear()`*

```rust
let mut v = vec![10, 20, 30];

v.clear();  // elimina todos los elementos

println!("{:?}", v);              // []
println!("Longitud: {}", v.len()); // 0
```

La capacidad se mantiene:

```rust
let mut v = vec![1, 2, 3, 4, 5];
println!("Capacidad antes: {}", v.capacity());

v.clear();
println!("Capacidad después: {}", v.capacity());  // misma capacidad
```

*5. Acortar con `truncate()`*

Mantiene los primeros n elementos y elimina el resto:

```rust
let mut v = vec![1, 2, 3, 4, 5];

v.truncate(2);

println!("{:?}", v);  // [1, 2]
```

Para vaciar todo:

```rust
let mut v = vec![1, 2, 3];

v.truncate(0);

println!("{:?}", v);  // []
```

*6. Eliminar con reemplazo `swap_remove()`*

El elemento eliminado se reemplaza por el último elemento del vector (más eficiente pero no mantiene el orden):

```rust
let mut v = vec!["foo", "bar", "baz", "qux"];

let eliminado = v.swap_remove(1);  // elimina "bar"

println!("Eliminado: {}", eliminado);  // bar
println!("{:?}", v);  // ["foo", "qux", "baz"]
```

Ventaja: O(1) en lugar de O(n).

*7. Eliminar elementos que cumplen condición con `retain()`*

```rust
let mut v = vec![1, 2, 3, 4, 5, 6];

v.retain(|&x| x % 2 == 0);  // mantener solo pares

println!("{:?}", v);  // [2, 4, 6]
```

*8. Eliminar duplicados consecutivos con `dedup()`*

```rust
let mut v = vec![1, 2, 2, 3, 3, 3, 4];

v.dedup();

println!("{:?}", v);  // [1, 2, 3, 4]
```

Para eliminar todos los duplicados (no solo consecutivos), primero ordena:

```rust
let mut v = vec![3, 1, 2, 1, 3, 2];

v.sort();
v.dedup();

println!("{:?}", v);  // [1, 2, 3]
```

#text(14pt)[*Intercambio y manipulación*]

*1. Intercambiar elementos con `swap()`*

```rust
let mut v = vec!["a", "b", "c", "d", "e"];

v.swap(1, 3);  // intercambia índices 1 y 3

println!("{:?}", v);  // ["a", "d", "c", "b", "e"]
```

*2. Invertir el vector con `reverse()`*

```rust
let mut v = vec![1, 2, 3, 4, 5];

v.reverse();

println!("{:?}", v);  // [5, 4, 3, 2, 1]
```

*3. Rotar elementos*

Rotar a la izquierda:

```rust
let mut v = vec![1, 2, 3, 4, 5];

v.rotate_left(2);

println!("{:?}", v);  // [3, 4, 5, 1, 2]
```

Rotar a la derecha:

```rust
let mut v = vec![1, 2, 3, 4, 5];

v.rotate_right(2);

println!("{:?}", v);  // [4, 5, 1, 2, 3]
```

*4. Dividir el vector con `split_off()`*

```rust
let mut v = vec![1, 2, 3, 4, 5];

let segunda_parte = v.split_off(3);

println!("Primera parte: {:?}", v);  // [1, 2, 3]
println!("Segunda parte: {:?}", segunda_parte);  // [4, 5]
```

#text(14pt)[*Longitud y capacidad*]

Rust distingue entre:

- `len()` : cantidad actual de elementos
- `capacity()` : espacio reservado en memoria

```rust
let mut v = Vec::with_capacity(10);

println!("len: {}, cap: {}", v.len(), v.capacity());
// len: 0, cap: 10

v.push(1);
v.push(2);

println!("len: {}, cap: {}", v.len(), v.capacity());
// len: 2, cap: 10
```

Cuando la capacidad se llena, el vector duplica automáticamente su espacio en memoria:

```rust
let mut v = Vec::with_capacity(2);

v.push(1);
v.push(2);
println!("cap: {}", v.capacity());  // 2

v.push(3);  // se queda sin espacio, realocar
println!("cap: {}", v.capacity());  // 4 (duplicado)
```

*Métodos relacionados con capacidad:*

```rust
let mut v = vec![1, 2, 3];

// Reservar más capacidad
v.reserve(10);
println!("cap: {}", v.capacity());  // al menos 13

// Reducir capacidad al mínimo necesario
v.shrink_to_fit();
println!("cap: {}", v.capacity());  // 3

// Reservar exactamente n elementos adicionales
v.reserve_exact(5);
println!("cap: {}", v.capacity());  // 8
```

#text(14pt)[*Copia y movimiento*]

Los vectores NO implementan `Copy`, solo `Clone`.

Al asignarlos, se mueven, no se copian automáticamente:

```rust
let v1 = vec![1, 2, 3];
let v2 = v1;  // v1 se mueve a v2

// println!("{:?}", v1);  // ✗ Error: valor movido
println!("{:?}", v2);     // ✓ [1, 2, 3]
```

Para mantener ambos, usa `clone()`:

```rust
let v1 = vec![1, 2, 3];
let v2 = v1.clone();  // copia explícita

println!("{:?}", v1);  // [1, 2, 3]
println!("{:?}", v2);  // [1, 2, 3]
```

#text(14pt)[*Comparaciones*]

Puedes comparar vectores si sus elementos implementan `PartialEq` o `Ord`:

```rust
let a = vec![1, 2, 3];
let b = vec![1, 2, 3];
let c = vec![1, 2, 4];

println!("{}", a == b);  // true
println!("{}", a != c);  // true
println!("{}", a < c);   // true (comparación lexicográfica)
```

La comparación es elemento por elemento, de izquierda a derecha.

#text(14pt)[*Ordenamiento*]

*1. Ordenar con `sort()`*

```rust
let mut v = vec![3, 1, 4, 1, 5];

v.sort();

println!("{:?}", v);  // [1, 1, 3, 4, 5]
```

*2. Ordenar de mayor a menor*

```rust
let mut v = vec![3, 1, 4, 1, 5];

v.sort_by(|a, b| b.cmp(a));

println!("{:?}", v);  // [5, 4, 3, 1, 1]
```

*3. Ordenar con función personalizada `sort_by_key()`*

```rust
let mut personas = vec![
    ("Ana", 25),
    ("Luis", 30),
    ("Pedro", 20),
];

personas.sort_by_key(|persona| persona.1);  // ordenar por edad

println!("{:?}", personas);
// [("Pedro", 20), ("Ana", 25), ("Luis", 30)]
```

*4. Ordenamiento inestable (más rápido) `sort_unstable()`*

```rust
let mut v = vec![3, 1, 4, 1, 5];

v.sort_unstable();  // más rápido pero no preserva orden de elementos iguales

println!("{:?}", v);  // [1, 1, 3, 4, 5]
```

#text(14pt)[*Búsqueda*]

*1. Verificar si contiene un elemento con `contains()`*

```rust
let v = vec![10, 20, 30, 40];

println!("{}", v.contains(&20));  // true
println!("{}", v.contains(&99));  // false
```

*2. Buscar posición con `iter().position()`*

```rust
let v = vec![10, 20, 30, 40];

if let Some(pos) = v.iter().position(|&x| x == 30) {
    println!("Encontrado en índice: {}", pos);  // 2
}
```

*3. Búsqueda binaria `binary_search()` (requiere vector ordenado)*

```rust
let v = vec![1, 3, 5, 7, 9];

match v.binary_search(&5) {
    Ok(pos) => println!("Encontrado en: {}", pos),  // 2
    Err(_) => println!("No encontrado"),
}
```

#text(14pt)[*Vectores multidimensionales*]

Puedes crear vectores dentro de otros vectores (matrices dinámicas):

```rust
let matriz = vec![
    vec![1, 2, 3],
    vec![4, 5, 6],
    vec![7, 8, 9],
];

println!("{}", matriz[0][1]);  // 2
println!("{}", matriz[1][2]);  // 6
println!("{}", matriz[2][0]);  // 7
```

Crear una matriz de tamaño dinámico:

```rust
let filas = 3;
let columnas = 4;
let mut matriz = vec![vec![0; columnas]; filas];

matriz[1][2] = 99;

println!("{:?}", matriz);
// [[0, 0, 0, 0], [0, 0, 99, 0], [0, 0, 0, 0]]
```


#text(14pt)[*Métodos de concatenación*]

*1. Concatenar slices con `concat()`*

```rust
let partes = vec!["Hola", "Mundo"];
let resultado = partes.concat();

println!("{}", resultado);  // HolaMundo
```

*2. Unir con separador usando `join()`*

```rust
let palabras = vec!["Hola", "desde", "Rust"];
let frase = palabras.join(" ");

println!("{}", frase);  // Hola desde Rust
```

```rust
let numeros = vec!["1", "2", "3", "4"];
let resultado = numeros.join("-");

println!("{}", resultado);  // 1-2-3-4
```

#text(14pt)[*Métodos de verificación*]

```rust
let v = vec![1, 2, 3, 4, 5];

// Verificar si está vacío
println!("{}", v.is_empty());  // false

// Verificar si comienza con una secuencia
println!("{}", v.starts_with(&[1, 2]));  // true

// Verificar si termina con una secuencia
println!("{}", v.ends_with(&[4, 5]));  // true
```

#text(14pt)[*Repetir vector*]

```rust
let v = vec![1, 2];
let repetido = v.repeat(3);

println!("{:?}", repetido);  // [1, 2, 1, 2, 1, 2]
```

#text(14pt)[*Conversión entre tipos*]

*De vector a array (tamaño conocido)*

```rust
let v = vec![1, 2, 3, 4];
let arr: [i32; 4] = v.try_into().unwrap();

println!("{:?}", arr);  // [1, 2, 3, 4]
```

*De vector a slice*

```rust
let v = vec![1, 2, 3, 4, 5];
let slice: &[i32] = &v[1..4];

println!("{:?}", slice);  // [2, 3, 4]
```
