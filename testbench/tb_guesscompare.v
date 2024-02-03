`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 00:20:33
// Design Name: 
// Module Name: tb_guesscompare
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


module tb_guesscompare(

    );
reg clk;
reg reset;
reg guess_trigger;
reg [6:0] user_number;
reg [6:0] actual_number;
wire [6:0] seg_display;

// Instantiate the guess_compare_display module
guess_compare_display uut (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .actual_number(actual_number),
    .seg_display(seg_display)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Generate a clock with a period of 10ns
end

// Test sequence
initial begin
    // Initialize Inputs
    reset = 1; 
    guess_trigger = 0;
    user_number = 0;
    actual_number = 7'b0101010; // Set the actual number

    // Wait for 100 ns for global reset to finish
    #100;
    reset = 0;

    // Simulate guesses
    #10;
    user_number = 7'b0101010; // Set user guess number
    #20; // Delay before triggering the guess
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger

    #20;
    user_number = 7'b1010101; // Change user guess number
    #20; // Delay before triggering the guess
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #30;
    user_number = 7'b0000001; // Change user guess number
    #20; // Delay before triggering the guess
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #40;
    user_number = 7'b0001101; // Change user guess number
    #20; // Delay before triggering the guess
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger

    // Finish the simulation
    #50;
    $finish;
end

// Monitoring the 7-segment display output
initial begin
    $monitor("Time = %t, User Number = %d, Actual Number = %d, 7-segment Display = %b", 
             $time, user_number, actual_number, seg_display);
end

endmodule