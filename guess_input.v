`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/14 22:09:11
// Design Name: 
// Module Name: guess_input
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


module guess_input(
    input clk,               
    input reset,            
    input guess_trigger,      // 1-bit guess trigger signal
    input [6:0] user_number,  // 7-bit user number input
    output reg [6:0] guess_number, // 7-bit output to the comparison module
    output reg guess_ready  
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        guess_number <= 0;
        guess_ready <= 0;
    end else if (guess_trigger) begin
        // On guess trigger, latch the user number and indicate readiness
        guess_number <= user_number;
        guess_ready <= 1;
    end else begin
        // Reset guess readiness for the next input
        guess_ready <= 0;
    end
end

endmodule

