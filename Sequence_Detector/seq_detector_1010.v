`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 12:06:02
// Design Name: 
// Module Name: seq_detector_1010
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


module seq_detector_1010 (
  input clk,
  input rst_n,
  input x,       // Serial input bit
  output reg z   // Output: 1 when 1010 is detected
);

  // State encoding
  
  parameter  S0 = 3'b000,  // Initial state
    S1 = 3'b001,  // '1' detected
    S2 = 3'b010,  // '10' detected
    S3 = 3'b011,  // '101' detected
    S4 = 3'b100 ;  // '1010' detected
 reg [2:0]current_state,next_state;

 

  // State transition logic
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      current_state <= S0;
    else
      current_state <= next_state;
  end

  // Next state logic
  always @(*) begin
    
    case (current_state)
      S0: next_state = x ? S1 : S0;
      S1: next_state = x ? S1 : S2;
      S2: next_state = x ? S3 : S0;
      S3: next_state = x ? S1 : S4;
      S4: next_state = x ? S1 : S0;
      default :next_state= S0;
    endcase
  end

  // Output logic
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      z <= 0;
    else if (current_state == S3 && !x)  // Sequence 1010 ends when S3 and next x=0
      z <= 1;
    else
      z <= 0;
  end

endmodule

   
