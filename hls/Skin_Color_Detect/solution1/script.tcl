############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Skin_Color_Detect
set_top ImgProcess_Top
add_files Skin_Color_Detect/imgprocess.h
add_files Skin_Color_Detect/top.cpp
add_files Skin_Color_Detect/top.h
add_files -tb Skin_Color_Detect/test.cpp
add_files -tb Skin_Color_Detect/test.jpg
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
#source "./Skin_Color_Detect/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl vhdl -format ip_catalog -vendor "skin_detect"
