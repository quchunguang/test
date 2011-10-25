/*
 * moneymatch.h
 *
 *  Created on: 2011-10-25
 *      Author: qcg
 */

#ifndef MONEYMATCH_H_
#define MONEYMATCH_H_

#include <opencv/cv.h>
#include <opencv/highgui.h>

#define __DEBUG__

/* moneymatch.cpp */
extern double MatchTemplate(IplImage* imgSrc, IplImage* imgTemp);
extern double SameAreaCount(IplImage* imgfrom, IplImage* imgto);
extern int GetSourceCount(IplImage* imgTemp);
extern double MatchAreaRate(int nMatchAreaSize, int nMatch);
extern int ChangeValue(int nMatchAreaSize, int nMatch);

/* regionretate.cpp */
extern void FindContours(IplImage *img, CvMemStorage* storage, CvSeq* contours);
extern void RotateImage(IplImage *src, IplImage *dst, CvPoint center, float angle, float factor);
extern CvBox2D RegionRotate(IplImage *src, IplImage *dst, CvSeq *contour);

#endif /* MONEYMATCH_H_ */
