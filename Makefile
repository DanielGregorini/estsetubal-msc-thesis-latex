# =====================================================================
# Makefile
# PT: Atalhos de compilação.
#       make          compila main.pdf com o latexmk (usa .latexmkrc)
#       make manual   compila sem latexmk: pdflatex, biber, makeglossaries, pdflatex x2
#       make clean    apaga os ficheiros auxiliares (mantém o PDF)
#       make distclean  apaga também o main.pdf
# EN: Build shortcuts.
#       make          builds main.pdf with latexmk (uses .latexmkrc)
#       make manual   builds without latexmk: pdflatex, biber, makeglossaries, pdflatex x2
#       make clean    removes the auxiliary files (keeps the PDF)
#       make distclean  also removes main.pdf
# =====================================================================

MAIN     = main
PDFLATEX = pdflatex -interaction=nonstopmode -file-line-error

.PHONY: all manual clean distclean

all:
	latexmk $(MAIN).tex

manual:
	$(PDFLATEX) $(MAIN).tex
	biber $(MAIN)
	makeglossaries $(MAIN)
	$(PDFLATEX) $(MAIN).tex
	$(PDFLATEX) $(MAIN).tex

clean:
	-latexmk -c $(MAIN).tex
	rm -f $(MAIN).acn $(MAIN).acr $(MAIN).alg $(MAIN).glo $(MAIN).gls $(MAIN).glg \
	      $(MAIN).ist $(MAIN).bbl $(MAIN).bcf $(MAIN).blg $(MAIN).run.xml \
	      $(MAIN).aux $(MAIN).log $(MAIN).out $(MAIN).toc $(MAIN).lof $(MAIN).lot \
	      $(MAIN).fls $(MAIN).fdb_latexmk $(MAIN).synctex.gz

distclean: clean
	rm -f $(MAIN).pdf
