`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 06:21:30 PM
// Design Name: 
// Module Name: Mux
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


module Mux
    #(parameter bits_num = 32)(
    input [bits_num-1:0] in1,
    input [bits_num-1:0] in2,
    input sel,
    output [bits_num-1:0] out
    );
    
    assign out = (sel)?(in1):(in2);
    
endmodule
