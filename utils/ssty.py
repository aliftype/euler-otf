#!/usr/bin/env python
import fontforge
import sys

fnt = fontforge.open(sys.argv[1])
fnt.selection.select(("ranges",None),"uni0021","uniF6BE")
glyphs = fnt.selection.byGlyphs

for glf in glyphs:
	ssty1 = fnt.createChar(-1,glf.glyphname+".ssty1")
	ssty2 = fnt.createChar(-1,glf.glyphname+".ssty2")
	if ssty1.isWorthOutputting() and ssty2.isWorthOutputting():
		print "Adding ssty1 and ssty2 to", glf.glyphname
		glf.addPosSub("'ssty' Script Style lookup 0-1",(ssty1.glyphname,ssty2.glyphname))
	elif ssty1.isWorthOutputting():
		print "Adding ssty1 to", glf.glyphname
		glf.addPosSub("'ssty' Script Style lookup 0-1",ssty1.glyphname)
	elif ssty2.isWorthOutputting():
		print "Adding ssty2 to", glf.glyphname
		glf.addPosSub("'ssty' Script Style lookup 0-1",ssty2.glyphname)

fnt.save()
