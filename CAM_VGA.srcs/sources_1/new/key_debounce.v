`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/20 13:45:45
// Design Name: 
// Module Name: key_debounce
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


module key_debounce(
        input clk,
        input in,
        output reg out
    );

    reg [23:0] count;

    initial count = 24'b0;

    always@(posedge clk) begin
        if(in==1) begin
            if(count==24'hFFFFFF) begin
                out <= 1;
            end
            else begin
                out <= 0;
                count <= count + 1;
            end
        end
        else begin
            count <= 24'b0;
            out <= 0;
        end
    end
    
endmodule
