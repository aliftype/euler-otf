NAME=euler
VERSION=0.002

PY=python

define $(NAME)SCRIPT
import fontforge, sys
f = fontforge.open(sys.argv[1])
f.correctDirection()
f.version = "$(VERSION)"
f.generate(sys.argv[2], flags=("round", "opentype"))
endef

export $(NAME)SCRIPT

SFDS=euler.sfd
OTFS=$(SFDS:.sfd=.otf)

all: otf

otf: $(OTFS)

%.otf : %.sfd
	@echo "Building $@"
	@$(PY) -c "$$$(NAME)SCRIPT" $< $@

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
