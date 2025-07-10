`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_pwm_generator;
  reg clk, rst;
  reg [7:0] duty;
  wire pwm_out;

  pwm_generator uut (
    .clk(clk),
    .rst(rst),
    .duty(duty),
    .pwm_out(pwm_out)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  initial begin
    rst = 1;
    duty = 8'd0;
    #20 rst = 0;
    #20 duty = 8'd64;   
    #200 duty = 8'd128; 
    #200 duty = 8'd192; 
    #200 $finish;
  end
endmodule