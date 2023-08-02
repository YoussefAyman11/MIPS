`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 06:47:13 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
    input clk,
    input reset,
    input MemtoReg,
    input MemWrite,
    input Branch,
    input ALUSrc,
    input RegDst,
    input RegWrite,
    input Jump,
    input [2:0] ALUControl,
    output [5:0] Opcode,
    output [5:0] Funct,
    output [15:0] test_value
    );
    
    wire [31:0] PC_in_sig,PC_out_sig,instruction,RD1_sig,RD2_sig,m_alu_out;
    wire [31:0] aluresult_sig,m_branch_out,RD_mem,WD3_sig,SignImm_sig;
    wire [31:0] Sh1_out,Add1_out,Add2_out;
    wire [27:0] Sh2_out;
    wire [4:0] A3_sig;
    wire zero_sig;
    
    Mux #(.bits_num('d32)) m_branch(
        .in1(Add1_out),
        .in2(Add2_out),
        .sel(Branch & zero_sig),
        .out(m_branch_out)
    );
    
    Mux #(.bits_num('d32)) m_jump(
        .in1({Add2_out[31:28],Sh2_out[27:0]}),
        .in2(m_branch_out),
        .sel(Jump),
        .out(PC_in_sig)
    );
    
    Program_Counter PC(
        .clk(clk),
        .reset(reset),
        .PC_in(PC_in_sig),
        .PC_out(PC_out_sig)
    );
    
    Instruction_Memory IM(
        .PC(PC_out_sig),
        .instr(instruction)
    );
    
    Reg_File rf(
        .clk(clk),
        .reset(reset),
        .A1(instruction[25:21]),
        .A2(instruction[20:16]),
        .A3(A3_sig),
        .WD3(WD3_sig),
        .WE3(RegWrite),
        .RD1(RD1_sig),
        .RD2(RD2_sig)
    );
    
    Mux #(.bits_num('d5)) m_A3(
        .in1(instruction[15:11]),
        .in2(instruction[20:16]),
        .sel(RegDst),
        .out(A3_sig)
    );
    
    Mux #(.bits_num('d32)) m_alu(
        .in1(SignImm_sig),
        .in2(RD2_sig),
        .sel(ALUSrc),
        .out(m_alu_out)
    );
    
    ALU ALU1(
        .SrcA(RD1_sig),
        .SrcB(m_alu_out),
        .ALUControl(ALUControl),
        .ALUResult(aluresult_sig),
        .Zero(zero_sig)
    );
    
    Data_Memory DM(
        .clk(clk),
        .reset(reset),
        .A(aluresult_sig),
        .WD(RD2_sig),
        .WE(MemWrite),
        .RD(RD_mem),
        .test_value(test_value)
    );
    
    Mux #(.bits_num('d32)) DM_mux(
        .in1(RD_mem),
        .in2(aluresult_sig),
        .sel(MemtoReg),
        .out(WD3_sig)
    );
    
    Sign_Extend SE(
        .Instr(instruction[15:0]),
        .SignImm(SignImm_sig)
    );
    
    Shift_Left_Twice #(.bits_num('d32)) Sh1(
        .in(SignImm_sig),
        .out(Sh1_out)
    );
    
    Adder Add1(
        .A(Sh1_out),
        .B(Add2_out),
        .C(Add1_out)
    );
    
    Adder Add2(
        .A(PC_out_sig),
        .B('d4),
        .C(Add2_out)
    );
    
    Shift_Left_Twice #(.bits_num('d28)) Sh2(
        .in({2'b00,instruction[25:0]}),
        .out(Sh2_out)
    );
    
    assign Opcode = instruction[31:26];
    assign Funct = instruction[5:0];
    
endmodule
