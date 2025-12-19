1. Información de Estudiante
Crea una tupla que almacene: nombre (&str), edad (u8), y promedio (f64).
Luego imprime cada campo por separado.

fn main() {
    let student:(&str, u8, f64) = ("ALex", 25, 18.6);
    let (a,b,c) = student ;
    println!("{a}");
    println!("{b}");
    println!("{c}");
}


2. Intercambio de Valores
Crea dos variables a = 5 y b = 10. Usa una
tupla para intercambiar sus valores sin usar una variable temporal adicional.

fn main() {
    let a:u8 = 5;
    let b:u8 = 10;
    let tupla_x:(u8,u8) = (b, a);

    println!("{tupla_x:?}");
}
