colors = {
    "red"	: 0xff0000,
    "blue"	: 0x0000ff,
    "green"	: 0x00ff00,
    "yellow": 0xffff00,
    "none"	: -1
}

def set_ssty(data, font):
    clrs = tuple(colors.keys())
    clr  = clrs[fontforge.askChoices("Set Glyph Color","Select a color",clrs)]
    color = "green"
    selection = font.selection.byGlyphs
    for glyph in selection:
        glyph.color = colors[clr]
	font.changed = 1

fontforge.registerMenuItem(set_ssty,None,None,"Font",None,"Set Glyph Color")
