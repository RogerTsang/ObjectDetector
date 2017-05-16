#ifndef __TOP_H____
#define __TOP_H____
#include "hls_video.h"
#define u8 ap_uint<8>
#define u1 ap_uint<1>
#define MAX_WIDTH 640
#define MAX_HEIGHT 480


typedef hls::stream<ap_axiu<32,1,1,1> > AXI_STREAM;
typedef hls::Mat<MAX_HEIGHT, MAX_WIDTH, HLS_8UC3> RGB_IMAGE;

void ImgProcess_Top(AXI_STREAM& input, AXI_STREAM& output,int rows, int cols,
int y_lower,int y_upper,int cb_lower,int cb_upper,int cr_lower,int cr_upper);

#endif
