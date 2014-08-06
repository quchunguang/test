#!/usr/bin/env python
# sudo apt-get install python-webkit

import gtk
import webkit

win = gtk.Window()
win.show()
win.connect('destroy', lambda w: gtk.main_quit())

scroller = gtk.ScrolledWindow()
win.add(scroller)

web = webkit.WebView()
web.open("http://www.baidu.com")
scroller.add(web)

scroller.show()
web.show()

gtk.main()
