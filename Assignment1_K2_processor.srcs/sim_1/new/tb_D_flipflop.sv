`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 07:19:08
// Design Name: 
// Module Name: tb_D_flipflop
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


module tb_D_flipflop();

parameter int n = 4;
logic clk, en, Rst;
logic [n-1:0] data;
logic [n-1:0] Q;

D_flipflop #(.n(n)) dff(.*);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period clock
end

// Stimulus
initial begin
    // Initialize inputs
    Rst  = 0;
    en = 0;
    data= 0;

    // Apply reset
    $display("Applying reset...");
    Rst  = 1;
    #10;
    Rst  = 0;
    #10;

    // Test writing to the register
    $display("Testing write operation...");
    en = 1;
    data= 4'b1010; // Write 1010 to the register
    #10;
//    @(negedge clk);

    // Check the output
    if (Q !== 4'b1010)
        $display("Test FAILED: Expected 1010, got %b", Q);
    else
        $display("Test PASSED: Output matches expected value");

    // Disable write and change input
    $display("Testing disable operation...");
    en = 0;
    data = 4'b0101;
    #10;

    if (Q !== 4'b1010)
        $display("Test FAILED: Expected 1010, got %b", Q);
    else
        $display("Test PASSED: Output remains unchanged when enable is low");

    // Reset again
    $display("Testing reset operation...");
    Rst = 1;
    #10;

    if (Q !== 4'b0000)
        $display("Test FAILED: Expected 0000 after reset, got %b", Q);
    else
        $display("Test PASSED: Output reset to 0000");

    $finish; 
end

endmodule
