`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/21 23:02:21
// Design Name: 
// Module Name: tb_compare
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


module tb_compare(

    );
reg [6:0] actual_number;
reg [6:0] guess_number;
wire [1:0] result;

// Instantiate the compare module
compare uut (
    .actual_number(actual_number),
    .guess_number(guess_number),
    .result(result)
);

// Test sequence
initial begin
    // Test Case 1: Guess is correct
    actual_number = 7'b0101010; // Set actual number
    guess_number = 7'b0101010; // Set guess number
    #10; // Wait for 10ns

    // Test Case 2: Guess is higher
    guess_number = 7'b1010101; // Set guess number to a higher value
    #10; // Wait for 10ns

    // Test Case 3: Guess is lower
    guess_number = 7'b0010101; // Set guess number to a lower value
    #10; // Wait for 10ns

    // Finish the simulation
    $finish;
end

// Monitoring the result
initial begin
    $monitor("Time = %t, Actual Number = %d, Guess Number = %d, Result = %b", 
             $time, actual_number, guess_number, result);
end

endmodule
