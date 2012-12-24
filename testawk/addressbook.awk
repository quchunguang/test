#!/usr/bin/awk -f

BEGIN		{ RS = ""; ORS = "\n\n"; FS = OFS = "\n"; }
/New York/	{ print $1, $3; }
