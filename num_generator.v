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
reg reset_prev = 0; // ���� ���� ���¸� ������ �������� �߰�

always @(posedge clk or posedge reset) begin
    if (reset) begin
        clock_counter <= 0;
        last_number <= 0;
        generated_number <= (clock_counter + last_number) % 128; // ���� ��, ���ο� ���� ����
        reset_prev <= 1; // ���� ���� ������Ʈ
    end else if (!reset && reset_prev) begin
        // ������ ��Ȱ��ȭ�ǰ� ���� ���°� �����̾��� �� (��, ���� �� ó�� ����� ��)
        reset_prev <= 0; // ���� ���� ������Ʈ
        // ���� ����
        last_number <= generated_number;
    end else if (!reset && !reset_prev) begin
        // ������ ��Ȱ��ȭ�Ǿ� �ְ�, �������� ������ ��Ȱ��ȭ�Ǿ� �־��� ��
        // Ŭ�� ī���͸� ������Ʈ
        clock_counter <= clock_counter + 1;
    end
end

endmodule

