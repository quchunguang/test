'''
Created on 2013-1-19

@author: Administrator
'''
import zlib


s = b'witch which has which witches wrist watch'
print(len(s))
t = zlib.compress(s)
print(len(t))
print(zlib.decompress(t))
print(zlib.crc32(s))
