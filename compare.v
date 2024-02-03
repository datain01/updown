`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/14 22:23:42
// Design Name: 
// Module Name: compare
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


module compare(
    input [6:0] actual_number, // 7-bit actual number from the RNG
    input [6:0] guess_number,  // 7-bit user guess number
    output reg [1:0] result    // Result of comparison (00: CORRECT, 01: UP, 10: DOWN)
);

always @(*) begin
    if (guess_number == actual_number)
        result = 2'b00; // CORRECT
    else if (guess_number > actual_number)
        result = 2'b01; // UP
    else
        result = 2'b10; // DOWN
end

endmodule
