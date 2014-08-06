#!/usr/bin/env python2
#import string
#import urllib
#import re
#import pickle
#import os
#import zipfile
#import Image
#import bz2
#import matplotlib.pyplot as plt
#import xmlrpclib


# [official]: http://www.pythonchallenge.com
# [answers]: http://wiki.pythonchallenge.com
# [answers]: http://garethrees.org/2007/05/07/python-challenge/
# [some answers in chinese]: http://blog.csdn.net/billstone/article/details/4438785


# print '-' * 20, '#0', '-' * 20
# print 2 ** 38
#
#
# print '-' * 20, '#1', '-' * 20
# str = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
# tb = string.maketrans("ygqrplcbjsamweknifzduv", "aistrnedlucoygmpkhbfwx")
# print str.translate(tb)
# password = "map"
# print password.translate(tb)
#
#
# print '-' * 20, '#2', '-' * 20
# sock = urllib.urlopen("http://www.pythonchallenge.com/pc/def/ocr.html")
# source = sock.read()
# sock.close()
# source = open('ocr.html', 'rU').read()
# data = re.findall(r'<!--(.+?)-->', source, re.S)
# charList = re.findall(r'([a-zA-Z])', data[1])
# print string.join(charList, sep='')
#
#
# print '-' * 20, '#3', '-' * 20
# with open('equality.html', 'rU') as doc:
#     data = re.findall(r'<!--(.+)-->', doc.read(), re.S)
#     matches = re.findall(r'[^A-Z][A-Z]{3}([a-z])[A-Z]{3}[^A-Z]', data[0], re.S)
#     print ''.join(matches)
#
#
# print '-' * 20, '#4', '-' * 20
# number = ['74795']
# base = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='
# for i in range(0, 400):
#     url = base + number[0]
#     data = urllib.urlopen(url).read()
#     number = re.findall('([0-9]+)$', data)
#     print data
# file.close()
#
#
# print '-' * 20, '#5', '-' * 20
# url = 'http://www.pythonchallenge.com/pc/def/banner.p'
# data = urllib.urlopen(url)
# obj = pickle.load(data)
#
# line = ''
# for row in obj:
#     for col in row:
#         line += col[0] * col[1]
#     print line
#     line = ''
#
#
# print '-' * 20, '#6', '-' * 20
# number = '90052'
# while True:
#     url = '/tmp/' + number + '.txt'
#     data = open(url, 'r').read()
#     print data
#     number = re.findall(r'([0-9]+)', data)[0]
# OR WHATEVER, USING SHELL INSTEAD,
# for f in *.txt;do cat $f;echo;done | sed '/Next nothing is [0-9]*/d'
#
# number = ['90052']
# f = zipfile.ZipFile('/home/qcg/download/channel.zip')
# print f.comment
# while True:
#     filename = number[0] + '.txt'
#     print f.getinfo(filename).comment,
#     number = re.findall(r'([0-9]+)', f.read(filename), re.S)
#
# print '-' * 20, '#7', '-' * 20
# pic = open('oxygen.png', 'wb')
# pic.write(urllib.urlopen('http://www.pythonchallenge.com/pc/def/oxygen.png').read())
# pic.close()
#
# im = Image.open('oxygen.png')
# print im.format, im.size, im.mode
# x_max, y_max = im.size
# y = y_max / 2
# message = []
# for x in range(1, x_max, 7):
#     message.append(im.getpixel((x, y))[0])
# print ''.join(map(chr, message))
#
# message2 = [105, 110, 116, 101, 103, 114, 105, 116, 121]
# print ''.join(map(chr, message2))
#
#
# print '-' * 20, '#8', '-' * 20
# un = 'BZh91AY&SYA\xaf\x82\r\x00\x00\x01\x01\x80\x02\xc0\x02\x00 \x00!\x9ah3M\x07<]\xc9\x14\xe1BA\x06\xbe\x084'
# pw = 'BZh91AY&SY\x94$|\x0e\x00\x00\x00\x81\x00\x03$ \x00!\x9ah3M\x13<]\xc9\x14\xe1BBP\x91\xf08'
# print bz2.decompress(un)
# print bz2.decompress(pw)
#
#
# print '-' * 20, '#9', '-' * 20
# first = [146, 399, 163, 403, 170, 393, 169, 391, 166, 386, 170, 381, 170, 371, 170, 355, 169, 346, 167, 335, 170, 329, 170, 320, 170,
#          310, 171, 301, 173, 290, 178, 289, 182, 287, 188, 286, 190, 286, 192, 291, 194, 296, 195, 305, 194, 307, 191, 312, 190, 316,
#          190, 321, 192, 331, 193, 338, 196, 341, 197, 346, 199, 352, 198, 360, 197, 366, 197, 373, 196, 380, 197, 383, 196, 387, 192,
#          389, 191, 392, 190, 396, 189, 400, 194, 401, 201, 402, 208, 403, 213, 402, 216, 401, 219, 397, 219, 393, 216, 390, 215, 385,
#          215, 379, 213, 373, 213, 365, 212, 360, 210, 353, 210, 347, 212, 338, 213, 329, 214, 319, 215, 311, 215, 306, 216, 296, 218,
#          290, 221, 283, 225, 282, 233, 284, 238, 287, 243, 290, 250, 291, 255, 294, 261, 293, 265, 291, 271, 291, 273, 289, 278, 287,
#          279, 285, 281, 280, 284, 278, 284, 276, 287, 277, 289, 283, 291, 286, 294, 291, 296, 295, 299, 300, 301, 304, 304, 320, 305,
#          327, 306, 332, 307, 341, 306, 349, 303, 354, 301, 364, 301, 371, 297, 375, 292, 384, 291, 386, 302, 393, 324, 391, 333, 387,
#          328, 375, 329, 367, 329, 353, 330, 341, 331, 328, 336, 319, 338, 310, 341, 304, 341, 285, 341, 278, 343, 269, 344, 262, 346,
#          259, 346, 251, 349, 259, 349, 264, 349, 273, 349, 280, 349, 288, 349, 295, 349, 298, 354, 293, 356, 286, 354, 279, 352, 268,
#          352, 257, 351, 249, 350, 234, 351, 211, 352, 197, 354, 185, 353, 171, 351, 154, 348, 147, 342, 137, 339, 132, 330, 122, 327,
#          120, 314, 116, 304, 117, 293, 118, 284, 118, 281, 122, 275, 128, 265, 129, 257, 131, 244, 133, 239, 134, 228, 136, 221, 137,
#          214, 138, 209, 135, 201, 132, 192, 130, 184, 131, 175, 129, 170, 131, 159, 134, 157, 134, 160, 130, 170, 125, 176, 114, 176,
#          102, 173, 103, 172, 108, 171, 111, 163, 115, 156, 116, 149, 117, 142, 116, 136, 115, 129, 115, 124, 115, 120, 115, 115, 117,
#          113, 120, 109, 122, 102, 122, 100, 121, 95, 121, 89, 115, 87, 110, 82, 109, 84, 118, 89, 123, 93, 129, 100, 130, 108, 132, 110,
#          133, 110, 136, 107, 138, 105, 140, 95, 138, 86, 141, 79, 149, 77, 155, 81, 162, 90, 165, 97, 167, 99, 171, 109, 171, 107, 161,
#          111, 156, 113, 170, 115, 185, 118, 208, 117, 223, 121, 239, 128, 251, 133, 259, 136, 266, 139, 276, 143, 290, 148, 310, 151,
#          332, 155, 348, 156, 353, 153, 366, 149, 379, 147, 394, 146, 399]
# second = [156, 141, 165, 135, 169, 131, 176, 130, 187, 134, 191, 140, 191, 146, 186, 150, 179, 155, 175, 157, 168, 157, 163, 157, 159,
#           157, 158, 164, 159, 175, 159, 181, 157, 191, 154, 197, 153, 205, 153, 210, 152, 212, 147, 215, 146, 218, 143, 220, 132, 220,
#           125, 217, 119, 209, 116, 196, 115, 185, 114, 172, 114, 167, 112, 161, 109, 165, 107, 170, 99, 171, 97, 167, 89, 164, 81, 162,
#           77, 155, 81, 148, 87, 140, 96, 138, 105, 141, 110, 136, 111, 126, 113, 129, 118, 117, 128, 114, 137, 115, 146, 114, 155, 115,
#           158, 121, 157, 128, 156, 134, 157, 136, 156, 136]
# plt.figure(1)
# plt.plot(first[::2], first[1::2])
# plt.plot(second[::2], second[1::2])
# plt.show()
#
# print '-' * 20, '#10', '-' * 20
# def gennext(s):
#     g = []
#     start = 0
#     for i in range(1, len(s)):
#         if s[i] != s[i - 1]:
#             g.append(s[start:i])
#             start = i
#     g.append(s[start:])
#     res = ''
#     for s in g:
#         res += str(len(s)) + s[0]
#     return res
#
# sample_a = [1, 11, 21, 1211, 111221]
# a = []
# a.append('1')
# print 'a[0] = ' + a[0]
# for i in range(1, 31):
#     a.append(gennext(a[-1]))
#     print 'a[' + str(i) + '] = ' + a[i]
# print len(a[30])
#
#
# print '-' * 20, '#11', '-' * 20
# im = Image.open('/home/qcg/download/cave.jpg')
# print im.size
# for row in range(6):
#     for col in range(6):
#         print im.getpixel((row, col)),
#     print
# odd = Image.new(im.mode, im.size)
# for row in range(0, im.size[0]):
#     for col in range(0, im.size[1]):
#         if (row + col) % 2 == 0:
#             odd.putpixel((row, col), im.getpixel((row, col)))
# odd.show()
#
#
# im = Image.open('/home/qcg/download/cave.jpg') # method 2
# data = list(im.getdata())
# doit = False
# for i in range(0, len(data)):
#     if (i + 1) % im.size[0] == 0:
#         continue
#     if doit:
#         data[i] = ((data[i - 1][0] + data[i + 1][0]) / 2, (data[i - 1][1] + data[i + 1][1]) / 2, (data[i - 1][2] + data[i + 1][2]) / 2)
#     doit = not doit
# im.putdata(data)
# im.show()
#
#
# print '-' * 20, '#12', '-' * 20
#
#
# def get_challenge(file):
#     if not os.path.isfile(file):
#         urllib.urlretrieve('http://www.pythonchallenge.com/pc/return/' + file, file)
#     return open(file, 'rb')
#
#
# f = get_challenge('evil2.gfx')
# content = f.read()
# f.close()
# for i in xrange(5):
#     f = open('%d.bin' % i, 'wb')
#     f.write(content[i::5])
#     f.close()
#
# print '-' * 20, '#13', '-' * 20
# proxy = xmlrpclib.ServerProxy('http://www.pythonchallenge.com/pc/phonebook.php')
# print proxy.system.listMethods()
# print proxy.system.methodHelp('phone')
# print proxy.phone('Bert')

