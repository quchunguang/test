'''
Created on 2012-12-18

@author: Administrator
'''
import os
import sys
import itertools
import glob
import re
import random
import datetime
import reprlib
import textwrap
import locale
import struct


def test():
    print(os.path.curdir + os.path.sep + sys.argv[0])
    for i in itertools.repeat(1, 3):
        print(i)
    for i,v in enumerate([1,2,3,4]):
        print(i,v)
    questions = ['name', 'quest', 'favorite color']
    answers = ['lancelot', 'the holy grail', 'blue']
    for q, a in zip(questions, answers):
        print('What is your {0}?  It is {1}.'.format(q, a))
    sys.stderr.write("NO Error exists")
    print(glob.glob("*.py"))
    a=re.findall(r'\bf[a-z]*', 'which foot or hand fell fastest')
    b=re.sub(r'(\b[a-z]+) \1', r'\1', 'cat in the the hat')
    print(a,b)
    random.choice(['apple', 'pear', 'banana'])
    print((datetime.date.today() - datetime.date(1979,4,19)).days)
    reprlib.repr(set('supercalifragilisticexpialidocious'))
    doc = """The wrap() method is just like fill() except that it returns
a list of strings instead of one big string with newlines to separate
the wrapped lines."""
    print(textwrap.fill(doc, width=40))

    locale.setlocale(locale.LC_ALL, 'en_US.utf8')  # locale -a
    conv = locale.localeconv()
    x = 1234567.8
    print(locale.format("%d", x, grouping=True))
    print(locale.format_string("%s%.*f",(conv['currency_symbol'],
                                   conv['frac_digits'], x), grouping=True))
    print()

    with open("test.zip", "rb") as f:
        data = f.read()
    start = 0
    for i in range(1):
        start += 14
        fields = struct.unpack('<IIIHH', data[start:start+16])
        crc32, comp_size, uncomp_size, filenamesize, extra_size = fields
        start += 16
        filename = data[start:start+filenamesize]
        start += filenamesize
        print(data[start:start+extra_size])
        print(filename, hex(crc32), comp_size, uncomp_size)
        start += extra_size + comp_size     # skip to the next header
    print(sys.platform)
    print(sys.getdefaultencoding())
    S='eggs'
    B = S.encode()
    print(bytes(S, encoding='ascii'))
    print(B.decode())
    print(str(B, encoding='ascii'))
    print(re.split(':', 'aa:ss:dd:ff'))
    print('哈哈哈'.encode('utf-8').decode('utf-8'))
    #line = input('> ')
    #print(line)

if __name__ == '__main__':
    test()