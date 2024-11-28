`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 08:31:56
// Design Name: 
// Module Name: adder_sub
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


module adder_sub#(parameter n = 1)
    (
    input logic [n-1 : 0] a,
    input logic [n-1 : 0] b,
    input logic cin,
    output logic [n-1 : 0] result,
    output logic Cout
    );
    
    assign {Cout, result} = cin? a-b : a+b; 
    // my Note: we can also gate-level modeling
    
endmodule
