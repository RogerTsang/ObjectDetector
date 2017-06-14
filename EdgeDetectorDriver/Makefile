CC=g++
CFLAGS=-pg -g
OBJS= xedgedetect_top.o imgprocess.o main.o vdma_driver.o
LIBS=opencv_core opencv_imgproc opencv_highgui opencv_ml opencv_video opencv_features2d opencv_calib3d opencv_objdetect opencv_contrib opencv_legacy opencv_flann  
all: main software

main: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(addprefix -l, $(LIBS))

xedgedetect_top.o: xedgedetect_top.c
	$(CC) $(CFLAGS) -c -o $@ $<

imgprocess.o: imgprocess.cpp
	$(CC) $(CFLAGS) -c -o $@ $<
	
main.o: main.cc imgprocess.o
	$(CC) $(CFLAGS) -c -o $@ $<
	
vdma_driver.o: vdma_driver.cpp
	$(CC) $(CFLAGS) -c -o $@ $<

software: software.cpp
	$(CC) $(CFLAGS) -O0 -o $@ $< $(addprefix -l, $(LIBS))

.PHONY: clean
clean:
	rm main software $(OBJS)
