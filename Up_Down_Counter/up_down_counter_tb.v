
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 14:15:19
// Design Name: 
// Module Name: up_down_counter_tb
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


`timescale 1ns / 1ps

module up_down_counter_tb;
  reg clk;
  reg rst;
  reg up_down;
  wire [2:0] count;

  
  up_down_counter uut (
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .count(count)
  );

  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  
  initial begin
    
    rst = 1;
    up_down = 1;
    #12 rst = 0; 

    
    up_down = 1;
    repeat (10) @(posedge clk);

    
    up_down = 0;
    repeat (10) @(posedge clk);

    
    rst = 1;
    @(posedge clk);
    rst = 0;

   
    up_down = 1;
    repeat (5) @(posedge clk);

    $finish;
  end

 
  initial begin
    $monitor("Time: %0t | rst=%b | up_down=%b | count=%b", $time, rst, up_down, count);
  end


endmodule

 
