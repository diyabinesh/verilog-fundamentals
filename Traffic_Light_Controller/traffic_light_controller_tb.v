`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 10:59:35
// Design Name: 
// Module Name: Treaffic_Light_Controller_TB
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
module Traffic_Light_Controller_TB;
reg clk,rst;
wire [2:0]light_M1;
wire [2:0]light_S;
wire [2:0]light_MT;
wire [2:0]light_M2;
Traffic_Light_Controller dut(.clk(clk) , .rst(rst) , .light_M1(light_M1) , .light_S(light_S)  ,.light_M2(light_M2),.light_MT(light_MT)   );
initial
begin
    clk=1'b0;
    forever #5 clk=~clk;
end
//    initial
//    $stop;//to add ps
initial
begin
   rst=1;
   #10 rst=0;
 
    $finish;
    end




endmodule

