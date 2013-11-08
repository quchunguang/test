#!/usr/bin/env python2
#import string
#import urllib
import re
#import pickle
#import os
import zipfile

'''
[official]: http://www.pythonchallenge.com
[answers]: http://wiki.pythonchallenge.com
[some answers in chinese]: http://blog.csdn.net/billstone/article/details/4438785


print '-' * 20, '#0', '-' * 20
print 2 ** 38


print '-' * 20, '#1', '-' * 20
str = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
tb = string.maketrans("ygqrplcbjsamweknifzduv", "aistrnedlucoygmpkhbfwx")
print str.translate(tb)
password = "map"
print password.translate(tb)


print '-' * 20, '#2', '-' * 20
#sock = urllib.urlopen("http://www.pythonchallenge.com/pc/def/ocr.html")
#source = sock.read()
#sock.close()
source = open('ocr.html', 'rU').read()
data = re.findall(r'<!--(.+?)-->', source, re.S)
charList = re.findall(r'([a-zA-Z])', data[1])
print string.join(charList, sep='')


print '-' * 20, '#3', '-' * 20
with open('equality.html', 'rU') as doc:
    data = re.findall(r'<!--(.+)-->', doc.read(), re.S)
    matches = re.findall(r'[^A-Z][A-Z]{3}([a-z])[A-Z]{3}[^A-Z]', data[0], re.S)
    print ''.join(matches)


print '-' * 20, '#4', '-' * 20
number = ['74795']
base = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='
for i in range(0, 400):
    url = base + number[0]
    data = urllib.urlopen(url).read()
    number = re.findall('([0-9]+)$', data)
    print data
file.close()


print '-' * 20, '#5', '-' * 20
url = 'http://www.pythonchallenge.com/pc/def/banner.p'
data = urllib.urlopen(url)
obj = pickle.load(data)

line = ''
for row in obj:
    for col in row:
        line += col[0] * col[1]
    print line
    line = ''


print '-' * 20, '#6', '-' * 20
number = '90052'
while True:
    url = '/tmp/' + number + '.txt'
    data = open(url, 'r').read()
    print data
    number = re.findall(r'([0-9]+)', data)[0]

number = ['90052']
f = zipfile.ZipFile('/home/qcg/download/channel.zip')
print f.comment
while True:
    filename = number[0] + '.txt'
    print f.getinfo(filename).comment,
    number = re.findall(r'([0-9]+)', f.read(filename), re.S)
'''

print '-' * 20, '#7', '-' * 20
