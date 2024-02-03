`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/21 23:06:38
// Design Name: 
// Module Name: tb_display
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


module tb_display(

    );
reg [1:0] result;
wire [6:0] seg_display;

// Instantiate the display_control module
display_control uut (
    .result(result),
    .seg_display(seg_display)
);

// Test sequence
initial begin
    // Test Case 1: Correct guess
    result = 2'b00; // Set result to CORRECT
    #10; // Wait for 10ns

    // Test Case 2: Guess is higher
    result = 2'b01; // Set result to UP
    #10; // Wait for 10ns

    // Test Case 3: Guess is lower
    result = 2'b10; // Set result to DOWN
    #10; // Wait for 10ns

    // Test Case 4: Default case
    result = 2'b11; // Set result to an undefined value
    #10; // Wait for 10ns

    // Finish the simulation
    $finish;
end

// Monitoring the 7-segment display output
initial begin
    $monitor("Time = %t, Result = %b, 7-segment Display = %b", 
             $time, result, seg_display);
end

endmodule
