/*
 * regionrotate.cpp
 *
 *  Created on: 2011-10-25
 *      Author: qcg
 */

#include <opencv/cv.h>
#include <opencv/highgui.h>
#include "moneymatch.h"

void FindContours(IplImage *img, CvMemStorage* storage, CvSeq* contours)
{
	cvFindContours( img, storage, &contours, sizeof(CvContour),
	                    CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, cvPoint(0,0) );
}

void RotateImage(IplImage *src, IplImage *dst, CvPoint center, float angle,
		float factor) { //以点center为旋转中心，对src旋转angle度并缩放factor倍。
	float m[6];
	CvMat mat = cvMat(2, 3, CV_32FC1, m);
	m[0] = (float) (factor * cos(-angle * CV_PI / 180.));
	m[1] = (float) (factor * sin(-angle * CV_PI / 180.));
	m[2] = center.x;
	m[3] = -m[1];
	m[4] = m[0];
	m[5] = center.y;
	cvSetZero(dst);
	cvGetQuadrangleSubPix(src, dst, &mat);
}
//http://blog.csdn.net/include1224/article/details/4384855
CvBox2D RegionRotate(IplImage *src, IplImage *dst, CvSeq *contour) {
	//传进来一个contour,然后计算它的最小包围矩形minRect，再把原图以包围矩形中心为旋转中心旋转minRect.angle°，得到调正的图像。
	//dst 是通过cvClone()src得到的
	CvMat *mat_contour = cvCreateMat(1, contour->total, CV_32FC2); //双通道
	CvPoint2D32f *ptr_mat = (CvPoint2D32f*) (mat_contour->data.ptr);
	for (int i = 0; i != contour->total; ++i) {
		CvPoint *ptr_seq = (CvPoint*) (cvGetSeqElem(contour, i));
		*ptr_mat = cvPointTo32f(*ptr_seq); //显示把CvPoint转换成CvPoint2D32F
		ptr_mat++;
	} //把轮廓变成矩阵
	CvBox2D minRect = cvMinAreaRect2(mat_contour); //得到最小包围矩形
	//CvMat *rot = cvCreateMat(2,3,CV_32FC1);
	//cv2DRotationMatrix(cvPoint2D32f(src->width*0.5f,src->height*0.5f),minRect.angle,0.6,rot);//计算得到旋转矩阵----这里计算得到的矩阵不能使图像变换到想要的旋转结果
	float m[6];
	CvMat mat = cvMat(2, 3, CV_32FC1, m);
	float factor = 1.0; //缩放
	float angle = -minRect.angle;
	float w = 0, h = 0;
	w = minRect.center.x;
	h = minRect.center.y;
	RotateImage(src, dst, cvPoint(w, h), angle, factor);
	//cvEllipseBox(dst,minRect,cvScalar(0,0,255));
	cvReleaseMat(&mat_contour);
	return minRect; //返回最佳包围盒
}


