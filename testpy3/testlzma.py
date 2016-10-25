"""
Created on 2013-1-17

@author: Administrator
"""
import lzma
data = b"Insert Data Here"
with lzma.open("file.xz", "w") as f:
    f.write(data)
with lzma.open("file.xz") as f:
    file_content = f.read()
    print(file_content)
