`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 00:16:38
// Design Name: 
// Module Name: fetch_cycle
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


module fetch_cycle(rst,clk,instrD,pcD,pcplus4D,immextE,jumpE,sp);
input rst,clk;
input [18:0]immextE,sp;
input [1:0]jumpE;
output [18:0] instrD;
output [18:0]pcD,pcplus4D;


wire [18:0] pcF,pcplus4F,pcF_bar;
wire [18:0] instrF;

reg [18:0] pcF_reg,pcplus4F_reg;
reg [18:0] instrF_reg;

pc_addr adder(
         .a(pcF),
         .b(19'd4),
         .c(pcplus4F)
         );

        
pc_module pc(
           .clk(clk),
           .rst(rst),
           .pc_next(pcF_bar),
           .pc(pcF)
           );  
           
                 
 instruction_mem memory(
                         .pc(pcF),
                         .RD(instrF),
                         .rst(rst),
                         .clk(clk)
                       );       
 
 
 mux3_1 pcmux(
              .a(pcplus4F),
              .b(immextE),
              .c(sp),
              .sel(jumpE),
              .e(pcF_bar)
              );                 


// mux2_1 pcmux(
//               .a(pcplus4F),
//               .b(immextE),
//               .sel(jumpE),
//               .c(pcF_bar) 
//               );                 
      
     always@(posedge clk )
        begin
            if(rst==1'b0)
                begin
                    pcF_reg<=0;
                    pcplus4F_reg<=0;
                    instrF_reg<= 0;
                end
                
                else   
                    begin
                         pcF_reg<=pcF;
                         pcplus4F_reg<=pcplus4F;
                         instrF_reg<= (jumpE!=2'b00)?19'd0:instrF; 
                    end
          end
          
    assign instrD   =(rst==1'b0)?{19{1'b0}}:instrF_reg;
    assign pcplus4D =(rst==1'b0)?{19{1'b0}}:pcplus4F_reg;  
    assign pcD      =(rst==1'b0)?{19{1'b0}}:pcF_reg;                
                            
    initial begin
    $monitor("time=%0t pcF=%d pcF_bar=%d jumpE=%b instrF=%b",
             $time, pcF, pcF_bar, jumpE, instrF);
end
              
endmodule
