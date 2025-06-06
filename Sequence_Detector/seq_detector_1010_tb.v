`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 12:13:36
// Design Name: 
// Module Name: seq_detector_1010_tb
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


module seq_detector_1010_tb;

  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the sequence detector
  seq_detector_1010 uut (
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .z(z)
  );

  // Clock generation: 10 time units period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    // Initial reset
    rst_n = 0;
    x = 0;
    #12;         // Hold reset for a while (reset released on next rising edge)
    rst_n = 1;

    // Apply input sequence: 1 0 1 0 (should detect)
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;

    // Random input sequence
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;

    // Apply another sequence
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;

    // Finish simulation
    #20 $finish;
  end

  // Monitor signals for clear debugging
  always @(posedge clk) begin
    $display("Time=%0t | clk=%b | rst_n=%b | x=%b | z=%b | state=%0d", $time, clk, rst_n, x, z, uut.current_state);
  end

  

endmodule

  
