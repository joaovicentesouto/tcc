PDFLATEX=pdflatex
BIBTEX=bibtex
MAKEINDEX=makeindex
LTX=$(PDFLATEX) -shell-escape -interaction=nonstopmode
XINDY=xindy
INKS=inkscape
GIT=git
PDFINFO=pdfinfo
PODOFOBOX=podofobox
GNUPLOT=gnuplot


###################################################
# Compute some target enumerations                #
###################################################

srcs=$(wildcard *.tex) $(wildcard *.bib)
svgs=$(wildcard imgs/svgs/*.svg)
frames=$(foreach k,1 2 3 4 5 6,imgs/processor-trend-$k.pdf)
pdfs=$(svgs:.svg=.pdf) 
others=$(wildcard imgs/others/*.pdf) $(wildcard imgs/others/*.jpg) $(wildcard imgs/others/*.png)

###################################################
# phony targets                                   #
###################################################

all: imgs main.robust.pdf

imgs: $(pdfs)
	cp $(pdfs) imgs
	cp $(others) imgs

.PHONY: all imgs clean

clean: 
	rm -fr *.64 main-logo.pdf _minted-* *.aux *.bbl *.blg *.brf *.out *.synctex.gz *.log main.pdf main.robust.pdf *.idx *.ilg *.ind *.lof *.lot *.lol *.loalgorithm *.glsdefs *.xdy *.toc *.acn *.glo *.ist *-*.pdf *-*.jpg *-*.png *.nav *.snm *.vrb *.prv _region*  *~ auto imgs/*.pdf imgs/svgs/*.pdf imgs/*.jpg imgs/*.png {imgs,plots}/*-eps-converted-to.pdf; 

###################################################
# SVG -> PDF conversion                           #
###################################################

# directly convert a SVG to PDF. The SVG's contents will be cropped to the page
imgs/%.pdf: imgs/%.svg
	$(INKS) -z -C -A="$$(pwd)/$@" "$$(pwd)/$<"

#Possible bug: inkscape -z -D -i gSlide1 -A=out.pdf in.svg
#Workaround: generate a pdf of the whole drawing (-D, beyond page borders); get bottom:left:width:height of object; convert px to PostScript pts; crop from the pdf
#Quirk: inkscape -Y has top-left corner of page at origin
define svg2pdf
	$(INKS) -z -D -A="$$(pwd)/$(3).tmp.pdf" "$$(pwd)/$(1).svg"
	PTS=$$($(PDFINFO) "$$(pwd)/$(3).tmp.pdf" | grep 'Page size' | sed 's/[^0-9]*\([0-9]*\.[0-9]*\)[^0-9].*/\1/'); \
	IW=$$($(INKS) -z --query-width "$$(pwd)/$(1).svg"); \
	FAC=$$(echo "scale=3; 100 * $$PTS / $$IW" | bc); \
	X=$$(awk "BEGIN {printf \"%.3f\", $$FAC * $$($(INKS) -z -I $(2) -X "$$(pwd)/$(1).svg")}"); \
	Y=$$(awk "BEGIN {printf \"%.3f\", $$FAC * (-1)*($$($(INKS) -z -I $(2) -Y "$$(pwd)/$(1).svg"))}"); \
	W=$$(awk "BEGIN {printf \"%.3f\", $$FAC * $$($(INKS) -z -I $(2) -W "$$(pwd)/$(1).svg")}"); \
	H=$$(awk "BEGIN {printf \"%.3f\", $$FAC * $$($(INKS) -z -I $(2) -H "$$(pwd)/$(1).svg")}"); \
	$(PODOFOBOX) "$$(pwd)/$(3).tmp.pdf" "$$(pwd)/$(3).pdf" media $$X $$Y $$W $$H
	rm "$$(pwd)/$(3).tmp.pdf"
endef

###################################################
# Frane targets                                   #
###################################################

imgs/processor-trend-1.pdf: imgs/svgs/processor-trend.svg
	$(call svg2pdf,imgs/svgs/processor-trend,gSlide1,imgs/processor-trend-1)
imgs/processor-trend-2.pdf: imgs/svgs/processor-trend.svg
	$(call svg2pdf,imgs/svgs/processor-trend,gSlide2,imgs/processor-trend-2)
imgs/processor-trend-3.pdf: imgs/svgs/processor-trend.svg
	$(call svg2pdf,imgs/svgs/processor-trend,gSlide3,imgs/processor-trend-3)
imgs/processor-trend-4.pdf: imgs/svgs/processor-trend.svg
	$(call svg2pdf,imgs/svgs/processor-trend,gSlide4,imgs/processor-trend-4)
imgs/processor-trend-5.pdf: imgs/svgs/processor-trend.svg
	$(call svg2pdf,imgs/svgs/processor-trend,gSlide5,imgs/processor-trend-5)
imgs/processor-trend-6.pdf: imgs/svgs/processor-trend.svg
	$(call svg2pdf,imgs/svgs/processor-trend,gSlide6,imgs/processor-trend-6)

###################################################
# main targets                                    #
###################################################

main.aux: $(srcs) $(pdfs) $(frames)
	$(LTX) main.tex; $(LTX) main.tex || true

main.blg: main.aux $(srcs)
	$(BIBTEX) main.aux

main.pdf: $(srcs) main.aux main.blg
	$(LTX) main.tex; \
	$(LTX) main.tex || true

# Converts main.pdf to PDF version 1.4 and embedd all fonts
# This is required by IEEE (this is done by PDF Xpress) and Elsevier journals
main.robust.pdf: main.pdf
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dEmbedAllFonts=true -sOutputFile="$@" -f "$<" 
