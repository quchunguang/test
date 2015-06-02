# -*- coding: utf-8 -*-
a = (1, 2, 3)
b = (4, 5, 6)


def move(l, x):
    return l[len(l) - x:] + l[:len(l) - x]

from decimal import Decimal
print list(map(int, '1 2 3 4 5'.split()))

l = [1, 2, 3, 4, 5]
print move(l, 3)
print[1, 2] * 3
m = [[0 for i in range(3)] for j in range(4)]
print m
print l[-1]

print '*'* 79
def pr(i): print i; return None
map(pr, [1,2])
[pr(i) for i in [1,2]]

def test(a):
    foo.append(10)
    if max1<0:print max1
foo=[1,2,3]
max1=10
test(1)
print foo
