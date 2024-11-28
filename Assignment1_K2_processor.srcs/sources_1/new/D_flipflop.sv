`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 01:25:45
// Design Name: 
// Module Name: D_flipflop
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


// this module could also be used as registers
module D_flipflop #(parameter int n=1) (
    input logic clk,
    input logic en,
    input logic Rst,
    input logic [n-1:0] data,
    output logic [n-1:0] Q
    );
    
    always @ ( posedge clk, negedge Rst) begin  // "posedge" to apply Rst once and no more
        if ( !Rst ) begin  // don't forget to use " ! "  symbol when you use "negedge" sensitivity
            Q <= {n{1'b0}};
        end else if (en) begin
            Q <= data;
        end
    end
    
endmodule
