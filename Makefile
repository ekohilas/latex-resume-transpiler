# Makefile for compiling

FILE ?= example
ENGINE = lualatex # or xelatex
TEX = $(FILE).tex
STY ?= two-column-resume.sty
CLS ?= two-column-resume.cls

PY = python3
GEN = gen_tex.py
GENT = md2tex.py

MD ?= $(FILE).md
PDF ?= $(FILE).pdf
PHOTO ?=

all : $(PDF)

.PHONY: all view

view :
	xdg-open $(PDF)

$(PDF) : $(TEX) $(STY) $(CLS) $(PHOTO)
	$(ENGINE) $(TEX)
	$(ENGINE) $(TEX)
	rm -f $(FILE).log $(FILE).aux $(FILE).out

$(TEX) : $(MD) $(GEN) $(GENT)
	$(PY) $(GEN) < $(MD) > $(TEX)

clean:
	rm -f $(PDF) $(FILE).log $(FILE).aux $(FILE).out $(FILE).tex


