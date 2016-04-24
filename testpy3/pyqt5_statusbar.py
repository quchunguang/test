#!/usr/bin/python3
# -*- coding: utf-8 -*-
import sys
from PyQt5.QtWidgets import QMainWindow, QTextEdit, QAction, qApp, QApplication
from PyQt5.QtGui import QIcon


class Example(QMainWindow):

    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        # textEdit
        textEdit = QTextEdit()
        self.setCentralWidget(textEdit)

        # action
        exitAction = QAction(QIcon('web.png'), '&Exit', self)
        exitAction.setShortcut('Ctrl+Q')
        exitAction.setStatusTip('Exit application')
        exitAction.triggered.connect(qApp.quit)

        # menu
        menubar = self.menuBar()
        fileMenu = menubar.addMenu('&File')
        fileMenu.addAction(exitAction)

        # tool bar
        exitToolBar = self.addToolBar('Exit')
        exitToolBar.addAction(exitAction)
        commonToolBar = self.addToolBar('Common')
        commonToolBar.addAction(exitAction)

        # status bar
        self.statusBar().showMessage('Ready')

        # main window
        self.setGeometry(300, 300, 250, 150)
        self.setWindowTitle('Main Window')
        self.show()


if __name__ == '__main__':

    app = QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
