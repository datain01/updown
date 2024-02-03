`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/14 22:24:10
// Design Name: 
// Module Name: display_control
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


module display_control(
    input reset,
    input [1:0] result,
    input [6:0] game_status,
    input game_over,
    output reg [6:0] seg_display
);

parameter WIN_DISPLAY      = 7'b0000001; 
parameter UP_DISPLAY       = 7'b1000001;
parameter DOWN_DISPLAY     = 7'b1000010; 
parameter INIT_DISPLAY  = 7'b0000000;

always @(*) begin
    if (reset) begin
        seg_display = INIT_DISPLAY; 
    end else if (game_over) begin
        seg_display = game_status; 
    end else begin
        case (result)
            2'b00: seg_display = WIN_DISPLAY;
            2'b01: seg_display = UP_DISPLAY; 
            2'b10: seg_display = DOWN_DISPLAY; 
            default: seg_display = 7'b0000000; 
        endcase
    end
end

endmodule

