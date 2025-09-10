`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 23:11:26
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(pc,RD,rst,clk);
input [18:0]pc;
input rst,clk;
output  [18:0]RD;
reg [18:0] mem [1023:0];

assign RD = (rst == 1'b0) ? {19{1'b0}} : mem[pc[18:2]];



    
               
initial 
    begin
        $readmemh("memfile.mem",mem);
    end
   
endmodule
