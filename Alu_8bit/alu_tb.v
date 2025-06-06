`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 20:44:34
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

    reg [7:0] operand_a;
    reg [7:0] operand_b;
    reg [3:0] operation;
    wire [7:0] result;
    wire carry_out;

    // Instantiate the ALU
    alu_8bit uut(
        .result(result),
        .carry_out(carry_out),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .operation(operation)
    );

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | operand_a=%b operand_b=%b operation=%b result=%b carry_out=%b",
                  $time, operand_a, operand_b, operation, result, carry_out);
    end

    // Stimulus generation
    initial begin
        operand_a = 8'b00110011;
        operand_b = 8'b11001100;
        operation = 4'b0000;
        #50; // Let initial values settle
    end

    // Generate random inputs
    always begin
        #50; // Wait 50 time units
        operand_a = $random;
        operand_b = $random;
        operation = $random % 16; // Only 0-15 operations
    end

    // Simulation control
    initial begin
        #1000; // Run simulation for 1000 time units
        $finish;
    end

   
endmodule
    


