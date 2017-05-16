#ifndef ___IMAGEPROCESS__
#define ___IMAGEPROCESS__
#include "top.h"

u1 rgb2ycbcr(u8 B, u8 G, u8 R, int y_lower, int y_upper, int cb_lower, int cb_upper, int cr_lower, int cr_upper)
{
#pragma HLS PIPELINE
    u8 y, cr, cb;
    y = (76 * R.to_int() + 150 * G.to_int() + 29 * B.to_int()) >> 8;
    cb = 128 + ((128*B.to_int() -43*R.to_int() - 85*G.to_int())>>8);
    cr = 128 + ((128*R.to_int() -107*G.to_int() - 21 * B.to_int())>>8);

    if (y > y_lower && y < y_upper && cb > cb_lower && cb < cb_upper
            && cr > cr_lower && cr < cr_upper)
         return 1;
    else
         return 0;
}

namespace hls {
template<int SRC_T, int DST_T,int ROW, int COL>
void ImgProcess(Mat<ROW, COL, SRC_T> &_src, Mat<ROW, COL, DST_T>    &_dst,
        int y_lower,int y_upper,int cb_lower,int cb_upper,int cr_lower,int cr_upper)
{
    loop_height: for(HLS_SIZE_T i= 0;i< ROW;i++)
    {
    #pragma HLS LOOP_TRIPCOUNT max=ROW
        loop_width: for (HLS_SIZE_T j= 0;j< COL;j++)
        {
        #pragma HLS LOOP_FLATTEN OFF
        #pragma HLS LOOP_TRIPCOUNT max=COL
        #pragma HLS DEPENDENCE array inter false
        #pragma HLS PIPELINE
            u8 r, g, b;
            u1 skin_region;

            HLS_TNAME(SRC_T) temp0=0;
            HLS_TNAME(SRC_T) temp1=0;
            HLS_TNAME(SRC_T) temp2=0;
            /***********stream input *********/
            _src.data_stream[0]>>temp0;
            _src.data_stream[1]>>temp1;
            _src.data_stream[2]>>temp2;

            b = temp0;
            g = temp1;
            r = temp2;
            /********detect skin region*******/
            skin_region = rgb2ycbcr(b, g, r,y_lower,y_upper,cb_lower,cb_upper,cr_lower,cr_upper);
            HLS_TNAME(DST_T) temp_dst0=0;
            HLS_TNAME(DST_T) temp_dst1=0;
            HLS_TNAME(DST_T) temp_dst2=0;

            temp_dst0= (skin_region == 1)? b : (u8)0;
            temp_dst1= (skin_region == 1)? g : (u8)0;
            temp_dst2= (skin_region == 1)? r : (u8)0;

            /***********stream output ********/
            _dst.data_stream[0]<<temp_dst0;
            _dst.data_stream[1]<<temp_dst1;
            _dst.data_stream[2]<<temp_dst2;

        }
    }
}



template<int SRC_T, int DST_T,int ROW, int COL>
void SkinColorDetect(Mat<ROW, COL, SRC_T> &_src,Mat<ROW, COL, DST_T> &_dst,
        int y_lower,int y_upper,int cb_lower,int cb_upper,int cr_lower,int cr_upper)
{
#pragma HLS INLINE
    ImgProcess(_src, _dst, y_lower, y_upper, cb_lower, cb_upper, cr_lower, cr_upper);
}

}

#endif
