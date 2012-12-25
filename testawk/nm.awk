#!/usr/bin/awk -f

NF == 1	{ file = $1 }
NF == 2	{ print file, $2 }
NF == 3	{ print file, $3 }
