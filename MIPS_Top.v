`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 08:01:12 PM
// Design Name: 
// Module Name: MIPS_Top
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


module MIPS_Top(
    input clk,
    input reset,
    output [15:0] test_value
    );
    
    wire MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,Jump;
    wire [2:0] ALUControl;
    wire [5:0] Opcode,Funct;
    
    Datapath dp(
        .clk(clk),
        .reset(reset),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .Jump(Jump),
        .ALUControl(ALUControl),
        .Opcode(Opcode),
        .Funct(Funct),
        .test_value(test_value)
    );
    
    Control_Unit cu(
        .Opcode(Opcode),
        .Funct(Funct),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .Jump(Jump),
        .ALUControl(ALUControl)
    );
    
endmodule
