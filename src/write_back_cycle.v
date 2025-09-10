`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2025 01:14:25
// Design Name: 
// Module Name: write_back_cycle
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


module write_back_cycle(clk,rst,aluresultW,readdataW,resultsrcW,resultW);
input clk,rst;
input [18:0]aluresultW,readdataW;
input resultsrcW;
output [18:0]resultW;
assign resultW =(resultsrcW)?readdataW:aluresultW;
endmodule
