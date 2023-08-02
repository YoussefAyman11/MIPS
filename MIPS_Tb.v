`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2023 08:06:51 PM
// Design Name: 
// Module Name: MIPS_Tb
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


module MIPS_Tb();

parameter clk_period = 10;
reg clk = 0;
always #(clk_period/2) clk = ~clk;

reg reset;
wire [15:0] test_value;

MIPS_Top dut(
    .clk(clk),
    .reset(reset),
    .test_value(test_value)
);

initial begin
    reset = 0;
    #10;
    reset = 1;
    #500;
    reset = 0;
    #10;
    
    $finish();
end
    
endmodule
