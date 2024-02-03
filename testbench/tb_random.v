`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/14 18:58:07
// Design Name: 
// Module Name: tb_random
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

module tb_random;

reg clk;
reg reset;
wire [6:0] random;

// Instantiate the random number generator module
random_num uut (
    .clk(clk),
    .reset(reset),
    .random(random)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Generate a clock with a period of 10ns
end

// Test sequence
initial begin
    // Initialize Inputs
    reset = 1; // Apply reset
    #20;       // Wait for 20ns
    reset = 0; // Release reset

    // Observe 10 random numbers
    repeat (10) begin
        @(posedge clk); // Wait for positive edge of clock
        $display("Time = %t, Random Number = %d", $time, random);
    end

    // Finish the simulation
    $finish;
end

endmodule

