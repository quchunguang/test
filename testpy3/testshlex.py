'''
Created on 2013-1-17

@author: Administrator
'''
import shlex
import sys


if len(sys.argv) != 2:
    print('Please specify one filename on the command line.')
    sys.exit(1)
filename = sys.argv[1]

body = open(filename, 'rt').read()
print('ORIGINAL:')
print(body)

print('TOKENS:')
lexer = shlex.shlex(body)
lexer.whitespace += '.,'
for token in lexer:
    print(token)
