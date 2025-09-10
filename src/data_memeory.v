`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 00:01:47
// Design Name: 
// Module Name: data_memeory
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
 

module data_memeory(clk,rst,aluresultM,readdataW,memwriteM,writedata);
input clk,rst,memwriteM;
input [18:0] aluresultM,writedata;
output [18:0] readdataW;
reg [18:0]memory[1024:0];

assign readdataW=(rst)?memory[aluresultM]:19'd0;


always@(posedge clk)
    begin 
        if(memwriteM && rst)
            memory[aluresultM]<=writedata;
    end
    
              
        
  initial begin
    memory[0] = 19'h00005;   
    memory[1] = 19'h0000A;   
    memory[2] = 19'h0000F;   
    memory[3] = 19'h00014;   
    memory[10] = 19'h0001E;  
end
endmodule

