CC=g++
CFLAGS=-g
OBJS= xedgedetect_top.o imgprocess.o main.o vdma_driver.o
LIBS=opencv_core opencv_imgproc opencv_highgui opencv_ml opencv_video opencv_features2d opencv_calib3d opencv_objdetect opencv_contrib opencv_legacy opencv_flann  
all: main


main: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(addprefix -l, $(LIBS))

xedgedetect_top.o:xedgedetect_top.c
imgprocess.o:imgprocess.cpp
main.o:main.cc imgprocess.o
vdma.o:vdma_driver.cpp

.PHONY: clean
clean:
	rm main *.o
