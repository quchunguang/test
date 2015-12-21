#!/usr/bin/env python2
# To Run: sudo python led.py
import RPi.GPIO as GPIO
import time

# Use physical pin numbers
GPIO.setmode(GPIO.BOARD)

# Set up header pin 11 (GPIO17) as an output
GPIO.setup(11, GPIO.OUT)

print "Start loop"
while True:
    GPIO.output(11, False)
    print "Set Output False"
    time.sleep(1)

    GPIO.output(11, True)
    print "Set Output True"
    time.sleep(1)
