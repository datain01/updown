`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/21 23:11:25
// Design Name: 
// Module Name: tb_control
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


module tb_control(

    );

reg clk;
reg reset;
reg [1:0] comparison_result;
wire start_random_gen;
wire [6:0] game_status;
wire game_over;

// Instantiate the game_control module
game_control uut (
    .clk(clk),
    .reset(reset),
    .comparison_result(comparison_result),
    .start_random_gen(start_random_gen),
    .game_status(game_status),
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
    reset = 1; // Apply reset
    comparison_result = 2'b11; // Set an initial undefined value

    // Wait for 100 ns for global reset to finish
    #100;
    reset = 0;

    // Simulate incorrect guesses 10 times
    repeat (10) begin
        #10; 
        comparison_result = 2'b01; // Simulate incorrect guess
    end

    // Additional time for observing the game over condition
    #20;

    // Simulate additional incorrect guesses after the game is over
    repeat (3) begin
        #10; 
        comparison_result = 2'b01; // Simulate incorrect guess
    end

    // Finish the simulation
    #50;
    $finish;
end

// Monitoring the game control outputs
initial begin
    $monitor("Time = %t, Comparison Result = %b, Start Random Gen = %b, Game Status = %b, Game Over = %b", 
             $time, comparison_result, start_random_gen, game_status, game_over);
end

endmodule