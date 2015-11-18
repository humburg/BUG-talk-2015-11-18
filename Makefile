PANDOC = pandoc
WEB_DIR = reveal.js

PANDOC_COMMON = --standalone --smart --normalize --highlight-style=tango
PANDOC_SLIDES = -t revealjs --toc-depth=1 -V toc-header="Overview" \
                --mathjax="/MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML,local/local" \
                -V theme="bug" --template=include/default.revealjs --slide-level=2 \
                -V revealjs-url=""

all: slides.html figure/* deploy
slides.html: slides.md include/default.revealjs
	pandoc $(PANDOC_COMMON) $(PANDOC_SLIDES) -s slides.md -o slides.html

.PHONY: all deploy
deploy:
	cp -r figure reveal.js/
	cp slides.html reveal.js/index.html
