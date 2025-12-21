=== HashMap

En Rust, `HashMap<K, V>` es una colección que almacena pares clave-valor, donde cada clave es única y está asociada con un valor.

Es una estructura de datos fundamental para búsquedas rápidas por clave.

`HashMap` vive en el heap y debe importarse desde la biblioteca estándar:

```rust
use std::collections::HashMap;
```

*Características principales:*
- Almacena pares clave-valor `(K, V)`
- Cada clave es única (no hay claves duplicadas)
- Acceso rápido a valores por clave: O(1) en promedio
- No mantiene orden de inserción
- Las claves deben implementar `Eq` y `Hash`
- Tamaño dinámico (puede crecer)
- Vive en el heap

#text(14pt)[*Creación de HashMap*]

*1. HashMap vacío con `new()`*

```rust
use std::collections::HashMap;

let mut mapa: HashMap<String, i32> = HashMap::new();

println!("{:?}", mapa);  // {}
```

Siempre necesitas `mut` para modificar un HashMap.

*2. Usando `from()` con array de tuplas*

```rust
use std::collections::HashMap;

let mapa = HashMap::from([
    ("Rust", 2015),
    ("Python", 1991),
    ("JavaScript", 1995),
]);

println!("{:?}", mapa);
```

*3. Con capacidad reservada*

```rust
use std::collections::HashMap;

let mut mapa: HashMap<String, i32> = HashMap::with_capacity(10);

println!("Capacidad: {}", mapa.capacity());  // al menos 10
```

*4. Construir desde vectores*

```rust
use std::collections::HashMap;

let claves = vec!["uno", "dos", "tres"];
let valores = vec![1, 2, 3];

let mut mapa = HashMap::new();

for (k, v) in claves.into_iter().zip(valores.into_iter()) {
    mapa.insert(k, v);
}

println!("{:?}", mapa);
```

#text(14pt)[*Insertar elementos*]

*1. Insertar con `insert()`*

```rust
use std::collections::HashMap;

let mut capitales = HashMap::new();

capitales.insert("Perú", "Lima");
capitales.insert("Chile", "Santiago");
capitales.insert("Argentina", "Buenos Aires");

println!("{:?}", capitales);
```

Si la clave ya existe, `insert()` reemplaza el valor anterior:

```rust
use std::collections::HashMap;

let mut puntos = HashMap::new();

puntos.insert("Ana", 10);
println!("{:?}", puntos);  // {"Ana": 10}

puntos.insert("Ana", 20);  // reemplaza 10 con 20
println!("{:?}", puntos);  // {"Ana": 20}
```

`insert()` retorna el valor anterior si existía:

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

let anterior = mapa.insert("clave", 1);
println!("{:?}", anterior);  // None

let anterior = mapa.insert("clave", 2);
println!("{:?}", anterior);  // Some(1)
```

#text(14pt)[*Acceso a valores*]

*1. Acceso con `get()` (recomendado)*

```rust
use std::collections::HashMap;

let mut puntos = HashMap::new();
puntos.insert("Ana", 10);
puntos.insert("Luis", 20);

match puntos.get("Ana") {
    Some(valor) => println!("Ana tiene {} puntos", valor),
    None => println!("Ana no encontrada"),
}
// Ana tiene 10 puntos
```

`get()` retorna `Option<&V>`:

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("clave", 42);

let valor = mapa.get("clave");
println!("{:?}", valor);  // Some(42)

let valor = mapa.get("no_existe");
println!("{:?}", valor);  // None
```

*2. Acceso con índice `[]` (puede causar panic)*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("clave", 42);

let valor = mapa["clave"];
println!("{}", valor);  // 42

// let x = mapa["no_existe"];  // ✗ panic: no entry found
```

⚠️ Usar `[]` genera panic si la clave no existe. Prefiere `get()`.

*3. Obtener valor o default con `get_or_insert()`*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

let valor = mapa.entry("clave").or_insert(42);
println!("{}", valor);  // 42

let valor = mapa.entry("clave").or_insert(100);
println!("{}", valor);  // 42 (ya existía)
```

