`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 10:51:44
// Design Name: 
// Module Name: guess_game_control
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


module guess_game_control(
    input clk,
    input reset,
    input guess_trigger,
    input [6:0] user_number,
    input [6:0] actual_number,
    output [6:0] seg_display,
    output game_over,
    output [6:0] game_status_output
);


wire [1:0] comparison_result;

assign game_status_output = game_status;

guess_compare_display g1 (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .actual_number(actual_number),
    .seg_display(seg_display),
    .comparison_result(comparison_result) 
);

// game_control ¸ðµâ
game_control g2 (
    .clk(clk),
    .reset(reset),
    .comparison_result(comparison_result), 
    .start_random_gen(start_random_gen),
    .game_status(game_status),
    .game_over(game_over)
);

endmodule

