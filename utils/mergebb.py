#!/usr/bin/python

import fontforge

font = fontforge.open("euler.sfd")
font.mergeFonts("eulerbb.sfd")
font.generate("eulerbb.otf")
