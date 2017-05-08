/*  For description look into the help() function. */

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include "imgprocess.hpp"


using namespace std;
using namespace cv;

int ImgProcess_Top(Mat src,Mat **dst,int rows, int cols,int threshold){
    int result = Setup_HW_Accelerator(rows, cols,threshold);
    if (result != 0) return -1;
    if(!src.isContinuous()) src=src.clone();
    void * buffer = malloc(480*640*3);
    result = Run_HW_Accelerator(src.data,buffer, 640,480);

    *dst = new Mat(480, 640, CV_8UC3, buffer );
    if (result != 0) return -2;
    return 0;
}

int main(int, char**) {
	//Initialize
	init();

	Mat src = imread("test.jpg", CV_LOAD_IMAGE_COLOR);
	//AXI_STREAM src_axi, dst_axi;
	Mat *dst;

	resize(src, src, Size(640, 480));

	int err = ImgProcess_Top(src, &dst, 480, 640, 90);
	if (err < 0)
		return -1;

	imwrite("src.jpg", src);
	imwrite("dst_hls.jpg", *dst);

	waitKey(0);

	return 0;
}


