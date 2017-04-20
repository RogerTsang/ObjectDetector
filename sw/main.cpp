#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <stdio.h>

using namespace cv;
using namespace std;

HoughCircleTransform

/** @function main */
int main(int argc, char** argv)
{
	Mat src, src_gray, src_gray_blur, src_edges;
    int medianBlurThres = 7;
    int cannyThres1 = 500;
    int cannyThres2 = 150;

	/// Read the image
	src = imread( argv[1], 1 );

	if( !src.data )
	{ return -1; }

	/// Convert it to gray
	cvtColor( src, src_gray, CV_BGR2GRAY );

	/// Reduce the noise so we avoid false circle detection
	medianBlur( src_gray, src_gray_blur, medianBlurThres);

    /// Apply Canny Edge detection on the image
    Canny(src_gray_blur, src_edges, cannyThres1, cannyThres2);

	/// Apply the Hough Transform to find the circles
	vector<Vec3f> circles;
	HoughCircles( src_gray, circles, CV_HOUGH_GRADIENT, 1, src_gray.rows/16, 200, 80, 1, 128 );

	cout << circles.size() << endl;
	/// Draw the circles detected
	for( size_t i = 0; i < circles.size(); i++ )
	{
		Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
		int radius = cvRound(circles[i][2]);
		// circle center
		circle( src, center, 3, Scalar(0,255,0), -1, 8, 0 );
		// circle outline
		circle( src, center, radius, Scalar(0,0,255), 3, 8, 0 );
	}

	/// Show your results
	// namedWindow( "Hough Circle Transform Demo", CV_WINDOW_AUTOSIZE );
	imshow(" Hough Circle", src );

	waitKey(0);
	return 0;
}
