'''
Created on 2012-12-10

@author: qcg
'''


class Person:

    def __init__(self, name):
        self.name = name

    def sayHi(self):
        print 'Hi, ', self.name

p = Person("baobao")
p.sayHi()
