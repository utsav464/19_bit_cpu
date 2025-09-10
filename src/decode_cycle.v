`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2025 00:17:16
// Design Name: 
// Module Name: decode_cycle
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


module decode_cycle(clk,rst,regwriteW,instrD,rdW,regwriteE,alucontrolE,RD1E,RD2E,RDE,resultW,resultsrcE,imm_extE,alusrcE,memwriteE,pcD,pcplus4D,pcE,pcplus4E,jumpE,immext,stack_data);
input clk,rst,regwriteW;
input [18:0]instrD,pcD,pcplus4D;
input [18:0]resultW;
input [2:0]rdW;
output regwriteE,resultsrcE,alusrcE,memwriteE;
output [4:0]alucontrolE;
output [18:0]RD1E,RD2E,pcE,pcplus4E,immext,stack_data;
output  [2:0] RDE;
output [18:0] imm_extE;
output [1:0]jumpE;

wire [2:0] RDD=instrD[13:11];
wire regwriteD,resultsrcD,alusrcD,memwriteD,registersrc,branchD,push,pop;
wire [4:0]alucontrolD;
wire [18:0]RD1D,RD2D,imm_extD;
wire [1:0]immsrc,jump;

wire [2:0] A=(branchD)?instrD[13:11]:instrD[10:8];
wire [2:0] B=(branchD)?instrD[10:8]:
             (registersrc)?instrD[2:0]:
                           instrD[7:5];


reg regwriteE_reg,resultsrcE_reg,alusrcE_reg,memwriteE_reg;
reg [4:0] alucontrolE_reg;
reg [18:0] RD1E_reg,RD2E_reg,imm_extE_reg,pcE_reg,pcplus4E_reg;
reg [2:0]RDE_reg;

cpu cpu_i(
         .op(instrD[18:14]),
         .funct(instrD[4:0]),
         .regwrite(regwriteD),
         .alucontrol(alucontrolD),
         .resultsrc(resultsrcD),
         .immsrc(immsrc),
         .alusrc(alusrcD),
         .memwrite(memwriteD),
         .registersrc(registersrc),
         .jump(jump),
         .branch(branchD),
         .A(RD1D),
         .B(RD2D),
         .push(push),
         .pop(pop)
         );


Register_file registerfile(
                            .wD3(resultW),
                            .clk(clk),
                            .rst(rst),
                            .wE3(regwriteW),
                            .A1(A),
                            .A2(B),
                            .A3(rdW),
                            .RD1(RD1D),
                            .RD2(RD2D)
                            );

sign_extended sign_extended (
                             .instrD(instrD),
                             .immsrc(immsrc),
                             .imm_ext(imm_extD)
                             );

 stack_pointer stack (
                      .clk(clk),
                      .rst(rst),
                      .push(push),
                      .pop(pop),
                      .pcD(pcplus4D),
                      .data_out(stack_data),
                      .sp()
                       );             
                             
always@(posedge clk )
    begin
        if(rst==1'b0)
            begin
                alucontrolE_reg <=5'b00000;
                regwriteE_reg   <=1'b0;
                RDE_reg         <=3'd0;
                RD1E_reg        <=19'd0;
                RD2E_reg        <=19'd0;
                resultsrcE_reg  <=1'b0;
                imm_extE_reg    <=19'd0;
                alusrcE_reg     <=1'b0;
                memwriteE_reg   <=1'b0;
                pcE_reg         <=19'd0;
                pcplus4E_reg    <=19'd0;
                
            end
        
        
        else
            begin
                alucontrolE_reg <= alucontrolD;
                regwriteE_reg   <= regwriteD;
                RDE_reg         <= RDD;
                RD1E_reg        <= RD1D;
                RD2E_reg        <= RD2D;
                resultsrcE_reg  <= resultsrcD;
                imm_extE_reg    <=imm_extD;
                alusrcE_reg     <=alusrcD;
                memwriteE_reg   <=memwriteD;
                pcE_reg         <=pcD;
                pcplus4E_reg    <=pcplus4D;
                
           end
        end
        
 assign regwriteE=regwriteE_reg;
 assign alucontrolE=alucontrolE_reg;
 assign RD1E = RD1E_reg;
 assign RD2E= RD2E_reg;
 assign RDE= RDE_reg;
 assign resultsrcE = resultsrcE_reg;
 assign imm_extE =imm_extE_reg;
 assign alusrcE =alusrcE_reg;
 assign memwriteE = memwriteE_reg;
 assign pcE = pcE_reg;
 assign pcplus4E = pcplus4E_reg;
 assign jumpE =jump;
 assign immext = imm_extD;
 

endmodule
