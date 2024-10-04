TEX=$(wildcard assets/tex/**/*.tex)
DVI=$(TEX:.tex=.dvi)
SVG=$(TEX:.tex=.svg)

.PHONY: clean all

all: $(SVG)

clean:
	rm -rf $(SVG)
	rm -rf $(DVI)

assets/tex/%.svg: assets/tex/%.dvi
	dvisvgm $< -o $@

assets/tex/%.dvi: assets/tex/%.tex
	latex -output-format=dvi -output-directory=$(shell dirname $<) $<
	rm -rf $(<:.tex=.log)
	rm -rf $(<:.tex=.aux)
