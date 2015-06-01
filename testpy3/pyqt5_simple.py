#!/usr/bin/python3
# -*- coding: utf-8 -*-
# http://zetcode.com/gui/pyqt5/firstprograms/
import sys
from PyQt5.QtWidgets import QWidget, QToolTip, QPushButton, QMessageBox, QDesktopWidget, QApplication
from PyQt5.QtCore import QCoreApplication
from PyQt5.QtGui import QFont, QIcon


class Example(QWidget):

    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        QToolTip.setFont(QFont('SansSerif', 10))

        qbtn = QPushButton('Quit', self)
        qbtn.setToolTip('This is a <b>QPushButton</b> widget')
        qbtn.clicked.connect(QCoreApplication.instance().quit)
        qbtn.resize(qbtn.sizeHint())
        qbtn.move(50, 50)

        self.setWindowIcon(QIcon('web.png'))
        self.setToolTip('This is a <b>QWidget</b> widget')
        self.setGeometry(300, 300, 250, 150)
        self.resize(250, 150)
        self.center()
        self.setWindowTitle('Center')
        self.show()

    def center(self):
        qr = self.frameGeometry()
        cp = QDesktopWidget().availableGeometry().center()
        qr.moveCenter(cp)
        self.move(qr.topLeft())

    def closeEvent(self, event):
        reply = QMessageBox.question(self, 'Message',
                                     "Are you sure to quit?",
                                     QMessageBox.Yes | QMessageBox.No,
                                     QMessageBox.No)
        if reply == QMessageBox.Yes:
            event.accept()
        else:
            event.ignore()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
