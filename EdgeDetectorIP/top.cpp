#include "top.h"
#include "imgprocess.h"

void EdgeDetect_Top(AXI_STREAM& input, AXI_STREAM& output,int rows, int cols,int threashold)
{

    #pragma HLS RESOURCE variable=input core=AXIS metadata="-bus_bundle INPUT_STREAM"
    #pragma HLS RESOURCE variable=output core=AXIS metadata="-bus_bundle OUTPUT_STREAM"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=rows metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=cols metadata="-bus_bundle CONTROL_BUS"
	#pragma HLS RESOURCE core=AXI_SLAVE variable=threashold metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=return metadata="-bus_bundle CONTROL_BUS"

    #pragma HLS INTERFACE ap_stable port=rows
    #pragma HLS INTERFACE ap_stable port=cols

    RGB_IMAGE  src_mat(rows,cols);
    RGB_IMAGE  dst_mat(rows,cols);
    RGB_IMAGE  b_src_mat(rows,cols);

    GRAY_IMAGE g_src_mat(rows,cols);
    GRAY_IMAGE g_dir_mat(rows,cols);
    GRAY_IMAGE g_temp_mat(rows,cols);
    GRAY_IMAGE g_dst_mat(rows,cols);

    unsigned char temp[65536];
    #pragma HLS dataflow

    hls::AXIvideo2Mat(input, src_mat);
    hls::GaussianBlur<3,3>(src_mat, b_src_mat);
    hls::CvtColor<HLS_RGB2GRAY>(b_src_mat, g_src_mat);
    hls::ImgProcess(g_src_mat, g_temp_mat, g_dir_mat, cols, rows);
    hls::ImgPostProcess(g_temp_mat, g_dir_mat, temp, threashold, cols, rows);
    hls::HoughProcess(temp, g_dst_mat, cols, rows);
    hls::CvtColor<HLS_GRAY2RGB>(g_dst_mat, dst_mat);
    hls::Mat2AXIvideo(dst_mat, output);
}
