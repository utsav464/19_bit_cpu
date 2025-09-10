`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2025 21:38:36
// Design Name: 
// Module Name: stack_pointer
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


module stack_pointer(clk,rst,push,pop,pcD,data_out,sp);
input clk,rst,push,pop;
input [18:0]pcD;
output reg [18:0]  data_out;
output reg [18:0] sp;


reg [18:0] stack_mem [0:1023]; 



always @(negedge clk) begin
        if (!rst) 
        begin
            sp <= 19'd1023;
            data_out <= 19'd0;
        end
        else begin
            if (push) begin
                stack_mem[sp] <= pcD; 
                sp <= sp - 4;            
            end
            else if (pop) begin
                sp <= sp + 4;           
                data_out <= stack_mem[sp + 4]; 
            end
        end
    end       
endmodule