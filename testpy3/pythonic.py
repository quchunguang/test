#!/usr/bin/env python3
# http://wuzhiwei.net/be_pythonic/
# http://docs.python-guide.org/en/latest/writing/style/

a = 3
b = 1
if 1 <= b <= a < 10:
    print("Chain compare")


name = 'Tim'
langs = ['AS3', 'Lua', 'C']
info = {'name': 'Tim', 'sex': 'Male', 'age': 23}
if name and langs and info:
    print('All True!')  # All True!

dic = {'name': 'Tim', 'age': 23}
dic['workage'] = dic.get('workage', 0) + 1


def reverse_str(s):
    return s[::-1]


print(reverse_str("Hello World!"))


strList = ["Python", "is", "good"]
res = ' '.join(strList)


numList = [1, 2, 3, 4, 5]
s = sum(numList)  # sum = 15
maxNum = max(numList)  # maxNum = 5
minNum = min(numList)  # minNum = 1


l = [x * x for x in range(10) if x % 3 == 0]

for x in range(1, 5):
    if x == 5:
        print('find 5')
        break
else:
    print('can not find 5!')


a = 3
b = 2 if a > 2 else 1

array = [1, 2, 3, 4, 5]
for i, e in enumerate(array, 0):
    print(i, e)


keys = ['Name', 'Sex', 'Age']
values = ['Tim', 'Male', 23]
dic = dict(zip(keys, values))
a, (b, c) = 1, (2, 3)
a, b = b, a

# PEP 3132:
a, *rest = [1, 2, 3]
# a = 1, rest = [2, 3]
a, *middle, c = [1, 2, 3, 4]
# a = 1, middle = [2, 3], c = 4

# Create an ignored variable
filename = 'foobar.txt'
basename, __, ext = filename.rpartition('.')

# Create a length-N list of the same thing
four_nones = [None] * 4

# Create a length-N list of lists
four_lists = [[] for __ in range(4)]


s = {'s', 'p', 'a', 'm'}
l = ['s', 'p', 'a', 'm']


def lookup_set(s):
    return 's' in s


def lookup_list(l):
    return 's' in l

d = {'hello': 'world'}
print(d.get('hello', 'default_value'))  # prints 'world'
print(d.get('thingy', 'default_value'))  # prints 'default_value'
# Or:
if 'hello' in d:
    print(d['hello'])
