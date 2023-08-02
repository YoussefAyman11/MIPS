`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 05:16:31 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [5:0] Opcode,
    input [5:0] Funct,
    output reg MemtoReg,
    output reg MemWrite,
    output reg Branch,
    output reg ALUSrc,
    output reg RegDst,
    output reg RegWrite,
    output reg Jump,
    output reg [2:0] ALUControl 
    );
    
    reg [1:0] ALUOp;
    
    always @(*) begin
        MemtoReg = 0;
        MemWrite = 0;
        Branch = 0;
        ALUSrc = 0;
        RegDst = 0;
        RegWrite = 0;
        Jump = 0;
        ALUOp = 'b0;
        case(Opcode)
            6'b10_0011: begin
                ALUSrc = 1;
                RegWrite = 1;
                MemtoReg = 1;
            end
            
            6'b10_1011: begin
                ALUSrc = 1;
                MemWrite = 1;
                MemtoReg = 1;
            end
            
            6'b00_0000: begin
                ALUOp = 'b10;
                RegDst = 1;
                RegWrite = 1;
            end
            
            6'b00_1000: begin
                ALUSrc = 1;
                RegWrite = 1;
            end
            
            6'b00_0100: begin
                ALUOp = 'b01;
                Branch = 1;
            end
            
            6'b00_0010: begin
                Jump = 1;
            end
            
            default: begin
                MemtoReg = 0;
                MemWrite = 0;
                Branch = 0;
                ALUSrc = 0;
                RegDst = 0;
                RegWrite = 0;
                Jump = 0;
                ALUOp = 'b0;
            end
        endcase
    end
    
    always @(*) begin
        ALUControl = 3'b000;
        casex({ALUOp,Funct})
            'b00XXXXXX: ALUControl = 3'b010;
            'b01XXXXXX: ALUControl = 3'b100;
            'b10100000: ALUControl = 3'b010;
            'b10100010: ALUControl = 3'b100;
            'b10101010: ALUControl = 3'b110;
            'b10011100: ALUControl = 3'b101;
            default: ALUControl = 3'b010;
        endcase
    end
endmodule
