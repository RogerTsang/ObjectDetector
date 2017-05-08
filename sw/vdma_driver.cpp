#include "vdma_driver.hpp"
#include "xparameters.h"
#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>



#define DMA_TX_ADDR		0x0F000000		// Phy. address of TX buffer
#define DMA_RX_ADDR		0x0F840000		// Phy. address of RX buffer


// Scatter?/?Gather?Mode?Register?Address?(Non©\Multi?Channel?Mode)
#define MM2S_VDMACR 		0x00		// MM2S DMA Control Register
#define MM2S_VDMASR 		0x04		// MM2S DMA Status Register
#define MM2S_REG_INDEX 		0x14		// MM2S Register Index
#define PARK_PTR_REG 	    0x28		// MM2S and S2MM Park Pointer Register
#define S2MM_VDMACR 		0x30		// S2MM DMA Control Register
#define S2MM_VDMASR 		0x34		// S2MM DMA Status Register
#define S2MM_VDMA_IRQ_MASK 	0x3c		// S2MM Error Interrupt Mask Register
#define S2MM_REG_INDEX      0x44        // S2MM Register Index
#define MM2S_VSIZE          0x50        // MM2S Vertical Size Register
#define MM2S_HSIZE          0x54        // MM2S Horizontal Size Register
#define MM2S_FRMDLY_STRIDE  0x58        // MM2S Frame Delay and Stride Register
#define S2MM_VSIZE          0xa0        // S2MM Vertical Size Register
#define S2MM_HSIZE          0xa4      // S2MM Horizontal Size Register
#define S2MM_FRMDLY_STRIDE  0xa8        // S2MM Frame Delay and Stride Register

#define S2MM_START_ADDRESS  0xac        // Start address of S2MM Start Address (1 to 16)
#define MM2S_START_ADDRESS  0x5c        // Start address MM2S Start Address (1 to 16)



// Shared Memory Settings
#define TX_PKT_SIZE		0x7FFFFF	// Size of TX Packet(0~0x7FFFFF)
#define RX_PKT_SIZE		0x7FFFFF	// Size of RX Packet(0~0x7FFFFF)

u32* axivdma_base;			// A pointer to axidma base address.
u32* tx_packet;				// A pointer to tx buffer area.
u32* rx_packet;				// A pointer to rx buffer area.




void vdma_status();			// Print status of MM2S and S2MM channels.

static void vdma_set(u32* addr, int offset, u32 value);
static u32 vdma_get(u32* addr, int offset);



void vdma_set(u32* addr, int offset, u32 value)
{
	addr[offset >> 2] = value;
}



u32 vdma_get(u32* addr, int offset)
{
	volatile u32 * addr_vol = &(addr[offset >> 2]);
    return *addr_vol;
}



// Initialize AXI VDMA's register.

void vdma_init(int fd)

{
	axivdma_base = (u32*)malloc(65536);
	tx_packet = (u32*)malloc(TX_PKT_SIZE);
	rx_packet = (u32*)malloc(RX_PKT_SIZE);
	axivdma_base = (u32*)mmap(axivdma_base,0xFFFF,PROT_READ | PROT_WRITE, MAP_SHARED, fd, XPAR_AXI_VDMA_0_BASEADDR);

	// Memory map tx buffer base address.
	tx_packet = (u32*)mmap(tx_packet, TX_PKT_SIZE, PROT_READ | PROT_WRITE,MAP_SHARED, fd, DMA_TX_ADDR);

	// Memory map rx buffer base address.
	rx_packet = (u32*)mmap(rx_packet, RX_PKT_SIZE, PROT_READ | PROT_WRITE,MAP_SHARED, fd, DMA_RX_ADDR);

	memset(axivdma_base, 0, 65536);
	memset(tx_packet, 0, TX_PKT_SIZE);
	memset(rx_packet, 0, RX_PKT_SIZE);

	// Reset AXI VDMA engine.
	vdma_set(axivdma_base, S2MM_VDMACR, 0x4);
	vdma_set(axivdma_base, MM2S_VDMACR, 0x4);
	printf("MM2S and S2MM has been reset.\n");
	vdma_status();

	// Halt AXI DMA engine.
	vdma_set(axivdma_base, S2MM_VDMACR, 0x0);
	vdma_set(axivdma_base, MM2S_VDMACR, 0x0);
	printf("MM2S and S2MM has been halted.\n");

	vdma_status();

	// Set source and destination addresses and start DMA.
	vdma_set(axivdma_base, S2MM_START_ADDRESS, DMA_RX_ADDR);
	vdma_set(axivdma_base, MM2S_START_ADDRESS, DMA_TX_ADDR);
	printf("Source and destination addresses have been set.\n");
	vdma_status();

	// Start MM2S and S2MM with FrmCnt_IrqEn and Err_Irq enabled and frame count = 1.

	vdma_set(axivdma_base, S2MM_VDMACR, 0x15011);
	vdma_set(axivdma_base, MM2S_VDMACR, 0x15011);

	vdma_status();
	// Clear Interrupt bits.
	u32 mm2s_sr = vdma_get(axivdma_base, MM2S_VDMASR);
	vdma_set(axivdma_base, MM2S_VDMASR, mm2s_sr |  0x0000CFF0);

	// Clear Interrupt bits.
	u32 s2mm_sr = vdma_get(axivdma_base, S2MM_VDMASR);
	vdma_set(axivdma_base, S2MM_VDMASR, s2mm_sr |  0x0000CFF0);
	//vdma_set(axivdma_base, S2MM_VDMA_IRQ_MASK, 0xF);

	printf("MM2S and S2MM has been started.\n");
	vdma_status();
}



