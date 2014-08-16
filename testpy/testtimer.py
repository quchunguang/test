#!/usr/bin/env python

import threading
import time


def delayrun():
    print 'running'
    t = threading.Timer(1, delayrun)
    t.start()

t = threading.Timer(1, delayrun)
t.start()
while True:
    time.sleep(0.33)
    print 'main running'
