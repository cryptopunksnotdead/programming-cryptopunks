TARGET = programming-cryptopunks
SRC    =  book/00_meta.md \
         01_crop.md \
         02_attributes.md \
         03_generate.md  \
         05_alien_invasion.md \
         06_palette_8bit.md \
         07_humans.md \
         08_composite.md  \
         09_monalisa.md \
         10_hair.md   \
         A1_special_effects.md 



PANDOC = c:/prg/pandoc3.1.11.1/pandoc.exe



all: pdf  pdf_std


pdf_std: $(SRC) build
	$(PANDOC) --verbose $(SRC) \
           -f gfm \
           --toc  \
           --number-sections \
           --pdf-engine=xelatex   \
	       -o build/$(TARGET)_std.pdf


pdf: $(SRC) build
	$(PANDOC) --verbose $(SRC) \
           -f gfm \
           --lua-filter book/numbering.lua \
           --toc  \
           --number-sections \
		   --include-in-header book/fonts.tex \
           --include-in-header book/chapter_break.tex \
           --include-in-header book/inline_code.tex \
           --highlight-style book/pygments.theme  \
           -V linkcolor:blue  \
           -V geometry:a4paper  \
           -V geometry:margin=2cm   \
           --pdf-engine=xelatex   \
	       -o build/$(TARGET).pdf

build:
	mkdir build

