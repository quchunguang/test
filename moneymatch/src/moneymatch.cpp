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
#include <unistd.h>
#include "moneymatch.h"

// Global arguments for program options
struct globalArgs_t {
	int verbosity; 		/* -v option */
	char **inputFiles; 	/* input files */
	int numInputFiles; 	/* # of input files */
} globalArgs;

static const char *optString = "vh?";

// Initialize source data
const double match_limit = 0.7;
const int srcs_len = 4;
const char *srcs[srcs_len] = { "/home/qcg/dev/prj/ciho/tools/money/1A.jpg",
		"/home/qcg/dev/prj/ciho/tools/money/1B.jpg",
		"/home/qcg/dev/prj/ciho/tools/money/100A.jpg",
		"/home/qcg/dev/prj/ciho/tools/money/100B.jpg" };

// Size of each image
int total[srcs_len] =
		{ 554 * 281, 554 * 281, 554 * 281, 554 * 281 /*, 298 * 280*/};

// Value of each source sample
int full_value[srcs_len] = { 1, 1, 100, 100 /*, 1000*/};

// Match each temp with given source, return match value
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
	 if (dMax < fTemp) 					// 找到最接近的位置
	 {
	 dMax = fTemp;
	 point = cvPoint(cx, cy); 				// 记录位置
	 }
	 }
	 }*/

	if (globalArgs.verbosity) {
		CvPoint point2 = cvPoint(ppoint->x + sizeTemp.width,
				ppoint->y + sizeTemp.height); 	// 对角位置
		cvRectangle(imgSrc, *ppoint, point2, cvScalar(255));
		cvNamedWindow("Test", CV_WINDOW_AUTOSIZE);
		cvShowImage("Test", imgSrc);

		cvWaitKey(0);
		cvDestroyWindow("Test");
	}
	cvReleaseImage(&imgResult);
	return max;
}

// Get match area with two same size image, return area (by pixel count)
double MatchAreaCount(IplImage* imgfrom, IplImage* imgto) {
	cvSub(imgfrom, imgto, imgto, 0); 			// 图像相减
	cvThreshold(imgto, imgto, 1, 255, CV_THRESH_BINARY); 	// 阈值处理
	int white = 0, black, total;
	for (int y = 0; y < imgto->height; y++) {
		for (int x = 0; x < imgto->width; x++) {
			const int val = imgto->imageData[y * imgto->widthStep
					+ x];
			if (val & 1) {
				++white; 			// 白色区域
			}
		}
	}
	total = imgto->width * imgto->height; 			// 总面积
	black = total - white; 					// 黑色面积

	if (globalArgs.verbosity) {
		printf("white = %d  black = %d  total = %d\n", white, black,
				total);
		cvNamedWindow("Test", CV_WINDOW_AUTOSIZE);
		cvShowImage("Test", imgto);
		cvWaitKey(0);
		cvDestroyWindow("Test");
	}
	return black;
}

