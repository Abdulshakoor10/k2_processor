`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 08:00:03
// Design Name: 
// Module Name: tb_nbits_Dec
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


module tb_nbits_Dec( );

parameter n = 2;

// Testbench signals
logic [n-1 : 0] s;
logic [(2**n)-1 : 0] out;

nbits_Dec #(n) Decoder2 ( .* );

// alternatice for instanctiation
//nbits_Dec #(n) Decoder2 (
//    .s(s), 
//    .out(out)
//);

logic [(2**n)-1 : 0] expected_out = 0;   // n-bits value for evaluation
initial begin
    $display("Starting Decoder Testbench...");
    $display("Input (s) | Expected Output (out) | Observed Output (out) | Test Result");

    for (int i = 0; i < 2**n; i = i + 1) begin
        s = i;  // specefiy the selector value
        #10;
        expected_out  = 1 << s;

        // Check if the output matches the expected value
        if (out === expected_out) begin
            $display("%b         | %b                 | %b                 | PASSED", s, expected_out, out);
        end else begin
            $display("%b         | %b                 | %b                 | FAILED", s, expected_out, out);
        end
    end

    $display("Decoder Testbench Completed.");
    $finish;
end

endmodule
