#!/usr/bin/env python
# coding=utf-8


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

#for i in range(1, 5):

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
#assert 2==3 # Causing AssertionError

l = []
l.append(2)
l.append('3')
print repr(l)
m = eval(repr(l))
m.append(5)
print 'm = ', m
print 'l = ', l
#p = raw_input("p=")
#print p

scores = [11, 2, 34, 5, 67]
print max(scores)
print sum(scores)
print map(lambda s: s * 2, scores)
print scores * 2
print float('45')
print divmod(7, 3)
print all([i > 2 for i in scores])
