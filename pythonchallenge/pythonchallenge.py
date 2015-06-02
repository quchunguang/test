# level 0
# print()
# print(2 ** 38)

# level 1
# secret = '''
# g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj. '''
# import string
# sl=string.ascii_lowercase
# table = str.maketrans(sl, sl[2:] + sl[:2])
# clear = secret.translate(table)
# print(clear)
# secret2 = 'map'
# clear2 = secret2.translate(table)
# print(clear2)

# level 2
# from urllib.request import urlopen
# import re
# url = 'http://www.pythonchallenge.com/pc/def/ocr.html'
# data = urlopen(url).read().decode('utf-8')
# m = re.findall(r'<!--(.*)-->', data, re.S)
# print(''.join(filter(str.isalpha, m[0])))

# level 3
# from urllib.request import urlopen
# import re
# url = 'http://www.pythonchallenge.com/pc/def/equality.html'
# data = urlopen(url).read().decode('utf-8')
# pattern = re.compile(r'[a-z][A-Z]{3}([a-z])[A-Z]{3}[a-z]')
# comment = pattern.findall(data)
# print(''.join(comment))

# level 4
# from urllib.request import urlopen
# import re
# number = '12345'
# for i in range(400):
#     url = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=' + number
#     print(url)
#     conn = urlopen(url)
#     data = conn.read().decode()
#     print(data)
#     pattern = re.compile(r'and the next nothing is (.*)')
#     number = pattern.findall(data)[0]
#     conn.close()

# level 5
# import pickle
# with open('banner.p', 'rb') as f:
#     data = pickle.load(f)
#     for line in data:
#         print('\n', end='')
#         for group in line:
#             print(group[0] * group[1], end='')

# level 6
# from zipfile import ZipFile
# with ZipFile('channel.zip', 'r') as myzip:
#     number = '90052'
#     while True:
#         filename = number + '.txt'
#         data = myzip.read(filename).decode()
#         print(myzip.getinfo(filename).comment.decode(), end='')
#         number = ''.join(filter(str.isnumeric, data))

# lever 7 - Work on python2.7 32 bit + PIL 1.1.7
# from PIL import Image
# im = Image.open('D://pythonchallenge//oxygen.png')
# print im.size
# data = [im.getpixel((x, 50))[0] for x in range(0, 629, 7)]
# print ''.join(map(chr, data))
# answer = [105, 110, 116, 101, 103, 114, 105, 116, 121]
# print ''.join(map(chr, answer))

# lever 8
# import bz2
# un = b'BZh91AY&SYA\xaf\x82\r\x00\x00\x01\x01\x80\x02\xc0\x02\x00 \x00!\x9ah3M\x07<]\xc9\x14\xe1BA\x06\xbe\x084'
# pw = b'BZh91AY&SY\x94$|\x0e\x00\x00\x00\x81\x00\x03$ \x00!\x9ah3M\x13<]\xc9\x14\xe1BBP\x91\xf08'
# print(bz2.decompress(un).decode())
# print(bz2.decompress(pw).decode())

# level 9 - Work on python2.7 32 bit + PIL 1.1.7
# import Image, ImageDraw

# first = [
# 146,399,163,403,170,393,169,391,166,386,170,381,170,371,170,355,169,346,167,335,170,329,170,320,170,
# 310,171,301,173,290,178,289,182,287,188,286,190,286,192,291,194,296,195,305,194,307,191,312,190,316,
# 190,321,192,331,193,338,196,341,197,346,199,352,198,360,197,366,197,373,196,380,197,383,196,387,192,
# 389,191,392,190,396,189,400,194,401,201,402,208,403,213,402,216,401,219,397,219,393,216,390,215,385,
# 215,379,213,373,213,365,212,360,210,353,210,347,212,338,213,329,214,319,215,311,215,306,216,296,218,
# 290,221,283,225,282,233,284,238,287,243,290,250,291,255,294,261,293,265,291,271,291,273,289,278,287,
# 279,285,281,280,284,278,284,276,287,277,289,283,291,286,294,291,296,295,299,300,301,304,304,320,305,
# 327,306,332,307,341,306,349,303,354,301,364,301,371,297,375,292,384,291,386,302,393,324,391,333,387,
# 328,375,329,367,329,353,330,341,331,328,336,319,338,310,341,304,341,285,341,278,343,269,344,262,346,
# 259,346,251,349,259,349,264,349,273,349,280,349,288,349,295,349,298,354,293,356,286,354,279,352,268,
# 352,257,351,249,350,234,351,211,352,197,354,185,353,171,351,154,348,147,342,137,339,132,330,122,327,
# 120,314,116,304,117,293,118,284,118,281,122,275,128,265,129,257,131,244,133,239,134,228,136,221,137,
# 214,138,209,135,201,132,192,130,184,131,175,129,170,131,159,134,157,134,160,130,170,125,176,114,176,
# 102,173,103,172,108,171,111,163,115,156,116,149,117,142,116,136,115,129,115,124,115,120,115,115,117,
# 113,120,109,122,102,122,100,121,95,121,89,115,87,110,82,109,84,118,89,123,93,129,100,130,108,132,110,
# 133,110,136,107,138,105,140,95,138,86,141,79,149,77,155,81,162,90,165,97,167,99,171,109,171,107,161,
# 111,156,113,170,115,185,118,208,117,223,121,239,128,251,133,259,136,266,139,276,143,290,148,310,151,
# 332,155,348,156,353,153,366,149,379,147,394,146,399]

