#ifndef ___IMAGEPROCESS__
#define ___IMAGEPROCESS__
#include "top.h"
#include <cmath>

typedef hls::Window<3, 3, unsigned char> S_WINDOW;
typedef hls::LineBuffer<3, MAX_WIDTH, unsigned char> S_BUFFER;
typedef hls::Window<3, 3, int> ST_WINDOW;
typedef hls::LineBuffer<3, MAX_WIDTH, int> ST_BUFFER;

namespace hls {

/* Do the Hough Circle Transform on the image */
void Transform(unsigned char (&img_edges)[65536],
		       unsigned short (&img_accu)[65536],
		       int w, int h, int r) {

    // Clear out accumulator
    clear_loop: for (int i = 0; i < MAX_WIDTH * MAX_HEIGHT; i++) {
    	img_accu[i] = 0;
    }

    // Loop through each pixel for image voting
    for(int y = 0; y < h; y++)
    {
    	for(int x = 0; x < w; x++)
        {
            if(img_edges[(y*w) + x] > 250)
            {
                // Search for pixel 360 degree
                lookup_loop: for(int t = 0; t < 360; t++)
                {
                    int a = ((float)x - ((float)r * hls::cosf((float)t * 0.017453293f)));
                    int b = ((float)y - ((float)r * hls::sinf((float)t * 0.017453293f)));

                    if((b >= 0 && b < h) && (a >= 0 && a < w)) {
                    	img_accu[(b * w) + a]++;
                    }
                }
            }
        }
    }
}

/* Get number of circles in the image */
int GetCircles(unsigned short (&img_accu)[65536],
			   int w, int h, int r, int threshold)
{
    int found = 0;

    for(int b = 0; b < h; b++)
    {
        for(int a = 0; a < w; a++)
        {
            if((int)img_accu[(b * w) + a] >= threshold)
            {
                // Is this point a local maxima (9x9)
                int max = img_accu[(b * w) + a];
                get_circles_loop: for(int ly = -4; ly <= 4; ly++)
                {
                    for(int lx = -4; lx <= 4; lx++)
                    {
                        if((ly + b >= 0 && ly + b < h) && (lx + a >= 0 && lx + a < w))
                        {
                            if((int)img_accu[((b + ly) * w) + (a + lx)] > max)
                            {
                                max = img_accu[((b + ly) * w) + (a + lx)];
                                ly = lx = 5;
                            }
                        }
                    }
                }

                if(max > (int)img_accu[(b * w) + a]) {
                    continue;
                } else {
                    found++;
                }
            }
        }
    }

    return found;
}

bool doTransformCircle(unsigned char (&edge)[65536], double percentage, int minRadius, int maxRadius, int step)
{
    int result = 0;
    unsigned short accu[65536];
	radius_loop: for(int r = minRadius; r <= maxRadius; r += step)
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

template<int DST_T, int ROW, int COL>
void HoughProcess(unsigned char (&_src)[65536],
				  hls::Mat<ROW, COL, DST_T> &_dst,
				  int width,
				  int height) {

    const int minRadius = 20;       /* Minimum radius to start searching */
    const int maxRadius = 120;      /* Maximum radius to end searching */
    const int step = 10;            /* Step of radius while searching */
    const double percentage = 0.75; /* Percentage of pixel need to fit to regard it as a circle */

	bool has_circle = doTransformCircle(_src, percentage, minRadius, maxRadius, step);

	/* Write out the data */
	for (int i = 0; i < height; i++) {
		for (int j = 0; j < width; j++) {
			if (has_circle && (i == 1 || i == height - 2 || j == 1 || j == height - 2)) {
				_dst.data_stream[0] << 150;
			} else if ((!has_circle) && (i == j || i == width - j)) {
				_dst.data_stream[0] << 150;
			} else {
				_dst.data_stream[0] << _src[i*width+j];
			}
		}
	}
	return;
}

int sobel_operation(S_WINDOW data, unsigned char *dir) {
	int x_dir = 0;
	int y_dir = 0;
	int Gx[3][3] = { { -1, 0, 1 }, { -2, 0, 2 }, { -1, 0, 1 } };
#pragma HLS ARRAY_PARTITION variable=Gx complete dim=2
	int Gy[3][3] = { { -1, -2, -1 }, { 0, 0, 0 }, { 1, 2, 1 } };
#pragma HLS ARRAY_PARTITION variable=Gy complete dim=2

	kernel_x: for (int rowOffset = 0; rowOffset < 3; rowOffset++) {
		kernel_y: for (int colOffset = 0; colOffset < 3; colOffset++) {

			x_dir = x_dir
					+ data.getval(rowOffset, colOffset)
							* Gx[rowOffset][colOffset];
			y_dir = y_dir
					+ data.getval(rowOffset, colOffset)
							* Gy[rowOffset][colOffset];
		}
	}
	int abs_y = hls::abs(y_dir);
	int abs_x = hls::abs(x_dir);
	int val = abs_y + abs_x;
	if (2*abs_x < abs_y){
		*dir = 0;//south north
	}	else if (abs_x > 2*abs_y){
		*dir = 1;//east west
	}	else {
		if ((x_dir > 0 && y_dir < 0) || (x_dir < 0 && y_dir > 0)){
			*dir = 2;//NW SE
		}	else{
			*dir = 3;//NE SW
		}
	}
	return val;
}

unsigned char local_max(ST_WINDOW data, S_WINDOW dir,int threshold) {
	int temp = 0;
	int pix_dir = dir.getval(1,1);
	if (pix_dir == 0){
		if (data.getval(1,1) > data.getval(0,1) && data.getval(1,1) > data.getval(2,1)){
			temp = data.getval(1,1);
		}
	}	else if (pix_dir == 1){
		if (data.getval(1,1) > data.getval(1,0) && data.getval(1,1) > data.getval(1,2)){
			temp = data.getval(1,1);
		}
	}	else if (pix_dir == 2){
		if (data.getval(1,1) > data.getval(2,2) && data.getval(1,1) > data.getval(0,0)){
			temp = data.getval(1,1);
		}
	}	else{
		if (data.getval(1,1) > data.getval(2,0) && data.getval(1,1) > data.getval(0,2)){
			temp = data.getval(1,1);
		}
	}

	return temp > threshold ? 255:0;
}

template<int SRC_T, int DST_T,int TEMP_T, int ROW, int COL>
void ImgProcess(hls::Mat<ROW, COL, SRC_T> &_src,
				hls::Mat<ROW, COL, TEMP_T> &_temp,
				hls::Mat<ROW, COL, DST_T> &_dir,
				int width,
				int height) {

	S_WINDOW sw; //image data
	S_BUFFER lb; //line buffer

	loop_height: for (HLS_SIZE_T q = 0; q < height + 1; q++) {
		loop_width: for (HLS_SIZE_T p = 0; p < width + 1; p++) {
			HLS_TNAME(SRC_T)temp1;
			HLS_TNAME(SRC_T) temp2;

			if (p < width) {
				temp1 = lb.getval(0,p);
				lb.shift_down(p);
			}

			if(q < height && p < width) {
				_src.data_stream[0] >> temp2;
				lb.insert_bottom(temp2,p);
			}
			sw.shift_right();
			if (p < width) {
				sw.insert(lb.getval(2,p),2,0);
				sw.insert(temp1,1,0);
				sw.insert(temp2,0,0);
			}

			HLS_TNAME(TEMP_T) edge_weight;
			HLS_TNAME(DST_T) dir = 0;
			if(q > 1 && q < height && p > 1 && p < width) {
				edge_weight = sobel_operation(sw,&dir);
			} else {
				edge_weight = 0;
			}

			if (q > 0 && p > 0){
				_temp.data_stream[0] << edge_weight;
				_dir.data_stream[0] << dir;
			}
		}
	}
}

template<int SRC_T, int DST_T, int ROW, int COL>
void ImgPostProcess(hls::Mat<ROW, COL, SRC_T> &_src,
					hls::Mat<ROW, COL, DST_T> &_dir,
					unsigned char (&_dst)[65536],
					int threashold,
					int width,
					int height) {

	ST_WINDOW sw; //image data
	S_WINDOW dw; //direction window
	ST_BUFFER lb; //line buffer
	S_BUFFER db; //direction buffer
	loop_height2: for (HLS_SIZE_T q = 0; q < height + 1; q++) {
		loop_width2: for (HLS_SIZE_T p = 0; p < width + 1; p++) {
			HLS_TNAME(SRC_T)temp1;
			HLS_TNAME(SRC_T) temp2;

			HLS_TNAME(DST_T) dir_temp1;
			HLS_TNAME(DST_T) dir_temp2;

			if (p < width) {
				temp1 = lb.getval(0,p);
				dir_temp1 = db.getval(0,p);
				lb.shift_down(p);
				db.shift_down(p);
			}


			if(q < height && p < width) {
				_dir.data_stream[0] >> dir_temp2;
				_src.data_stream[0] >> temp2;
				lb.insert_bottom(temp2,p);
				db.insert_bottom(dir_temp2,p);
			}
			sw.shift_right();
			dw.shift_right();
			if (p < width) {

				sw.insert(lb.getval(2,p),2,0);
				sw.insert(temp1,1,0);
				sw.insert(temp2,0,0);
				dw.insert(db.getval(2,p),2,0);
				dw.insert(dir_temp1,1,0);
				dw.insert(dir_temp2,0,0);

			}


			HLS_TNAME(DST_T) edge_weight;


			if(q > 1 && q < height && p > 1 && p < width) {
				edge_weight = local_max(sw,dw,threashold);
			} else {
				edge_weight = 0;
			}

			if (q > 0 && p > 0){
				_dst[(q-1)*width+(p-1)] = edge_weight;
			}
		}
	}
}

}
#endif
