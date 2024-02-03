`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/21 22:41:03
// Design Name: 
// Module Name: tb_guess
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


module tb_guess(

    );
reg clk;
reg reset;
reg guess_trigger;
reg [6:0] user_number;
wire [6:0] guess_number;
wire guess_ready;

// Instantiate the guess_input module
guess_input uut (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .guess_number(guess_number),
    .guess_ready(guess_ready)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Generate a clock with a period of 10ns
end

// Test sequence
initial begin
    // Initialize Inputs
    reset = 1; // Apply reset
    guess_trigger = 0;
    user_number = 0;

    // Wait for 20 ns for global reset to finish
    #20;
    reset = 0;

    // Simulate a user guess
    #10; // Wait for some time
    user_number = 7'b0101010; // Set a user guess
    guess_trigger = 1; // Trigger the guess
    #10; 
    guess_trigger = 0; // Reset the trigger

    // Wait and then simulate another guess
    #30;
    user_number = 7'b1010101; // Change the user guess
    guess_trigger = 1; // Trigger the guess
    #10;
    guess_trigger = 0; // Reset the trigger

    // Finish the simulation
    #50;
    $finish;
end

// Monitoring the outputs
initial begin
    $monitor("Time = %t, Guess Number = %d, Guess Ready = %b", 
             $time, guess_number, guess_ready);
end

endmodule