#text(14pt)[*Verificar existencia*]

*1. Verificar si existe una clave con `contains_key()`*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("Rust", 2015);

if mapa.contains_key("Rust") {
    println!("Rust existe en el mapa");
}

if !mapa.contains_key("Python") {
    println!("Python no existe en el mapa");
}
```

*2. Verificar si está vacío con `is_empty()`*

```rust
use std::collections::HashMap;

let mut mapa: HashMap<String, i32> = HashMap::new();

println!("¿Vacío? {}", mapa.is_empty());  // true

mapa.insert(String::from("clave"), 1);

println!("¿Vacío? {}", mapa.is_empty());  // false
```

#text(14pt)[*Actualizar valores*]

*1. Actualizar directamente con `insert()`*

```rust
use std::collections::HashMap;

let mut puntos = HashMap::new();

puntos.insert("Ana", 10);
puntos.insert("Ana", 20);  // actualiza

println!("{:?}", puntos);  // {"Ana": 20}
```

*2. Actualizar solo si existe con `get_mut()`*

```rust
use std::collections::HashMap;

let mut puntos = HashMap::new();
puntos.insert("Ana", 10);

if let Some(valor) = puntos.get_mut("Ana") {
    *valor += 5;  // incrementa en 5
}

println!("{:?}", puntos);  // {"Ana": 15}
```

*3. Insertar solo si no existe con `entry().or_insert()`*

```rust
use std::collections::HashMap;

let mut puntos = HashMap::new();

puntos.entry("Ana").or_insert(10);
println!("{:?}", puntos);  // {"Ana": 10}

puntos.entry("Ana").or_insert(20);  // no hace nada, ya existe
println!("{:?}", puntos);  // {"Ana": 10}
```

*4. Actualizar basado en el valor anterior*

```rust
use std::collections::HashMap;

let mut contador = HashMap::new();

for palabra in vec!["hola", "mundo", "hola", "rust"] {
    let count = contador.entry(palabra).or_insert(0);
    *count += 1;
}

println!("{:?}", contador);
// {"hola": 2, "mundo": 1, "rust": 1}
```

*5. Insertar con función si no existe con `or_insert_with()`*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

mapa.entry("clave").or_insert_with(|| {
    println!("Calculando valor...");
    42
});

println!("{:?}", mapa);  // {"clave": 42}
```

La función solo se ejecuta si la clave no existe.

#text(14pt)[*Eliminar elementos*]

*1. Eliminar con `remove()`*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("Rust", 2015);
mapa.insert("Python", 1991);

let eliminado = mapa.remove("Rust");
println!("{:?}", eliminado);  // Some(2015)

let no_existe = mapa.remove("Java");
println!("{:?}", no_existe);  // None

println!("{:?}", mapa);  // {"Python": 1991}
```

*2. Eliminar y obtener par clave-valor con `remove_entry()`*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("Rust", 2015);

let eliminado = mapa.remove_entry("Rust");
println!("{:?}", eliminado);  // Some(("Rust", 2015))
```

*3. Vaciar completamente con `clear()`*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 1);
mapa.insert("b", 2);

println!("Antes: {:?}", mapa);  // {"a": 1, "b": 2}

mapa.clear();

println!("Después: {:?}", mapa);  // {}
println!("Longitud: {}", mapa.len());  // 0
```

*4. Mantener solo elementos que cumplen condición con `retain()`*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 1);
mapa.insert("b", 2);
mapa.insert("c", 3);
mapa.insert("d", 4);

mapa.retain(|_clave, valor| *valor % 2 == 0);

println!("{:?}", mapa);  // {"b": 2, "d": 4}
```

#text(14pt)[*Longitud y capacidad*]

```rust
use std::collections::HashMap;

let mut mapa = HashMap::with_capacity(10);

println!("len: {}, cap: {}", mapa.len(), mapa.capacity());
// len: 0, cap: al menos 10

mapa.insert("a", 1);
mapa.insert("b", 2);

println!("len: {}, cap: {}", mapa.len(), mapa.capacity());
// len: 2, cap: al menos 10
```

*Reservar capacidad:*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

