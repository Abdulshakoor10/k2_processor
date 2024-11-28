`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 08:37:53
// Design Name: 
// Module Name: K2_ALU
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


module K2_ALU#(parameter n = 1)
    (
    input logic clk,
    input logic [n-1 : 0] a,
    input logic [n-1 : 0] b,
    input logic sub,
    output logic [n-1 : 0] result,
    output logic zero
    );
    
//    D_fliplflop #(.n(n)) result_reg (
//    
//    );
endmodule
