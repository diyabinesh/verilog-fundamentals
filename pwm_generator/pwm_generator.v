`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module pwm_generator (
  input clk,         
  input rst,         
  input [7:0] duty,   
  output reg pwm_out 
);

  reg [7:0] counter;

  always @(posedge clk) begin
    if (rst) begin
      counter <= 8'd0;
      pwm_out <= 1'b0;
    end else begin
      counter <= counter + 1;

      if (counter < duty)
        pwm_out <= 1;
      else
        pwm_out <= 0;
    end
  end
endmodule