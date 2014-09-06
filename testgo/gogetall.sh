#!/usr/bin/env bash

# wget http://godoc.org/-/index
# gawk 'match($0, /.*href="\/(.*)\".*$/, m) { print m[1]; }' Index\ -\ GoDoc.html > godoc.org.index
# (trip head 5 lines)

source='godoc.org.index'

i=1
length=$(wc -l godoc.org.index | awk '{print $1}')
while read line; do
	echo "$i/$length ${line}"
	go get ${line}
	((i++))
done <${source}
