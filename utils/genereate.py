#!/usr/bin/env python
import fontforge
import sys
if fontforge.version() < 20090622:
	print "Please upgrade to fontforge 20090622 or later version"
	sys.exit(1)

filename = sys.argv[1].rpartition(".")[0]
font     = fontforge.open(filename + ".sfd")
flags    = "round"

print "Generating %s.otf..." % filename
font.generate(filename + ".otf", flags)
print "Done"
