LATEX = latexmk
LATEX_FLAGS = -shell-escape -e "\$$pdflatex=q/pdflatex -synctex=1 -interaction=nonstopmode/" -pdf

all: main.tex clean
	pdflatex -interaction=nonstopmode main.tex ; \
	biber main; \
	pdflatex -interaction=nonstopmode main.tex ;\
	pdflatex -interaction=nonstopmode main.tex

clean:
	rm -f             \
		*.aux         \
		*.bbl         \
		*.bcf         \
		*.blg         \
		*.fls         \
		*.log         \
		*.out         \
		*.xml         \
		*.toc         \
		*.fdb_latexmk \
		*.gz          \
		*.glo         \
		*.ist         \
		*.acn