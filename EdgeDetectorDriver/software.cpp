#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <cmath>
#include <iostream>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#define M_PI 3.14159265358979323846

using namespace cv;
using namespace std;

// Constant image information
const int MAX_WIDTH = 256;
const int MAX_HEIGHT = 256;

// Hough Circle transformation function declaration
void ImgProcess_Top(Mat src, Mat dst, int rows, int cols, int threshold, char *filename);
void ImgProcess(unsigned char _src[65536], unsigned char _out[65536], unsigned char _dir[65536], int width, int height);
void ImgPostProcess(unsigned char _src[65536], unsigned char _dir[65536], unsigned char _dst[65536], int threashold, int width, int height);

void HoughProcess(unsigned char _src[65536], unsigned char _dst[65536], int width, int height);
void Transform(unsigned char img_edges[65536], unsigned short img_accu[65536], int w, int h, int r);
bool doTransformCircle(unsigned char edge[65536], double percentage, int minRadius, int maxRadius, int step);

/** @function main */
int main(int argc, char** argv)
{
    if (argc < 2) {
        cerr << "Usage: ./software <image-name>" << endl;
        return 0;
    }

    // Initialize
    cout << "Initialise software for " << argv[1] << endl;
    Mat src = imread(argv[1], CV_LOAD_IMAGE_GRAYSCALE);
    Mat dst = Mat::zeros(256, 256, CV_8U);

    // Resize image to fit the IP core
    resize(src, src, Size(MAX_WIDTH, MAX_HEIGHT));

    // Execute Image Processing
    cout << "Start Processing " << argv[1] << "..." << endl;
    ImgProcess_Top(src, dst, MAX_HEIGHT, MAX_WIDTH, 90, argv[1]);

    return 0;
}

void ImgProcess_Top(Mat src, Mat dst, int rows, int cols, int threshold, char *filename) {
    Mat _src_blur = Mat::zeros(256, 256, CV_8U);
    Mat _temp = Mat::zeros(256, 256, CV_8U);
    Mat _dir = Mat::zeros(256, 256, CV_8U);
    Mat _out = Mat::zeros(256, 256, CV_8U);

    GaussianBlur(src, _src_blur, Size(3, 3), 0, 0);
    ImgProcess(_src_blur.data, _temp.data, _dir.data, 256, 256);
    ImgPostProcess(_temp.data, _dir.data, _out.data, threshold, 256, 256);
    HoughProcess(_out.data, dst.data, 256, 256);

#ifdef DEBUG
    imwrite("_src_blur.bmp", _src_blur);
    imwrite("_temp.bmp", _temp);
    imwrite("_dir.bmp", _dir);
    imwrite("_out.bmp", _out);
#endif

    cout << "Finish Processing " << filename << endl;
    char dstin_file[32];
    strcpy(dstin_file, "dst_");
    strcat(dstin_file, filename);
    cout << "Writing Result " << dstin_file << endl;
    imwrite(dstin_file, dst);

    /* Stack corruption on return
     * Therefore, Early exit
     */
    exit(0);
}

/* Do the Hough Circle Transform on the image */
void Transform(unsigned char img_edges[65536],
    unsigned short img_accu[65536],
    int w, int h, int r) {

    // Clear out accumulator
    for (int i = 0; i < MAX_WIDTH * MAX_HEIGHT; i++) {
        img_accu[i] = 0;
    }

    // Loop through each pixel for image voting
    for (int y = 0; y < h; y++)
    {
        for (int x = 0; x < w; x++)
        {
            if (img_edges[(y*w) + x] > 250)
            {
                // Search for pixel 360 degree
                for (int t = 0; t < 360; t++)
                {
                    int a = ((double)x - ((double)r * cos((double)t * 0.017453293f)));
                    int b = ((double)y - ((double)r * sin((double)t * 0.017453293f)));

                    if ((b >= 0 && b < h) && (a >= 0 && a < w)) {
                        img_accu[(b * w) + a]++;
                    }
                }
            }
        }
    }
}

