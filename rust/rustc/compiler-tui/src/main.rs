use std::time::{Duration, SystemTime};
use ratatui::{
    backend::CrosstermBackend,
    layout::{Constraint, Direction, Layout},
    style::{Color, Modifier, Style},
    text::{Line, Span},
    widgets::{Block, Borders, List, ListItem, Paragraph, Wrap},
    Terminal,
};
use ratatui::crossterm::{
    event::{self, Event, KeyCode},
    terminal::{disable_raw_mode, enable_raw_mode, EnterAlternateScreen, LeaveAlternateScreen},
    execute,
};

struct CompileOption {
    name: &'static str,
    commands: &'static [(&'static str, &'static [&'static str])],
    watch_file: &'static str,
    output_bin: &'static str,
}

struct App {
    options: Vec<CompileOption>,
    selected_index: usize,
    terminal_output: String,
    last_compiled_size: Option<u64>,
    current_size: Option<u64>,
    watch_mode: bool,
    last_modified: Option<SystemTime>,
    status_message: String,
    executed_command_str: String,
}

impl App {
    fn new() -> Self {
        let options = vec![
            CompileOption {
                name: "1. Compilar Básico (Debug)",
                commands: &[("rustc", &["../main.rs", "-o", "../build/main"])],
                watch_file: "../main.rs",
                output_bin: "../build/main",
            },
            CompileOption {
                name: "2. Limpiar con 'strip'",
                commands: &[
                    ("rustc", &["../main.rs", "-o", "../build/main"]),
                    ("strip", &["../build/main"]),
                ],
                watch_file: "../main.rs",
                output_bin: "../build/main",
            },
            CompileOption {
                name: "3. Generar LLVM-IR (.ll)",
                commands: &[("rustc", &["--emit=llvm-ir", "../main.rs", "-o", "../main.ll"])],
                watch_file: "../main.rs",
                output_bin: "../main.ll",
            },
            CompileOption {
                name: "4. Generar Assembly (.s)",
                commands: &[("rustc", &["--emit=asm", "../main.rs", "-o", "../main.s"])],
                watch_file: "../main.rs",
                output_bin: "../main.s",
            },
            CompileOption {
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
            CompileOption {
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

        Self {
            options,
            selected_index: 0,
            terminal_output: "Presiona Enter para compilar...".to_string(),
            last_compiled_size: None,
            current_size: None,
            watch_mode: false,
            last_modified: None,
            status_message: "IDLE".to_string(),
            executed_command_str: String::new(),
        }
    }

    fn run_compilation(&mut self) {
        let option = &self.options[self.selected_index];
        
        // Guardar tamaño anterior antes de compilar si el archivo ya existe
        if let Ok(metadata) = std::fs::metadata(option.output_bin) {
            self.last_compiled_size = Some(metadata.len());
        } else {
            self.last_compiled_size = None;
        }

        self.status_message = "COMPILING...".to_string();
        self.terminal_output = String::new();
        self.executed_command_str = String::new();

        let mut success = true;
        let mut final_stdout = String::new();
        let mut final_stderr = String::new();

        // Asegurarse de que la carpeta de build existe
        let _ = std::fs::create_dir_all("../build");

        for &(cmd, args) in option.commands {
            let cmd_str = format!("{} {}", cmd, args.join(" "));
            if !self.executed_command_str.is_empty() {
                self.executed_command_str.push_str(" && ");
            }
            self.executed_command_str.push_str(&cmd_str);

            let output = std::process::Command::new(cmd)
                .args(args)
                .output();

            match output {
                Ok(out) => {
                    let stdout_part = String::from_utf8_lossy(&out.stdout).to_string();
                    let stderr_part = String::from_utf8_lossy(&out.stderr).to_string();
                    
                    if !stdout_part.is_empty() {
                        final_stdout.push_str(&stdout_part);
                    }
                    if !stderr_part.is_empty() {
                        final_stderr.push_str(&stderr_part);
                    }

                    if !out.status.success() {
                        success = false;
                        self.status_message = "COMPILATION ERROR".to_string();
                        break;
                    }
                }
                Err(e) => {
                    success = false;
                    self.status_message = "EXECUTION FAILED".to_string();
                    final_stderr.push_str(&format!("Error al ejecutar '{}': {}", cmd, e));
                    break;
                }
            }
        }

        if success {
            self.status_message = "SUCCESS".to_string();
            self.terminal_output = if final_stdout.is_empty() && final_stderr.is_empty() {
                "Ejecutado con éxito sin salida en consola (se generó el archivo de salida).".to_string()
            } else {
                format!("STDOUT:\n{}\nSTDERR:\n{}", final_stdout, final_stderr)
            };

            // Obtener el nuevo tamaño
            if let Ok(metadata) = std::fs::metadata(option.output_bin) {
                self.current_size = Some(metadata.len());
            } else {
                self.current_size = None;
            }
        } else {
            self.terminal_output = format!("STDERR:\n{}", final_stderr);
            self.current_size = None;
        }

        // Actualizar el tiempo de última modificación para evitar bucles de watch
        if let Ok(metadata) = std::fs::metadata(option.watch_file) {
            if let Ok(modified) = metadata.modified() {
                self.last_modified = Some(modified);
            }
        }
    }

    fn draw(&self, frame: &mut ratatui::Frame) {
        let chunks = Layout::default()
            .direction(Direction::Vertical)
            .constraints([
                Constraint::Length(3), // Header
                Constraint::Min(10),   // Main area
                Constraint::Length(3), // Footer
            ])
            .split(frame.area());

        // 1. Header
        let header = Paragraph::new(Line::from(vec![
            Span::styled(" 🛠️  ASISTENTE DE COMPILACIÓN RUST ", Style::default().add_modifier(Modifier::BOLD).fg(Color::Cyan)),
            Span::styled(" | Taller de compilación de bajo nivel ", Style::default().fg(Color::Gray)),
        ]))
        .block(Block::default().borders(Borders::ALL).border_style(Style::default().fg(Color::DarkGray)));
        frame.render_widget(header, chunks[0]);

        // 2. Split Main Area
        let main_chunks = Layout::default()
            .direction(Direction::Horizontal)
            .constraints([
                Constraint::Percentage(35), // Left panel (Options)
                Constraint::Percentage(65), // Right panel (Output/Details)
            ])
            .split(chunks[1]);

        // Left Panel (Options List)
        let items: Vec<ListItem> = self.options.iter().enumerate().map(|(i, opt)| {
            let style = if i == self.selected_index {
                Style::default().fg(Color::Yellow).add_modifier(Modifier::BOLD)
            } else {
                Style::default().fg(Color::White)
            };
            let prefix = if i == self.selected_index { "➔ " } else { "  " };
            ListItem::new(Line::from(vec![
                Span::styled(prefix, style),
                Span::styled(opt.name, style),
            ]))
        }).collect();

        let options_list = List::new(items)
            .block(Block::default().borders(Borders::ALL).title(" Recetas de Compilación ").border_style(Style::default().fg(Color::Gray)));
        frame.render_widget(options_list, main_chunks[0]);

        // Right Panel (Details)
        let mut details = Vec::new();
        let option = &self.options[self.selected_index];

        details.push(Line::from(vec![
            Span::styled("Archivo origen: ", Style::default().fg(Color::Gray)),
            Span::styled(option.watch_file, Style::default().fg(Color::White)),
        ]));
        details.push(Line::from(vec![
            Span::styled("Archivo salida: ", Style::default().fg(Color::Gray)),
            Span::styled(option.output_bin, Style::default().fg(Color::White)),
        ]));

        details.push(Line::from(vec![
            Span::styled("Comando: ", Style::default().fg(Color::Gray)),
            Span::styled(&self.executed_command_str, Style::default().fg(Color::LightCyan).add_modifier(Modifier::ITALIC)),
        ]));

        details.push(Line::from(""));

        // Status
        let status_color = match self.status_message.as_str() {
            "SUCCESS" => Color::Green,
            "COMPILATION ERROR" => Color::Red,
            "COMPILING..." => Color::Yellow,
            "EXECUTION FAILED" => Color::LightRed,
            _ => Color::Gray,
        };
        details.push(Line::from(vec![
            Span::styled("Estado: ", Style::default().fg(Color::Gray)),
            Span::styled(&self.status_message, Style::default().fg(status_color).add_modifier(Modifier::BOLD)),
        ]));

        // Sizes
        if let Some(curr) = self.current_size {
            let mut size_spans = vec![
                Span::styled("Tamaño actual: ", Style::default().fg(Color::Gray)),
                Span::styled(format_size(curr), Style::default().fg(Color::Green).add_modifier(Modifier::BOLD)),
            ];

            if let Some(last) = self.last_compiled_size {
                if last != curr {
                    let diff = curr as i128 - last as i128;
                    let percentage = (diff.abs() as f64 / last as f64) * 100.0;
                    let (diff_str, diff_color) = if diff < 0 {
                        (format!(" (-{:.2}%, -{})", percentage, format_size(diff.abs() as u64)), Color::LightGreen)
                    } else {
                        (format!(" (+{:.2}%, +{})", percentage, format_size(diff as u64)), Color::LightRed)
                    };
                    size_spans.push(Span::styled(diff_str, Style::default().fg(diff_color)));
                }
            }
            details.push(Line::from(size_spans));
        } else {
            details.push(Line::from(vec![
                Span::styled("Tamaño actual: ", Style::default().fg(Color::Gray)),
                Span::styled("N/A (archivo no compilado)", Style::default().fg(Color::DarkGray)),
            ]));
        }

        details.push(Line::from(""));
        details.push(Line::from(Span::styled("Salida de consola / Log:", Style::default().fg(Color::Gray).add_modifier(Modifier::UNDERLINED))));
        
        for line in self.terminal_output.lines() {
            details.push(Line::from(Span::styled(line, Style::default().fg(Color::LightGray))));
        }

        let details_paragraph = Paragraph::new(details)
            .block(Block::default().borders(Borders::ALL).title(" Detalles y Resultados ").border_style(Style::default().fg(Color::Gray)))
            .wrap(Wrap { trim: false });
        frame.render_widget(details_paragraph, main_chunks[1]);

        // 3. Footer
        let watch_status = if self.watch_mode {
            Span::styled(" ACTIVO [Monitoreando cambios] ", Style::default().fg(Color::Black).bg(Color::Green))
        } else {
            Span::styled(" INACTIVO ", Style::default().fg(Color::White).bg(Color::DarkGray))
        };

        let footer = Paragraph::new(Line::from(vec![
            Span::styled(" Navegar: ", Style::default().fg(Color::Gray)),
            Span::styled("▲/▼", Style::default().fg(Color::Yellow)),
            Span::styled(" | Compilar: ", Style::default().fg(Color::Gray)),
            Span::styled("Enter", Style::default().fg(Color::Yellow)),
            Span::styled(" | Auto-compilar: ", Style::default().fg(Color::Gray)),
            Span::styled("W", Style::default().fg(Color::Yellow)),
            Span::styled(" (", Style::default().fg(Color::Gray)),
            watch_status,
            Span::styled(") | Salir: ", Style::default().fg(Color::Gray)),
            Span::styled("Q / Esc", Style::default().fg(Color::Yellow)),
        ]))
        .block(Block::default().borders(Borders::ALL).border_style(Style::default().fg(Color::DarkGray)));
        frame.render_widget(footer, chunks[2]);
    }

    fn run(&mut self, terminal: &mut Terminal<CrosstermBackend<std::io::Stdout>>) -> Result<(), Box<dyn std::error::Error>> {
        self.run_compilation();

        loop {
            terminal.draw(|f| self.draw(f))?;

            if event::poll(Duration::from_millis(150))? {
                if let Event::Key(key) = event::read()? {
                    if key.kind == event::KeyEventKind::Press {
                        match key.code {
                            KeyCode::Char('q') | KeyCode::Char('Q') | KeyCode::Esc => {
                                break;
                            }
                            KeyCode::Char('w') | KeyCode::Char('W') => {
                                self.watch_mode = !self.watch_mode;
                                if self.watch_mode {
                                    let option = &self.options[self.selected_index];
                                    if let Ok(metadata) = std::fs::metadata(option.watch_file) {
                                        self.last_modified = metadata.modified().ok();
                                    }
                                }
                            }
                            KeyCode::Up => {
                                if self.selected_index > 0 {
                                    self.selected_index -= 1;
                                    self.last_compiled_size = None;
                                    self.current_size = None;
                                    
                                    // Actualizar watcher para el nuevo archivo
                                    let option = &self.options[self.selected_index];
                                    if let Ok(metadata) = std::fs::metadata(option.watch_file) {
                                        self.last_modified = metadata.modified().ok();
                                    }
                                    
                                    self.run_compilation();
                                }
                            }
                            KeyCode::Down => {
                                if self.selected_index < self.options.len() - 1 {
                                    self.selected_index += 1;
                                    self.last_compiled_size = None;
                                    self.current_size = None;
                                    
                                    // Actualizar watcher para el nuevo archivo
                                    let option = &self.options[self.selected_index];
                                    if let Ok(metadata) = std::fs::metadata(option.watch_file) {
                                        self.last_modified = metadata.modified().ok();
                                    }
                                    
                                    self.run_compilation();
                                }
                            }
                            KeyCode::Enter => {
                                self.run_compilation();
                            }
                            _ => {}
                        }
                    }
                }
            }

            // Lógica de monitoreo (Watch Mode)
            if self.watch_mode {
                let option = &self.options[self.selected_index];
                if let Ok(metadata) = std::fs::metadata(option.watch_file) {
                    if let Ok(modified) = metadata.modified() {
                        if Some(modified) != self.last_modified {
                            self.last_modified = Some(modified);
                            self.run_compilation();
                        }
                    }
                }
            }
        }
        Ok(())
    }
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

fn main() -> Result<(), Box<dyn std::error::Error>> {
    enable_raw_mode()?;
    let mut stdout = std::io::stdout();
    execute!(stdout, EnterAlternateScreen)?;
    let backend = CrosstermBackend::new(stdout);
    let mut terminal = Terminal::new(backend)?;

    let mut app = App::new();
    let res = app.run(&mut terminal);

    disable_raw_mode()?;
    execute!(
        terminal.backend_mut(),
        LeaveAlternateScreen
    )?;
    terminal.show_cursor()?;

    if let Err(err) = res {
        println!("Error en la TUI: {:?}", err);
    }

    Ok(())
}
