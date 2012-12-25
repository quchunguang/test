#!/usr/bin/awk -f

BEGIN		{ FS = OFS = "\t" }
$4 ~ "North"	{ $4 = "NA" }
$4 ~ "South"	{ $4 = "SA" }
		{ print }
