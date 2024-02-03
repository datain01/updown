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

    // total_game 모듈 인스턴스 생성
total_game uut (
    .clk(clk),
    .reset(reset),
    .guess_trigger(guess_trigger),
    .user_number(user_number),
    .seg_display(seg_display),
    .game_over(game_over),
    .actual_number_out(actual_number_out) // 포트 연결 추가
);


    // 클록 생성
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns 주기의 클록
    end

    // 테스트 시퀀스
    initial begin
        // 초기화
        reset = 1; guess_trigger = 0; user_number = 0;
        #10;
        reset = 0;

        // 여러 추측 시뮬레이션
        repeat (11) begin
            // 사용자 추측
            user_number = $random % 128; // 0과 127 사이의 무작위 추측
            #10;
            guess_trigger = 1; // 추측 트리거
            #10;
            guess_trigger = 0; // 트리거 리셋
            #20; // 다음 추측 전 대기
        end

        // 시뮬레이션 종료
        #100;
        $finish;
    end

    // 출력 모니터링
    initial begin
        $monitor("Time = %t, User Number = %d, Actual Number = %d, 7-Segment Display = %b, Game Over = %b", 
                 $time, user_number, actual_number, seg_display, game_over);
    end
endmodule
