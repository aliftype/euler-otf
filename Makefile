NAME=neo-euler
VERSION=0.002

FF=fontforge -lang=ff
FFLAGES=0x200000
SCRIPT='Open($$1); Generate($$2, "", $(FFLAGES))'

SFDS=euler.sfd
OTFS=$(SFDS:.sfd=.otf)

all: otf

otf: $(OTFS)

%.otf : %.sfd
	$(FF) -c $(SCRIPT) $< $@

dist: $(OTFS)
	mkdir -p $(NAME)-$(VERSION)/sources
	cp $(SFDS) $(NAME)-$(VERSION)/sources
	cp $(OTFS) $(NAME)-$(VERSION)
	cp OFL-FAQ.txt OFL.txt README $(NAME)-$(VERSION)
	cp Makefile $(NAME)-$(VERSION)

	tar cfj $(NAME)-$(VERSION).tar.bz2 $(NAME)-$(VERSION)

clean:
	rm -rf $(OTFS) $(NAME)-$(VERSION) $(NAME)-$(VERSION).tar.bz2
