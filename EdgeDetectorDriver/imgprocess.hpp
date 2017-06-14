#ifndef IMGPROCESS_H
#define IMGPROCESS_H

//DMA Initialization
int init();

//Setup the hardware function arguments
int Setup_HW_Accelerator(int rows, int cols,int threshold);

//Run the hardware function
int Run_HW_Accelerator(void * src,void * dst, int width, int height);

#endif