/*  For description look into the help() function. */

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include "imgprocess.hpp"

#define IMAGE_WIDTH 256
#define IMAGE_HEIGHT 256
#define IMAGE_DEPTH 24

using namespace std;
using namespace cv;

int ImgProcess_Top(Mat src,Mat **dst,int rows, int cols,int threshold){
    int result = Setup_HW_Accelerator(rows, cols,threshold);
    if (result != 0) return -1;
    if(!src.isContinuous()) src=src.clone();
    void * buffer = malloc(rows*cols*3);
    result = Run_HW_Accelerator(src.data,buffer, cols,rows);

    *dst = new Mat(rows, cols, CV_8UC3, buffer);
    if (result != 0) return -2;
    return 0;
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        cerr << "Usage: ./main <image-name>" << endl;
        return 0;
    }

	// Initialize
    cout << "Initialise device for " << argv[1] << endl;
	init();
	Mat src = imread(argv[1], CV_LOAD_IMAGE_COLOR);
	Mat *dst;

    // Resize image to fit the IP core
	resize(src, src, Size(IMAGE_WIDTH, IMAGE_HEIGHT));

    // Execute Image Processing
    cout << "Start Processing " << argv[1] << "..." << endl;
	int err = ImgProcess_Top(src, &dst, IMAGE_HEIGHT, IMAGE_WIDTH, 90);
	if (err < 0) {
        cerr << "Image Process Failed" << endl;
		return -1;
    }
    cout << "Finish Processing " << argv[1] << endl;

    char destin_file[32]; strcpy(destin_file, "dst_"); strcat(destin_file, argv[1]);

    cout << "Writing Result " << destin_file << endl;
	imwrite(destin_file, *dst);

	return 0;
}
