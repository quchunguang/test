'''
Created on 2012-12-12

@author: qcg
'''
import re

s = '100 BROAD ROAD APT. 3'
t = re.sub(r'\bROAD\b', 'RD.', s)
print(t)
