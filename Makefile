TEX=$(wildcard tex/*.tex tex/**/*.tex)
TEXDVI=$(TEX:.tex=.dvi) $(TEX:.tex=.dark.dvi)
TEXSVG=$(addprefix assets/,$(TEX:.tex=.svg)) $(addprefix assets/,$(TEX:.tex=.dark.svg))
STYLEDEFS=data/styleconf.json
LIGHTCOLOR=$(shell jq -r ".text.light.primary" $(STYLEDEFS))
DARKCOLOR=$(shell jq -r ".text.dark.primary" $(STYLEDEFS))

.PHONY: clean all latexdiagrams watch

all: latexdiagrams

watch:
	while true; do \
		$(MAKE); \
		inotifywait -qre close_write .; \
	done

clean:
	rm -rf $(TEXDVI)
	rm -rf $(TEXSVG)

latexdiagrams: $(TEXSVG)

assets/tex:
	mkdir -p assets/tex/

assets/tex/%.svg: tex/%.dvi assets/tex
	dvisvgm -Z 2 $< -o $@

# TODO: The following two rules should be de-duplicated and merged into one
# also, i want the latex source to have access to a boolean variable which indicates
# whether it's being rendered in light mode or dark mode
tex/%.dvi: tex/%.tex $(STYLEDEFS)
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

tex/%.dark.dvi: tex/%.tex $(STYLEDEFS) assets/tex
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
