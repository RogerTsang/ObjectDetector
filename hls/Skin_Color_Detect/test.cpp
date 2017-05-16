#include "top.h"
#include "hls_opencv.h"
#include"iostream"
#include<time.h>
using namespace std;
using namespace cv;


int main (int argc, char** argv) {



    Mat src = imread("test.jpg");
    AXI_STREAM  src_axi, dst_axi;
    Mat dst(Size(640,480),CV_8UC3);

    resize(src,src,Size(640,480));
    //mat to axi video
    cvMat2AXIvideo(src, src_axi);
    //test function
    ImgProcess_Top(src_axi, dst_axi, 480, 640,0,255,80,135,131,185);
    //axi video to mat
    AXIvideo2cvMat(dst_axi, dst);

    imshow("src",src);
    imshow("dst_hls",dst);

    waitKey(0);

    return 0;
}
