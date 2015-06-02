import sys
from os import listdir
from os.path import isdir, abspath
from itertools import count, repeat
from random import random

root1 = abspath(r'a')
root2 = abspath(r'b')
dirs1 = listdir(root1)
dirs2 = listdir(root2)

# dirs3 = [val for val in dirs1 if val in dirs2]
dirs3 = set(dirs1) & set(dirs2)
print(dirs3)

s = 'test.end'
trim = lambda s: s.strip('.end')
print(list(map(trim, [s, ])))

from functools import partial
pow2 = partial(pow, 2)
print(pow2(5))

print(list(map(pow, count(0), repeat(2, 10))))
print(pow(2, 3))
print([random() for i in range(10)])
print('{0}([1,2,3])'.format('sin'))
print(min.__name__)

from timeit import Timer
l = [1, 2, 3]
stmt = 'sum(l)'
setup = 'from __main__ import l'
print(Timer(stmt, setup).repeat(2, 3))

import collections

l = [(x, y) for x in range(5) for y in range(x)]
