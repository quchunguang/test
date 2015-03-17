#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
# Dependence:
# $ sudo apt-get install python-serial
import serial
import time
import sys

ser = serial.Serial('/dev/ttyUSB0', 9600)

## serial read
# while True:
#     n = ser.inWaiting();
#     if n:
#         rec = ser.read(n)
#         print rec,

print 'Waiting for Arduino (on', ser.portstr, ') ready ...'
time.sleep(2)  # !!! It seems the problem is that the Arduino resets when you
               # open the serial port (at least my Uno does), so you need to
               # wait a few seconds for it to start up.
if sys.argv[1] == 'on':
    ser.write(b'1')
elif sys.argv[1] == 'off':
    ser.write(b'0')

ser.close()

print 'LED is now', sys.argv[1]
