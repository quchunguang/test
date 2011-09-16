#!/usr/bin/env python

import time, thread

def print_t( name, delay ):
	while 1:
		time.sleep(delay)
		print name

thread.start_new_thread( print_t, ("First Thread", 1,) )
thread.start_new_thread( print_t, ("Second Thread", 2,) )

time.sleep(10);
print 'The end.'
