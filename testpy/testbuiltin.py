#-*- encoding: utf-8 -*-
import sys


def fun(x, y):
    return x + y

def print_hello():
    pass

def nature(x):
    return x > 0


class NoUse:
    pass

l = range(5)
print any(l)
print bin(16)
print bool([])
print bytearray(range(65, 70))
print callable(print_hello)
print chr(65)
print cmp(1, 2)
print complex(1, 2)
print dir()
print divmod(50, 7)
x = 1
print eval('x+1')

print '*' * 50
execfile('test.py')
f = open('poem.txt')
print isinstance(f, file)
l = [-3, -2, -1, 0, 1, 2, 3]

print '*' * 50
print filter(nature, l)
print frozenset(l)
print globals()
print hash(nature)
print hex(255)
print id(nature)
# print input('input l')
# print eval(raw_input('input l'))
print int('77', base=8)
print issubclass(NoUse, NoUse)
print len('string')
print list((1, 2, 3, 4))

print '*' * 50
print locals()

print '*' * 50
print long('23124234432')
print map(lambda x: x * 2, l)
print max(l)
print min(l)
print oct(10)
print ord(u'命')
print pow(2, 3, 7)

l = range(1, 101)
print reduce(fun, l)
reload(sys)
x = 1
y = 2
print repr(3.0 / 7)
print str(3.0 / 7)

l = [1, 2, 3, 4, 1, 2]
print list(reversed(l))
print round(-0.5)
print round(-0.4)
print round(0.4)
print round(0.5)
print list(set(l))
print slice(1, 10, 2)

s = ['dda', 'aaa', 'ddd']
print sorted(s, cmp=lambda x, y: cmp(x.lower(), y.lower()))
print sorted(s, key=str.lower, reverse=True)

print sum(l)
print tuple(s)
print type(s)
u = unichr(0x5555)
print '命'

for i in xrange(10):
    print i,
x = [1, 2, 3]
y = [4, 5, 6]
print zip(x, y)
