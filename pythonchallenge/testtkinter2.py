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






# import tkSimpleDialog
# from Tkinter import *


# class MyDialog(tkSimpleDialog.Dialog):

#     def body(self, master):

#         Label(master, text="First:").grid(row=0)
#         Label(master, text="Second:").grid(row=1)

#         self.e1 = Entry(master)
#         self.e2 = Entry(master)

#         self.e1.grid(row=0, column=1)
#         self.e2.grid(row=1, column=1)
# return self.e1  # initial focus

#     def apply(self):
#         first = int(self.e1.get())
#         second = int(self.e2.get())
# print first, second  # or something


# master = Tk()
# master.geometry('400x800')
# Button(master, text="Hello!").pack()
# master.update()

# d = MyDialog(master)
# print d.result


# from Tkinter import *
# import tkMessageBox


# def callback():
#     if tkMessageBox.askokcancel("Quit", "Do you really wish to quit?"):
#         master.destroy()

# master = Tk()
# master.protocol("WM_DELETE_WINDOW", callback)


# def key(event):
#     print "pressed", repr(event.char)

# def callback(event):
#     frame.focus_set()
#     print "clicked at", event.x, event.y

# frame = Frame(master, width=100, height=100)
# frame.bind("<Key>", key)
# frame.bind("<Button-1>", callback)
# frame.pack()
# frame.focus_set()

# master.mainloop()


# from Tkinter import *

# pane = Tk()
# pane.geometry('800x600')
# Label(pane, text="Pane Title").pack()
# b = Button(pane, width=10, height=10)
# b.place(relx=1, x=-2, y=2, anchor=NE)

# pane.mainloop()


# from Tkinter import *

# master = Tk()

# listbox = Listbox(master)
# sl = Scrollbar(master)
# sl.pack(side = RIGHT,fill = Y)
# listbox['yscrollcommand'] = sl.set
# sl['command'] = listbox.yview
# listbox.pack()

# for item in range(100):
#     listbox.insert(END, str(item))

# mainloop()


# from Tkinter import *
# master = Tk()
# canvas = Canvas(master, width=800, height=600)
# canvas.pack()
# i = canvas.create_line(0, 0, 200, 200)
# canvas.create_line(200, 200, 0, 100)
# canvas.create_rectangle(50, 25, 150, 75, fill="blue")
# # canvas.delete(i)
# # canvas.delete(ALL)
# master.mainloop()


# from tkinter import *
# def printkey(event):
#     label["text"] = event.char

# root = Tk()
# entry = Entry(root)
# # 给输入框绑定按键监听事件<Key>为监听任何按键 <Key-x>监听其它键盘，如大写的A<Key-A>、回车<Key-Return>
# entry.bind('<Key>', printkey)
# entry.pack()
# label = Label(root)
# label.pack()
# entry.focus_set()
# root.mainloop()




from Tkinter import *

def callback():
    print "click!"

def cb():
    print "variable is", var.get()

master = Tk()
b = Button(master, text="OK", command=callback)
b.pack()

var = IntVar()
c = Checkbutton(master, text="Enable Tab", variable=var, command=cb)
c.pack()

e = Entry(master)
e.pack()
e.delete(0, END)
e.insert(0, "a default value")

separator = Frame(height=2, bd=1, relief=SUNKEN)
separator.pack(fill=X, padx=5, pady=5)

frame = Frame(width=768, height=50, bg="", colormap="new")
frame.pack()
# video.attach_window(frame.window_id())

w = Label(master, text="Hello, world!")
w.pack()

group = LabelFrame(master, text="Group", padx=5, pady=5)
group.pack(padx=10, pady=10)
w = Entry(group)
w.pack()

listbox = Listbox(master)
listbox.pack()
listbox.insert(END, "a list entry")

def hello():
    print "hello!"
menubar = Menu(master)
# create a pulldown menu, and add it to the menu bar
filemenu = Menu(menubar, tearoff=0)
filemenu.add_command(label="Open", command=hello)
filemenu.add_command(label="Save", command=hello)
filemenu.add_separator()
filemenu.add_command(label="Exit", command=master.quit)
menubar.add_cascade(label="File", menu=filemenu)
# create more pulldown menus
editmenu = Menu(menubar, tearoff=0)
editmenu.add_command(label="Cut", command=hello)
editmenu.add_command(label="Copy", command=hello)
editmenu.add_command(label="Paste", command=hello)
menubar.add_cascade(label="Edit", menu=editmenu)
helpmenu = Menu(menubar, tearoff=0)
helpmenu.add_command(label="About", command=hello)
menubar.add_cascade(label="Help", menu=helpmenu)
# display the menu
master.config(menu=menubar)


w = Message(master, text="this is a message")
w.pack()

w = Spinbox(master, from_=0, to=10)
w.pack()

m = PanedWindow(orient=VERTICAL)
m.pack(fill=BOTH, expand=1)
top = Label(m, text="top pane")
m.add(top)
bottom = Label(m, text="bottom pane")
m.add(bottom)

mainloop()





