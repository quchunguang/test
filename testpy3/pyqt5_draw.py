#!/usr/bin/python3
# -*- coding: utf-8 -*-
import sys
import random
from PyQt5.QtWidgets import QWidget, QApplication
from PyQt5.QtGui import QPainter, QColor, QFont, QPen, QBrush
from PyQt5.QtCore import Qt


class Example(QWidget):

    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setGeometry(300, 300, 640, 480)
        self.setWindowTitle('Draw text')
        self.show()

    def paintEvent(self, event):
        qp = QPainter()
        qp.begin(self)
        self.drawText(event, qp)
        self.drawPoints(qp)
        self.drawRectangles(qp)
        self.drawLines(qp)
        self.drawBrushes(qp)
        qp.end()

    def drawText(self, event, qp):
        text = u'它执行\n的部件和其他涂料设备的低级别的绘画。'
        qp.setPen(QColor(168, 34, 3))
        qp.setFont(QFont('Decorative', 20))
        qp.drawText(event.rect(), Qt.AlignCenter, text)

    def drawPoints(self, qp):
        qp.setPen(Qt.red)
        size = self.size()
        for i in range(1000):
            x = random.randint(1, size.width() - 1)
            y = random.randint(1, size.height() - 1)
            qp.drawPoint(x, y)

    def drawRectangles(self, qp):
        col = QColor(0, 0, 0)
        col.setNamedColor('#d4d4d4')
        qp.setPen(col)
        qp.setBrush(QColor(200, 0, 0))
        qp.drawRect(10, 315, 90, 60)
        qp.setBrush(QColor(255, 80, 0, 160))
        qp.drawRect(130, 315, 90, 60)
        qp.setBrush(QColor(25, 0, 90, 200))
        qp.drawRect(250, 315, 90, 60)

    def drawLines(self, qp):
        pen = QPen(Qt.black, 2, Qt.SolidLine)
        qp.setPen(pen)
        qp.drawLine(400, 40, 550, 40)
        pen.setStyle(Qt.DashLine)
        qp.setPen(pen)
        qp.drawLine(400, 80, 550, 80)
        pen.setStyle(Qt.DashDotLine)
        qp.setPen(pen)
        qp.drawLine(400, 120, 550, 120)
        pen.setStyle(Qt.DotLine)
        qp.setPen(pen)
        qp.drawLine(400, 160, 550, 160)
        pen.setStyle(Qt.DashDotDotLine)
        qp.setPen(pen)
        qp.drawLine(400, 200, 550, 200)
        pen.setStyle(Qt.CustomDashLine)
        pen.setDashPattern([1, 4, 5, 4])
        qp.setPen(pen)
        qp.drawLine(400, 240, 550, 240)

    def drawBrushes(self, qp):
        brush = QBrush(Qt.SolidPattern)
        qp.setBrush(brush)
        qp.drawRect(10, 15, 90, 60)
        brush.setStyle(Qt.Dense1Pattern)
        qp.setBrush(brush)
        qp.drawRect(130, 15, 90, 60)
        brush.setStyle(Qt.Dense2Pattern)
        qp.setBrush(brush)
        qp.drawRect(250, 15, 90, 60)
        brush.setStyle(Qt.Dense3Pattern)
        qp.setBrush(brush)
        qp.drawRect(10, 105, 90, 60)
        brush.setStyle(Qt.DiagCrossPattern)
        qp.setBrush(brush)
        qp.drawRect(10, 105, 90, 60)
        brush.setStyle(Qt.Dense5Pattern)
        qp.setBrush(brush)
        qp.drawRect(130, 105, 90, 60)
        brush.setStyle(Qt.Dense6Pattern)
        qp.setBrush(brush)
        qp.drawRect(250, 105, 90, 60)
        brush.setStyle(Qt.HorPattern)
        qp.setBrush(brush)
        qp.drawRect(10, 195, 90, 60)
        brush.setStyle(Qt.VerPattern)
        qp.setBrush(brush)
        qp.drawRect(130, 195, 90, 60)
        brush.setStyle(Qt.BDiagPattern)
        qp.setBrush(brush)
        qp.drawRect(250, 195, 90, 60)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = Example()
    sys.exit(app.exec_())
