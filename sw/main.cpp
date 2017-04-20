#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <cmath>
#include <iostream>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

using namespace cv;
using namespace std;

// Constant image information
const int BITMAP_WIDTH = 256;
const int BITMAP_HEIGHT = 256;
const int BITMAP_DEPTH = 24;

// Hough Circle transformation function declaration
int Transform(unsigned char *img_edges, int w, int h, int r);
const unsigned int* GetAccu(int *w, int *h);
int GetCircles(int threshold, std::vector< std::pair< std::pair<int, int>, int> >& result);
bool doTransformCircle(Mat edge, double percentage, int minRadius, int maxRadius, int step);

// Variables for storing the temporary data
unsigned int _accu[BITMAP_WIDTH * BITMAP_HEIGHT];
int _accu_w;
int _accu_h;
int _img_w;
int _img_h;
int _r;

/** @function main */
int main(int argc, char** argv)
{

    Mat src, src_gray, src_gray_blur, src_edges;
    int medianBlurThres = 7;
    int cannyThres1 = 500;
    int cannyThres2 = 150;
    int minRadius = 20;       /* Minimum radius to start searching */
    int maxRadius = 120;      /* Maximum raduis to end searching */
    int step = 10;            /* Step of radius while searching */
    double percentage = 0.75; /* Percentage of pixel need to fit to regard it as a circle */

	// Read the image
	src = imread(argv[1], 1);

	if( !src.data )
	{ return -1; }

	// Convert it to gray
	cvtColor( src, src_gray, CV_BGR2GRAY );

	// Reduce the noise so we avoid false circle detection
	medianBlur( src_gray, src_gray_blur, medianBlurThres);

    // Apply Canny Edge detection on the image
    Canny(src_gray_blur, src_edges, cannyThres1, cannyThres2);

	// Apply the Hough Transform to find the circles
    bool hasCircle =  doTransformCircle(src_edges, percentage, minRadius, maxRadius, step);
    cout << argv[1] << " " << hasCircle << endl;
    // imshow("Edge", src_edges);
    waitKey(0);
    return 0;

    //============================================================================
    /*
	// Apply the Hough Transform to find the circles
	vector<Vec3f> circles;
	HoughCircles( src_gray, circles, CV_HOUGH_GRADIENT, 1, src_gray.rows/16, 200, 80, minRadius, maxRadius);

	cout << circles.size() << endl;
	// Draw the circles detected
	for( size_t i = 0; i < circles.size(); i++ )
	{
		Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
		int radius = cvRound(circles[i][2]);
		// circle center
		circle( src, center, 3, Scalar(0,255,0), -1, 8, 0 );
		// circle outline
		circle( src, center, radius, Scalar(0,0,255), 3, 8, 0 );
	}

	// Show your results
	imshow(" Hough Circle", src );

	waitKey(0);
	return 0;
    */
}

/* Do the Hough circle transformation on the image */
int Transform(unsigned char *img_edges, int w, int h, int r) {
    // Store the variables for finding circles
    _r = r;
    _img_w = w;
    _img_h = h;
    _accu_h = h;
    _accu_w = w;

    // Clear out accumulator
    for (int i = 0; i < BITMAP_WIDTH * BITMAP_HEIGHT; i++) {
        _accu[i] = 0;
    }

    // Loop through each pixel for image voting
    for(int y = 0; y < h; y++)
    {
        for(int x = 0; x < w; x++)
        {
            if(img_edges[(y*w) + x] > 250)
            {
                // Search for pixel 360 degree
                for(int t = 0; t < 360; t++)
                {
                    int a = ((double)x - ((double)_r * cos((double)t * 0.017453293f)));
                    int b = ((double)y - ((double)_r * sin((double)t * 0.017453293f)));

                    if((b >= 0 && b < _accu_h) && (a >= 0 && a < _accu_w)) {
                        _accu[(b * _accu_w) + a]++;
                    }
                }
            }
        }
    }
}

/* Get accumulator data */
const unsigned int* GetAccu(int *w, int *h)
{
    *w = _accu_w;
    *h = _accu_h;
    return _accu;
}

/* Get number of circles in the image */
int GetCircles(int threshold, std::vector< std::pair< std::pair<int, int>, int> >& result)
{
    int found = 0;

    for(int b = 0; b < _accu_h; b++)
    {
        for(int a = 0; a < _accu_w; a++)
        {
            if((int)_accu[(b * _accu_w) + a] >= threshold)
            {
                // Is this point a local maxima (9x9)
                int max = _accu[(b * _accu_w) + a];
                for(int ly = -4; ly <= 4; ly++)
                {
                    for(int lx = -4; lx <= 4; lx++)
                    {
                        if((ly + b >= 0 && ly + b < _accu_h) && (lx + a >= 0 && lx + a < _accu_w))
                        {
                            if((int)_accu[((b + ly) * _accu_w) + (a + lx)] > max)
                            {
                                max = _accu[((b + ly) * _accu_w) + (a + lx)];
                                ly = lx = 5;
                            }
                        }
                    }
                }

                if(max > (int)_accu[(b * _accu_w) + a])
                    continue;

                result.push_back(std::pair< std::pair<int, int>, int>(std::pair<int, int>(a,b), _r));
                found++;
            }
        }
    }

    return found;
}

/* do transformation */
bool doTransformCircle(Mat edge, double percentage, int minRadius, int maxRadius, int step)
{
	// Transform
	std::vector< std::pair< std::pair<int, int>, int> > circles;
    int w = BITMAP_WIDTH;
    int h = BITMAP_HEIGHT;

    int result = 0;
	for(int r = minRadius; r <= maxRadius; r += step)
	{
        Transform(edge.data, w, h, r);

        // percentage of the pixel need to fit to count it as a circle
        int thres = percentage * (2.0 * (double)r * M_PI);

        // get circles from vote
        int ncircles = GetCircles(thres, circles);
        // cout << "Circles: " << ncircles << " at radius: " << r << endl;

        result += ncircles;
    }

    return result > 0;
}