mapa.reserve(100);  // reserva espacio para al menos 100 elementos

println!("Capacidad: {}", mapa.capacity());
```

*Reducir capacidad al mínimo:*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::with_capacity(100);
mapa.insert("a", 1);

mapa.shrink_to_fit();

println!("Capacidad reducida: {}", mapa.capacity());
```

#text(14pt)[*Recorrer HashMap*]

*1. Recorrer claves y valores*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("Rust", 2015);
mapa.insert("Python", 1991);
mapa.insert("JavaScript", 1995);

for (clave, valor) in &mapa {
    println!("{}: {}", clave, valor);
}
```

⚠️ El orden NO está garantizado y puede cambiar.

*2. Recorrer solo claves*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 1);
mapa.insert("b", 2);
mapa.insert("c", 3);

for clave in mapa.keys() {
    println!("{}", clave);
}
```

*3. Recorrer solo valores*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 1);
mapa.insert("b", 2);
mapa.insert("c", 3);

for valor in mapa.values() {
    println!("{}", valor);
}
```

*4. Recorrer valores mutables*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 1);
mapa.insert("b", 2);

for valor in mapa.values_mut() {
    *valor *= 2;
}

println!("{:?}", mapa);  // {"a": 2, "b": 4}
```

*5. Consumir el HashMap*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 1);
mapa.insert("b", 2);

for (clave, valor) in mapa {  // sin &, consume el mapa
    println!("{}: {}", clave, valor);
}

// println!("{:?}", mapa);  // ✗ Error: mapa fue movido
```

#text(14pt)[*Entry API*]

La Entry API es poderosa para manipular entradas de forma eficiente.

*1. Obtener o insertar con `or_insert()`*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

mapa.entry("clave").or_insert(42);
mapa.entry("clave").or_insert(100);  // no hace nada

println!("{:?}", mapa);  // {"clave": 42}
```

*2. Modificar entrada existente o insertar*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

let valor = mapa.entry("contador").or_insert(0);
*valor += 1;

let valor = mapa.entry("contador").or_insert(0);
*valor += 1;

println!("{:?}", mapa);  // {"contador": 2}
```

*3. Usar `and_modify()` antes de insertar*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 10);

mapa.entry("a")
    .and_modify(|v| *v += 5)
    .or_insert(1);

mapa.entry("b")
    .and_modify(|v| *v += 5)
    .or_insert(1);

println!("{:?}", mapa);  // {"a": 15, "b": 1}
```

*4. Insertar con función solo si no existe*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

mapa.entry("clave").or_insert_with(|| {
    println!("Calculando...");
    42
});

mapa.entry("clave").or_insert_with(|| {
    println!("No se ejecuta");
    100
});

println!("{:?}", mapa);  // {"clave": 42}
// Solo imprime "Calculando..." una vez
```

#text(14pt)[*Combinar HashMaps*]

*1. Extender un HashMap con otro*

```rust
use std::collections::HashMap;

let mut mapa1 = HashMap::new();
mapa1.insert("a", 1);
mapa1.insert("b", 2);

let mut mapa2 = HashMap::new();
mapa2.insert("c", 3);
mapa2.insert("d", 4);

mapa1.extend(mapa2);

println!("{:?}", mapa1);  // {"a": 1, "b": 2, "c": 3, "d": 4}
```

Si hay claves duplicadas, los valores del segundo HashMap reemplazan los del primero:

```rust
use std::collections::HashMap;

let mut mapa1 = HashMap::new();
mapa1.insert("a", 1);

let mut mapa2 = HashMap::new();
mapa2.insert("a", 100);
mapa2.insert("b", 2);

mapa1.extend(mapa2);

println!("{:?}", mapa1);  // {"a": 100, "b": 2}
```

#text(14pt)[*Tipos de claves*]

Las claves deben implementar `Eq` y `Hash`.

*Tipos comunes que funcionan:*

```rust
use std::collections::HashMap;

// Números
let mut mapa1: HashMap<i32, &str> = HashMap::new();
mapa1.insert(1, "uno");

