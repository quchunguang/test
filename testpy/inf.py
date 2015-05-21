#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
from math import sin, pi


# A implacement of standard module 'timeit'
def timeit(fn):
    def wapper(*args):
        from time import clock, sleep
        start = clock()
        res = fn(*args)
        finish = clock()
        print 'Run in', (finish - start), 'seconds'
        return res
    return wapper


def fn(x):
    return sin(x)


def inf(fn, low, up, n):
    dx = (up - low) / n
    s, x = 0.0, low + 0.5 * dx
    for i in xrange(n):
        s, x = s + dx * fn(x), x + dx
    return s


@timeit
def main():
    print 'Inf(sin(x), 0, 1/4*pi):', inf(fn, 0.0, pi * 0.25, 1000)

if __name__ == '__main__':
    main()
