NAME=neo-euler
VERSION=0.002

PY=python

define SCRIPT
import fontforge, sys
f = fontforge.open(sys.argv[1])
f.correctDirection()
f.version = $(VERSION)
f.generate(sys.argv[2], flags=("round"))
endef


SFDS=euler.sfd
OTFS=$(SFDS:.sfd=.otf)

all: otf

otf: $(OTFS)

%.otf : %.sfd
	@echo "Building $@"
	@$(PY) -c "$$SCRIPT" $< $@

dist: $(OTFS)
	@echo "Making dist tarball"
	@mkdir -p $(NAME)-$(VERSION)/sources
	@cp $(SFDS) $(NAME)-$(VERSION)/sources
	@cp $(OTFS) $(NAME)-$(VERSION)
	@cp OFL-FAQ.txt OFL.txt README $(NAME)-$(VERSION)
	@cp Makefile $(NAME)-$(VERSION)
	@tar cfj $(NAME)-$(VERSION).tar.bz2 $(NAME)-$(VERSION)

clean:
	@rm -rf $(OTFS) $(NAME)-$(VERSION) $(NAME)-$(VERSION).tar.bz2
