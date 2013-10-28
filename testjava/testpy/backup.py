#!/usr/bin/env python
# Filename: backup_ver1.py

import os
import time

comment = raw_input("Input comment-->")
source=['/home/qcg/www',]
target_dir='/tmp/'
today = target_dir+time.strftime('%Y%m%d')
now = time.strftime('%H%M%S')
target = today + os.sep + now + comment.replace(' ', '_') + '.tar.bz2'

if not os.path.exists(today):
	os.mkdir(today)
	print today,' created'

zip_command="tar jcfP '%s' %s" %(target,' '.join(source))

if os.system(zip_command)==0:
	print 'Successful backup to',target
else:
	print 'Backup FAILED'