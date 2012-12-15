'''
Created on 2012-12-11

@author: qcg
'''
import os

print os.name
print os.getcwd()
print os.listdir('/home/qcg/dev')
print os.path.isdir('/home/qcg/dev')
print os.path.split('/home/qcg/dev/prj/git/Makefile')