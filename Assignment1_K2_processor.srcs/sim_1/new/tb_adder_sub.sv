`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 08:47:47
// Design Name: 
// Module Name: tb_adder_sub
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


module tb_adder_sub();

parameter n = 4;
logic [n-1 : 0] a;
logic [n-1 : 0] b;
logic cin;
logic [n-1 : 0] result;
logic Cout;

// Instantance
adder_sub #(n) DUT (
    .a(a),
    .b(b),
    .cin(cin),
    .result(result),
    .Cout(Cout)
);

initial begin
    $display("Starting adder_sub Testbench...");
    $display(" a    |  b    | cin | Expected Result | Observed Result | Cout | Test Result");

    // Test Cases
    a = 4'b0001; b = 4'b0010; cin = 1'b0; #10; // Test addition: 1 + 2
    check_result(4'b0011, 1'b0);                       // call task to check results

    a = 4'b1010; b = 4'b0101; cin = 1'b0; #10; // Test addition: 10 + 5
    check_result(4'b1111, 1'b0);

    a = 4'b1111; b = 4'b0001; cin = 1'b0; #10; // Test addition with carry: 15 + 1
    check_result(4'b0000, 1'b1);

    a = 4'b0101; b = 4'b0011; cin = 1'b1; #10; // Test subtraction: 5 - 3
    check_result(4'b0010, 1'b0);

    a = 4'b0110; b = 4'b0110; cin = 1'b1; #10; // Test subtraction: 6 - 6
    check_result(4'b0000, 1'b0);

    a = 4'b1000; b = 4'b1001; cin = 1'b1; #10; // Test subtraction with underflow: 8 - 9
    check_result(4'b1111, 1'b1);

    $display("adder_sub Testbench Completed.");
    $finish;
end

// Task to check the result  (task like function but better)
task check_result(
    input logic [n-1 : 0] expected_result,
    input logic expected_Cout
    );
    if (result === expected_result && Cout === expected_Cout) begin
        $display("%b | %b |  %b  |       %b       |       %b       |  %b  | PASSED", 
                  a, b, cin, expected_result, result, Cout);
    end else begin
        $display("%b | %b |  %b  |       %b       |       %b       |  %b  | FAILED", 
                  a, b, cin, expected_result, result, Cout);
    end
endtask

endmodule
