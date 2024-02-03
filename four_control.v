`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 11:41:16
// Design Name: 
// Module Name: four_control
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


module four_control(
    input clk,
    input reset,
    input guess_trigger,
    input [6:0] user_number,
    output [6:0] seg_display,
    output game_over
);

// Internal signals
wire [6:0] guess_number;
wire [1:0] comparison_result;
wire [6:0] game_status;
reg [6:0] actual_number = 7'b0001111; // 내부 레지스터로 선언

guess_input f1(
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .guess_number(guess_number)
);

compare f2(
    .actual_number(actual_number),
    .guess_number(guess_number),
    .result(comparison_result)
);

game_control f3(
    .clk(clk),
    .reset(reset),
    .comparison_result(comparison_result),
    .guess_trigger(guess_trigger),  
    .game_status(game_status),
    .game_over(game_over)
);

display_control f4(
    .reset(reset),
    .result(comparison_result),
    .game_status(game_status),
    .game_over(game_over),
    .seg_display(seg_display)
);

endmodule
