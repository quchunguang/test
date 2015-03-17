#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
# Dependence:
# $ sudo apt-get install python-serial
from __future__ import print_function
import serial
import time
import sys

ser = serial.Serial('/dev/ttyUSB1', 9600)
starttime = time.time()
before, now = 1, 1
s = 0
# serial read
while True:
    # n = ser.inWaiting();
    # if n:
    #     rec = ser.read(n)
    #     print(rec, end='')
    line = ser.readline()
    #print(line, end='')
    now = int(line)
    if now == 0 and before == 1:
        s += 1
        nowtime = time.time()
        speed = 1 / (nowtime - starttime)
        print("Sum = %d, Speed = %f times/second" % (s, speed))
        starttime = nowtime
    before = now

ser.close()
