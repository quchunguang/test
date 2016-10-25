"""
Created on 2012-12-17

@author: Administrator
"""
import urllib.parse
import sys
import os.path
from tkinter import Tk

# def addToClipBoard(text):
#    """Only work after vista"""
#    command = 'echo ' + text.strip() + '| clip'
#    os.system(command)

path, ext = os.path.splitext(sys.argv[1])
tokens = path.split('\\')[3:]
total = ""
for token in tokens:
    total = total + '/' + urllib.parse.quote(token)

if ext == ".wmv":
    url = "http://grazestar.com/wmvplayer.php?file=" + total[1:]
else:
    url = "grazestar.com/ynn" + total + ext

"""Copy to windows clipboard"""
r = Tk()
r.withdraw()
r.clipboard_clear()
r.clipboard_append(url)
r.destroy()
# addToClipBoard(url)

print(url)
