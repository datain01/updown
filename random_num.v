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
reg [6:0] count;  // Ŭ�� ����Ŭ�� ī��Ʈ�ϴ� ��������

// ���� ���¿��� ī���� ����
always @(posedge clk) begin
    if (reset == 0)
        count <= count + 1;
    else
        count <= 0;
end

// ���� �� LFSR �ʱ�ȭ
always @(posedge clk or posedge reset) begin
    if (reset) begin
        lfsr <= count; // ���� �� ī���� ���� LFSR �ʱⰪ���� ���
    end else begin
        // LFSR ������Ʈ ����
        lfsr <= {lfsr[5:0], lfsr[6] ^ lfsr[5]};
    end
end

always @(posedge clk) begin
    if (!reset) begin
        random <= lfsr;
    end
end

endmodule
