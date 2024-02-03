`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/15 16:25:45
// Design Name: 
// Module Name: top_game
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


module top_game(
    input clk,
    input reset,
    input guess_trigger,         // Trigger signal for guessing
    input [6:0] user_input,      // User input number
    output [6:0] seg_display,    // 7-segment display output
    output [6:0] random_number_out // Output for monitoring the random number
);


// Internal signals
wire [6:0] random_number;
wire [6:0] guess_number;
wire guess_ready;
wire [1:0] comparison_result;
wire start_random_gen;
wire [6:0] game_status;
wire game_over;

assign random_number_out = random_number;

// Instantiate Random Number Generator Module
random_num top1 (
    .clk(clk),
    .reset(reset), // Reset RNG on game reset or when start signal is asserted
    .generate_num(start_random_gen),
    .random(random_number)
);

// Instantiate Guess Input Module
guess_input top2 (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger && !game_over), // Allow guessing only if game is not over
    .user_number(user_input),
    .guess_number(guess_number),
    .guess_ready(guess_ready)
);

// Instantiate Comparison Module
compare top3 (
    .actual_number(random_number),
    .guess_number(guess_number),
    .result(comparison_result)
);

// Instantiate Display Control Module
display_control top4 (
    .result(game_over ? game_status : comparison_result), // Display game status if over, else comparison result
    .seg_display(seg_display)
);

// Instantiate Game Control Module
game_control top5 (
    .clk(clk),
    .reset(reset),
    .comparison_result(guess_ready ? comparison_result : 2'b11), // Consider comparison result only when a new guess is ready
    .start_random_gen(start_random_gen),
    .game_status(game_status),
    .game_over(game_over)
);

endmodule
