`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 05:03:48 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk,
    input reset,
    input [31:0] A,
    input [31:0] WD,
    input WE,
    output [31:0] RD,
    output [15:0] test_value
    );
    
    reg [31:0] mem [0:99];
    integer i;
    
    
    always @(posedge clk,negedge reset) begin
        if(!reset) begin
            for(i = 0; i < 100; i = i + 1)
                mem[i] <= 'b0;
        end
        else if(WE)
            mem[A] <= WD;
        end
        
        assign RD = mem[A];
        assign test_value = mem[0];

endmodule
