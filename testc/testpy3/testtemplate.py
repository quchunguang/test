'''
Created on 2013-1-19

@author: Administrator
'''
from string import Template

t = Template('${village}folk send $$10 to $cause.')
s = t.substitute(village='Nottingham', cause='the ditch fund')
print(s)
d = dict(village='Jinan')
s = t.safe_substitute(d)
print(s)

basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
for f in sorted(set(basket)):
    print(f)
