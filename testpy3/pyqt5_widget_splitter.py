#!/usr/bin/python3
# -*- coding: utf-8 -*-
import sys
from PyQt5.QtWidgets import (QWidget, QHBoxLayout, QVBoxLayout, QLabel,
                             QComboBox, QFrame, QSplitter, QApplication)
from PyQt5.QtCore import Qt


class Example(QWidget):

    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        '''
        Example
            hbox
                splitter2
                    splitter1
                        topleft
                            vbox
                                self.lbl
                                combo
                        topright
                    bottom
        '''
        # splitter
        hbox = QHBoxLayout(self)
        topleft = QFrame(self)
        topleft.setFrameShape(QFrame.StyledPanel)
        topright = QFrame(self)
        topright.setFrameShape(QFrame.StyledPanel)
        bottom = QFrame(self)
        bottom.setFrameShape(QFrame.StyledPanel)
        splitter1 = QSplitter(Qt.Horizontal)
        splitter1.addWidget(topleft)
        splitter1.addWidget(topright)
        splitter2 = QSplitter(Qt.Vertical)
        splitter2.addWidget(splitter1)
        splitter2.addWidget(bottom)
        hbox.addWidget(splitter2)
        self.setLayout(hbox)

        # combo
        self.lbl = QLabel("Ubuntu", self)
        combo = QComboBox(self)
        combo.addItem("Ubuntu")
        combo.addItem("Mandriva")
        combo.addItem("Fedora")
        combo.addItem("Arch")
        combo.addItem("Gentoo")
        combo.activated[str].connect(self.onActivated)

        # put combo and label into layout into frame
        vbox = QVBoxLayout(topleft)
        vbox.addWidget(self.lbl)
        vbox.addWidget(combo)

        self.setGeometry(300, 300, 300, 200)
        self.setWindowTitle('QSplitter')
        self.show()

    def onActivated(self, text):
        self.lbl.setText(text)
        self.lbl.adjustSize()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
