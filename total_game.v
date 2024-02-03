`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 15:19:08
// Design Name: 
// Module Name: total_game
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


module total_game(
    input clk,
    input reset,
    input guess_trigger,
    input [6:0] user_number,
    output [6:0] seg_display,
    output game_over,
    output [6:0] actual_number_out // 외부로 숫자 출력
);

// Internal signals
wire [6:0] guess_number;
wire [1:0] comparison_result;
wire [6:0] game_status;
wire [6:0] actual_number; // num_generator에서 생성된 숫자

// Instantiate num_generator module
num_generator f0 (
    .clk(clk),
    .reset(reset),
    .generated_number(actual_number)
);

// Instantiate guess_input module
guess_input f1(
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .guess_number(guess_number)
);

// Instantiate compare module
compare f2(
    .actual_number(actual_number),
    .guess_number(guess_number),
    .result(comparison_result)
);

// Instantiate game_control module
game_control f3(
    .clk(clk),
    .reset(reset),
    .comparison_result(comparison_result),
    .guess_trigger(guess_trigger),
    .game_status(game_status),
    .game_over(game_over)
);

// Instantiate display_control module
display_control f4(
    .reset(reset),
    .result(comparison_result),
    .game_status(game_status),
    .game_over(game_over),
    .seg_display(seg_display)
);

// 실제 숫자 값을 외부로 출력
assign actual_number_out = actual_number;

endmodule
