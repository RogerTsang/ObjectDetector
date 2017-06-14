#include "top.h"
#include "hls_opencv.h"
#include "iostream"
#include <time.h>
using namespace std;
using namespace cv;


int main (int argc, char** argv) {

    Mat src = imread("test.bmp");
    AXI_STREAM  src_axi, dst_axi;
    Mat dst(Size(MAX_HEIGHT,MAX_WIDTH),CV_8UC3);

    resize(src,src,Size(MAX_HEIGHT, MAX_WIDTH));

    //mat to axi video
    cvMat2AXIvideo(src, src_axi);

    //test function
    printf("Before Edge Detect_Top\n");
    EdgeDetect_Top(src_axi, dst_axi, MAX_HEIGHT, MAX_WIDTH, 60);
    printf("After Edge Detect_Top\n");
    //axi video to mat
    AXIvideo2cvMat(dst_axi, dst);
    printf("Before Image Show\n");
    imshow("src_img",src);
    imshow("dst_img",dst);
    printf("After Image Show\n");
    waitKey(0);

    return 0;
}
