CAMLC     = ocamlc
CAMLOPT   = ocamlopt
CAMLCFLAG = -thread
CAMLDEP   = ocamldep

CAMLYACC=ocamlyacc
YACCFLAGS=-v
CAMLLEX=ocamllex

TARGET = hw5
OBJ = lambda.cmo kml.cmo nameless.cmo parser.cmo \
      lexer.cmo pp.cmo trans.cmo hw5.cmo main.cmo

all: $(OBJ)
	$(CAMLC) -thread -g -o $(TARGET) unix.cma threads.cma $(OBJ)

clean:
	rm -f $(TARGET) *.cmx *.o [^t^p]*.cmo [^t^p]*.cmi hw5

.SUFFIXES : .ml .mli .cmo .cmi .cmx

.ml.cmo: $<
	$(CAMLC) $(CAMLCFLAG) -c $< -o $@
.ml.cmx: $<
	$(CAMLOPT) $(CAMLCFLAG) -c $< -o $@
.mli.cmi: $<
	$(CAMLC) $(CAMLCFLAG) -c $< -o $@

depend:
	$(CAMLDEP) *.mli *.ml > .depend

.PHONY: depend

include .depend

