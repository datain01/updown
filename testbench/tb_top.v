`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/15 16:28:23
// Design Name: 
// Module Name: tb_top
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


module tb_top(

    );
reg clk;
reg reset;
reg guess_trigger;
reg [6:0] user_input;
wire [6:0] seg_display;
wire [6:0] random_number_out;

// Instantiate the top-level module
top_game uut (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_input(user_input),
    .seg_display(seg_display),
    .random_number_out(random_number_out)
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
    user_input = 0;

    // Wait for 100 ns for global reset to finish
    #100;
    reset = 0;

    // Simulate 10 guesses
    repeat (15) begin
        #20; // Wait for some time between guesses
        user_input = $random % 128; // Random guess between 0 and 127
        guess_trigger = 1; // Trigger the guess
        #10; 
        guess_trigger = 0; // Reset the trigger
    end

    // Finish the simulation
    #100;
    $finish;
end

// Monitoring the display and game state
initial begin
    $monitor("Time = %t, Display = %b, User Input = %d, Random Number = %d", 
             $time, seg_display, user_input, random_number_out);
end


endmodule