// Get matched source from all srcs, return NULL if no match
IplImage* GetSourceImage(IplImage* imgTemp, int *nMatch) {
	IplImage* imgSrc;
	int i;
	double tmp, max;
	CvPoint point = cvPoint(0, 0);
	CvPoint bestpoint = cvPoint(0, 0);

	for (i = 0; i < srcs_len; i++) {
		imgSrc = cvLoadImage(srcs[i]);
		tmp = MatchTemplate(imgSrc, imgTemp, &point);
		if (globalArgs.verbosity)
			printf("match rate of srcs[%d]=%f\n", i, tmp);

		cvReleaseImage(&imgSrc);
		if (tmp > max) {
			max = tmp;
			*nMatch = i;
			bestpoint.x = point.x;
			bestpoint.y = point.y;
		}
	}
	if (globalArgs.verbosity)
		printf("limit=%f max=%f maxi=%d\n", match_limit, max, *nMatch);

	imgSrc = cvLoadImage(srcs[*nMatch]);
	CvSize sizeTemp = cvGetSize(imgTemp);
	CvRect rcROI;
	rcROI.x = bestpoint.x;
	rcROI.y = bestpoint.y;
	rcROI.width = sizeTemp.width;
	rcROI.height = sizeTemp.height;
	if (globalArgs.verbosity)
		printf("ROI %d, %d, %d, %d\n", rcROI.x, rcROI.y, rcROI.width,
				rcROI.height);

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

void display_usage(void) {
	puts("moneymatch - A money match program.");

	exit(EXIT_FAILURE);
}

void getoptions(int argc, char *argv[]) {
	int opt = 0;

	/* Initialize globalArgs before we get to work. */
	globalArgs.verbosity = 0;
	globalArgs.inputFiles = NULL;
	globalArgs.numInputFiles = 0;
	opt = getopt(argc, argv, optString);
	while (opt != -1) {
		switch (opt) {
		case 'v':
			globalArgs.verbosity++;
			break;
		case 'h': /* fall-through is intentional */
		case '?':
			display_usage();
			break;
		default:
			/* You won't actually get here. */
			break;
		}
		opt = getopt(argc, argv, optString);
	}

	globalArgs.inputFiles = argv + optind;
	globalArgs.numInputFiles = argc - optind;
}

// 主程序
int main(int argc, char* argv[]) {
	// Get command line optins
	getoptions(argc, argv);

	// Load temp images to be matched
	IplImage* imgTemp = cvLoadImage(globalArgs.inputFiles[0]);

	// Get image from srcs[] which match temp image, and set ROI on it
	int nMatch;
	IplImage* imgSrc;
	if ((imgSrc = GetSourceImage(imgTemp, &nMatch)) == NULL) {
		if (globalArgs.verbosity)
			printf("[ERROR] Cannot match any temps. Abort.\n");

		return EXIT_FAILURE;
	}

	// Calculate match area of temp image
	int nMatchAreaSize = MatchAreaCount(imgSrc, imgTemp);

	// Calculate the change value
	int nChangeValue = ChangeValue(nMatchAreaSize, nMatch);
	if (globalArgs.verbosity) {
		printf(
				"MatchValue=%d YUAN\nMatchAreaRate=%f\nChangeValue = %d YUAN\n",
				full_value[nMatch],
				MatchAreaRate(nMatchAreaSize, nMatch),
				nChangeValue);
	}
	printf("%d", nChangeValue);
	cvReleaseImage(&imgSrc);
	cvReleaseImage(&imgTemp);

	return EXIT_SUCCESS;
}

// 查找边界
IplImage* FindContours(IplImage *img, CvMemStorage* storage, CvSeq* contours) {
	IplImage* pContourImg = NULL;
	// 为轮廓显示图像申请空间
	// 3通道图像，以便用彩色显示
	pContourImg = cvCreateImage(cvGetSize(img), IPL_DEPTH_8U, 3);
	// copy source image and convert it to BGR image
	cvCvtColor(img, pContourImg, CV_GRAY2BGR);
	// 查找contour
	cvFindContours(img, storage, &contours, sizeof(CvContour),
			CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE,
			cvPoint(0, 0));
	return pContourImg;
}

// 以点center为旋转中心，对src旋转angle度并缩放factor倍。
void RotateImage(IplImage *src, IplImage *dst, CvPoint center, float angle,
		float factor) {
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

// 传进来一个contour,然后计算它的最小包围矩形minRect，再把原图以包围矩形中心为旋转中心旋转minRect.angle°，得到调正的图像。
// http://blog.csdn.net/include1224/article/details/4384855
CvBox2D RegionRotate(IplImage *src, IplImage *dst, CvSeq *contour) {
	//dst 是通过cvClone()src得到的
	CvMat *mat_contour = cvCreateMat(1, contour->total, CV_32FC2); 	//双通道
	CvPoint2D32f *ptr_mat = (CvPoint2D32f*) (mat_contour->data.ptr);
	for (int i = 0; i != contour->total; ++i) {
		CvPoint *ptr_seq = (CvPoint*) (cvGetSeqElem(contour, i));
		*ptr_mat = cvPointTo32f(*ptr_seq); 			//显示把CvPoint转换成CvPoint2D32F
		ptr_mat++;
	} //把轮廓变成矩阵
	CvBox2D minRect = cvMinAreaRect2(mat_contour); 			//得到最小包围矩形
	//CvMat *rot = cvCreateMat(2,3,CV_32FC1);
	//cv2DRotationMatrix(cvPoint2D32f(src->width*0.5f,src->height*0.5f),minRect.angle,0.6,rot);//计算得到旋转矩阵----这里计算得到的矩阵不能使图像变换到想要的旋转结果
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
/*
 int main(int argc, char** argv) {
 // 声明IplImage指针
 IplImage* img = NULL;
 IplImage* pContourImg = NULL;
 CvMemStorage * storage = cvCreateMemStorage(0);
 CvSeq * contours = 0;

 // 创建窗口
 cvNamedWindow("contour", 1);
 // 载入图像，强制转化为Gray
 img = cvLoadImage(argv[1], 0);
 pContourImg = cvCreateImage(cvGetSize(img), IPL_DEPTH_8U, 3);
 // copy source image and convert it to BGR image
 cvCvtColor(img, pContourImg, CV_GRAY2BGR);
 // 查找contour
 cvFindContours(img, storage, &contours, sizeof(CvContour), CV_RETR_EXTERNAL,
 CV_CHAIN_APPROX_SIMPLE, cvPoint(0, 0));
 //pContourImg = FindContours(pImg, storage, contour);

 // 将轮廓画出
 cvDrawContours(pContourImg, contours, CV_RGB(0,0,255), CV_RGB(255, 0, 0), 2, 2, 8, cvPoint(0, 0));

 IplImage* pRotateImg = cvCreateImage(cvGetSize(pContourImg), IPL_DEPTH_8U, 3);
 RegionRotate(pContourImg, pRotateImg, contours);
 // 显示图像
 cvShowImage("contour", pContourImg);
 //cvShowImage("contour", pRotateImg);
 cvWaitKey(0);
 // 销毁窗口
 cvDestroyWindow("contour");
 // 释放图像
 cvReleaseImage(&img);
 cvReleaseImage(&pContourImg);
 cvReleaseImage(&pRotateImg);
 cvReleaseMemStorage(&storage);
 return 0;
 }
 */