# print '-' * 20, '#14', '-' * 20
# 100*100=(100+99+99+98)+(...
# l = [(i,i-1,i-1,i-2) for i in xrange(100,1,-2)]
#
# im = Image.open('/home/qcg/download/wire.png')
# imdata = im.getdata()
# im2 = Image.new(im.mode, (100,100))
# im2data = im2.load()
# x, y = -1, 0
# index = 0
# for r,d,l,u in l:
#     for i in range(r):
#         x += 1
#         im2data[(x, y)] = imdata[index]
#         index += 1
#     for i in range(d):
#         y += 1
#         im2data[(x, y)] = imdata[index]
#         index += 1
#     for i in range(l):
#         x -= 1
#         im2data[(x, y)] = imdata[index]
#         index += 1
#     for i in range(u):
#         y -= 1
#         im2data[(x, y)] = imdata[index]
#         index += 1
# print imdata[1]
# print im2data[(0,0)]
# im2.save('res.png')
#
# print '-' * 20, '#15', '-' * 20
# from calendar import isleap
# from datetime import date
# TUESDAY = 1
# for year in range(1006, 2000, 10):
#     t = date(year, 1, 27)
#     if isleap(year) and t.weekday() == TUESDAY:
#         print t.isoformat()
#
# print '-' * 20, '#16', '-' * 20
# import Image
# im = Image.open('/home/qcg/download/mozart.gif')
# imdata = list(im.getdata())
# w, h = im.size

