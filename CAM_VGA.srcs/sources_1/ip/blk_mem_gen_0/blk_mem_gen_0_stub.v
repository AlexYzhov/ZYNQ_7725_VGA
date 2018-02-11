// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun Jan 21 07:55:03 2018
// Host        : ALEXYZHOV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/Proj_ZYNQ/CAM_VGA/CAM_VGA.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_stub.v
// Design      : blk_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *)
module blk_mem_gen_0(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[16:0],dina[47:0],clkb,addrb[18:0],doutb[11:0]" */;
  input clka;
  input [0:0]wea;
  input [16:0]addra;
  input [47:0]dina;
  input clkb;
  input [18:0]addrb;
  output [11:0]doutb;
endmodule
