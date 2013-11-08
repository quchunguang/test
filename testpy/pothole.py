#!/usr/bin/env python2
import csv


potholes_by_block = {}


potholes_by_block['r'] = 5
potholes_by_block['a'] = 7
potholes_by_block['m'] = 1
potholes_by_block['b'] = 2
potholes_by_block['y'] = 8

print sorted(potholes_by_block, key=lambda k: potholes_by_block[k])
print sorted(potholes_by_block)
