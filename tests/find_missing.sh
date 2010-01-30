#!/bin/bash
TESTFIL=$1
grep "Missing character" "$TESTFIL.log" | sort | sed -e 's/\(^.......\)/\[32m\1\[0m/' -e 's/\(There is no \)\(.\)/\1\[31m\2\[0m/' -e "s/Missing character: //"
