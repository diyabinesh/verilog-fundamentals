`timescale 1ns / 1ps



module dice_roller_tb;

    reg clk, rst_n, btn;
    wire [5:0] led;

    dice_roller uut (
        .clk(clk),
        .rst_n(rst_n),
        .btn(btn),
        .led(led)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    initial begin
        rst_n = 0; btn = 0;
        #50 rst_n = 1;

        
        #100 btn = 1;
        #100000 btn = 0; 
        #1000 $finish;
    end

  
endmodule
   
