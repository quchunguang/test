#!/usr/bin/env python3
'''
Created on 2013年11月17日

@author: qcg
'''
from os import listdir
from os.path import isfile, join, split, splitext, abspath 
import shutil

root = '.'
root = abspath(root)
# for dirname,subdirs,filenames in os.walk(root):
#     for d in subdirs:
#         print(os.path.join(dirname, d))
#     for f in filenames:
#         print(os.path.join(dirname, f))
#     if '.git' in subdirs:
#         subdirs.remove('.git')
filelist = [join(root, f) for f in listdir(path=root) if isfile(join(root, f))]
for f in filelist:
    __, ext = splitext(f)
    if ext == '.py':
        path,name = split(f)
        name = 'test_' + name
        #shutil.move(f, join(path, name))
        print('mv', f, join(path, name))
string = 'qq','ww'
print(list(enumerate(string, start=1)))
a = compile('3+4', '', 'eval')
print(eval(a))
prog = compile('for i in range(5): print(i)', '', 'exec')
exec(prog)

if filter(lambda x: x >= 2, range(2, 6)):
    print('OK')
print(list(zip([1,2,3], ['x', 'y', 'z'])))

list = [5,3,1,2,3,3,4,4,4]
print(set(list))