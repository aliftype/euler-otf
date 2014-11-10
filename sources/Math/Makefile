MKO=makeotf -r -shw

OTF=Regular/NeoEulerMath-Regular.otf Bold/NeoEulerMath-Bold.otf
ASM=Regular/font.t1asm Bold/font.t1asm
PFA=$(ASM:.t1asm=.pfa)

all: otf

otf: $(OTF)

%.pfa: %.t1asm
	@echo "Generating $@"
	@t1asm -a $< $@

Regular/NeoEulerMath-Regular.otf: FontMenuNameDB GlyphOrderAndAliasDB features Regular/features Regular/fontinfo Regular/font.pfa
	@echo "Building $@"
	@(cd `dirname $@` && $(MKO))

Bold/NeoEulerMath-Bold.otf: FontMenuNameDB GlyphOrderAndAliasDB features Bold/fontinfo Bold/font.pfa
	@echo "Building $@"
	@(cd `dirname $@` && $(MKO))
