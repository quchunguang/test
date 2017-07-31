#!/usr/bin/python3
# http://stackoverflow.com/questions/5082452/python-string-formatting-vs-format
# https://pyformat.info/
from datetime import datetime, timedelta
import decimal

sub1 = "python string!"
sub2 = "an arg"
print("i am a %s" % sub1)
print("i am a {0}".format(sub1))
print("with %(kwarg)s!" % {'kwarg': sub2})
print("with {kwarg}!".format(kwarg=sub2))

name = "qcg"
print("My name is {name}".format(name=name))

tu = (12, 45, 22222, 103, 6)
print('{0} {2} {1} {2} {3} {2} {4} {2}'.format(*tu))

li = [12, 45, 78, 784, 2, 69, 1254, 4785, 984]
print(list(map('the number is {}'.format, li)))

once_upon_a_time = datetime(2010, 7, 1, 12, 0, 0)
delta = timedelta(days=13, hours=8, minutes=20)
gen = (once_upon_a_time + x * delta for x in range(3))
print('\n'.join(map('{:%Y-%m-%d %H:%M:%S}'.format, gen)))

decimal.getcontext().prec = 50
d = decimal.Decimal('3.12375239e-24')
print('%.50f' % d)
print('{0:.50f}'.format(d))


class A(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y


a = A(2, 3)
print('x is {0.x}, y is {0.y}'.format(a))

origin = "London"
destination = "Paris"
# print(f"from {origin} to {destination}") #  v3.6 only

# As regexp raises IndexError
# print('{type_names} [a-z]{2}'.format(type_names='triangle|square'))
# In this situation, you can use:
print('%(type_names)s [a-z]{2}' % {'type_names': 'triangle|square'})
