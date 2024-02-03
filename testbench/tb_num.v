`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 16:05:39
// Design Name: 
// Module Name: tb_num
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


module tb_num(

    );
    reg clk;
    reg reset;
    wire [6:0] generated_number;

    // Instantiate the num_generator module
    num_generator uut (
        .clk(clk),
        .reset(reset),
        .generated_number(generated_number)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1; // Activate reset
        #20; // Wait for 20ns

        reset = 0; // Deactivate reset
        #100; // Wait for 100ns to see changes in generated_number

        reset = 1; // Activate reset again
        #20; // Wait for 20ns

        reset = 0; // Deactivate reset
        #100; // Wait for 100ns to observe changes

        $finish; // End of simulation
    end

    // Monitoring the outputs
    initial begin
        $monitor("Time = %t, Generated Number = %d", 
                 $time, generated_number);
    end

endmodule
