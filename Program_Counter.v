`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 03:44:00 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input clk,
    input reset,
    input [31:0] PC_in,
    output reg [31:0] PC_out
    );
    
    always @(posedge clk,negedge reset) begin
        if(!reset)
            PC_out <= 'b0;
        else
            PC_out <= PC_in;
    end
    
endmodule
