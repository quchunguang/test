#!/usr/bin/env python
# -*- coding:utf-8 -*-
 
import sys
import math
 
from opencv.cv import *
from opencv.highgui import *
 
if __name__ == '__main__':
 
    if len(sys.argv) == 2:
 
        src = cvLoadImage(sys.argv[1], -1)
        if not src: sys.exit(-1)
 
        delta = 1;
        angle = 90;
        opt = 0;    # 1： 旋转加缩放, 0: 仅仅旋转
        factor = 1;
 
        dst = cvCloneImage (src);
        cvNamedWindow ("src", 1);
        cvShowImage ("src", src);
 
        M = cvCreateMat (2, 3, CV_32F)
 
        while True:
 
            w = src.width;
            h = src.height;
 
            # factor大小未改变
 
            M[0,0] = factor * math.cos (-angle * 2 * CV_PI / 180.0);
            M[0,1] = factor * math.sin (-angle * 2 * CV_PI / 180.0);
            M[1,0] = -M[0,1];
            M[1,1] = M[0,0];
 
            # 将旋转中心移至图像中间
 
            M[0,2] = w * 0.5;
            M[1,2] = h * 0.5;
 
            # dst(x,y) = A * src(x,y) + b
 
            cvZero (dst);
            cvGetQuadrangleSubPix (src, dst, M);
 
            cvNamedWindow ("dst", 1);
            cvShowImage ("dst", dst);
 
            # ESC
 
            if cvWaitKey(10) == '\x1b':
                break
 
            angle = (angle + delta) % 360
