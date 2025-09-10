`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2025 21:57:10
// Design Name: 
// Module Name: pipeline_tb
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


module pipeline_tb();


    reg clk = 1'b0;
    reg rst;

    // Instantiate the single_cycle CPU
pipeline_top     DUT (
        .clk(clk),
        .rst(rst)
    );
    // Clock generation: 50ns half period → 100ns full period (10 MHz)
    always #50 clk = ~clk;

    // Reset sequence
    initial begin
        rst = 1'b0;      // Assert reset
        #100;
        rst = 1'b1;      // Deassert reset after 100ns
    end

   initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end


endmodule