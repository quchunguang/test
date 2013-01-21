'''
Created on 2012-12-28

@author: Administrator
'''
import urllib.request


req = urllib.request.Request('http://www.python.org/fish.html')
try:
    urllib.request.urlopen(req)
except urllib.error.HTTPError as e:
    print(e.code)
    print(e.read())
    
response = urllib.request.urlopen('http://python.org/')
html = response.read()