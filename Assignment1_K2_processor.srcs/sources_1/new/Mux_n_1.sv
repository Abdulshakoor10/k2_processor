`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 08:12:32
// Design Name: 
// Module Name: Mux_n_1
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


module Mux_n_1 #
    (
    parameter valBits=1,
    parameter selBits=1
    )
    (
    input logic [valBits - 1 : 0] values [(2**selBits)-1: 0],
    input logic [selBits-1: 0] sel,  //select
    output logic [valBits-1 : 0] out
    );
    
    assign out = values[sel];
    
endmodule
