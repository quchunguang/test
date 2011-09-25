#!/usr/bin/env python

import sys
from PyQt4 import QtGui

app = QtGui.QApplication(sys.argv)

win = QtGui.QWidget()
win.resize(600,400)
win.setWindowTitle("This is my window")
win.show()

sys.exit(app.exec_())