# second = [
# 156,141,165,135,169,131,176,130,187,134,191,140,191,146,186,150,179,155,175,157,168,157,163,157,159,
# 157,158,164,159,175,159,181,157,191,154,197,153,205,153,210,152,212,147,215,146,218,143,220,132,220,
# 125,217,119,209,116,196,115,185,114,172,114,167,112,161,109,165,107,170,99,171,97,167,89,164,81,162,
# 77,155,81,148,87,140,96,138,105,141,110,136,111,126,113,129,118,117,128,114,137,115,146,114,155,115,
# 158,121,157,128,156,134,157,136,156,136]

# img = Image.new('RGB', (640,480))
# draw = ImageDraw.Draw(img)
# draw.line(first)
# draw.line(second)
# img.show()

# level 10
# a = ['1']
# for i in range(0, 31):
# a[i] -> a[i+1]
#     count = [1]
#     symbol = [a[i][0]]
#     for c in a[i][1:]:
#         if c == symbol[-1]:
#             count[-1] = count[-1] + 1
#         else:
#             symbol.append(c)
#             count.append(1)
#     item = []
#     for j in range(len(symbol)):
#         item.append(str(count[j]))
#         item.append(symbol[j])
#     a.append(item)
# print(len(''.join(a[30])))

# level 11 - Work on python2.7 32 bit + PIL 1.1.7
# from PIL import Image
# im = Image.open('D://pythonchallenge//cave.jpg')
# im1 = Image.new("RGB", (640,480))
# im2 = Image.new("RGB", (640,480))
# X, Y = im.size
# for x in range(X):
#     for y in range(Y):
#         if (x+y) % 2 == 0:
#             im1.putpixel((x,y), im.getpixel((x,y)))
#         else:
#             im2.putpixel((x,y), im.getpixel((x,y)))
# im1.show()
# im2.show()

# level 12
# import Image
# from cStringIO import StringIO
# s = open("evil2.gfx", "rb").read()
# for i in range(5):
# piece = s[i::5]  # every fifth byte, starting at i
#     im = Image.open(StringIO(piece))
#     f = open("%d.%s" % (i, im.format.lower()), "wb")
#     f.write(piece)
#     f.close()

# level 13
# import xmlrpclib
# server = xmlrpclib.Server('http://www.pythonchallenge.com/pc/phonebook.php')
# print server.system.listMethods()
# print server.phone('Bert')

# level 14
# from PIL import Image
# im = Image.open('wire.png')
# im1 = Image.new("RGB", (100, 100))
# data = list(im.getdata())
# flagbox = [[0 for x in range(100)] for y in range(100)]
# x = 0
# y = 0
# d = 'r'
# for i in range(10000):
#     im1.putpixel((x, y), data[i])
#     flagbox[x][y] = 1
#     if d == 'r':
#         if x + 1 == 100 or flagbox[x + 1][y] == 1:
#             d = 'b'
#             y = y + 1
#         else:
#             x = x + 1
#     elif d == 'b':
#         if y + 1 == 100 or flagbox[x][y + 1] == 1:
#             d = 'l'
#             x = x - 1
#         else:
#             y = y + 1
#     elif d == 'l':
#         if x - 1 < 0 or flagbox[x - 1][y] == 1:
#             d = 'u'
#             y = y - 1
#         else:
#             x = x - 1
#     else:
#         if y - 1 < 0 or flagbox[x][y - 1] == 1:
#             d = 'r'
#             x = x + 1
#         else:
#             y = y - 1
# im1.show()


