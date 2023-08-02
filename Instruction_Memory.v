`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 04:35:27 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input [31:0] PC,
    output [31:0] instr
    );
    
    reg [31:0] memory [0:99];
    
    initial begin
        $readmemh("instruction_memory.mem",memory);
    end
    
    assign instr = memory[PC>>2];
    
endmodule
