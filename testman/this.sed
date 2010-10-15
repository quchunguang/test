# titles
1s/^\(.*\)$/\.TH \1/
/\<NAME\>/s/^\(.*\)$/\.SH \1/
/\<SYNOPSIS\>/s/^\(.*\)$/\.SH \1/
/\<DESCRIPTION\>/s/^\(.*\)$/\.SH \1/
/\<EXAMPLE\>/s/^\(.*\)$/\.SH \1/
/\<SEE ALSO\>/s/^\(.*\)$/\.SH \1/
/\<AUTHOR\>/s/^\(.*\)$/\.SH \1/
/\<REPORTING BUGS\>/s/^\(.*\)$/\.SH \1/
/\<COPYRIGHT\>/s/^\(.*\)$/\.SH \1/

# highlight name
s/this/\\fIthis\\fR/g

# example mark
/EXAMPLEMARK/,/EXAMPLEMARK/{
a\
.br
}
/EXAMPLEMARK/s///

# SEE ALSO
/SEE ALSO/,/AUTHOR/{
/^[a-z]/s/^\(.*\)$/\.BR \1/
s/(\([1-9]\))/ "(\1), "/g
s/(C++)/ "(C++), "/g
s/(C++)$/ "(C++)"/
}

# AUTHOR
/AUTHOR/{
i\

a\
\\fIR\\fRofail\ \\fIQ\\fRu\ \<rofail@gmail.com\>
}

# COPYRIGHT
/COPYRIGHT/{
i\

a\
\\fIC\\fRopyright\ \\fI© 2010\\fR\ Rofail Qu
}
