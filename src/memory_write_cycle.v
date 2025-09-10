`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2025 02:55:37
// Design Name: 
// Module Name: memory_write_cycle
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

module memory_write_cycle(clk,rst,aluresultM,readdataW,regwriteM,regwriteW,rdW,rdM,resultsrcM,resultsrcW,aluresultW,memwriteM,writedata);
input clk,rst;
input [18:0] aluresultM,writedata;
input regwriteM,resultsrcM,memwriteM;
input [2:0]rdM;
output [18:0] readdataW,aluresultW;
output regwriteW,resultsrcW;
output [2:0]rdW;

wire [18:0]readdataM;




reg [18:0]readdataW_reg,aluresultW_reg;
reg regwriteW_reg,resultsrcW_reg;
reg [2:0] rdW_reg;

data_memeory dataaa_memory(
                          .clk(clk),
                          .rst(rst),
                          .aluresultM(aluresultM),
                          .readdataW(readdataM), 
                          .memwriteM(memwriteM),
                          .writedata(writedata)
                           );

always@(posedge clk or negedge rst)
    begin
        if(rst==1'b0)
            begin
                readdataW_reg<=19'b0;
                regwriteW_reg<=1'b0;
                rdW_reg <=3'b0;
                resultsrcW_reg<=1'b0;
                aluresultW_reg <= 19'd0;
                
            end
            
        else
            begin
                readdataW_reg<=readdataM;
                regwriteW_reg<=regwriteM;
                rdW_reg <= rdM;
                resultsrcW_reg<=resultsrcM;
                aluresultW_reg <= aluresultM; 
                
            end
     end
                
 assign readdataW = readdataW_reg;
 assign regwriteW = regwriteW_reg;                       
 assign rdW =rdW_reg;               
 assign resultsrcW =resultsrcW_reg;  
 assign aluresultW =aluresultW_reg;
             
endmodule
