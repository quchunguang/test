#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
import time
import datetime


def testdatetime():
    today = datetime.date.today()
    print 'combine', datetime.datetime.combine(today, datetime.time.min)
    print datetime.time.min
    print datetime.time.max
    print datetime.date.min
    print datetime.date.max
    print datetime.datetime.min
    print datetime.datetime.max
    print datetime.datetime.now() + datetime.timedelta(30, 0, 0) + \
        datetime.timedelta(seconds=3600)
    print datetime.datetime(2014, 1, 1, 2, 2, 2)


def testtime():
    # package time is a clone of time.h in c
    print time.time()
    start = time.clock()
    for i in xrange(1000000):
        pass
    print time.clock() - start
    start2 = time.time()
    time.sleep(1)  # while, time.clock() will not count the sleep time.
    print time.time() - start2
    print time.strftime("%H:%M:%S")
    print time.gmtime(3600)
    print time.strftime("%H:%M:%S", time.gmtime(3600))


def main():
    testtime()
    print '*' * 79
    testdatetime()

if __name__ == "__main__":
    main()
