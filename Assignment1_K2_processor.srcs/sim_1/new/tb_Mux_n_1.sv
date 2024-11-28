`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 08:13:01
// Design Name: 
// Module Name: tb_Mux_n_1
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


module tb_Mux_n_1();

parameter valBits = 4;
parameter selBits = 2;
parameter SIZE = 2**selBits;

logic [valBits - 1 : 0] values [SIZE-1 : 0];
logic [selBits - 1 : 0] sel;
logic [valBits - 1 : 0] out;

Mux_n_1 #(valBits, selBits) mux_4to1(
    .values(values),
    .sel(sel),
    .out(out)
);

initial begin
    $display("Starting MUX Testbench...");
    $display("Selector (sel) | Expected Output | Observed Output | Test Result");

    // Initialize input values
    for (int i = 0; i < SIZE; i = i + 1) begin
        values[i] = i + 1;
    end

    // test all possible selector values
    for (int i = 0; i < SIZE; i = i + 1) begin
        sel = i; // Set selector
        #10;     // Wait for the output to stabilize

        // Check if the output matches the expected value
        if (out === values[sel]) begin
            $display("%b              | %b             | %b             | PASSED", sel, values[sel], out);
        end else begin
            $display("%b              | %b             | %b             | FAILED", sel, values[sel], out);
        end
    end

    $display("MUX Testbench Completed.");
    $finish;
end


endmodule
