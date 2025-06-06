`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 20:15:56
// Design Name: 
// Module Name: alu_8bit
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

module alu_8bit(
    input [7:0] operand_a,
    input [7:0] operand_b,
    input [3:0] operation,
    output reg [7:0] result,
    output reg carry_out
);
    always @(*)
    begin
        carry_out = 0; // default
        case (operation)
            4'b0000: begin
                {carry_out, result} = operand_a + operand_b;
            end
            4'b0001: begin
                result = operand_a - operand_b;
            end
            4'b0010: result = operand_a * operand_b;
            4'b0011: result = (operand_b != 0) ? (operand_a / operand_b) : 8'b0;
            4'b0100: result = operand_a << 1;
            4'b0101: result = operand_a >> 1;
            4'b0110: result = {operand_a[6:0], operand_a[7]};
            4'b0111: result = {operand_a[0], operand_a[7:1]};
            4'b1000: result = operand_a & operand_b;
            4'b1001: result = operand_a | operand_b;
            4'b1010: result = operand_a ^ operand_b;
            4'b1011: result = ~(operand_a | operand_b);
            4'b1100: result = ~(operand_a & operand_b);
            4'b1101: result = ~(operand_a ^ operand_b);
            4'b1110: result = (operand_a > operand_b) ? 8'd1 : 8'd0;
            4'b1111: result = (operand_a == operand_b) ? 8'd1 : 8'd0;
            default: result = 8'b00000000;
        endcase
    end
endmodule
    
        
