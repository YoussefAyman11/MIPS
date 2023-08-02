`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 03:24:28 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    output reg [31:0] ALUResult,
    output Zero
    );
    
    
    always @(*) begin
        ALUResult = 'b0;
        case(ALUControl)
            'b000: ALUResult = SrcA & SrcB;
            'b001: ALUResult = SrcA | SrcB;
            'b010: ALUResult = SrcA + SrcB;
            'b011: ALUResult = 0;
            'b100: ALUResult = SrcA - SrcB;
            'b101: ALUResult = SrcA * SrcB;
            'b110: ALUResult = (SrcA < SrcB);
            'b111: ALUResult = 0;
            default: ALUResult = 0;
        endcase
    end
    
    assign Zero = (ALUResult == 'b0);
    
endmodule
