#!/usr/bin/env python

import pygtk
import gtk
pygtk.require('2.0')

import gobject
gobject.threads_init()


class Timer():

    def __init__(self):
        self.x = 0
        self.g = 0
        self.Win()

    def start_t(self, widget):
        self.g = gobject.timeout_add(1000, self.count)

    def Win(self):
        self.win = gtk.Window()
        self.win.connect("destroy", lambda q: gtk.main_quit())
        self.box1 = gtk.HBox()
        self.win.add(self.box1)
        self.box1.show()

        self.label = gtk.Label(self.x)
        self.box1.pack_start(self.label)
        self.label.show()

        self.button1 = gtk.Button("Start")
        self.box1.pack_start(self.button1)
        self.button1.show()
        self.button1.connect("clicked", self.start_t)

        self.win.show()

    def count(self):
        self.x += 1
        self.label.set_text(str(self.x))
        print self.x
        return True


def main():
    gtk.main()

if __name__ == "__main__":
    window = Timer()
    main()
