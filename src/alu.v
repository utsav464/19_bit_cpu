`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 20:49:27
// Design Name: 
// Module Name: alu
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


module alu(alucontrol,A,B,aluresult);
input [18:0]A,B ;
input[4:0]alucontrol;
output reg [18:0]aluresult;

always@(*)
    begin   
        case(alucontrol)
            5'b00001: aluresult=A+B;
            5'b00010: aluresult=A-B;
            5'b00011: aluresult=A*B;
            5'b00100: aluresult=(B!=0)?A/B:19'd0;
            5'b00101: aluresult=A+1;
            5'b00110: aluresult=A-1;
            5'b00111: aluresult=A&B;
            5'b01000: aluresult=A|B;
            5'b01001: aluresult=A^B;
            5'b01010: aluresult=~A;
            5'b01111: aluresult =B;
            5'b10000: aluresult =B;
          
                        
            default:aluresult =19'd0;
        endcase
   end         
endmodule
