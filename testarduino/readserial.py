#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
# Dependence:
# $ sudo apt-get install python-serial
from __future__ import print_function
import serial

ser = serial.Serial('/dev/ttyUSB0', 115200)

# serial read
while True:
    # n = ser.inWaiting();
    # if n:
    #     rec = ser.read(n)
    #     print(rec, end='')
    line = ser.readline()
    print(line, end='')

ser.close()
