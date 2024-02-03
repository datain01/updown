`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 10:07:24
// Design Name: 
// Module Name: guess_compare_display
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


module guess_compare_display(
    input clk,
    input reset,
    input guess_trigger,
    input [6:0] user_number,
    input [6:0] actual_number,
    output [6:0] seg_display,
    output [1:0] comparison_result
);

// Internal signals
wire [6:0] guess_number;

// Instantiate guess_input module
guess_input guess_input_inst (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .guess_number(guess_number)
);

// Instantiate compare module
compare compare_inst (
    .actual_number(actual_number),
    .guess_number(guess_number),
    .result(comparison_result)
);

// Instantiate display_control module
display_control display_control_inst (
    .result(comparison_result),
    .seg_display(seg_display)
);

endmodule

