`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 07:49:21
// Design Name: 
// Module Name: nbits_Dec
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


module nbits_Dec#(parameter  n = 2)
     (
     input logic [n-1 :0] s,
     output logic [(2**n)-1 : 0] out
    );
    
    always @(*) begin
        out = 'b0;  //auto fill
        out [s] = 1'b1;
    end
    
endmodule