// Strings
let mut mapa2: HashMap<String, i32> = HashMap::new();
mapa2.insert(String::from("clave"), 42);

// &str
let mut mapa3: HashMap<&str, i32> = HashMap::new();
mapa3.insert("clave", 42);

// Tuplas
let mut mapa4: HashMap<(i32, i32), &str> = HashMap::new();
mapa4.insert((0, 0), "origen");

// Chars
let mut mapa5: HashMap<char, i32> = HashMap::new();
mapa5.insert('a', 1);
```

❌ NO puedes usar tipos que no implementan `Eq` y `Hash`:

```rust
use std::collections::HashMap;

// ✗ f64 no implementa Eq (debido a NaN)
// let mut mapa: HashMap<f64, i32> = HashMap::new();

// ✗ Vec<T> implementa Hash pero no es recomendado
// let mut mapa: HashMap<Vec<i32>, i32> = HashMap::new();
```

#text(14pt)[*Valores por defecto*]

Patrón común: contador de palabras

```rust
use std::collections::HashMap;

let texto = "hola mundo hola rust mundo hola";

let mut contador = HashMap::new();

for palabra in texto.split_whitespace() {
    let count = contador.entry(palabra).or_insert(0);
    *count += 1;
}

println!("{:?}", contador);
// {"hola": 3, "mundo": 2, "rust": 1}
```

Patrón: agrupar elementos

```rust
use std::collections::HashMap;

let datos = vec![("Ana", 25), ("Luis", 30), ("Ana", 28)];

let mut grupos: HashMap<&str, Vec<i32>> = HashMap::new();

for (nombre, edad) in datos {
    grupos.entry(nombre).or_insert(Vec::new()).push(edad);
}

println!("{:?}", grupos);
// {"Ana": [25, 28], "Luis": [30]}
```

#text(14pt)[*Propiedad (Ownership)*]

*Tipos que implementan Copy:*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

let clave = 1;
let valor = 10;

mapa.insert(clave, valor);

println!("clave: {}, valor: {}", clave, valor);  // ✓ siguen disponibles
```

*Tipos que NO implementan Copy (como String):*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

let clave = String::from("nombre");
let valor = String::from("Ana");

mapa.insert(clave, valor);

// println!("{}", clave);  // ✗ Error: clave fue movida
// println!("{}", valor);  // ✗ Error: valor fue movido
```

Para mantener las variables originales, clona o usa referencias:

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

let clave = String::from("nombre");
let valor = String::from("Ana");

mapa.insert(clave.clone(), valor.clone());

println!("clave: {}, valor: {}", clave, valor);  // ✓ funcionan
```

*Usando referencias como claves:*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();

let clave = String::from("nombre");
let valor = String::from("Ana");

mapa.insert(&clave, &valor);

println!("clave: {}, valor: {}", clave, valor);  // ✓ funcionan
```

⚠️ Las referencias deben vivir tanto como el HashMap.

#text(14pt)[*Comparar HashMaps*]

```rust
use std::collections::HashMap;

let mut mapa1 = HashMap::new();
mapa1.insert("a", 1);
mapa1.insert("b", 2);

let mut mapa2 = HashMap::new();
mapa2.insert("b", 2);
mapa2.insert("a", 1);

println!("{}", mapa1 == mapa2);  // true (orden no importa)

let mut mapa3 = HashMap::new();
mapa3.insert("a", 1);
mapa3.insert("b", 3);

println!("{}", mapa1 == mapa3);  // false
```

#text(14pt)[*HashMap con structs personalizados*]

```rust
use std::collections::HashMap;

#[derive(Debug)]
struct Persona {
    nombre: String,
    edad: u32,
}

let mut personas = HashMap::new();

personas.insert(
    "001",
    Persona {
        nombre: String::from("Ana"),
        edad: 25,
    },
);

personas.insert(
    "002",
    Persona {
        nombre: String::from("Luis"),
        edad: 30,
    },
);

