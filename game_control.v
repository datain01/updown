`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/15 16:17:09
// Design Name: 
// Module Name: game_control
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

module game_control(
    input clk,
    input reset,
    input [1:0] comparison_result,
    input guess_trigger,  
    output reg [6:0] game_status,
    output reg game_over
);

reg [3:0] attempt_count;
parameter WIN_DISPLAY  = 7'b0000001;
parameter LOSE_DISPLAY = 7'b1110001;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        attempt_count <= 0;
        game_status <= 7'b0000000;
        game_over <= 0;
    end else 
        if (guess_trigger) begin
            if (comparison_result == 2'b00) begin
                game_status <= WIN_DISPLAY;
                game_over <= 1;
            end else begin
                attempt_count <= attempt_count + 1;
                if (attempt_count >= 9) begin
                    game_status <= LOSE_DISPLAY;
                    game_over <= 1;
                end
            end
        end
    end


endmodule
