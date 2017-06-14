############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2015 Xilinx Inc. All rights reserved.
############################################################
open_project EdgeDetectorIP
set_top EdgeDetect_Top
add_files EdgeDetectorIP/top.h
add_files EdgeDetectorIP/top.cpp
add_files EdgeDetectorIP/imgprocess.h
add_files -tb EdgeDetectorIP/test.cpp
add_files -tb EdgeDetectorIP/test.bmp
open_solution "solution"
set_part {xc7z020clg484-1}
create_clock -period 12.5 -name default
#source "./EdgeDetectorIP/solution/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -format ip_catalog -description "EdgeDetectionProvider" -vendor "EdgeDetector" -version "2.2" -display_name "EdgeDetector"
