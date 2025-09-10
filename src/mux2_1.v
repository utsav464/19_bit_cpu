`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 02:11:27
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(a,b,sel,c );
input [18:0]a;
input [18:0]b;
input sel;
output [18:0]c;

assign c= (sel==1'b0)?a:b;

endmodule
