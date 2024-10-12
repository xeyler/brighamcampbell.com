TEX=$(wildcard tex/*.tex tex/**/*.tex)
TEXDVI=$(TEX:.tex=.dvi) $(TEX:.tex=.dark.dvi)
TEXSVG=$(addprefix assets/,$(TEX:.tex=.svg)) $(addprefix assets/,$(TEX:.tex=.dark.svg))
STYLEDEFS=data/styleconf.json
LIGHTCOLOR=$(shell jq -r ".text.light.primary" $(STYLEDEFS))
DARKCOLOR=$(shell jq -r ".text.dark.primary" $(STYLEDEFS))
COLORS=$(LIGHTCOLOR) $(DARKCOLOR)

.PHONY: clean all latexdiagrams

all: latexdiagrams

clean:
	rm -rf $(TEXDVI)
	rm -rf $(TEXSVG)

latexdiagrams: $(TEXSVG)

assets/tex/%.svg: tex/%.dvi
	dvisvgm $< -o $@

# TODO: The following two rules should be de-duplicated and merged into one
# also, i want the latex source to have access to a boolean variable which indicates
# whether it's being rendered in light mode or dark mode
tex/%.dvi: tex/%.tex
	latexmk \
		-silent \
		-dvi \
		-outdir=$(dir $<) \
		-jobname=$(basename $(notdir $@)) \
		-pretex="\AtBeginDocument{\definecolor{MyColor}{HTML}{$(LIGHTCOLOR)}\color{MyColor}}" \
		-usepretex \
		$<
	latexmk \
		-silent \
		-c \
		-outdir=$(dir $<) \
		-jobname=$(basename $(notdir $@)) \
		$<

tex/%.dark.dvi: tex/%.tex
	latexmk \
		-silent \
		-dvi \
		-outdir=$(dir $<) \
		-jobname=$(basename $(notdir $@)) \
		-pretex="\AtBeginDocument{\definecolor{MyColor}{HTML}{$(DARKCOLOR)}\color{MyColor}}" \
		-usepretex \
		$<
	latexmk \
		-silent \
		-c \
		-outdir=$(dir $<) \
		-jobname=$(basename $(notdir $@)) \
		$<
