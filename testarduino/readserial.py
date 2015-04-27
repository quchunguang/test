#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
# Dependence:
# $ sudo apt-get install python-serial
from __future__ import print_function
import serial
import time

ser = serial.Serial('/dev/ttyUSB0', 115200)
ser.setDTR( level=False ) # set the reset signal
time.sleep(2)             # wait two seconds, an Arduino needs some time to really reset
                          # don't do anything here which might overwrite the Arduino's program
ser.setDTR( level=True )  # remove the reset signal, the Arduino will restart

N=1
# serial read
while N<10:
    while ser.inWaiting() == 0:
        pass
    line = ser.readline().decode()
    value = float(line)
    print(value, end='')
    N+=1

ser.close()
