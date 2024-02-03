`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 15:48:31
// Design Name: 
// Module Name: num_generator
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


module num_generator(
    input clk,
    input reset,
    output reg [6:0] generated_number
);

reg [6:0] clock_counter = 0;
reg [6:0] last_number = 10;
reg reset_prev = 0; // 이전 리셋 상태를 저장할 레지스터 추가

always @(posedge clk or posedge reset) begin
    if (reset) begin
        clock_counter <= 0;
        last_number <= 0;
        generated_number <= (clock_counter + last_number) % 128; // 리셋 시, 새로운 숫자 생성
        reset_prev <= 1; // 리셋 상태 업데이트
    end else if (!reset && reset_prev) begin
        // 리셋이 비활성화되고 이전 상태가 리셋이었을 때 (즉, 리셋 후 처음 실행될 때)
        reset_prev <= 0; // 리셋 상태 업데이트
        // 숫자 유지
        last_number <= generated_number;
    end else if (!reset && !reset_prev) begin
        // 리셋이 비활성화되어 있고, 이전에도 리셋이 비활성화되어 있었을 때
        // 클록 카운터만 업데이트
        clock_counter <= clock_counter + 1;
    end
end

endmodule

