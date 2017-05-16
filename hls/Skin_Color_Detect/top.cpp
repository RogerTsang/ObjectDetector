#include "top.h"
#include "imgprocess.h"
#include <string.h>

void ImgProcess_Top(AXI_STREAM& input, AXI_STREAM& output,int rows, int cols,
        int y_lower,int y_upper,int cb_lower,int cb_upper,int cr_lower,int cr_upper)
{
    #pragma HLS RESOURCE variable=input core=AXIS metadata="-bus_bundle INPUT_STREAM"
    #pragma HLS RESOURCE variable=output core=AXIS metadata="-bus_bundle OUTPUT_STREAM"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=rows metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=cols metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=y_lower metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=y_upper metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=cb_lower metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=cb_upper metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=cr_lower metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=cr_upper metadata="-bus_bundle CONTROL_BUS"
    #pragma HLS RESOURCE core=AXI_SLAVE variable=return metadata="-bus_bundle CONTROL_BUS"

    #pragma HLS INTERFACE ap_stable port=rows
    #pragma HLS INTERFACE ap_stable port=cols
    #pragma HLS INTERFACE ap_stable port=y_lower
    #pragma HLS INTERFACE ap_stable port=y_upper
    #pragma HLS INTERFACE ap_stable port=cb_lower
    #pragma HLS INTERFACE ap_stable port=cb_upper
    #pragma HLS INTERFACE ap_stable port=cr_lower
    #pragma HLS INTERFACE ap_stable port=cr_upper
    RGB_IMAGE  src_mat(rows,cols);
    RGB_IMAGE  dst_mat(rows,cols);
    #pragma HLS dataflow
    hls::AXIvideo2Mat(input, src_mat);
    SkinColorDetect(src_mat,dst_mat, y_lower, y_upper, cb_lower, cb_upper, cr_lower, cr_upper);
    hls::Mat2AXIvideo(dst_mat, output);
}
