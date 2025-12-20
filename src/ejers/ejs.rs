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


3. Función que Retorna Múltiples Valores
Escribe una función dividir(dividendo: i32, divisor: i32) que retorne una tupla con:

El cociente
El residuo

Ejemplo: dividir(17, 5) → (3, 2)



fn main(){
    println!("{:?}",dividir(17,5));
}

fn dividir(dividiendo:i32, divisor: i32) -> (i32,i32){

    let x:i32 = dividiendo / divisor;
    let y:i32 =  dividiendo % divisor;

    (x,y)
}

4. Coordenadas 3D
Crea una tupla que represente un punto 3D (x, y, z). 
Escribe una función que calcule la distancia desde el origen (0, 0, 0) 
usando la fórmula: √(x² + y² + z²)

fn main(){
    println!("{:?}",dividir(17.0,5.0,2.0));
}

fn dividir(x:f32, y: f32, z:f32) -> f32 {
    
    let rs:f32 = x.powi(2) + y.powi(2) + z.powi(2); 
   
    rs.sqrt()
}

