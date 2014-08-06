'''
Created on 2012-12-11

@author: qcg
'''


def powersum(power, *args):
    '''Return the sum of each argument raised to specified power.'''
    total = 0
    for i in args:
        total += pow(i, power)
    return total


def testdict(**dict):
    for key, value in dict.items():
        print key, '=', value

powersum(2, 3, 4)
testdict(a=1, b=2)
