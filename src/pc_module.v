`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 23:05:15
// Design Name: 
// Module Name: pc_module
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


module pc_module(clk,rst,pc_next,pc);
input clk,rst;
input [18:0] pc_next;
output reg [18:0] pc;

always@(posedge clk)
begin
    if(rst==1'b0)
            pc<={19{1'b0}};
        
     else
            pc<=pc_next;
        
end
        
          
endmodule
