#-*- encoding: utf-8 -*-
# 用四个空格表示缩进，如果没有缩进，是语法错误


def spam():
    eggs = 12
    return eggs

print spam()
count_to = 2137483647 + 2137483648  # 没有发生溢出，运行正常
print 10 // 3.0  # 3
print 10 / 3.0  # 3.33333
print 10 / 3  # 3

# 打印时间
from datetime import datetime
now = datetime.now()
print '%s/%s/%s %s:%s:%s' % \
    (now.month, now.day, now.year, now.hour, now.minute, now.second)
print 'Alpha' + "Bravo" + str(3)
c = "cats"[1]

parrot = "Norwegian Blue"
print len(parrot)
parrot = "Norwegian Blue"
print parrot.lower()
print parrot.upper()
pi = 3.14
print str(pi)

string_1 = "Camelot"
string_2 = "place"
print "Let's not go to %s. 'Tis a silly %s." % (string_1, string_2)

hour = 3
ones = hour % 10
tens = hour // 10
print tens, ones, ":00"  # 输出 0 3 :00
print str(tens), str(ones), ":00"  # 输出 0 3 :00
print str(tens) + str(ones) + ":00"  # 输出 03:00

import math  # 这种是generic import
print math.sqrt(25)
my_list = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
print my_list[::-1]

list_a = [3, 9, 17, 15, 19]
list_b = [2, 4, 8, 10, 30, 40, 50, 60, 70, 80, 90]
for a, b in zip(list_a, list_b):
    if a>=b:
        print a
    else:
        print b

shift_right = 0b1100
shift_left = 0b1

# Your code here!
shift_right=shift_right >>2
shift_left=shift_left<<2
print bin(shift_right)
print bin(shift_left)

print ~1
print ~2
print ~3
print ~42
print ~123
