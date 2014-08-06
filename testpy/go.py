#!/usr/bin/env python

import gtk
import random


class MyObject:

    def close_application(self, widget, event, data=None):
        gtk.main_quit()

    def __init__(self):
        win = gtk.Window(gtk.WINDOW_POPUP)
        win.connect("delete_event", self.close_application)
        win.set_events(win.get_events() | gtk.gdk.BUTTON_PRESS_MASK)
        win.connect("button_press_event", self.close_application)
        win.show()
        ww, wh = win.get_size()
        screen = win.get_screen()
        w = screen.get_width() / 2 - ww
        h = screen.get_height() - wh
        win.move(random.randint(0, w), random.randint(0, h))
        pixmap, mask = gtk.gdk.pixmap_create_from_xpm(
            win.window, None, "me.jpeg")
        image = gtk.Image()
        image.set_from_pixmap(pixmap, mask)
        win.add(image)
        win.shape_combine_mask(mask, 0, 0)
        win.show_all()

MyObject()
gtk.main()
