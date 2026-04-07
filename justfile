# Watch + servir + auto-refresh navegador
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

# Limpiar PDFs generados
clean:
    rm -rf output/*.pdf *.pdf
