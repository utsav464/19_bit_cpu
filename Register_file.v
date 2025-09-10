`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 14:49:52
// Design Name: 
// Module Name: Register_file
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


module Register_file(A1,A2,A3,clk,rst,wE3,RD1,RD2,wD3,start);
input [2:0] A1,A2,A3;
input clk,rst,wE3,start;
output  [18:0]RD1,RD2;
input [18:0]wD3;
reg [18:0]register [7:0];
integer i;
always@(posedge clk)
    begin
        if(wE3 &(A3!=3'b000))
            register[A3]<=wD3;
     end       
    
    assign RD1=(rst==1'b0)?19'd0:register[A1];
    assign RD2=(rst==1'b0)?19'd0:register[A2];
 
    
  
    initial begin
        register[3] = 19'd4;
        register[1] = 19'd9;
        register[2] = 19'd5;
    end  
    


endmodule
