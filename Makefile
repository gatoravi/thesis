all: thesis.tex chapters/01_introduction.tex chapters/02_hedgehog.tex chapters/03_cas.tex chapters/04_conclusion.tex chapters/05_appendix.tex
	latexmk -lualatex thesis.tex
clean:
	latexmk -C  # also remove the built PDF
