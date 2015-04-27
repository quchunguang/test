#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
import pyglet
from pyglet.gl import *

win = pyglet.window.Window()

@win.event
def on_draw():
    # Clear buffers
    glClear(GL_COLOR_BUFFER_BIT)

    # Draw outlines only
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE)

    # Draw some stuff
    glBegin(GL_TRIANGLE_STRIP)
    glVertex2i(50, 50)
    glVertex2i(75, 100)
    glVertex2i(200, 200)
    glVertex2i(50, 250)
    glEnd()

pyglet.app.run()
