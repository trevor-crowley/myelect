############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project proj_loop_pipeline
set_top loop_pipeline
add_files loop_pipeline.c
add_files -tb result.golden.dat
add_files -tb loop_pipeline_test.c
open_solution "solution2"
set_part {xc7k160tfbg484-1}
create_clock -period 25 -name default
source "./proj_loop_pipeline/solution2/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
