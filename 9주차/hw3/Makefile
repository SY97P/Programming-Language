CAMLC=ocamlc
CAMLOPT=ocamlopt
CAMLCFLAG= 
CAMLDEP=ocamldep

CAMLYACC=ocamlyacc
YACCFLAGS=-v
CAMLLEX=ocamllex

TARGET=hw3
OBJ=hw3.cmo

all: $(OBJ)
	$(CAMLC) $(CAMLCFLAG) -o $(TARGET) $(OBJ) 

clean:
	rm -f $(TARGET) *.annot *.aux *.log *.cm[iox] *.dvi 

.SUFFIXES : .ml .mli .cmo .cmi .cmx 

.ml.cmo: 
	$(CAMLC) $(CAMLCFLAG) -c $< 
.ml.cmx: 
	$(CAMLOPT) $(CAMLCFLAG) -c $<
.mli.cmi: 
	$(CAMLC) $(CAMLCFLAG) -c $<

depend: 
	$(CAMLDEP) *.mli *.ml > .depend 

.PHONY: depend

include .depend
