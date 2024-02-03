`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 14:23:54
// Design Name: 
// Module Name: tb_game
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


module tb_game(

    );
 reg clk;
    reg reset;
    reg guess_trigger;
    reg [6:0] user_number;
    wire [6:0] seg_display;
    wire game_over;
    wire [6:0] actual_number;

    // total_game ��� �ν��Ͻ� ����
total_game uut (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .seg_display(seg_display),
    .game_over(game_over),
    .actual_number_out(actual_number_out) // ��Ʈ ���� �߰�
);


    // Ŭ�� ����
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns �ֱ��� Ŭ��
    end

    // �׽�Ʈ ������
    initial begin
        // �ʱ�ȭ
        reset = 1; guess_trigger = 0; user_number = 0;
        #10;
        reset = 0;

        // ���� ���� �ùķ��̼�
        repeat (11) begin
            // ����� ����
            user_number = $random % 128; // 0�� 127 ������ ������ ����
            #10;
            guess_trigger = 1; // ���� Ʈ����
            #10;
            guess_trigger = 0; // Ʈ���� ����
            #20; // ���� ���� �� ���
        end

        // �ùķ��̼� ����
        #100;
        $finish;
    end

    // ��� ����͸�
    initial begin
        $monitor("Time = %t, User Number = %d, Actual Number = %d, 7-Segment Display = %b, Game Over = %b", 
                 $time, user_number, actual_number, seg_display, game_over);
    end
endmodule
