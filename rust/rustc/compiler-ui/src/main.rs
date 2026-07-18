use ratatui::Frame;
use ratatui::crossterm::event::{self, Event, KeyCode};
use ratatui::crossterm::terminal::WindowSize;
use ratatui::layout::{Alignment, Constraint, Direction, Layout, Size};
use ratatui::style::{Color, Style};
use ratatui::widgets::Paragraph;
use ratatui_image::{Image, Resize, picker::Picker};
use std::error::Error as StdError;
use std::time::{Duration, Instant};

// Vista Activa
#[derive(PartialEq)]
enum AppScream {
    Inicio,
    Taller,
    Creditos,
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
enum UnsignedIntegerType {
    U8,
    U16,
    U32,
    U64,
    U128,
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
enum SignedIntegerType {
    I8,
    I16,
    I32,
    I64,
    I128,
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
enum IntegerType {
    Unsigned(UnsignedIntegerType),
    Signed(SignedIntegerType),
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
enum FloatingPointType {
    F32,
    F64,
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
enum ScalarType {
    Integer(IntegerType),
    Float(FloatingPointType),
    Char(char),
    Bool(bool),
}

// Estado de compilación
enum EstadoCompilacion {
    Inactivo,
    Activo,
    Exito { size: u64 },
    Error(String),
}

#[derive(PartialEq, Debug)]
enum MenuOption {
    Taller,
    Creditos,
}

enum Test {
    ONE,
    TWO,
}

// #[derive(Default, Debug)]
// struct ScalarType {
//     naturales: (u8, u16, u32, u64, u128),
//     enteros: (i8, i16, i32, i64, i128),
//     flotantes: (f32, f64),
//     caracteres: char,
//     booleanos: bool,
// }

enum CompoundType {
    Tuple(Vec<ScalarType>),
    Array(Vec<ScalarType>),
}

struct CustomType {}

enum DataType {
    Scalar(ScalarType),
    Compound(CompoundType),
    Custom(CustomType),
}

// impl Default for ScalarType {
//     fn default() -> Self {
//         Self {
//             naturales: (0, 0, 0, 0, 0),
//             enteros: (0, 0, 0, 0, 0),
//             flotantes: (0.0, 0.0),
//             caracteres: ' ',
//             booleanos: false,
//         }
//     }
// }

fn main() -> Result<(), Box<dyn StdError>> {
    let mut window_app = AppScream::Inicio;
    let mut terminal = ratatui::init();
    let mut select_menu = MenuOption::Taller;
    // let datos_scalar = ScalarType::default();
    let mut frame_animation = 0;
    let mut last_frame_time = Instant::now();

    // Inicializar el lector de imágenes para ratatui-image
    let mut picker = Picker::from_query_stdio().unwrap_or_else(|_| Picker::halfblocks());
    let img_path = "src/rustpe.png";
    let dyn_img = image::ImageReader::open(img_path)?.decode()?;

    // Ajustar la imagen a la mitad de la terminal (ej. 60 de ancho x 30 de alto)
    let img_size = Size::new(60, 30);
    let image_protocol = picker.new_protocol(dyn_img, img_size, Resize::Fit(None))?;

    // Variables para nuestra animación de texto (más rápida)
    let mut frame_texto = 0;
    let mut last_texto_time = Instant::now();

    // Variables para los mensajes curiosos de Ferris (cada 2 segundos)
    let mut frame_mensaje = 0;
    let mut last_mensaje_time = Instant::now();

    // println!("{:?}", datos_scalar);
    //

    // --- ESTADO DEL TALLER ---
    let taller_tipos = vec!["u8", "i32", "f64", "bool", "char", "String"];
    let mut taller_seleccion_idx = 0;
    let mut tupla_actual: Vec<&str> = Vec::new();

    loop {
        let entero_u8: u8 = 5;

        let mut text: String = String::new();

        text = "hola ".to_string() + &entero_u8.to_string();

        terminal.draw(|frame| {
            match window_app {
                AppScream::Inicio => {
                    // Creamos el Flex Horizontal Principal (50% izquierda, 50% derecha)
                    let main_layout = Layout::default()
                        .direction(Direction::Horizontal)
                        .constraints([
                            Constraint::Percentage(50), // Columna Izquierda (Para la Imagen)
                            Constraint::Percentage(50), // Columna Derecha (Para el Menú y Ferris)
                        ])
                        .split(frame.area());

                    // ¡1. Dibujamos la Imagen en la columna izquierda! (Con clipping permitido para que siempre se dibuje)
                    let widget_fondo = Image::new(&image_protocol).allow_clipping(true);
                    frame.render_widget(widget_fondo, main_layout[0]);

                    // Creamos el Flex Vertical (3 componentes) dentro de la columna derecha
                    let seccion = Layout::default()
                        .direction(Direction::Vertical)
                        .constraints([
                            Constraint::Percentage(20),
                            Constraint::Percentage(40),
                            Constraint::Percentage(40),
                        ])
                        .split(main_layout[1]);

            // ¡Efecto máquina de escribir!
            let mensaje_completo = "POWERED BY RATATUI Y TECSUP TALLER";
            // Cortamos el texto hasta donde vaya el contador (sin pasarnos del largo total)
            let longitud_actual = (frame_texto as usize).min(mensaje_completo.len());
            let texto_animado = &mensaje_completo[0..longitud_actual];

            let title = Paragraph::new(texto_animado)
                .alignment(Alignment::Center)
                .style(Style::default().fg(Color::Cyan).bg(Color::Black));

            frame.render_widget(title, seccion[0]);

            let taller = if select_menu == MenuOption::Taller {
                "🦀  Taller  "
            } else {
                "   Taller  "
            };

            let credito = if select_menu == MenuOption::Creditos {
                "🦀  Creditos"
            } else {
                "   Creditos"
            };

            let text_menu = format!("{}\n\n{}", taller, credito);

            let widget_menu = Paragraph::new(text_menu)
                .alignment(Alignment::Center)
                .style(Style::default().bg(Color::Black));

            frame.render_widget(widget_menu, seccion[1]);

            // Importamos nuestros dibujos desde los archivos TXT
            let ferris_abajo = include_str!("ferris_abajo.txt");
            let ferris_arriba = include_str!("ferris_arriba.txt");

            let dibujo_ferris = if frame_animation % 2 == 0 {
                ferris_abajo
            } else {
                ferris_arriba
            };

            // Nuestros mensajes curiosos de Rust
            let mensajes = [
                "🦀¡Hola! Soy Ferris, tu guía 🦀",
                "💡Tip: En Rust no existe el temido 'Null'",
                "🚀Usa 'cargo check' para revisar tu código rapidísimo",
                "⚔️¡No le tengas miedo al Borrow Checker!",
                "🎨Ratatui es el rey de las terminales",
            ];

            let mensaje_actual = mensajes[frame_mensaje % mensajes.len()];

            // Calculamos el ancho de la caja según el largo del mensaje
            let ancho_texto = mensaje_actual.chars().count();
            let linea_horizontal = "─".repeat(ancho_texto + 2);

            // Armamos el globo de diálogo (Bocadillo)
            let bocadillo = format!(
                "╭{}╮\n│ {} │\n╰{}╯\n      \\",
                linea_horizontal, mensaje_actual, linea_horizontal
            );

            // Unimos el bocadillo de cómic y el dibujo
            let arte_final = format!("{}\n{}", bocadillo, dibujo_ferris);

            let widget_ferris = Paragraph::new(arte_final)
                .alignment(Alignment::Center)
                .style(Style::default().fg(Color::Rgb(255, 135, 85)).bg(Color::Black)); // Color Naranja Ferris y fondo negro

                    frame.render_widget(widget_ferris, seccion[2]);
                }
                AppScream::Taller => {
                    let taller_layout = Layout::default()
                        .direction(Direction::Horizontal)
                        .constraints([Constraint::Percentage(30), Constraint::Percentage(70)])
                        .split(frame.area());

                    let mut lista_items = String::new();
                    for (i, &tipo) in taller_tipos.iter().enumerate() {
                        if i == taller_seleccion_idx {
                            lista_items.push_str(&format!(">> [ {} ] <<\n\n", tipo));
                        } else {
                            lista_items.push_str(&format!("   {}   \n\n", tipo));
                        }
                    }

                    let panel_izq = Paragraph::new(format!("📦 TIPOS DISPONIBLES\n\n{}", lista_items))
                        .alignment(Alignment::Center)
                        .style(Style::default().fg(Color::Cyan));

                    frame.render_widget(panel_izq, taller_layout[0]);

                    let der_layout = Layout::default()
                        .direction(Direction::Vertical)
                        .constraints([Constraint::Percentage(50), Constraint::Percentage(50)])
                        .split(taller_layout[1]);

                    let codigo_tupla = if tupla_actual.is_empty() {
                        "let mi_tupla: () = ();".to_string()
                    } else {
                        let tipos_str = tupla_actual.join(", ");
                        format!("let mi_tupla: ({}) = /* valores */;", tipos_str)
                    };

                    let panel_codigo = Paragraph::new(format!("💻 CÓDIGO RUST GENERADO\n\n{}", codigo_tupla))
                        .alignment(Alignment::Center)
                        .style(Style::default().fg(Color::Green));

                    frame.render_widget(panel_codigo, der_layout[0]);

                    let panel_memoria = Paragraph::new(format!(
                        "🧠 MEMORIA Y ESTADÍSTICAS\n\nElementos en la tupla: {}\n\n(Presiona Enter para agregar el tipo, Backspace para borrar el último)",
                        tupla_actual.len()
                    ))
                        .alignment(Alignment::Center)
                        .style(Style::default().fg(Color::Yellow));

                    frame.render_widget(panel_memoria, der_layout[1]);
                }
                AppScream::Creditos => {
                    let titulo = Paragraph::new("📜 CRÉDITOS 📜\n\nUn proyecto increíble hecho con ❤️ usando Ratatui y Rust.")
                        .alignment(Alignment::Center)
                        .style(Style::default().fg(Color::Green));
                    frame.render_widget(titulo, frame.area());
                }
            }
        })?;

        if last_frame_time.elapsed() >= Duration::from_millis(500) {
            frame_animation += 1;
            last_frame_time = Instant::now();
        }

        // Reloj rápido para las letras (50 milisegundos)
        if last_texto_time.elapsed() >= Duration::from_millis(50) {
            frame_texto += 1;
            last_texto_time = Instant::now();
        }

        // Reloj para cambiar el mensaje de Ferris (2000 milisegundos = 2 segundos)
        if last_mensaje_time.elapsed() >= Duration::from_millis(2000) {
            frame_mensaje += 1;
            last_mensaje_time = Instant::now();
        }

        // Bajamos el poll a 50ms para que la pantalla se actualice más rápido y el texto se vea fluido
        if event::poll(Duration::from_millis(50))? {
            if let Event::Key(key) = event::read()? {
                match window_app {
                    AppScream::Inicio => match key.code {
                        KeyCode::Char('q') => break,
                        KeyCode::Esc => window_app = AppScream::Inicio,
                        KeyCode::Enter => {
                            if select_menu == MenuOption::Taller {
                                window_app = AppScream::Taller;
                            } else {
                                window_app = AppScream::Creditos;
                            }
                        }
                        KeyCode::Up | KeyCode::Down => {
                            select_menu = if select_menu == MenuOption::Taller {
                                MenuOption::Creditos
                            } else {
                                MenuOption::Taller
                            };
                        }
                        _ => {}
                    },
                    AppScream::Taller => match key.code {
                        KeyCode::Char('q') => break,
                        KeyCode::Esc => window_app = AppScream::Inicio,
                        KeyCode::Up => {
                            if taller_seleccion_idx > 0 {
                                taller_seleccion_idx -= 1;
                            }
                        }
                        KeyCode::Down => {
                            if taller_seleccion_idx < taller_tipos.len() - 1 {
                                taller_seleccion_idx += 1;
                            }
                        }
                        KeyCode::Enter => {
                            tupla_actual.push(taller_tipos[taller_seleccion_idx]);
                        }
                        KeyCode::Backspace => {
                            tupla_actual.pop();
                        }
                        _ => {}
                    },
                    AppScream::Creditos => match key.code {
                        KeyCode::Char('q') => break,
                        KeyCode::Esc => window_app = AppScream::Inicio,
                        _ => {}
                    },
                }
            }
        }
    }

    ratatui::restore();
    Ok(())
}
