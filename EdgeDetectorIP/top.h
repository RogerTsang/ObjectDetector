#ifndef __TOP_H____
#define __TOP_H____

#include "hls_video.h"

#define u8 ap_uint<8>
#define u1 ap_uint<1>
#define MAX_WIDTH 256
#define MAX_HEIGHT 256

typedef hls::stream<ap_axiu<24,1,1,1> > AXI_STREAM;
typedef hls::Mat<MAX_HEIGHT, MAX_WIDTH, HLS_8UC3> RGB_IMAGE;
typedef hls::Mat<MAX_HEIGHT, MAX_WIDTH, HLS_8UC1> GRAY_IMAGE;
void EdgeDetect_Top(AXI_STREAM& input, AXI_STREAM& output,int rows,int cols,int threashold);

#endif
