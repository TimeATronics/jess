IDIR =./include
SDIR =./src
CXX=clang++
CFLAGS=-I$(IDIR)

ODIR=obj
LDIR =./lib

LIBS=

_DEPS = engine.h jess.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = engine.o jess.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CFLAGS)

jess: $(OBJ)
	$(CXX) -o $@.exe $^ $(CFLAGS) -L$(LDIR) $(LIBS)

.PHONY: clean run

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~

run:
	make
	./jess.exe
