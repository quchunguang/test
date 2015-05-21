#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
import this

print ' '.join(['a', 'b'])

d = {'a': 1, 'b': 2, 'c': 3, 'e': 2, 'f': 2}
for k, v in d.items():
    print k, v
l = ['a', 'b', 'c']
s = ''
for i in l:
    s += i
print s
print ''.join(l)

print d.get('d', 4)
dd = {}
for k, v in d.items():
    dd.setdefault(v, [])
    dd[v].append(k)
print dd

from collections import defaultdict
ddd = defaultdict(list)
for k, v in d.items():
    ddd[v].append(k)
print ddd

name = 'David'
messages = 3
print 'Hello %s, you have %i messages' % (name, messages)

from pprint import pprint
# pprint(locals())
# print this.s

print dict((fn(i + 1), code)
           for i, code in enumerate('abcdefg')
           for fn in (int, str))

ll = ['a', 'b', 'c', 'd']
print ll


def my_range_generator(stop):
    value = 0
    while value < stop:
        yield value
        value += 1

print ''.join(map(str, my_range_generator(10)))
