all:
	latexmk -lualatex thesis.tex
clean:
	latexmk -C  # also remove the built PDF
