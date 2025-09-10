`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2025 23:28:20
// Design Name: 
// Module Name: execute_cycle
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


module execute_cycle(clk,rst,RD1E,RD2E,alucontrolE,regwriteE,aluresultM,regwriteM,rdE,rdM,resultsrcE,resultsrcM,immextE,alusrcE,memwriteE,memwriteM,writedata,pcE,pcplus4E);
input clk,rst;
input [18:0]RD1E,RD2E,immextE,pcE,pcplus4E;
input [4:0]alucontrolE;
input [2:0]rdE;
input regwriteE,resultsrcE,alusrcE,memwriteE;
output [18:0]aluresultM,writedata;
output regwriteM,resultsrcM,memwriteM;
output [2:0]rdM;


wire [18:0] aluresultE,srcBE;


reg [18:0] aluresultM_reg,writedata_reg;
reg [2:0] rdM_reg;
reg regwriteM_reg,resultsrcM_reg,memwriteM_reg;


 alu alu_i (
         .alucontrol(alucontrolE),
         .A(RD1E),
         .B(srcBE),
         .aluresult(aluresultE)
         
          );
          
mux2_1 alumux(
              .a(RD2E),
              .b(immextE),
              .sel(alusrcE),
              .c(srcBE) 
               );          



               
always@(posedge clk)
    begin
        if(rst==1'b0)
            begin
             aluresultM_reg<=19'd0;
             rdM_reg<=3'b000;
             regwriteM_reg<=1'b0;
             resultsrcM_reg <= 1'b0;
             memwriteM_reg <=1'b0;
             writedata_reg <=19'd0;
             
            end
            
            else
                begin
                     aluresultM_reg<=aluresultE;
                     rdM_reg<=rdE;               
                     regwriteM_reg<=regwriteE;  
                     resultsrcM_reg <= resultsrcE;
                     memwriteM_reg <=memwriteE;
                     writedata_reg <=RD2E;
                     
                end
                
    end
    
assign aluresultM = aluresultM_reg;
assign rdM =rdM_reg;
assign regwriteM = regwriteM_reg;
assign resultsrcM = resultsrcM_reg;
assign memwriteM =memwriteM_reg;  
assign writedata = writedata_reg; 

endmodule