/* Get number of circles in the image */
int GetCircles(unsigned short(&img_accu)[65536],
    int w, int h, int r, int threshold)
{
    int found = 0;

    for (int b = 0; b < h; b++)
    {
        for (int a = 0; a < w; a++)
        {
            if ((int)img_accu[(b * w) + a] >= threshold)
            {
                // Is this point a local maxima (9x9)
                int max = img_accu[(b * w) + a];
                for (int ly = -4; ly <= 4; ly++)
                {
                    for (int lx = -4; lx <= 4; lx++)
                    {
                        if ((ly + b >= 0 && ly + b < h) && (lx + a >= 0 && lx + a < w))
                        {
                            if ((int)img_accu[((b + ly) * w) + (a + lx)] > max)
                            {
                                max = img_accu[((b + ly) * w) + (a + lx)];
                                ly = lx = 5;
                            }
                        }
                    }
                }

                if (max > (int)img_accu[(b * w) + a]) {
                    continue;
                }
                else {
                    found++;
                }
            }
        }
    }

    return found;
}

bool doTransformCircle(unsigned char edge[65536], double percentage, int minRadius, int maxRadius, int step)
{
    int result = 0;
    unsigned short accu[65536];
    for (int r = minRadius; r <= maxRadius; r += step)
    {
        Transform(edge, accu, MAX_WIDTH, MAX_HEIGHT, r);

        // percentage of the pixel need to fit to count it as a circle
        int thres = percentage * (2.0 * (double)r * M_PI);

        // get circles from vote
        int ncircles = GetCircles(accu, MAX_WIDTH, MAX_HEIGHT, r, thres);
        result += ncircles;
    }

    return result > 0;
}

void HoughProcess(unsigned char _src[65536], unsigned char _dst[65536], int width, int height) {

    const int minRadius = 20;       /* Minimum radius to start searching */
    const int maxRadius = 120;      /* Maximum radius to end searching */
    const int step = 10;            /* Step of radius while searching */
    const double percentage = 0.75; /* Percentage of pixel need to fit to regard it as a circle */

    bool has_circle = doTransformCircle(_src, percentage, minRadius, maxRadius, step);

    /* Write out the data */
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            if (has_circle && (i == 1 || i == height - 2 || j == 1 || j == height - 2)) {
                _dst[i*width + j] = 150;
            }
            else if ((!has_circle) && (i == j || i == width - j)) {
                _dst[i*width + j] = 150;
            }
            else {
                _dst[i*width + j] = _src[i*width + j];
            }
        }
    }
    return;
}

int sobel_operation(unsigned char data[9], unsigned char *dir) {
    int x_dir = 0;
    int y_dir = 0;
    int Gx[3][3] = { { -1, 0, 1 },{ -2, 0, 2 },{ -1, 0, 1 } };
    int Gy[3][3] = { { -1, -2, -1 },{ 0, 0, 0 },{ 1, 2, 1 } };
    for (int rowOffset = 0; rowOffset < 3; rowOffset++) {
        for (int colOffset = 0; colOffset < 3; colOffset++) {
            x_dir = x_dir + data[rowOffset * 3 + colOffset] * Gx[rowOffset][colOffset];
            y_dir = y_dir + data[rowOffset * 3 + colOffset] * Gy[rowOffset][colOffset];
        }
    }

    int abs_y = std::abs(y_dir);
    int abs_x = std::abs(x_dir);
    int val = abs_y + abs_x;
    if (2 * abs_x < abs_y) {
        *dir = 0;//south north
    }
    else if (abs_x > 2 * abs_y) {
        *dir = 1;//east west
    }
    else {
        if ((x_dir > 0 && y_dir < 0) || (x_dir < 0 && y_dir > 0)) {
            *dir = 2;//NW SE
        }
        else {
            *dir = 3;//NE SW
        }
    }
    return val;
}

