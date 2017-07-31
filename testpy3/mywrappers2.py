import os
import re
import gc
import json


def allinone():
    def func1():
        nonlocal a
        a = 4

    a = 3
    func1()
    print(a)


class cls1:

    def __init__(self):
        print("init")

    def func(self, a):
        print("cls1.func a=%d" % a)


class cls2(cls1):

    def func(self, a):
        print("cls2.func a=%d" % a)

cls = cls1()
cls.func(1)
d = dict()
d['primary'] = cls
del(cls)
gc.collect()
print(d['primary'])
print(d['primary'].func(2))

with open('data.txt', 'a') as f:
    f.write('\nALL 1\n')
    f.write('\nALL 2\n')
    f.write('\nALL 3\n')

a, b = 1, 2
a, b = b, a
print(a, b)
table = {'Sjoerd': 4127, 'Jack': 4098, 'Dcab': 7678}
for name, phone in table.items():
    print('{0:10} ==> {1:10d}'.format(name, phone))

print(json.dumps([1, ('simple', 'list')]))


def f(ham: 42, eggs: int='spam') -> "Nothing to see here":
    print("Annotations:", f.__annotations__)
    print("Arguments:", ham, eggs)

f('wonderful')

print(sorted("This is a test string from Andrew".split(), key=str.lower))


def func2(lst):
    square = lambda x: x ** 2
    odd = lambda x: x % 2 == 0
    return map(square, filter(odd, lst))

print(list(func2([1, 2, 3, 4])))


def d(f):
    def calc(x):
        dx = 0.000001  # 表示无穷小的Δx
        return (f(x + dx) - f(x)) / dx  # 计算斜率。注意，此处引用了外层作用域的变量 f
    return calc  # 此处用函数作为返回值（也就是函数 f 的导数）
f = lambda x: x ** 2 + x + 1  # 先把二次函数用代码表达出来
f1 = d(f)  # 这个f1 就是 f 的一阶导数啦。注意，导数依然是个函数
print(f1(3))
