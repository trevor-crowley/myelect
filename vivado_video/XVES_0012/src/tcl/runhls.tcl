open_project AXI4S_bd_v_tpg_0_0
set_top v_tpg
add_files -cflags " -I /home/trevor/dev/myelect/vivado_video/XVES_0012/proj_1/proj_1.srcs/sources_1/bd/AXI4S_bd/ip/AXI4S_bd_v_tpg_0_0/src " /home/trevor/dev/myelect/vivado_video/XVES_0012/proj_1/proj_1.srcs/sources_1/bd/AXI4S_bd/ip/AXI4S_bd_v_tpg_0_0/src/v_tpg_config.h
add_files -cflags " -I /home/trevor/dev/myelect/vivado_video/XVES_0012/proj_1/proj_1.srcs/sources_1/bd/AXI4S_bd/ip/AXI4S_bd_v_tpg_0_0/src " /home/trevor/dev/myelect/vivado_video/XVES_0012/proj_1/proj_1.srcs/sources_1/bd/AXI4S_bd/ip/AXI4S_bd_v_tpg_0_0/src/v_tpg.cpp
add_files -cflags " -I /home/trevor/dev/myelect/vivado_video/XVES_0012/proj_1/proj_1.srcs/sources_1/bd/AXI4S_bd/ip/AXI4S_bd_v_tpg_0_0/src " /home/trevor/dev/myelect/vivado_video/XVES_0012/proj_1/proj_1.srcs/sources_1/bd/AXI4S_bd/ip/AXI4S_bd_v_tpg_0_0/src/v_tpg.h
add_files -cflags " -I /home/trevor/dev/myelect/vivado_video/XVES_0012/proj_1/proj_1.srcs/sources_1/bd/AXI4S_bd/ip/AXI4S_bd_v_tpg_0_0/src " /home/trevor/dev/myelect/vivado_video/XVES_0012/proj_1/proj_1.srcs/sources_1/bd/AXI4S_bd/ip/AXI4S_bd_v_tpg_0_0/src/v_tpg_zoneplate.h

open_solution "prj"
set_part {xc7z020clg484-1}
create_clock -period 50 -name ap_clk


config_rtl -form_dsp
config_schedule -verbose
config_interface -input_reg_mode both -output_reg_mode both


config_rtl -prefix AXI4S_bd_v_tpg_0_0_
csynth_design
export_design -format ip_catalog -vendor xilinx.com -library ip -version 8.0
exit
