#!/usr/bin/python

import time
import os
import datetime
import getpass
import commands

s = "a string"
print len(s)
x = 0
while x <= 10:
    print x
    x = x + 1
#       time.sleep(.2)
os.system("cat time.py")
for x in range(1, 10):
    print "x is now", x

today = datetime.date.today()
oneday = datetime.timedelta(days=1)
print today
print today + oneday
print today.strftime("%A %B %d %M %S %p %y")
xmas = datetime.date(2011, 12, 25)
diff = xmas - today
print diff
password = getpass.getpass()
print "password is ", password

ret = commands.getoutput("ls")
print ret
