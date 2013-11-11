'''
Created on 2012-12-12

@author: qcg
'''
class NotIntegerError(ValueError):
    pass

def doublevalue(n):
    if not isinstance(n, int):
        raise NotIntegerError('Input value are not a integer.')
    return 2 * n
