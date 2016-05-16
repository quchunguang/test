"""
Created on 2012-12-11

@author: qcg
"""


def get_error():
    return (2, 'error message')

errno, errmsg = get_error()
print(errno, errmsg)
a, *b = [1, 2, 3, 4, 5]
print(b)
a = 1
b = 2
a, b = b, a
print(a, b)
if True:
    print('HI')

points = [{'x': 2, 'y': 3}, {'x': 4, 'y': 1}]
points.sort(key=lambda i: i['y'])
print(points)

mylist = ['item']
assert len(mylist) >= 1
mylist.pop()
# assert len(mylist) >= 1
print(len("光da"))
print(b'abcd\x65')
a_byte = "各国abc".encode(encoding='gbk')
print(len(a_byte))
print(a_byte.decode(encoding='gbk'))
val = 'aa'
print(isinstance(val, int))
