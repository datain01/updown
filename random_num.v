`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/14 18:50:42
// Design Name: 
// Module Name: random_num
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


module random_num(
    input clk,
    input reset,
    output reg [6:0] random
);

reg [6:0] lfsr;
reg [6:0] count;  // 클록 사이클을 카운트하는 레지스터

// 리셋 상태에서 카운터 증가
always @(posedge clk) begin
    if (reset == 0)
        count <= count + 1;
    else
        count <= 0;
end

// 리셋 시 LFSR 초기화
always @(posedge clk or posedge reset) begin
    if (reset) begin
        lfsr <= count; // 리셋 시 카운터 값을 LFSR 초기값으로 사용
    end else begin
        // LFSR 업데이트 로직
        lfsr <= {lfsr[5:0], lfsr[6] ^ lfsr[5]};
    end
end

always @(posedge clk) begin
    if (!reset) begin
        random <= lfsr;
    end
end

endmodule
