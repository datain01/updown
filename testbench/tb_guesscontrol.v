`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 10:52:56
// Design Name: 
// Module Name: tb_guesscontrol
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


module tb_guesscontrol(

    );

reg clk;
reg reset;
reg guess_trigger;
reg [6:0] user_number;
wire [6:0] seg_display;
wire game_over;

// Instantiate the four_control module
four_control uut (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .seg_display(seg_display),
    .game_over(game_over)
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
    user_number = 7'b0000000;

    // Global reset
    #100;
    reset = 0;

    // Test Cases
    // Case 1: Incorrect guess
    #20;
    user_number = 7'b1010101; // Set user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger

    // Case 2: Another incorrect guess
    #30;
    user_number = 7'b0000011; // Change user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #40;
    user_number = 7'b0011111; // Change user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #50;
    user_number = 7'b0000001; // Change user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #60;
    user_number = 7'b1000000; // Change user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #70;
    user_number = 7'b0001100; // Change user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #80;
    user_number = 7'b1000000; // Change user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #90;
    user_number = 7'b0000001; // Change user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #100;
    user_number = 7'b0011111; // Change user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    
    #110;
    user_number = 7'b0000001; // Change user guess number
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger
    

    // Add more test cases as required
    #30

    $finish;
end

// Monitoring the outputs
initial begin
    $monitor("Time = %t, User Number = %d, 7-segment Display = %b, Game Over = %b", 
             $time, user_number, seg_display, game_over);
end

endmodule