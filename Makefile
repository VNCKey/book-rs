build:
	typst compile main.typ output/libro.pdf

watch:
	typst watch main.typ output/libro.pdf

clean:
	rm -f output/*.pdf
