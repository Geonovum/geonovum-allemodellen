XML = $(wildcard *.xml)

all: $(XML:xml=html)

%.html: %.xml mim2report.xsl Makefile
	xsltproc mim2report.xsl $< > $@
