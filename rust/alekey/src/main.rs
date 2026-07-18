fn main() -> () {
    let valor_devuelto: String = saludar_y_devolver();

    println!("Valor devuelto es: {}", valor_devuelto);
}

fn saludar_y_devolver() -> String {
    println!("Hola Rustaceans!");

    return String::from("Empezemos!!");
}
