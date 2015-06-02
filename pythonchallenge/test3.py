
print('Kevin'.center(50, '*'))
print('abcccabccccaba'.count('ab'))

from collections import defaultdict

strings = ('puppy', 'kitten', 'puppy', 'puppy',
           'weasel', 'puppy', 'kitten', 'puppy')
counts = defaultdict(lambda: 0)  # 使用lambda来定义简单的函数

for s in strings:
    counts[s] += 1

# print(defaultdict.__missing__.__doc__)
print(counts['hi'])
print(counts['hi'])
print(counts)
s = 'kjfhdskafhkd'
print(s.partition('ds'))
print("they're bill's friends from the UK".title())
print('dsad'.upper())
print('sdas'.zfill(10))
print(__debug__)
print('%(language)s has %(number)03d quote types.' %
      {'language': "Python", "number": 2})
data = b'abcde'
v = memoryview(data)
print(hash(v), hash(b'abcde'))
print(v.tolist())
v.release()
print(v)

import array
a = array.array('l', [1, 2, 3])
x = memoryview(a)
print(x.format)
print(x.itemsize)
print(len(x))
print(x.nbytes)
y = x.cast('B')
print(y.format)
print(y.itemsize)
print(len(y))
print(y.nbytes)

import string
print(len(string.printable))
print('{2}, {1}, {0}'.format(*'abc'))
print('Coordinates: {latitude}, {longitude}'.format(
    latitude='37.24N', longitude='-115.81W'))

import re
s = 'dsal444455dhksaj3438lkfdjs\nflk0999clksjclks'
for m in re.findall('(\d)\d(\d\d)', s):
    print(m)


class Person:
    color = 'red'

    def __init__(self, name, age):
        self.name = name
        self.age = age
        self.history = []

    def __eq__(self, other):
        return self.age == other.age

    def __hash__(self):
        return hash(self.name)

    def __str__(self):
        return '{} is {} years old.'.format(self.name, self.age)

    def __repr__(self):
        return '''('{}', {})'''.format(self.name, self.age)

    def __call__(self, name, age):
        self.name = name
        self.age = age

    def __len__(self):
        return len(self.history)

    def __iter__(self):
        return iter(self.history)

    def __getitem__(self, key):
        return history[key]

    def __setitem__(self, key, value):
        self.history[key] = value

    def append(self, value):
        self.history.append(value)

    def __add__(self, other):
        return self.history + other.history


p1 = Person('Qu', 35)
p2 = Person('Li', 28)
print(p1 != p2)
print(repr(p1))
print(hash(p1))
print(p1)
print(p1('Quchunguang', 36))
p1.append('p1: born')
p1.append('p1: kids school')
p2.append('p2: born')
p2.append('p2: kids school')
print(len(p1))
for item in p1:
    print(item)
print(p1 + p2)
p2.color = 'blue'
print(p1.color)

with open('test.conf', 'r') as f:
    for line in f:
        print(line, end='')

import pickle
with open('data.pk', 'wb') as f:
    pickle.dump(p1, f)
with open('data.pk', 'rb') as f2:
    p3 = pickle.load(f2)
    print(p3)

try:
    1 / 0
except ZeroDivisionError as err:
    print(err)
else:
    print('no error')
finally:
    print('show it any time')


class Error(Exception):

    """Base error of this module"""

    def __init__(self, msg):
        self.msg = msg

    def __str__(self):
        return self.msg

try:
    raise Error("I am wrong!!!")
except Error as err:
    print(err)

import os
print(os.getcwd())
# print(os.system('notepad'))

import shutil
print(shutil.which('notepad.exe'))

# import time
# time.sleep(1)

from itertools import product
for i in product(range(4), range(3)):
    print(i)

li = list(map(print, [1,2]))
print(li)

