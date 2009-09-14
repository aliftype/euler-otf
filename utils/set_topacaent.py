#!/usr/bin/python

import fontforge

amount = None

def set_topaccent(data, font):
    selection = font.selection.byGlyphs
    global amount
    if not amount:
        amount = ""
    amount = fontforge.askString("Math accent shift","How much the accent is shifted from midline?", amount)
    for glyph in selection:
        if amount:
            glyph.topaccent = round((glyph.width/2.0) + (int(amount)))
            font.changed = True

fontforge.registerMenuItem(set_topaccent,None,None,"Font",None,"Set Math accent")
