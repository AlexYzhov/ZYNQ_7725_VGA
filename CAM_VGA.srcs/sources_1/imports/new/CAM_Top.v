`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/20 13:38:07
// Design Name: 
// Module Name: CAM_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CAM_Top(
        inout clk100,

        input CAM_VSYNC,
        input CAM_HSYNC,
        input CAM_PCLK,
        input [7:0] CAM_Data,

        output [3:0] VGA_Red,
        output [3:0] VGA_Green,
        output [3:0] VGA_Blue,
        output VGA_VSYNC,
        output VGA_HSYNC,

        output [7:0] LED
    );

    wire [18:0] CAM_addr;
    wire [48:0] CAM_data;

    wire [18:0] VGA_addr;
    wire [11:0] VGA_pixel;
    
    wire capture_we;
    wire clk50;
    wire clk25;

    wire configure_finished;
    
    //实例化时钟模块
    clk_gen user_clock(
        .clk_in1 (clk100),
        .clk_out1(clk50),
        .clk_out2(clk25)
    );

    //实例化BRAM(FIFO)
    blk_mem_gen_0 frame_buffer(
        .clka  (CAM_PCLK),
        .wea   (capture_we),
        .addra (CAM_addr[18:2]),
        .dina  (CAM_data),

        .clkb  (clk50),
        .addrb (VGA_addr),
        .doutb (VGA_pixel)
    );

    //实例化图像采集模块
    CAM_RGB565_Capture frame_capture(
        .pclk       (CAM_PCLK),
        .vsync      (CAM_VSYNC),
        .hsync      (CAM_HSYNC),
        .din_8bit   (CAM_Data),
        .address    (CAM_addr),
        .dout_48bit (CAM_data),
        .we         (capture_we)
    );

    //实例化VGA显示模块
    VGA_Display vga_display(
        .clk25       (clk25),
        .vga_red     (VGA_Red),
        .vga_green   (VGA_Green),
        .vga_blue    (VGA_Blue),
        .vga_hsync   (VGA_HSYNC),
        .vga_vsync   (VGA_VSYNC),
        .HCnt        (),
        .VCnt        (),
    
        .frame_addr  (VGA_addr),
        .frame_pixel (VGA_pixel)
    );

    //实例化SCCB控制模块
endmodule
