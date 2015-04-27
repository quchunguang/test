#-*- coding: utf-8 -*-
# from Tkinter import *  # 引入模块


# resize函数是用来改变文字大小的，当进度条改变时调用
# def resize(ev=None):
#     label.config(font='Helvetica -%d bold' % scale.get())
# config函数就是通过设置组件的参数来改变组件的，这里改变的是font字体大小


# top = Tk()  # 主窗口
# top.geometry('600x400')  # 设置了主窗口的初始大小600x400
# 设置标签字体的初始大小
# label = Label(top, text='Hello world!', font='Helvetica -12 bold')
# label.pack(fill=Y, expand=1)
# scale创建进度条，设置
# scale = Scale(top, from_=10, to=40, orient=HORIZONTAL, command=resize)
# scale.set(12)  # 设置起始位置
# scale.pack(fill=X, expand=1)
# quit = Button(top, text='QUIT', command=top.quit, activeforeground='white',
#               activebackground='red')
# quit.pack()
# mainloop()

#################################################################

# from ctypes import *
# user32 = windll.LoadLibrary('user32.dll')  # 加载动态链接库
# user32.MessageBoxA(0, '内容', '标题', 0)   # 调用MessageBoxA函数

# __author__ = 'fyby'
# from Tkinter import *
# class App:
#     def __init__(self, master):
# 构造函数里传入一个父组件(master),创建一个Frame组件并显示
#         frame = Frame(master)
#         frame.pack()
# 创建两个button，并作为frame的一部分
#         self.button = Button(frame, text="QUIT", fg="red", command=frame.quit)
# self.button.pack(side=LEFT) #此处side为LEFT表示将其放置 到frame剩余空间的最左方
#         self.hi_there = Button(frame, text="Hello", command=self.say_hi)
#         self.hi_there.pack(side=LEFT)

#     def say_hi(self):
#         print "hi there, this is a class example!"

# win = Tk()
# app = App(win)
# win.mainloop()


#####################################################################
# from Tkinter import *
# root = Tk()
# import sys


# def hello():
#     print('hello')


# def about():
#     w = Label(
#         root, text="Arguments:\n{}".format('\n'.join(sys.argv)))
#     w.pack(side=TOP)

# menubar = Menu(root)

# # 创建下拉菜单File，然后将其加入到顶级的菜单栏中
# filemenu = Menu(menubar, tearoff=0)
# filemenu.add_command(label="Open", command=hello)
# filemenu.add_command(label="Save", command=hello)
# filemenu.add_separator()
# filemenu.add_command(label="Exit", command=root.quit)
# menubar.add_cascade(label="File", menu=filemenu)

# # 创建另一个下拉菜单Edit
# editmenu = Menu(menubar, tearoff=0)
# editmenu.add_command(label="Cut", command=hello)
# editmenu.add_command(label="Copy", command=hello)
# editmenu.add_command(label="Paste", command=hello)
# menubar.add_cascade(label="Edit", menu=editmenu)

# # 创建下拉菜单Help
# helpmenu = Menu(menubar, tearoff=0)
# helpmenu.add_command(label="About", command=about)
# menubar.add_cascade(label="Help", menu=helpmenu)

# # 显示菜单
# root.config(menu=menubar)

# mainloop()



from tkinter import *

# arg = r'D:\杀手信徒.The.Following\远古入侵：新世界 Primeval.New.World.S01E05.mkv'

from os.path import split, basename
from os import listdir, mkdir, sep
from shutil import move
import sys
import re
def todolist():
    l = []
    path, name = split(sys.argv[1])
    for f in listdir(path):
        if name[:5] in basename(f):
            l.append(f)
    return l

def do_it():
    path, name = split(sys.argv[1])
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


top = Tk()
top.geometry('800x600')
run = Button(top, text='RUN', command=do_it, activeforeground='white',
              activebackground='red')
run.pack()
li = todolist()
label = Label(top, text='\n'.join(li), font='Helvetica -12 bold')
label.pack(fill=Y, expand=1)
mainloop()
