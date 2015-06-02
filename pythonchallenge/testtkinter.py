from tkinter import *
from os.path import split, basename
from os import listdir, mkdir, sep
from shutil import move
import sys
import re

def todolist():
    l = []
    path, name = split(inputfile)
    for f in listdir(path):
        if name[:5] in basename(f):
            l.append(f)
    return l

def do_it():
    path, name = split(inputfile)
    match = re.match(r'(.*)\.S\d\dE\d\d.*', name)
    dirname = path + sep + match.group(1)
    mkdir(dirname)
    res = 'create ' + dirname
    for f in li:
        pathname = path + sep + f
        move(pathname, dirname)
        res += '\n' + f + '->' + dirname
    label["text"] = res
    # label.config(text='change the value')


if len(sys.argv) != 2:
    exit(1)
inputfile = sys.argv[1]
# inputfile = r'D:\加州迷情.Californication\加州迷情.Californication.S01E01.rmvb'
# li = todolist()

root = Tk()
root.geometry('400x800')
frametop = Frame(root)
frametop.pack(side=TOP)
framemain = Frame(root)
framemain.pack()

run = Button(frametop, text='RUN', command=do_it)
run.pack(side=LEFT)
quit = Button(frametop, text='QUIT', command=root.quit)
quit.pack(side=LEFT)
label = Label(framemain, text='\n'.join(li), font='Helvetica -12 bold')
label.pack(fill=BOTH, expand=1)
mainloop()
