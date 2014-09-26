#!/usr/bin/env python2
# -*- coding: utf-8 -*-
import cv
if __name__ == '__main__':
    img = cv.LoadImageM ("input.jpg")
    cv.NamedWindow ("ShowImage")
    cv.ShowImage ("ShowImage", img)
    cv.WaitKey (0)
