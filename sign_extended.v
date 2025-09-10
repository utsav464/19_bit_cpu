`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 01:02:49
// Design Name: 
// Module Name: sign_extended
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


module sign_extended(instrD,immsrc,imm_ext);
input [18:0] instrD;
input [1:0]immsrc;
output [18:0] imm_ext;

assign imm_ext=(immsrc==2'b01)?{{8{instrD[10]}},instrD[10:0]}:
               (immsrc==2'b10)?{{8{instrD[13]}},instrD[13:3]}:
               (immsrc==2'b11)?{{11{instrD[7]}},instrD[7:0]}:19'd0;
initial begin
    $monitor("time=%0t immsrc=%b instrD=%b imm_ext=%b",
             $time, immsrc, instrD, imm_ext);
end
endmodule