# print imdata[0:2000]
# print max(imdata)
# d = dict()
# for item in imdata:
#     if item in d:
#         d[item] += 1
#     else:
#         d[item] = 1
# for i in d.keys():
#     print i, "=>", d[i]
# print sorted(d.values())

# prev = 0
# count = 1
# index = 0
# res = []
# for item in imdata:
#     index += 1
#     if item == prev:
#         count += 1
#     else:
#         if count == 5 and prev == 195:
#             res.append(index - 5)
#         count = 1
#         prev = item
# print res

# collect = []
# for y in xrange(h):
#     for x in xrange(w):
#         if im.getpixel((x, y)) == 195 and im.getpixel((x + 4, y)) == 195:
#             collect.append((x,y))
# print collect[0:20]
#
# patten = [195, 195, 195, 195, 195, ]
# bars = []
# for i in range(len(imdata)):
#     if imdata[i:i + len(patten)] == patten:
#         bars.append((i%w, i/w))
#
# shift = Image.new(im.mode, (w * 2, h), 0)
# shift.palette = im.palette  # share colour table
# for j in range(h):
#     for i in range(w):
#         shift.putpixel((i + w - bars[j][0], j), im.getpixel((i,j)))
# shift.save('shift.png')

print '-' * 20, '#17', '-' * 20
