#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
import operator
from pipe import Pipe, add, where, take_while, select, as_list
import inspect


def print_max(a, b):
	if a > b:
		print a
	else:
		print b

def test_global():
	global y
	y = y + 1

def say(message, times=1):
	print message * times

def func(a, b=3, c=5):
	print 'test key args' 'a=', a, 'b=', b, 'c=', c

def printDoc():
	'''Print documents

	details...'''

def test_items():
	print '''Th\is's
	balabal'''
	print 'aa\
	ss'
	print r'aa\nbb'
	print 'aa\nbb'
	print u"中文" 'haha'

	i = 5
	i = i // 2
	print 'i =', i
	print ~5
	x = True
	print not x

	number = 23
	if number == 22:
		print "!!!"
	elif number == 23:
		print "test 'if' OK"
	else:
		print "???"

	times = 3
	while times:
		print 'haha'
		times = times - 1
	else:
		print "test 'while' ok"

	# for i in range(1, 5):

	for i in [1, 2, 3, 4, 5, 6]:
		print i
		if i == 3:
			break
	else:
		print "test 'for' ok"
	print_max(9, 6)
	y = 5
	test_global()
	print 'test global', y
	say('Hello')
	say('Hi', 3)
	func(9, 8)
	func(9, c=7)
	func(b=8, c=7, a=9)
	print "test return 'None'", func(4)
	printDoc()
	print printDoc.__doc__
	if __name__ == '__main__':
		print "run by itself 哈哈"
	listone = [1, 2, 3]
	listtwo = [i * 2 for i in listone if i > 1]
	print listtwo

	exec 'print "HI"'
	print eval('2*3')
	# assert 2==3 # Causing AssertionError

	l = []
	l.append(2)
	l.append('3')
	print repr(l)
	m = eval(repr(l))
	m.append(5)
	print 'm = ', m
	print 'l = ', l
	# p = raw_input("p=")
	# print p

	scores = [11, 2, 34, 5, 67]
	print max(scores)
	print sum(scores)
	print map(lambda s: s * 2, scores)
	print scores * 2
	print float('45')
	print divmod(7, 3)
	print all([i > 2 for i in scores])


def outter():
	n = 1
	def inner():
		print n
	inner()
	n = 'x'
	inner()


def addto(n):
	return lambda x:x + n

def fibonacci():
		a = b = 1
		yield a
		yield b
		while True:
			a, b = b, a + b
			yield b

def test_functional():
	a = [1, 4, 2, 3]
	a.sort(key=lambda x:-x)
	print sum(a)
	print filter(lambda x:x > 2, a)
	print reduce(lambda x, y:x + y, a, 0)
	# print map(operator.mul, [1, 2, 3, 4], [2, 3, 4, 5])
	# print map(lambda x:x * 2, [2, 3, 4, 5])
	print map(lambda x:x + 1, a)
	print map(addto(2), a)
	m = (1, 2, 3, 4)
	n = (2, 3, 4, 5)
	print map(lambda x, y:x + y, m, n)
	print zip((1, 2, 3), (4, 5, 6))
	it = iter(a)
	print it.next(), next(it)
	for i, value in enumerate(a):
		print i, "=>", value
	print [x * x for x in a if x < 4]
	for num in fibonacci():
		if num > 100:break
		print num,
	print
	outter()

@Pipe
def take_while_idx(iterable, predicate):
	for idx, x in enumerate(iterable):
		if predicate(idx): yield x
		else: return

def test_pipe():
	print range(5) | add
	print range(5) | where(lambda x:x % 2 == 0) | add
	print fibonacci() | where(lambda x:x % 2 == 0) \
		| take_while(lambda x:x < 10000) | add
	print fibonacci() | select(lambda x:x ** 2) | take_while(lambda x:x < 100) | as_list
	print fibonacci() | take_while_idx(lambda x : x < 10) | as_list

class Cat():
	def __init__(self, name='ketty'):
		self.name = name

	def sayHi(self):
		print self.name, ", Hi!"


def testinspect():
	test_pipe()
	cat = Cat()
	print cat.sayHi
	print Cat.sayHi
	print cat.name
	cat.sayHi()
	print dir(cat)
	if hasattr(cat, 'name'):
		setattr(cat, 'name', 'guang')
	print getattr(cat, 'name')
	print operator.__dict__.items()[0]
	print Cat.__dict__
	print cat.__dict__
	print cat.__class__ == Cat
	print inspect.getmembers(cat)

def main():
	testinspect()

if __name__ == "__main__":
	main()
