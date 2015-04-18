#!/usr/bin/env python2.7
import RPi.GPIO as GPIO
import time

# Use physical pin numbers
GPIO.setmode(GPIO.BOARD)

# Set up header pin 11 (GPIO17) as an output
print "Setup Pin 11"
GPIO.setup(11, GPIO.OUT)

var = 1
print "Start loop"
while var == 1:
    print "Set Output False"
    GPIO.output(11, False)
    time.sleep(1)
    print "Set Output True"
    GPIO.output(11, True)
    time.sleep(1)
