`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 14:12:17
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter (
  input wire clk,
  input wire rst,       
  input wire up_down,   
  output reg [2:0] count
);

  always @(posedge clk) begin
    if (rst) begin
      count <= 3'b000; 
    end else begin
      if (up_down) begin
       
        count <= count + 1;
      end else begin
        
        count <= count - 1;
      end
    end
  end
endmodule
