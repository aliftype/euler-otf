def set_ssty(data, font):
    selection = font.selection.byGlyphs
    for glyph in selection:
        name = glyph.glyphname
        glyph.addPosSub("'ssty' Script Style lookup 0-1",(name+".ssty1",name+".ssty2"))

fontforge.registerMenuItem(set_ssty,None,None,"Font",None,"Set SSTY variants")
