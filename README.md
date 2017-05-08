# ObjectDetector
COMP4601

v1 has the following problems(short comings)
## 1.vdma is used to make use of hls_video library instead of dma. ##
## 2.vdma_driver doesn't work perfectly. There is no interrupt triggered after the image is synchronized in the VDMA engine, but we could still get the output in the memory. ##
## 3.rigiht now in version 1.0, the output image is a three channel black and white image, which I could change it to one channel later on. ## 
## 4.It has rows,cols,threshold arguments so it can handle any images that's withint the size of row 480 cols 640. The smaller the threshold the torlerance is better(i.e finding more edges) ## 
## 5.The hls synthesis tool synthesize to estimated cycle of 10.49 ns which is greater than what the board provided, which I would do optimization later on, but it still works fine with 10.49ns. ## 
