
'''
Created on 2012-12-9

@author: qcg
'''
import sys
#from sys import argv
import helloworld

for arg in sys.argv:
    print arg

print "The PYTHONPATH is:"
for path in sys.path:
    print path

print len(sys.argv)

helloworld.print_hello()

print dir()
