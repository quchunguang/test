#!/usr/bin/env python

import sys
from PyQt4 import QtGui


class Form(QtGui.QWidget):

    def __init__(self, parent=None):
        QtGui.QWidget.__init__(self, parent)

app = QtGui.QApplication(sys.argv)
form = Form()
form.show()
sys.exit(app.exec_())
