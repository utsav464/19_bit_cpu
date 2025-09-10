`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 01:57:39
// Design Name: 
// Module Name: pipeline_top
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
`include "fetch_cycle.v"
`include "decode_cycle.v"
`include "execute_cycle.v"
`include "memory_write _cycle.v"
`include "pc_addr.v"
`include "pc_module.v"
`include "instruction_mem.v"
`include "cpu.v"
`include "Register_file.v"
`include "alu.v"
`include "data_memeory.v"
`include"write_back_cycle.v"
`include"stack_pointer.v"
`include"sign_extended.v"
`include"write_back_cycle"

module pipeline_top(clk,rst);
input clk,rst;

wire [18:0]instrD,resultW,aluresultM,immextE,readdataW,aluresultW;
wire [18:0] RD1E,RD2E,writedata;
wire [18:0]pcD,pcplus4D,pcE,pcplus4E,immext,stack_data;
wire [2:0]rdW,rdM,RDE;
wire regwriteW,regwriteE,regwriteM,resultsrcE,resultsrcM,resultsrcW,memwriteE,memwriteM;
wire [4:0]alucontrolE;
wire [1:0]jumpE;

fetch_cycle fetch(
                  .rst(rst),
                  .clk(clk),
                  .instrD(instrD),
                  .pcD(pcD),
                  .pcplus4D(pcplus4D),
                  .immextE(immext),
                  .jumpE(jumpE),
                  .sp(stack_data) 
                   );
                   
decode_cycle decode(
                    .clk(clk),
                    .rst(rst),
                    .regwriteW(regwriteW),
                    .instrD(instrD),
                    .rdW(rdW),
                    .regwriteE(regwriteE),
                    .alucontrolE(alucontrolE),
                    .RD1E(RD1E),
                    .RD2E(RD2E),
                    .RDE(RDE),
                    .resultW(resultW),
                    .resultsrcE(resultsrcE),
                    .imm_extE(immextE),
                    .alusrcE(alusrcE),
                    .memwriteE(memwriteE),
                    .pcD(pcD),
                    .pcplus4D(pcplus4D),
                    .pcE(pcE),
                    .pcplus4E(pcplus4E),
                    .jumpE(jumpE),
                    .immext(immext),
                    .stack_data(stack_data)
               
                     );                   
  
  
execute_cycle execute (
                       .clk(clk),
                       .rst(rst),
                       .RD1E(RD1E),
                       .RD2E(RD2E),
                       .alucontrolE(alucontrolE),
                       .regwriteE(regwriteE),
                       .aluresultM(aluresultM),
                       .regwriteM(regwriteM),
                       .rdE(RDE),
                       .rdM(rdM),
                       .resultsrcE(resultsrcE),
                       .resultsrcM(resultsrcM),
                       .immextE(immextE),
                       .alusrcE(alusrcE),
                       .memwriteE(memwriteE),
                       .memwriteM(memwriteM),
                       .writedata(writedata),
                       .pcE(pcE),
                       .pcplus4E(pcplus4E)
                       
                        );          
                        
 memory_write_cycle memory_write(
                                 .clk(clk),
                                 .rst(rst),
                                 .aluresultM(aluresultM),
                                 .readdataW(readdataW),
                                 .regwriteM(regwriteM),
                                 .regwriteW(regwriteW),
                                 .rdW(rdW),
                                 .rdM(rdM),
                                 .resultsrcM(resultsrcM),
                                 .resultsrcW(resultsrcW),
                                 .aluresultW(aluresultW),
                                 .memwriteM(memwriteM),
                                 .writedata(writedata)
                                  );        
                        
                        
 write_back_cycle writeback(
                             .clk(clk),
                             .rst(rst),
                             .aluresultW(aluresultW),
                             .readdataW(readdataW),
                             .resultsrcW(resultsrcW),
                             .resultW(resultW)
                             );                       
                                 
endmodule