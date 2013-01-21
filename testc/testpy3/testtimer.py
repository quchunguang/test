'''
Created on 2013-1-19

@author: Administrator
'''
from timeit import Timer


t1 = Timer('t=a; a=b; b=t', 'a=1; b=2').timeit()
t2 = Timer('a,b = b,a', 'a=1; b=2').timeit()
print(t1, t2)
