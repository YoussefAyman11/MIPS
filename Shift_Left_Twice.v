`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 06:13:30 PM
// Design Name: 
// Module Name: Shift_Left_Twice
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


module Shift_Left_Twice
    #(parameter bits_num = 32)(
    input [bits_num-1:0] in,
    output [bits_num-1:0] out
    );
    
    assign out = in<<2;
    
endmodule