// Start DMA transfer.

void vdma_startTransfer_MM2S(void * src, int width, int height)

{

	memcpy(tx_packet,src,width * height * 3);

	// Start transfer by setting length registers.
	vdma_set(axivdma_base, MM2S_FRMDLY_STRIDE, width * 3);
	vdma_set(axivdma_base, MM2S_HSIZE, width * 3);

	vdma_set(axivdma_base, MM2S_VSIZE, height);

	printf("MM2S Transfer length has been set, and transfer begins.\n");

	vdma_status();

}

void vdma_startTransfer_S2MM(int width, int height)

{

	// Start transfer by setting length registers.
	vdma_set(axivdma_base, S2MM_FRMDLY_STRIDE, width * 3);
	vdma_set(axivdma_base, S2MM_HSIZE, width * 3);
	vdma_set(axivdma_base, S2MM_VSIZE, height);

	printf("S2MM Transfer length has been set, and transfer begins.\n");

	vdma_status();


}


// Wait until current transfer ends.

void vdma_wait_MM2S()
{
	printf("Waiting MM2S... ");
	u32 status = vdma_get(axivdma_base, MM2S_VDMASR);

	while (!(status & 1 << 12)){
		status = vdma_get(axivdma_base, MM2S_VDMASR);
	}


	printf("completed.\n");
	vdma_status();
}

void vdma_wait_S2MM(void * dst,int image_size)
{
	u32 status = vdma_get(axivdma_base, S2MM_VDMASR);
	printf("Waiting S2MM...");
	int k = 0;
	while (!(status & 1 << 12) && k < 1){
		k++;
		status = vdma_get(axivdma_base, S2MM_VDMASR);
	}

	printf("completed.\n");

	memcpy(dst,rx_packet,image_size*3);
	vdma_status();
}


// Print status of MM2S and S2MM channels.

void vdma_status()

{
	u32 status = vdma_get(axivdma_base, S2MM_VDMASR);
	printf("S2MM status (0x%08x@0x%02x):", status, S2MM_VDMASR);

	if (status & 0x00000001) printf(" halted");
	else 					 printf(" running");
	if (status & 0x00001000) printf(" FrmCnt_Irq");
    if (status & 0x00000010) printf(" VDMAIntErr");
    if (status & 0x00000020) printf(" VDMASlvErr");
    if (status & 0x00000040) printf(" DMADecErr");
    if (status & 0x00000080) printf(" SOFEarlyErr");
    if (status & 0x00002000) printf(" DlyCnt_Irq");
    printf("\n");

    status = vdma_get(axivdma_base, MM2S_VDMASR);
    printf("MM2S status (0x%08x@0x%02x):", status, MM2S_VDMASR);
    if (status & 0x00000001) printf(" halted");
	else 					 printf(" running");
    if (status & 0x00001000) printf(" FrmCnt_Irq");
	if (status & 0x00000010) printf(" VDMAIntErr");
	if (status & 0x00000020) printf(" VDMASlvErr");
	if (status & 0x00000040) printf(" DMADecErr");
	if (status & 0x00000080) printf(" SOFEarlyErr");
	if (status & 0x00002000) printf(" DlyCnt_Irq");
	printf("\n");

}



