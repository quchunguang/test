#!/usr/bin/python3
# -*- coding: utf-8 -*-
import sys
from PyQt5.QtWidgets import QWidget, QCheckBox, QPushButton, QFrame, QSlider, QLabel, QProgressBar, QCalendarWidget, QLineEdit, QApplication
from PyQt5.QtCore import Qt, QBasicTimer, QDate
from PyQt5.QtGui import QColor, QPixmap


class Example(QWidget):

    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        # checkbox
        cb = QCheckBox('Show title', self)
        cb.move(20, 160)
        cb.toggle()
        cb.stateChanged.connect(self.changeTitle)

        # toggle button
        self.col = QColor(0, 0, 0)
        redb = QPushButton('Red', self)
        redb.setCheckable(True)
        redb.move(10, 10)
        redb.clicked[bool].connect(self.setColor)
        redb = QPushButton('Green', self)
        redb.setCheckable(True)
        redb.move(10, 60)
        redb.clicked[bool].connect(self.setColor)
        blueb = QPushButton('Blue', self)
        blueb.setCheckable(True)
        blueb.move(10, 110)
        blueb.clicked[bool].connect(self.setColor)
        self.square = QFrame(self)
        self.square.setGeometry(150, 20, 100, 100)
        self.square.setStyleSheet("QWidget { background-color: %s }" %
                                  self.col.name())

        # slider
        sld = QSlider(Qt.Horizontal, self)
        sld.setFocusPolicy(Qt.NoFocus)
        sld.setGeometry(30, 210, 100, 30)
        sld.valueChanged[int].connect(self.changeValue)

        # pixmap
        self.label = QLabel(self)
        self.label.setPixmap(QPixmap('web.png'))
        self.label.setGeometry(160, 210, 80, 30)

        # process bar
        self.pbar = QProgressBar(self)
        self.pbar.setGeometry(30, 260, 200, 25)
        self.btn = QPushButton('Start', self)
        self.btn.move(40, 310)
        self.btn.clicked.connect(self.doAction)
        self.timer = QBasicTimer()
        self.step = 0

        # calendar
        cal = QCalendarWidget(self)
        cal.setGridVisible(True)
        cal.move(300, 10)
        cal.clicked[QDate].connect(self.showDate)
        self.lbl = QLabel(self)
        date = cal.selectedDate()
        self.lbl.setText(date.toString())
        self.lbl.move(300, 260)

        # line edit
        self.lbl2 = QLabel(self)
        qle = QLineEdit(self)
        qle.move(300, 310)
        self.lbl2.move(480, 310)
        qle.textChanged[str].connect(self.onChanged)

        self.setGeometry(300, 300, 640, 480)
        self.setWindowTitle('QCheckBox')
        self.show()

    def changeTitle(self, state):
        if state == Qt.Checked:
            self.setWindowTitle('QCheckBox')
        else:
            self.setWindowTitle('')

    def setColor(self, pressed):
        source = self.sender()
        if pressed:
            val = 255
        else:
            val = 0
        if source.text() == "Red":
            self.col.setRed(val)
        elif source.text() == "Green":
            self.col.setGreen(val)
        else:
            self.col.setBlue(val)
        self.square.setStyleSheet("QFrame { background-color: %s }" %
                                  self.col.name())

    def changeValue(self, value):
        if value == 0:
            self.label.setPixmap(QPixmap('web.png'))
        elif value > 0 and value <= 30:
            self.label.setPixmap(QPixmap('web.png'))
        elif value > 30 and value < 80:
            self.label.setPixmap(QPixmap('web.png'))
        else:
            self.label.setPixmap(QPixmap('web.png'))

    def timerEvent(self, e):
        if self.step >= 100:
            self.timer.stop()
            self.btn.setText('Finished')
            return
        self.step = self.step + 1
        self.pbar.setValue(self.step)

    def doAction(self):
        if self.timer.isActive():
            self.timer.stop()
            self.btn.setText('Start')
        else:
            self.timer.start(100, self)
            self.btn.setText('Stop')

    def showDate(self, date):
        self.lbl.setText(date.toString())

    def onChanged(self, text):
        self.lbl2.setText(text)
        self.lbl2.adjustSize()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
