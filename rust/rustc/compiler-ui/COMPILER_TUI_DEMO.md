# 🖥️ Código Completo de la TUI de Compilación con Pestañas

Este archivo contiene el código completo y funcional del **Asistente de Compilación Interactivo con Menú ASCII y Pestañas**. Puedes copiar este código y usarlo en el futuro como base para tu taller.

```rust
use ratatui::crossterm::event::{self, Event, KeyCode};
use ratatui::layout::{Constraint, Direction, Layout, Alignment};
use ratatui::style::{Color, Modifier, Style};
use ratatui::text::{Line, Span};
use ratatui::widgets::{Block, Borders, List, ListItem, Paragraph, Wrap};
use std::error::Error as StdError;

// 1. Enum para controlar la navegación por pantallas (Pestañas/Vistas)
#[derive(PartialEq)]
enum AppScreen {
    Home,
    Asistente,
    Creditos,
}

// 2. Enum para representar el estado de la compilación
enum EstadoCompilacion {
    Inactivo,
    Compilando,
    Exito { size: u64 },
    Error(String),
}

// Estructura para las recetas del asistente
struct RecetaCompilacion {
    name: &'static str,
    commands: &'static [(&'static str, &'static [&'static str])],
    watch_file: &'static str,
    output_bin: &'static str,
}

fn main() -> Result<(), Box<dyn StdError>> {
    // Inicializar terminal
    let mut terminal = ratatui::init();

    // Estado de la aplicación
    let mut pantalla_activa = AppScreen::Home;
    let mut seleccion_home = 0; // 0 = Ir al Asistente, 1 = Créditos, 2 = Salir
    
    // Estado del asistente de compilación
    let mut seleccion_asistente = 0;
    let mut logs_compilacion = "Selecciona una opción y presiona Enter para compilar.".to_string();
    let mut estado_compilacion = EstadoCompilacion::Inactivo;
    let mut anterior_tamaño: Option<u64> = None;
    let mut actual_tamaño: Option<u64> = None;
    let mut comando_ejecutado = String::new();

    let recetas = vec![
        RecetaCompilacion {
            name: "1. Compilar Básico (Debug)",
            commands: &[("rustc", &["../main.rs", "-o", "../build/main"])],
            watch_file: "../main.rs",
            output_bin: "../build/main",
        },
        RecetaCompilacion {
            name: "2. Limpiar con 'strip'",
            commands: &[
                ("rustc", &["../main.rs", "-o", "../build/main"]),
                ("strip", &["../build/main"]),
            ],
            watch_file: "../main.rs",
            output_bin: "../build/main",
        },
        RecetaCompilacion {
            name: "3. Generar LLVM-IR (.ll)",
            commands: &[("rustc", &["--emit=llvm-ir", "../main.rs", "-o", "../main.ll"])],
            watch_file: "../main.rs",
            output_bin: "../main.ll",
        },
        RecetaCompilacion {
            name: "4. Generar Assembly (.s)",
            commands: &[("rustc", &["--emit=asm", "../main.rs", "-o", "../main.s"])],
            watch_file: "../main.rs",
            output_bin: "../main.s",
        },
        RecetaCompilacion {
            name: "5. Optimización Extrema (Size)",
            commands: &[("rustc", &[
                "-C", "opt-level=z",
                "-C", "lto",
                "-C", "codegen-units=1",
                "-C", "panic=abort",
                "-C", "strip=symbols",
                "../main.rs",
                "-o", "../build/main_opt"
            ])],
            watch_file: "../main.rs",
            output_bin: "../build/main_opt",
        },
        RecetaCompilacion {
            name: "6. Compilar no_std (Puro Metal)",
            commands: &[
                ("rustc", &[
                    "-C", "panic=abort",
                    "-C", "link-arg=-nostartfiles",
                    "../main_nostd.rs",
                    "-o", "../build/main_nostd"
                ]),
                ("strip", &["../build/main_nostd"]),
            ],
            watch_file: "../main_nostd.rs",
            output_bin: "../build/main_nostd",
        },
    ];

    // Bucle principal de eventos
    loop {
        terminal.draw(|frame| {
            let layout_principal = Layout::default()
                .direction(Direction::Vertical)
                .constraints([
                    Constraint::Min(10),   // Pantalla activa
                    Constraint::Length(3), // Footer fijo abajo
                ])
                .split(frame.area());

            let area_pantalla = layout_principal[0];
            let area_footer = layout_principal[1];

            match pantalla_activa {
                // ================= PANTALLA HOME =================
                AppScreen::Home => {
                    let division_home = Layout::default()
                        .direction(Direction::Vertical)
                        .constraints([
                            Constraint::Length(6), // Logo ASCII
                            Constraint::Length(4), // Bienvenida
                            Constraint::Min(5),    // Opciones del Menú
                        ])
                        .split(area_pantalla);

                    // Logo ASCII en color Cyan
                    let ascii_logo = Paragraph::new(vec![
                        Line::from(Span::styled("   _ __ _   _ ___| |_ ___   _   _(_) ", Style::default().fg(Color::Cyan).add_modifier(Modifier::BOLD))),
                        Line::from(Span::styled("  | '__| | | / __| __/ __| | | | | | ", Style::default().fg(Color::Cyan).add_modifier(Modifier::BOLD))),
                        Line::from(Span::styled("  | |  | |_| \\__ \\ || (__  | |_| | | ", Style::default().fg(Color::Cyan).add_modifier(Modifier::BOLD))),
                        Line::from(Span::styled("  |_|   \\__,_|___/\\__\\___|  \\__,_|_| ", Style::default().fg(Color::Cyan).add_modifier(Modifier::BOLD))),
                    ])
                    .alignment(Alignment::Center);
                    frame.render_widget(ascii_logo, division_home[0]);

                    // Texto de Bienvenida
                    let bienvenida = Paragraph::new("¡Bienvenido al Laboratorio de Compilación de Bajo Nivel!\nSelecciona una opción del menú para comenzar.")
                        .alignment(Alignment::Center)
                        .wrap(Wrap { trim: true });
                    frame.render_widget(bienvenida, division_home[1]);

                    // Opciones de menú estilo "Botones"
                    let opciones_menu = vec![
                        " 🛠️  1. Ir al Asistente de Compilación ",
                        " 📖  2. Información y Créditos del Taller ",
                        " 🚪  3. Salir del Asistente ",
                    ];

                    let items: Vec<ListItem> = opciones_menu.iter().enumerate().map(|(i, texto)| {
                        let style = if i == seleccion_home {
                            Style::default().fg(Color::Black).bg(Color::Yellow).add_modifier(Modifier::BOLD)
                        } else {
                            Style::default().fg(Color::White)
                        };
                        ListItem::new(Line::from(Span::styled(*texto, style)))
                    }).collect();

                    let lista_menu = List::new(items)
                        .block(Block::default().borders(Borders::NONE));
                    frame.render_widget(lista_menu, division_home[2]);
                }

                // ================= PANTALLA ASISTENTE =================
                AppScreen::Asistente => {
                    let layout_asistente = Layout::default()
                        .direction(Direction::Horizontal)
                        .constraints([
                            Constraint::Percentage(35), // Menú de recetas
                            Constraint::Percentage(65), // Panel de compilación y datos
                        ])
                        .split(area_pantalla);

                    // Lista de recetas (izquierda)
                    let items_recetas: Vec<ListItem> = recetas.iter().enumerate().map(|(i, r)| {
                        let style = if i == seleccion_asistente {
                            Style::default().fg(Color::Yellow).add_modifier(Modifier::BOLD)
                        } else {
                            Style::default().fg(Color::White)
                        };
                        let prefix = if i == seleccion_asistente { "➔ " } else { "  " };
                        ListItem::new(Line::from(vec![
                            Span::styled(prefix, style),
                            Span::styled(r.name, style),
                        ]))
                    }).collect();

                    let lista_recetas = List::new(items_recetas)
                        .block(Block::default().borders(Borders::ALL).title(" Recetas de Compilación ").border_style(Style::default().fg(Color::Gray)));
                    frame.render_widget(lista_recetas, layout_asistente[0]);

                    // Panel de detalles (derecha)
                    let mut detalles = Vec::new();
                    let receta = &recetas[seleccion_asistente];

                    detalles.push(Line::from(vec![
                        Span::styled("Archivo origen: ", Style::default().fg(Color::Gray)),
                        Span::styled(receta.watch_file, Style::default().fg(Color::White)),
                    ]));
                    detalles.push(Line::from(vec![
                        Span::styled("Archivo salida: ", Style::default().fg(Color::Gray)),
                        Span::styled(receta.output_bin, Style::default().fg(Color::White)),
                    ]));
                    detalles.push(Line::from(vec![
                        Span::styled("Comando: ", Style::default().fg(Color::Gray)),
                        Span::styled(&comando_ejecutado, Style::default().fg(Color::LightCyan).add_modifier(Modifier::ITALIC)),
                    ]));

                    detalles.push(Line::from(""));

                    let (status_text, status_color) = match &estado_compilacion {
                        EstadoCompilacion::Inactivo => ("INACTIVO", Color::Gray),
                        EstadoCompilacion::Compilando => ("COMPILANDO...", Color::Yellow),
                        EstadoCompilacion::Exito { .. } => ("ÉXITO (Binario Generado)", Color::Green),
                        EstadoCompilacion::Error(_) => ("ERROR DE COMPILACIÓN", Color::Red),
                    };

                    detalles.push(Line::from(vec![
                        Span::styled("Estado: ", Style::default().fg(Color::Gray)),
                        Span::styled(status_text, Style::default().fg(status_color).add_modifier(Modifier::BOLD)),
                    ]));

                    if let Some(curr) = actual_tamaño {
                        let mut spans_tamaño = vec![
                            Span::styled("Tamaño actual: ", Style::default().fg(Color::Gray)),
                            Span::styled(format_size(curr), Style::default().fg(Color::Green).add_modifier(Modifier::BOLD)),
                        ];

                        if let Some(last) = anterior_tamaño {
                            if last != curr {
                                let diff = curr as i128 - last as i128;
                                let pct = (diff.abs() as f64 / last as f64) * 100.0;
                                let (diff_str, color) = if diff < 0 {
                                    (format!(" (-{:.2}%, -{})", pct, format_size(diff.abs() as u64)), Color::LightGreen)
                                } else {
                                    (format!(" (+{:.2}%, +{})", pct, format_size(diff as u64)), Color::LightRed)
                                };
                                spans_tamaño.push(Span::styled(diff_str, Style::default().fg(color)));
                            }
                        }
                        detalles.push(Line::from(spans_tamaño));
                    } else {
                        detalles.push(Line::from(vec![
                            Span::styled("Tamaño actual: ", Style::default().fg(Color::Gray)),
                            Span::styled("N/A", Style::default().fg(Color::DarkGray)),
                        ]));
                    }

                    detalles.push(Line::from(""));
                    detalles.push(Line::from(Span::styled("Consola / Logs:", Style::default().fg(Color::Gray).add_modifier(Modifier::UNDERLINED))));

                    for line in logs_compilacion.lines() {
                        detalles.push(Line::from(Span::styled(line, Style::default().fg(Color::Gray))));
                    }

                    let panel_detalles = Paragraph::new(detalles)
                        .block(Block::default().borders(Borders::ALL).title(" Detalles y Ejecución ").border_style(Style::default().fg(Color::Gray)))
                        .wrap(Wrap { trim: false });
                    frame.render_widget(panel_detalles, layout_asistente[1]);
                }

                // ================= PANTALLA CRÉDITOS =================
                AppScreen::Creditos => {
                    let contenido_creditos = Paragraph::new(vec![
                        Line::from(""),
                        Line::from(Span::styled("📖 ACERCA DE ESTE TALLER", Style::default().fg(Color::Cyan).add_modifier(Modifier::BOLD))),
                        Line::from("----------------------------------------"),
                        Line::from("Este programa interactivo complementa el capítulo de 'rustc' del libro."),
                        Line::from("El objetivo es demostrar visualmente cómo funciona la compilación,"),
                        Line::from("qué metadatos añade el compilador por defecto, y cómo optimizar binarios."),
                        Line::from(""),
                        Line::from(Span::styled("🚀 TECNOLOGÍAS UTILIZADAS", Style::default().fg(Color::Cyan).add_modifier(Modifier::BOLD))),
                        Line::from("----------------------------------------"),
                        Line::from("- Lenguaje: Rust 2024"),
                        Line::from("- Renderizador TUI: Ratatui Crate"),
                        Line::from("- Control de Terminal: Crossterm"),
                    ])
                    .block(Block::default().borders(Borders::ALL).title(" Información del Taller ").border_style(Style::default().fg(Color::Gray)))
                    .wrap(Wrap { trim: false });
                    frame.render_widget(contenido_creditos, area_pantalla);
                }
            }

            // ================= FOOTER / AYUDA =================
            let texto_ayuda = match pantalla_activa {
                AppScreen::Home => " [▲/▼] Navegar menú | [Enter] Seleccionar | [Q] Salir ",
                AppScreen::Asistente => " [▲/▼] Receta | [Enter] Compilar | [Esc] Volver ",
                AppScreen::Creditos => " [Esc/Enter] Volver ",
            };

            let footer = Paragraph::new(Line::from(vec![
                Span::styled(" Ayuda: ", Style::default().fg(Color::Gray)),
                Span::styled(texto_ayuda, Style::default().fg(Color::Yellow)),
            ]))
            .block(Block::default().borders(Borders::ALL).border_style(Style::default().fg(Color::DarkGray)));
            frame.render_widget(footer, area_footer);
        })?;

        // 3. CAPTURA Y PROCESAMIENTO DE TECLAS
        if let Event::Key(key) = event::read()? {
            if key.kind == event::KeyEventKind::Press {
                match pantalla_activa {
                    AppScreen::Home => match key.code {
                        KeyCode::Char('q') | KeyCode::Char('Q') | KeyCode::Esc => break,
                        KeyCode::Up => {
                            if seleccion_home > 0 { seleccion_home -= 1; } else { seleccion_home = 2; }
                        }
                        KeyCode::Down => {
                            if seleccion_home < 2 { seleccion_home += 1; } else { seleccion_home = 0; }
                        }
                        KeyCode::Enter => {
                            match seleccion_home {
                                0 => pantalla_activa = AppScreen::Asistente,
                                1 => pantalla_activa = AppScreen::Creditos,
                                2 => break,
                                _ => {}
                            }
                        }
                        _ => {}
                    }

                    AppScreen::Asistente => match key.code {
                        KeyCode::Esc => pantalla_activa = AppScreen::Home,
                        KeyCode::Up => {
                            if seleccion_asistente > 0 {
                                seleccion_asistente -= 1;
                                anterior_tamaño = None;
                                actual_tamaño = None;
                                estado_compilacion = EstadoCompilacion::Inactivo;
                                logs_compilacion = "Selecciona una opción y presiona Enter para compilar.".to_string();
                                comando_ejecutado = String::new();
                            }
                        }
                        KeyCode::Down => {
                            if seleccion_asistente < recetas.len() - 1 {
                                seleccion_asistente += 1;
                                anterior_tamaño = None;
                                actual_tamaño = None;
                                estado_compilacion = EstadoCompilacion::Inactivo;
                                logs_compilacion = "Selecciona una opción y presiona Enter para compilar.".to_string();
                                comando_ejecutado = String::new();
                            }
                        }
                        KeyCode::Enter => {
                            let receta = &recetas[seleccion_asistente];
                            
                            if let Ok(meta) = std::fs::metadata(receta.output_bin) {
                                anterior_tamaño = Some(meta.len());
                            } else {
                                anterior_tamaño = None;
                            }

                            estado_compilacion = EstadoCompilacion::Compilando;
                            
                            let mut success = true;
                            let mut stdout_acumulado = String::new();
                            let mut stderr_acumulado = String::new();
                            comando_ejecutado = String::new();

                            let _ = std::fs::create_dir_all("../build");

                            for &(cmd, args) in receta.commands {
                                if !comando_ejecutado.is_empty() {
                                    comando_ejecutado.push_str(" && ");
                                }
                                comando_ejecutado.push_str(&format!("{} {}", cmd, args.join(" ")));

                                let output = std::process::Command::new(cmd)
                                    .args(args)
                                    .output();

                                match output {
                                    Ok(out) => {
                                        stdout_acumulado.push_str(&String::from_utf8_lossy(&out.stdout));
                                        stderr_acumulado.push_str(&String::from_utf8_lossy(&out.stderr));

                                        if !out.status.success() {
                                            success = false;
                                            break;
                                        }
                                    }
                                    Err(e) => {
                                        success = false;
                                        stderr_acumulado.push_str(&format!("Error al ejecutar '{}': {}", cmd, e));
                                        break;
                                    }
                                }
                            }

                            if success {
                                if let Ok(meta) = std::fs::metadata(receta.output_bin) {
                                    let size = meta.len();
                                    actual_tamaño = Some(size);
                                    estado_compilacion = EstadoCompilacion::Exito { size };
                                } else {
                                    estado_compilacion = EstadoCompilacion::Inactivo;
                                }
                                logs_compilacion = format!("STDOUT:\n{}\nSTDERR:\n{}", stdout_acumulado, stderr_acumulado);
                            } else {
                                estado_compilacion = EstadoCompilacion::Error(stderr_acumulado.clone());
                                logs_compilacion = format!("STDERR:\n{}", stderr_acumulado);
                                actual_tamaño = None;
                            }
                        }
                        _ => {}
                    }

                    AppScreen::Creditos => match key.code {
                        KeyCode::Esc | KeyCode::Enter => pantalla_activa = AppScreen::Home,
                        _ => {}
                    }
                }
            }
        }
    }

    // Restaurar la terminal limpia
    ratatui::restore();
    Ok(())
}

fn format_size(bytes: u64) -> String {
    if bytes >= 1_048_576 {
        format!("{:.2} MB", bytes as f64 / 1_048_576.0)
    } else if bytes >= 1024 {
        format!("{:.2} KB", bytes as f64 / 1024.0)
    } else {
        format!("{} bytes", bytes)
    }
}
```
