# coding=utf-8
import win32gui
import win32api
import win32con
import time
import threading
import pythoncom
import pyHook

evt = threading.Event()


def OnKeyboardEvent(event):
    evt.set()
    # return True to pass the event to other handlers
    return True


def pressKey(myKey):
    win32api.keybd_event(
        myKey, 0x45, win32con.KEYEVENTF_EXTENDEDKEY | 0, 0)
    win32api.keybd_event(
        myKey, 0x45,
        win32con.KEYEVENTF_EXTENDEDKEY | win32con.KEYEVENTF_KEYUP, 0)
    print 'Send key event done.'


def getKeyboardEventSignal():
    while True:
        evt.wait()
        pressKey(87)   # w键位码87
        print "A keyboard event occure"
        evt.clear()

t = threading.Thread(target=getKeyboardEventSignal, args=())
t.start()

# create a hook manager
hm = pyHook.HookManager()
# watch for all mouse events
hm.KeyDown = OnKeyboardEvent
# set the hook
hm.HookKeyboard()
# wait forever
pythoncom.PumpMessages()
