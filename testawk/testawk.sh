#!/bin/sh
## From:
## http://sunsite.ualberta.ca/Documentation/Gnu/gawk-3.1.0/html_chapter/gawk.html

## Call awk to process another target field, \47 \42 as single/double quotes is always a good idea
awk 'BEGIN{RS="\n\n"; FS="\n";}{system("echo " $1 " | awk \47{print $2}\47");}' inventory-shipped 

## NOT match demos
awk '$1 !~ /^J/{IGNORECASE = 1; if($1 ~ /feb/) print $1}' inventory-shipped 
## use regex
echo aaaabcd | awk '{ sub(/a+/, "<A>"); print }'
echo aaaabcd | awk '{ str=$1; sub(/a+/, "<A>", str); print str }'
## record separate by regex
echo record 1 AAAA record 2 BBBB record 3 | gawk 'BEGIN { RS = "\n|( *[[:upper:]]+ *)" } { print "Record =", $0, "and RT =", RT }'
## last record
awk '/foo/ { print $1, $NF }' BBS-list
## calc count
awk '/foo/{ print $(2*2) }' BBS-list
## OFS
echo a b c d | awk '{ OFS = ":"; $2 = ""; print $0; print NF }'
