`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 00:19:15
// Design Name: 
// Module Name: guess_and_compare
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


module guess_and_compare(
    input clk,
    input reset,
    input guess_trigger,
    input [6:0] user_number,
    input [6:0] actual_number,  // Now as an input
    output [1:0] comparison_result
);

// Internal signals
wire [6:0] guess_number;
wire guess_ready;

// Instantiate guess_input module
guess_input guess_input_inst (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .guess_number(guess_number),
    .guess_ready(guess_ready)
);

// Instantiate compare module
compare compare_inst (
    .actual_number(actual_number),
    .guess_number(guess_number),
    .result(comparison_result)
);

endmodule
