CC=g++
CFLAGS=-g
LIBS=opencv_core opencv_imgproc opencv_highgui opencv_ml opencv_video opencv_features2d opencv_calib3d opencv_objdetect opencv_contrib opencv_legacy opencv_flann  

all: main

main: main.cpp
	$(CC) $(CFLAGS) -o $@ $< $(addprefix -l, $(LIBS))

.PHONY: clean
clean:
	rm main
