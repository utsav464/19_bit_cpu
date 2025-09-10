;`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2025 22:13:02
// Design Name: 
// Module Name: mux3_1
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


module mux3_1(a,b,c,e,sel);
  
  
  input [18:0] a, b, c;
  input [1:0] sel;
  output reg [18:0] e;
  
  
always @(*) begin
    case(sel)
        2'b00: e = a;  
        2'b01: e = b;  
        2'b11: e = c;                             
        default: e = a;                           
    endcase                                       
end
endmodule