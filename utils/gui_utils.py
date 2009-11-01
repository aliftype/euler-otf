colors = {
    "red"	: 0xff0000,
    "blue"	: 0x0000ff,
    "light blue": 0x00ffff,
    "green"	: 0x00ff00,
    "yellow"	: 0xffff00,
    "none"	: -1
}

def set_color(data, font):
    color_keys = tuple(colors.keys())
    color      = color_keys[fontforge.askChoices("Set Glyph Color","Select a color",color_keys)]
    for glyph in font.selection.byGlyphs:
        glyph.color = colors[color]
        font.changed = True

def set_ssty(data, font):
    for glyph in font.selection.byGlyphs:
        name = glyph.glyphname
        glyph.addPosSub("'ssty' Script Style lookup 0-1",(name+".ssty1",name+".ssty2"))
        font.changed = True

accent_shift = None

def set_topaccent(data, font):
    global accent_shift
    if not accent_shift:
        accent_shift = ""
    accent_shift = fontforge.askString("Math accent shift",
                    "How much the accent is shifted from midline?",
                    accent_shift)
    for glyph in font.selection.byGlyphs:
        if accent_shift:
            glyph.topaccent = round((glyph.width/2.0) + (float(accent_shift)))
            font.changed = True

def set_extended_shape(data, font):
    for glyph in font.selection.byGlyphs:
        glyph.isExtendedShape = True
        font.changed = True

fontforge.registerMenuItem(set_color,None,None,"Font",None,"Math","Set glyph color")
fontforge.registerMenuItem(set_ssty,None,None,"Font",None,"Math","Set 'ssty' variants")
fontforge.registerMenuItem(set_topaccent,None,None,"Font",None,"Math","Set math accent")
fontforge.registerMenuItem(set_extended_shape,None,None,"Font",None,"Math","Set extended shape")
