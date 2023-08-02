`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 04:48:18 PM
// Design Name: 
// Module Name: Reg_File
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


module Reg_File(
    input clk,
    input reset,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    input WE3,
    output [31:0] RD1,
    output [31:0] RD2
    );
    
    reg [31:0] mem [0:99];
    integer i;
    
    
    always @(posedge clk,negedge reset) begin
        if(!reset) begin
            for(i = 0; i < 100; i = i + 1)
                mem[i] <= 'b0;
        end
        else if(WE3)
            mem[A3] <= WD3;
        end
        
        assign RD1 = mem[A1];
        assign RD2 = mem[A2];

endmodule
