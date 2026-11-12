export TYPST_FONT_PATHS := "fonts/fonts"

# Watch + servir + auto-refresh navegador (Windows/Mac)
default:
    ./scripts/serve.sh

# Solo compilar
build:
    mkdir -p output
    ~/.cargo/bin/typst compile main.typ output/libro.pdf
    rm -f *.pdf

# Servir PDF en HTTP
serve:
    python3 -m http.server 8080 --directory output

# Linux: Zathura + auto-recompile
zathura:
    @bash -c '\
        mkdir -p output && \
        ~/.cargo/bin/typst watch --root . main.typ output/libro.pdf & \
        WATCH_PID=$! && \
        zathura output/libro.pdf & \
        ZATHURA_PID=$! && \
        trap "kill $WATCH_PID $ZATHURA_PID 2>/dev/null || true" INT TERM EXIT && \
        wait -n $WATCH_PID $ZATHURA_PID && \
        kill $WATCH_PID $ZATHURA_PID 2>/dev/null || true'


# Limpiar PDFs generados
clean:
    rm -rf output/*.pdf *.pdf
