`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/20 11:08:47
// Design Name: 
// Module Name: CAM_RGB565_Capture
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

module CAM_RGB565_Capture(
            input pclk,
            input vsync,
            input hsync,
            input [7:0] din_8bit,

            output [18:0] address,
            output [47:0] dout_48bit,
            output reg we
    );

reg [1:0]  count;
reg [15:0] din_latch_reg;
reg [47:0] dout_48bit_reg;

reg [18:0] addr;
reg [18:0] addr_next;
reg [1:0]  wr_hold;

initial count = 2'b0;
initial din_latch_reg = 16'b0;
initial dout_48bit_reg = 48'b0;

initial addr = 19'b0;
initial addr_next = 19'b0;
initial wr_hold = 2'b0;

assign address = addr;

always@(posedge pclk) begin
    if(vsync == 1) begin
        // reset module
        addr <= 19'b0;
        addr_next <= 19'b0;
        wr_hold <= 2'b0;
        count <= 2'b0;
    end
    else begin
        addr <= addr_next;
        we   <= wr_hold[1];
        wr_hold <= {wr_hold[0], (hsync&&(!wr_hold[0]))};

        din_latch_reg <= {din_latch_reg, din_8bit};

        if(wr_hold[1] == 1) begin
            addr_next <= addr_next+1;

            if(count>=3) begin
                count <= 0;
            end
            else begin
                count <= count+1;
            end

            case(count)
                0: dout_48bit_reg[11:0]  <= {din_latch_reg[15:12], din_latch_reg[10:7], din_latch_reg[4:1]};
                1: dout_48bit_reg[23:12] <= {din_latch_reg[15:12], din_latch_reg[10:7], din_latch_reg[4:1]};
                2: dout_48bit_reg[35:24] <= {din_latch_reg[15:12], din_latch_reg[10:7], din_latch_reg[4:1]};
                3: dout_48bit_reg[47:36] <= {din_latch_reg[15:12], din_latch_reg[10:7], din_latch_reg[4:1]};
            endcase;
        end
    end
end

assign dout_48bit = dout_48bit_reg;

endmodule
