#!/usr/bin/env python2
# https://www.raspberrypi.org/learning/turtle-snowflakes/worksheet/
# Dependence
#   sudo apt-get install python-tk
import turtle

wn = turtle.Screen()
elsa = turtle.Turtle()
wn.bgcolor("black")
elsa.color("white")

elsa.penup()
elsa.forward(90)
elsa.left(45)
elsa.pendown()


def branch():
    for i in range(3):
        for i in range(3):
            elsa.forward(30)
            elsa.backward(30)
            elsa.right(45)
        elsa.left(90)
        elsa.backward(30)
        elsa.left(45)
    elsa.right(90)
    elsa.forward(90)

for i in range(8):
    branch()
    elsa.left(45)

wn.exitonclick()