if let Some(persona) = personas.get("001") {
    println!("{:?}", persona);
}
```

#text(14pt)[*Conversión a Vec*]

*De HashMap a Vec de tuplas:*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 1);
mapa.insert("b", 2);
mapa.insert("c", 3);

let vec: Vec<(&str, i32)> = mapa.into_iter().collect();

println!("{:?}", vec);
// Orden no garantizado: [("a", 1), ("b", 2), ("c", 3)]
```

*Solo claves a Vec:*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 1);
mapa.insert("b", 2);

let claves: Vec<&str> = mapa.keys().copied().collect();

println!("{:?}", claves);
```

*Solo valores a Vec:*

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("a", 1);
mapa.insert("b", 2);

let valores: Vec<i32> = mapa.values().copied().collect();

println!("{:?}", valores);
```

#text(14pt)[*Ordenar HashMap*]

HashMap NO mantiene orden. Para ordenar, convierte a Vec:

```rust
use std::collections::HashMap;

let mut mapa = HashMap::new();
mapa.insert("c", 3);
mapa.insert("a", 1);
mapa.insert("b", 2);

let mut items: Vec<_> = mapa.iter().collect();
items.sort_by_key(|&(k, _)| k);  // ordenar por clave

for (clave, valor) in items {
    println!("{}: {}", clave, valor);
}
// a: 1
// b: 2
// c: 3
```

Si necesitas mantener orden de inserción, usa `IndexMap` (requiere crate externo).

#text(14pt)[*HashMap anidados*]

```rust
use std::collections::HashMap;

let mut usuarios = HashMap::new();

let mut info_ana = HashMap::new();
info_ana.insert("edad", "25");
info_ana.insert("ciudad", "Lima");

let mut info_luis = HashMap::new();
info_luis.insert("edad", "30");
info_luis.insert("ciudad", "Bogotá");

usuarios.insert("Ana", info_ana);
usuarios.insert("Luis", info_luis);

if let Some(info) = usuarios.get("Ana") {
    if let Some(edad) = info.get("edad") {
        println!("Ana tiene {} años", edad);
    }
}
```

#text(14pt)[*Clonar HashMap*]

```rust
use std::collections::HashMap;

let mut mapa1 = HashMap::new();
mapa1.insert("a", 1);
mapa1.insert("b", 2);

let mapa2 = mapa1.clone();

println!("{:?}", mapa1);  // {"a": 1, "b": 2}
println!("{:?}", mapa2);  // {"a": 1, "b": 2}
```

⚠️ `clone()` hace una copia profunda, puede ser costoso para HashMaps grandes.

#text(14pt)[*Cuándo usar HashMap vs otros tipos*]

*Usa `HashMap<K, V>` cuando:*
- Necesitas búsquedas rápidas por clave
- Las claves son únicas
- No importa el orden
- Necesitas insertar/eliminar dinámicamente

*Usa `BTreeMap<K, V>` cuando:*
- Necesitas claves ordenadas
- Necesitas encontrar rangos de claves
- Iteras en orden frecuentemente

*Usa `Vec<(K, V)>` cuando:*
- Tienes pocas entradas (< 10-20)
- Necesitas mantener orden de inserción
- Iteras más que buscas

*Usa `Array/Tupla` cuando:*
- El número de elementos es fijo y pequeño
- Conoces todas las "claves" en compilación

#text(14pt)[*Resumen rápido*]

```rust
use std::collections::HashMap;

// Crear
let mut mapa = HashMap::new();
let mapa = HashMap::from([("a", 1), ("b", 2)]);

// Insertar
mapa.insert("clave", valor);
mapa.entry("clave").or_insert(valor);

// Acceder
mapa.get("clave");           // Option<&V>
mapa["clave"];               // V (panic si no existe)
mapa.contains_key("clave");  // bool

// Actualizar
mapa.get_mut("clave");
mapa.entry("clave").and_modify(|v| *v += 1);

// Eliminar
mapa.remove("clave");
mapa.clear();
mapa.retain(|k, v| condición);

// Información
mapa.len();
mapa.is_empty();
mapa.capacity();

// Recorrer
for (k, v) in &mapa { }
for k in mapa.keys() { }
for v in mapa.values() { }

// Combinar
mapa1.extend(mapa2);
```