# level 15
# import datetime
# for i in range(2014, 1000, -1):
#     d = datetime.datetime(i, 1, 26)
#     weekday = d.weekday()
#     if weekday == 0 and i % 10 == 6:
#         print '{}.1.26'.format(i)

# level 16
# from PIL import Image
# im = Image.open('mozart.gif')
# X, Y = im.size
# im1 = Image.new("P", (X*2, Y))
# for y in range(Y):
#     dline = [0 for i in range(X*2)]
#     for x in range(X):
#         dline[x] = im.getpixel((x, y))
#     for i in range(X-4):
#         if dline[i:i+5] == [195,195,195,195,195]:
#             step = X - i
#             break
#     dline[step: step+X] = dline[:X]
#     dline[:step] = [0]*step
#     for x in range(2*X):
#         im1.putpixel((x,y),dline[x])
# im1.show()
# im1.save('romance.gif')

# level 17
# import cookielib
# import urllib
# import urllib2
# import re
# import bz2
# import xmlrpclib
# from urllib2 import Request
# from urllib import quote_plus


# cj=cookielib.CookieJar()
# opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))
# res = opener.open('http://www.pythonchallenge.com/pc/def/linkedlist.php')
# print cj

# url = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?busynothing='
# seed = '12345'
# info = ''
# while 1:
#     req = urllib.urlopen(url + seed)
#     content = req.read()
#     seed = ''.join(re.findall(r"busynothing is (\d+)", content))
#     cookies = req.info().getheaders('Set-Cookie')[0]
# print cookies
#     byte = cookies.split(';')[0].split('=')[1]
#     info += byte
#     try:
#         int(seed)
#         print "Info:", byte, " Next:", seed
#     except:
#         print "Info:", byte, " Last:", content
#         break
# print info
# print "info:", bz2.decompress(urllib.unquote_plus(info))

# '''
# info: is it the 26th already? call his father and inform him that "the flowers are on their way". he'll understand.
# '''
# server = xmlrpclib.Server('http://www.pythonchallenge.com/pc/phonebook.php')
# print server.phone('Leopold')
# inform = 'the flowers are on their way'
# url = 'http://www.pythonchallenge.com/pc/stuff/violin.php'
# req = Request(url, headers={'Cookie': 'info=' + quote_plus(inform)})
# print urllib2.urlopen(req).read()
# print req.info().getheaders('Set-Cookie')[0]
# oh well, don't you dare to forget the balloons.

# get cookie in python3
# import http.cookiejar
# import urllib.request
# cj = http.cookiejar.CookieJar()
# opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))
# r = opener.open("http://www.pythonchallenge.com/pc/def/linkedlist.php")
# for cookie in cj:
#     print(cookie)

# level 18
# def minus(x, y):
#     return (x[0]- y[0], x[1]- y[1], x[2]- y[2], )

# from difflib import Differ
# d = Differ()

# from PIL import Image
# im = Image.open('balloons.jpg')
# X, Y = im.size
# print X, Y
# im1 = Image.new("RGB", (X / 2, Y))
# for y in range(Y):
#     for x in range(X / 2):
# print x, y, x+X/2
#         p1 = im.getpixel((x, y))
#         p2 = im.getpixel((x + X / 2, y))
#         print d.compare(p1, p2)
#         im1.putpixel((x,y), minus(p1, p2))
# im1.show()


# import gzip
# import difflib

# h = gzip.open("deltas.gz")
# d = difflib.Differ()

# part_1, part_2 = [], []
# file_1, file_2, file_3 = [], [], []

# for line in h:
#     part_1.append(line[0:53])
#     part_2.append(line[56:-1])

# h.close()

# for line in list(d.compare(part_1, part_2)):
#     if line[0] == "+":
#         file_1.append(line[2:])
#     elif line[0] == "-":
#         file_2.append(line[2:])
#     else:
#         file_3.append(line[2:])

# for n, data in enumerate((file_1, file_2, file_3)):
#     temp = []

#     for line in data:
#         temp.extend([chr(int(o, 16)) for o in line.strip().split(" ") if o])

#     h = open("%s.png" % (n + 1), "wb")
#     h.writelines(temp)
#     h.close()
