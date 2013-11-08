#!/usr/bin/env python2
# tracebus.py by quchunguang@gmail.com

# get xml data
import urllib
from xml.etree.ElementTree import parse

daves_latitude = 41.98062
daves_longitude = -87.668452


def savexml():
    u = urllib.urlopen('http://ctabustracker.com/bustime/map/getBusesForRoute.jsp?route=22')
    data = u.read()
    f = open('rt22.xml', 'wb')
    f.write(data)
    f.close()


def tracebus():
    savexml()
    buses = parse('rt22.xml')
    for bus in buses.findall('bus'):
        lat = float(bus.findtext('lat'))
        if lat > daves_longitude:
            direction = bus.findtext('d')
            if direction.startswith('North'):
                busid = bus.findtext('id')
                print busid, lat


def distance(lat1, lat2):
    'Return distance in miles between two lats'
    return 69 * abs(lat2 - lat1)


def monitor():
    canidates = ['1887', '4175']
    u = urllib.urlopen('http://ctabustracker.com/bustime/map/getBusesForRoute.jsp?route=22')
    buses = parse(u)
    for bus in buses.findall('bus'):
        busid = bus.findtext('id')
        if busid in canidates:
            lat = float(bus.findtext('lat'))
            dis = distance(lat, daves_latitude)
            print busid, dis, 'miles'
    print '-' * 10

import time
while True:
    monitor()
    time.sleep(60)
