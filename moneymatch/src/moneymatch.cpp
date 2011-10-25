//============================================================================
// Name        : moneymatch.cpp
// Author      : Kevin Qu
// Version     :
// Copyright   : © 2011 Grazestar All Rights Reserved
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include "moneymatch.h"

// Initialize source data
const double match_limit = 0.7;
const int srcs_len = 4;
const char *srcs[srcs_len] = { "/home/qcg/dev/prj/ciho/tools/money/1A.jpg",
		"/home/qcg/dev/prj/ciho/tools/money/1B.jpg",
		"/home/qcg/dev/prj/ciho/tools/money/100A.jpg",
		"/home/qcg/dev/prj/ciho/tools/money/100B.jpg"
};

// Size of each image
int total[srcs_len] = { 554 * 281, 554 * 281, 554 * 281, 554 * 281/*, 298 * 280*/ };

int full_value[srcs_len] = { 1, 1, 100, 100/*, 1000*/ };

double MatchTemplate(IplImage* imgSrc, IplImage* imgTemp, CvPoint* ppoint) {
	CvSize sizeSrc = cvGetSize(imgSrc);
	CvSize sizeTemp = cvGetSize(imgTemp);
	CvSize sizeResult = cvSize(sizeSrc.width - sizeTemp.width + 1,
			sizeSrc.height - sizeTemp.height + 1);
	IplImage* imgResult = cvCreateImage(sizeResult, IPL_DEPTH_32F, 1);
	cvMatchTemplate(imgSrc, imgTemp, imgResult, CV_TM_CCORR_NORMED);

	double max;
	cvMinMaxLoc(imgResult, 0, &max, 0, ppoint);
	/* Match as
	 float dMax = 0.0;
	 CvPoint point = cvPoint(0, 0);
	 for (int cx = 0; cx < sizeResult.width; cx++) {
	 for (int cy = 0; cy < sizeResult.height; cy++) {
	 float fTemp = CV_IMAGE_ELEM(imgResult,float,cy,cx);
	 if (dMax < fTemp) //找到最接近的位置
	 {
	 dMax = fTemp;
	 point = cvPoint(cx, cy); //记录位置
	 }
	 }
	 }*/

#ifdef __DEBUG__
	CvPoint point2 = cvPoint(ppoint->x + sizeTemp.width,
			ppoint->y + sizeTemp.height); //对角位置
	cvRectangle(imgSrc, *ppoint, point2, cvScalar(255));
	cvNamedWindow("Test", CV_WINDOW_AUTOSIZE);
	cvShowImage("Test", imgSrc);

	cvWaitKey(0);
	cvDestroyWindow("Test");
#endif
	cvReleaseImage(&imgResult);
	return max;
}

double MatchAreaCount(IplImage* imgfrom, IplImage* imgto) {
	cvSub(imgfrom, imgto, imgto, 0); //图像相减
	cvThreshold(imgto, imgto, 1, 255, CV_THRESH_BINARY); //阈值处理
	int white = 0, black, total;
	for (int y = 0; y < imgto->height; y++) {
		for (int x = 0; x < imgto->width; x++) {
			const int val = imgto->imageData[y * imgto->widthStep
					+ x];
			if (val & 1) {
				++white; //白色なのでカウントする
			}
		}
	}
	total = imgto->width * imgto->height; //総面積
	black = total - white; //黒い面積

#ifdef __DEBUG__
	printf("white = %d  black = %d  total = %d\n", white, black, total);
	cvNamedWindow("Test", CV_WINDOW_AUTOSIZE);
	cvShowImage("Test", imgto);
	cvWaitKey(0);
	cvDestroyWindow("Test");
#endif
	return black;
}

IplImage* GetSourceImage(IplImage* imgTemp, int *nMatch) {
	IplImage* imgSrc;
	int i;
	double tmp, max;
	CvPoint point = cvPoint(0, 0);
	CvPoint bestpoint = cvPoint(0, 0);

	for (i = 0; i < srcs_len; i++) {
		imgSrc = cvLoadImage(srcs[i]);
		tmp = MatchTemplate(imgSrc, imgTemp, &point);
#ifdef __DEBUG__
		printf("match rate of srcs[%d]=%f\n", i, tmp);
#endif
		cvReleaseImage(&imgSrc);
		if (tmp > max) {
			max = tmp;
			*nMatch = i;
			bestpoint.x = point.x;
			bestpoint.y = point.y;
		}
	}
#ifdef __DEBUG__
	printf("limit=%f max=%f maxi=%d\n", match_limit, max, *nMatch);
#endif
	imgSrc = cvLoadImage(srcs[*nMatch]);
	CvSize sizeTemp = cvGetSize(imgTemp);
	CvRect rcROI;
	rcROI.x = bestpoint.x;
	rcROI.y = bestpoint.y;
	rcROI.width = sizeTemp.width;
	rcROI.height = sizeTemp.height;
#ifdef __DEBUG__
	printf("ROI %d, %d, %d, %d\n", rcROI.x, rcROI.y, rcROI.width, rcROI.height);
#endif
	cvSetImageROI(imgSrc, rcROI);
	if (max > match_limit) {
		return imgSrc;
	} else {
		return NULL;
	}
}

// Calculate match area rate
double MatchAreaRate(int nMatchAreaSize, int nMatch) {
	return (double) ((nMatchAreaSize)) / total[nMatch];
}

// Calculate change value
int ChangeValue(int nMatchAreaSize, int nMatch) {
	double fMatchAreaRate = MatchAreaRate(nMatchAreaSize, nMatch);

	int nChangeValue;
	if (fMatchAreaRate > 0.75) {
		nChangeValue = full_value[nMatch];
	} else if (fMatchAreaRate > 0.5) {
		nChangeValue = full_value[nMatch] / 2;
	} else {
		nChangeValue = 0;
	}

	return nChangeValue;
}

int main(int argc, char* argv[]) {

	IplImage* imgTemp = cvLoadImage(argv[1]);

	// Get image from srcs[] which match temp image, and set ROI on it
	int nMatch;
	IplImage* imgSrc;
	if((imgSrc = GetSourceImage(imgTemp, &nMatch)) == NULL) {
#ifdef __DEBUG__
		printf("[ERROR] Cannot match any temps. Abort.\n");
#endif
		return EXIT_FAILURE;
	}

	// Calculate match area of temp image
	int nMatchAreaSize = MatchAreaCount(imgSrc, imgTemp);

	// Calculate the change value
	int nChangeValue = ChangeValue(nMatchAreaSize, nMatch);
#ifdef __DEBUG__
	printf("MatchValue=%d YUAN\nMatchAreaRate=%f\nChangeValue = %d YUAN\n",
			full_value[nMatch],
			MatchAreaRate(nMatchAreaSize, nMatch), nChangeValue);
#endif
	printf("%d", nChangeValue);
	cvReleaseImage(&imgSrc);
	cvReleaseImage(&imgTemp);

	return EXIT_SUCCESS;
}
