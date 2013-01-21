'''
Created on 2012-12-22

@author: Administrator
'''
import shelve
import os
import threading
import time


class TestThreading(threading.Thread):
    def __init__(self, delay):
        threading.Thread.__init__(self)
        self.delay = delay

    def run(self):
        for i in range(3):
            print(time.ctime(time.time()))
            time.sleep(self.delay)

delay = TestThreading(3)
delay.start()
delay2 = TestThreading(3)
delay2.start()

d = shelve.open("data")
d['bar'] = 3
for key in d.keys():
    print(key, d[key])
d.close()
path = os.environ['PATH']
for key in path.split(';'):
    print(key)

delay.join()
delay2.join()