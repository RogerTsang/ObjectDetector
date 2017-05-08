/**

 * Using AXI Direct Memory Access v7.1

 * Direct Register Mode

 *

 * Author: 	ZMJ@SEU

 * Date: 	2016-07-12

 */
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <termios.h>

#include "xparameters.h"
#include "xedgedetect_top.h"
#include "vdma_driver.hpp"

u32* control_bus_base;
XEdgedetect_top imgprocess_dev;

//DMA Initialization
int init_dma();
//Setup the hardware function arguments
int Setup_HW_Accelerator(int rows, int cols,int y_lower,int y_upper,int cb_lower,int cb_upper,int cr_lower,int cr_upper);
//Run the hardware function
int Run_HW_Accelerator(void * src,void * dst, int dma_size);

void imgprocess_init(int fd);
void start_XImgprocess(void *InstancePtr);

using namespace std;
void start_XImgprocess(void *InstancePtr){
	XEdgedetect_top *pExample = (XEdgedetect_top *)InstancePtr;
	XEdgedetect_top_InterruptEnable(pExample,1);
	XEdgedetect_top_InterruptGlobalEnable(pExample);
	XEdgedetect_top_Start(pExample);
	//XEdgedetect_top_EnableAutoRestart(pExample);
}


int init(){
	// Open /dev/mem which represents the whole physical memory.
	int fd = open("/dev/mem", O_RDWR | O_SYNC);
	vdma_init(fd);		// Initialize AXI DMA's register.
	imgprocess_init(fd);

	return 0;
}

//Run the hardware function
int Run_HW_Accelerator(void * src,void * dst, int width,int height){
	vdma_startTransfer_S2MM(width, height);	// Start DMA transfer.
	vdma_startTransfer_MM2S(src,width, height);	// Start DMA transfer.
	vdma_wait_MM2S();
	u32 done = XEdgedetect_top_IsDone(&imgprocess_dev);
	while (!done){
		done = XEdgedetect_top_IsDone(&imgprocess_dev);
	}
	printf("done:%d\n",done);
	vdma_wait_S2MM(dst,width*height);
	// Print status of MM2S and S2MM channels.


	return 0;
}

int Setup_HW_Accelerator(int rows, int cols,int threshold)
//Setup the Vivado HLS Block
{

	//Arguments setup
	XEdgedetect_top_Set_rows(&imgprocess_dev,rows);
	XEdgedetect_top_Set_cols(&imgprocess_dev,cols);
	XEdgedetect_top_Set_threashold(&imgprocess_dev,threshold);
	start_XImgprocess(&imgprocess_dev);
	
	cout << rows << " " << XEdgedetect_top_Get_rows(&imgprocess_dev) << endl;
	cout << cols << " " << XEdgedetect_top_Get_cols(&imgprocess_dev) << endl;
	cout << threshold << " " << XEdgedetect_top_Get_threashold(&imgprocess_dev) << endl;
	



	//flush the cache
	//Xil_DCacheFlushRange((unsigned int)A,dma_size);
	//Xil_DCacheFlushRange((unsigned int)B,dma_size);
	//Xil_DCacheFlushRange((unsigned int)res_hw,dma_size);

	return 0;
}

void imgprocess_init(int fd){
	control_bus_base = (u32*)malloc(65536);

	// Memory map AXI control bus register block
	control_bus_base = (u32*)mmap(control_bus_base, 65536, PROT_READ | PROT_WRITE,MAP_SHARED, fd, XPAR_EDGEDETECT_TOP_0_S_AXI_CONTROL_BUS_BASEADDR);

	memset(control_bus_base, 0, 65536);

	imgprocess_dev.Control_bus_BaseAddress = (u32)control_bus_base;
	imgprocess_dev.IsReady = 0;
}

