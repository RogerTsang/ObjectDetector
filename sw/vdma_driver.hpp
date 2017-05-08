void vdma_memroy_map(int fd);
void vdma_init(int fd);
void vdma_startTransfer_MM2S(void * src, int width, int height);
void vdma_startTransfer_S2MM(int width, int height);
void vdma_status();				// prints out vdma status
void vdma_wait();				// Wait until current transfer ends.
void vdma_wait_MM2S();				// Wait until current transfer ends.
void vdma_wait_S2MM(void * dst,int image_size); // Wait until current transfer ends.


typedef unsigned int u32;
