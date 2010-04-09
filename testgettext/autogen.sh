#!/bin/bash

# generate file.list for gettext
[ -d language ] || mkdir language
find . -name "*.c" > language/file.list

# create template po file
xgettext --keyword=_ --from-code=UTF-8 -o language/template.po -f language/file.list
# TODO: change CHARSET -> UTF-8 in language/template.po by hand

# create zh_CN po file
mkdir -p language/zh_CN/LC_MESSAGES
msginit --local=zh_CN -i language/testgettext.po -o language/zh_CN/LC_MESSAGES/testgettext.po
# TODO: translate language/zh_CN/LC_MESSAGES/testgettext.po to chinese version

# compile po file to mo file
msgfmt -o language/zh_CN/LC_MESSAGES/testgettext.mo language/zh_CN/LC_MESSAGES/testgettext.po

# make program
make clean
make

# run for test
locale | grep LC_MESSAGES # show current location setting
./testgettext
./testgettext2

