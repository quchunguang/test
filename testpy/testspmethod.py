'''
Created on 2012-12-11

@author: qcg
'''


class Mylist:

    def __init__(self):
        pass

    def __getitem__(self, key):
        return key

    def __del__(self):
        print 'object ', self, ' deleted'

    def __len__(self):
        return 5

    def __lt__(self, other):
        return True

l = Mylist()
print 'l[50] == ', l[50]
print 'len(l) == ', len(l)
m = Mylist()
print l < m
print 'The end.'
