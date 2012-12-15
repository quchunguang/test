#!/usr/bin/env python3
'''
Created on 2012-12-11

@author: qcg
'''
import sys, warnings
if sys.version_info.major < 3:
    warnings.warn("Need Python 3.0 for this program to run",
        RuntimeWarning)
else:
    print('Proceed as normal')

age = 20
name = 'quchunguang'
print("Hi, {}. You are {} years old.".format(name, age))

l=[1,2,3,4,5]
m=l[:]
print(l[::-1])
n=["aa","bb","cc",]
print("-*-".join(n))
print("--".join([str(i) for i in l]))
for i in l:
    print("i=",i,end=' ')

ab = {  'Swaroop'   : 'swaroop@swaroopch.com',
        'Larry'     : 'larry@wall.org',
        'Matsumoto' : 'matz@ruby-lang.org',
        'Spammer'   : 'spammer@hotmail.com'
    }
del ab['Spammer']
for name, address in ab.items():
    print('Contact {0} at {1}'.format(name, address))

bri = set(['brazil', 'russia', 'india'])
if 'india' in bri:
    print(''''india' in bri''')
bric = bri.copy()
bric.add('china')
print(bric.issuperset(bri))
bri.remove('russia')
print(bri & bric) #print(bri.intersection(bric))

with open('poem.txt') as f:
    for line in f:
        print(line, end='')
aa=7
def test():
    print(aa)

test()
