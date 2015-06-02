# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'demo.ui'
#
# Created: Thu May 21 08:54:48 2015
#      by: PyQt4 UI code generator 4.11.3
#
# WARNING! All changes made in this file will be lost!
import sys
from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8

    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)


class Ui_MainForm(QtGui.QWidget):

    def __init__(self):
        QtGui.QWidget.__init__(self)
        self.setupUi(self)

    def setupUi(self, MainForm):
        MainForm.setObjectName(_fromUtf8("MainForm"))
        MainForm.resize(634, 527)
        self.btnOpen = QtGui.QPushButton(MainForm)
        self.btnOpen.setGeometry(QtCore.QRect(430, 480, 91, 31))
        self.btnOpen.setObjectName(_fromUtf8("btnOpen"))
        self.btnExit = QtGui.QPushButton(MainForm)
        self.btnExit.setGeometry(QtCore.QRect(530, 480, 91, 31))
        self.btnExit.setObjectName(_fromUtf8("btnExit"))
        self.textEdit = QtGui.QTextEdit(MainForm)
        self.textEdit.setGeometry(QtCore.QRect(10, 10, 611, 441))
        self.textEdit.setObjectName(_fromUtf8("textEdit"))

        self.retranslateUi(MainForm)
        QtCore.QMetaObject.connectSlotsByName(MainForm)

    def retranslateUi(self, MainForm):
        MainForm.setWindowTitle(
            _translate("MainForm", "Anaconda Python IDE", None))
        self.btnOpen.setText(_translate("MainForm", "打开", None))
        self.btnExit.setText(_translate("MainForm", "退出", None))
        self.btnOpen.clicked.connect(self.printHam)
        self.btnExit.clicked.connect(self.close)

    def printHam(self):
        self.textEdit.setText(self.textEdit.toPlainText() + "HAHA\n")

if __name__ == "__main__":
    app = QtGui.QApplication(sys.argv)
    ex = Ui_MainForm()
    ex.show()
    sys.exit(app.exec_())
