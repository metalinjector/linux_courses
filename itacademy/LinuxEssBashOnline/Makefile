TARGET = 01-linux-course.pdf
TARGET += 02-linux-course.pdf
TARGET += 03-linux-course.pdf
TARGET += 04-linux-course.pdf
TARGET += 05-linux-course.pdf
TARGET += 06-linux-course.pdf

LATEXML=latexml
LATEXML_PARAMS=--inputencoding=utf8 --preload=beamer.cls --preload=t2aenc.def --nocomments
XMLWF=xmlwf
XMLWF_PARAMS=

LATEXML2OPENXML=java -jar latexml2openxml-0.0.1-SNAPSHOT-jar-with-dependencies.jar

.PHONY: all xml pptx tex clean

%.dvi: %.tex
	latex $<
	latex $<
	latex $<

%.ps: %.dvi
	dvips -j0 -Ppdf -o $@ $<

%.pdf: %.tex common.tex
	xelatex $<
	xelatex $<

%.xml: %.tex
	$(LATEXML) $(LATEXML_PARAMS) --destination=$@ $< &> $@.log
	$(XMLWF) $(XMLWF_PARAMS) $@

%.pptx: %.xml
	$(LATEXML2OPENXML) --slideshow=$@ $< &> $@.log

tex: $(TARGET)

xml: $(TARGET_XML)

pptx: $(TARGET_PPTX)

bib: programm.aux
	bibtex8 -s programm.aux

all: tex

clean: 
	@rm -f *.aux
	@rm -f *.vrb
	@rm -f *.snm
	@rm -f *.log
	@rm -f *.out
	@rm -f *.toc
	@rm -f *.nav
	@rm -f *.xdv
	@rm -f *.fls
	@rm -f *.fdb_latexmk
	@rm -f $(TARGET_PPTX)
	@rm -f $(TARGET_XML)
	@rm -f $(TARGET)
