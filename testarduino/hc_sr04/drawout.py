#!/usr/bin/env python
import signal
import sys
import time
import serial
import numpy
import matplotlib.pyplot as plt
from drawnow import *

data = []
cnt = 0


def signal_handler(signal, frame):
    ser.close()
    print 'bye'
    sys.exit(0)


def makeFig():
    plt.plot(data, 'r*-')


signal.signal(signal.SIGINT, signal_handler)

ser = serial.Serial(port='/dev/ttyUSB0', baudrate=9600, timeout=0)
while True:
    while ser.inWaiting() == 0:
        pass
    s = ser.readline()
    try:
        v = float(s[:-2])
        data.append(v)
        drawnow(makeFig)
        plt.pause(.000001)
        cnt += 1
        if cnt > 50:
            data.pop(0)
    except:
        pass
