`timescale 1ns / 1ps
module cpu(op,funct,regwrite,alucontrol,resultsrc,immsrc,alusrc,memwrite,registersrc,jump,branch,A,B,push,pop);
input [4:0]op;
input [4:0]funct;
input [18:0] A,B;
output [4:0]alucontrol;
output regwrite,resultsrc,alusrc,memwrite,registersrc,branch,push,pop;
output [1:0] immsrc,jump;

assign regwrite=(op==5'b00001)|(op==5'b00010)|(op==5'b00011)|(op==5'b00100)|
                (op==5'b00101)|(op==5'b00110)|(op==5'b00111)|(op==5'b01000)|
                (op==5'b01001)|(op==5'b01010)|(op==5'b01111);
assign resultsrc = (op==5'b01111)|(op==5'b10000);
assign alucontrol=op;
assign immsrc=(op==5'b01111)? 2'b01:
              (op==5'b10000)? 2'b10:
              (op==5'b01011|op==5'b01100|op==5'b01101|op==5'b01110)?2'b11:2'b0;
             
assign alusrc=(op==5'b01111)|(op==5'b10000);
assign memwrite=(op==5'b10000)?1'b1:1'b0;
assign registersrc=(op==5'b10000)?1'b1:1'b0;  
assign jump = (op==5'b01011)||((op==5'b01100)&&(A==B))||((op==5'b01101)&&(A!=B)||(op==5'b01110))?2'b01:
              (op==5'b10001)?2'b11:2'b00;
          
assign branch=(op==5'b01100)|(op==5'b01101);
assign push=(op==5'b01110);
assign pop=(op==5'b10001);  

       
endmodule