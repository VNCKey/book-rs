#!/bin/bash
mkdir -p output
~/.cargo/bin/typst compile main.typ output/libro.pdf
rm -f *.pdf

# Servir con Python (accesible desde otros dispositivos)
cd output && python3 -m http.server 8080 --bind 0.0.0.0 &

IP=$(hostname -I | awk '{print $1}')

echo ""
echo "============================================"
echo "  Abriendo navegador..."
echo ""
echo "  Local:    http://localhost:8080/viewer.html"
echo "  Red:      http://$IP:8080/viewer.html"
echo ""
echo "  Ctrl+C para detener"
echo "============================================"
echo ""

# Abrir navegador local con viewer.html
xdg-open http://localhost:8080/viewer.html 2>/dev/null || open http://localhost:8080/viewer.html 2>/dev/null || true

# Watch para cambios en .typ y recompilar
find . -name "*.typ" -not -path "./output/*" | \
entr -n sh -c '~/.cargo/bin/typst compile main.typ output/libro.pdf && rm -f *.pdf && echo "Recompilado: $(date +%H:%M:%S)"'