unsigned char local_max(unsigned char data[9], unsigned char dir[9], int threshold) {
    int temp = 0;
    int pix_dir = dir[1 * 3 + 1];
    if (pix_dir == 0) {
        if (data[1 * 3 + 1] > data[0 * 3 + 1] && data[1 * 3 + 1] > data[2 * 3 + 1]) {
            temp = data[1 * 3 + 1];
        }
    }
    else if (pix_dir == 1) {
        if (data[1 * 3 + 1] > data[1 * 3 + 0] && data[1 * 3 + 1] > data[1 * 3 + 2]) {
            temp = data[1 * 3 + 1];
        }
    }
    else if (pix_dir == 2) {
        if (data[1 * 3 + 1] > data[2 * 3 + 2] && data[1 * 3 + 1] > data[0 * 3 + 0]) {
            temp = data[1 * 3 + 1];
        }
    }
    else {
        if (data[1 * 3 + 1] > data[2 * 3 + 0] && data[1 * 3 + 1] > data[0 * 3 + 2]) {
            temp = data[1 * 3 + 1];
        }
    }

    return temp > threshold ? 255 : 0;
}

void ImgProcess(unsigned char _src[65536],
    unsigned char _out[65536],
    unsigned char _dir[65536],
    int width,
    int height) {

    unsigned char sw[9]; // image data
    unsigned char edge_weight;

    for (int q = 0; q < height + 1; q++) {
        for (int p = 0; p < width + 1; p++) {
            if (q > 1 && q < height - 1 && p > 1 && p < width - 1) {
                sw[0] = _src[(q - 1)*width + (p - 1)];
                sw[1] = _src[(q - 1)*width + (p)];
                sw[2] = _src[(q - 1)*width + (p + 1)];
                sw[3] = _src[(q)*width + (p - 1)];
                sw[4] = _src[(q)*width + (p)];
                sw[5] = _src[(q)*width + (p + 1)];
                sw[6] = _src[(q + 1)*width + (p - 1)];
                sw[7] = _src[(q + 1)*width + (p)];
                sw[8] = _src[(q + 1)*width + (p + 1)];
                edge_weight = sobel_operation(sw, &_dir[q*width + p]);
            }
            else {
                edge_weight = 0;
            }

            if (q > 0 && p > 0) {
                _out[q*width + p] = edge_weight;
            }
        }
    }
}

void ImgPostProcess(unsigned char _src[65536],
    unsigned char _dir[65536],
    unsigned char _dst[65536],
    int threashold,
    int width,
    int height) {

    unsigned char edge_weight;
    unsigned char sw[9]; // image data
    unsigned char dw[9]; // direction data

    for (int q = 0; q < height + 1; q++) {
        for (int p = 0; p < width + 1; p++) {
            if (q > 1 && q < height && p > 1 && p < width) {
                sw[0] = _src[(q - 1)*width + (p - 1)];
                sw[1] = _src[(q - 1)*width + (p)];
                sw[2] = _src[(q - 1)*width + (p + 1)];
                sw[3] = _src[(q)*width + (p - 1)];
                sw[4] = _src[(q)*width + (p)];
                sw[5] = _src[(q)*width + (p + 1)];
                sw[6] = _src[(q + 1)*width + (p - 1)];
                sw[7] = _src[(q + 1)*width + (p)];
                sw[8] = _src[(q + 1)*width + (p + 1)];
                dw[0] = _dir[(q - 1)*width + (p - 1)];
                dw[1] = _dir[(q - 1)*width + (p)];
                dw[2] = _dir[(q - 1)*width + (p + 1)];
                dw[3] = _dir[(q)*width + (p - 1)];
                dw[4] = _dir[(q)*width + (p)];
                dw[5] = _dir[(q)*width + (p + 1)];
                dw[6] = _dir[(q + 1)*width + (p - 1)];
                dw[7] = _dir[(q + 1)*width + (p)];
                dw[8] = _dir[(q + 1)*width + (p + 1)];
                edge_weight = local_max(sw, dw, threashold);
            }
            else {
                edge_weight = 0;
            }

            if (q > 0 && p > 0) {
                _dst[(q - 1)*width + (p - 1)] = edge_weight;
            }
        }
    }
}
