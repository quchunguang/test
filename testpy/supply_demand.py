#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
Simulate news-vendor's incoming with supply and demand.
"""
from random import gauss
import matplotlib.pyplot as plt
from sys import argv


def main():
    """
    Price of sale (price1) reads from command line argument.
    """
    price0, price1 = 1.0, float(argv[1])
    mu, sigma = 100, 10
    max_trails = 1000
    supplies, avgs = [], []
    min_avg, max_avg, max_supply = float('inf'), float('-inf'), float('-inf')

    for supply in xrange(mu-5*sigma, mu+5*sigma):
        avg = 0
        for _ in xrange(max_trails):
            demand = int(0.5 + gauss(mu, sigma))
            incoming = min(supply, demand)*price1 - supply*price0
            avg += incoming
        supplies.append(supply)
        avgs.append(avg/max_trails)
        if max_avg < avg/max_trails:
            max_avg = avg/max_trails
            max_supply = supply
        if min_avg > avg/max_trails:
            min_avg = avg/max_trails

    fig = plt.figure()
    axx = fig.add_subplot(111)
    axx.plot(supplies, avgs)
    axx.plot([mu, mu], [min_avg, max_avg], '-.')
    axx.plot(max_supply, max_avg, 'or')
    axx.annotate('(%s, %s)' % (max_supply, max_avg), xy=(max_supply, max_avg))
    plt.show()

if __name__ == '__main__':
    main()
