`timescale 1ns / 1ps



module dice_roller (
    input clk,        
    input rst_n,     
    input btn,       
    output reg [5:0] led
   
);

    reg [2:0] dice_val; 
    reg [15:0] clk_div; 

   
    always @(*) begin
        case (dice_val)
            3'd1: led = 6'b000001; 
            3'd2: led = 6'b000010; 
            3'd3: led = 6'b000011; 
            3'd4: led = 6'b001100; 
            3'd5: led = 6'b001101; 
            3'd6: led = 6'b111100; 
            default: led = 6'b000000;
        endcase
    end

    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_div <= 0;
            dice_val <= 3'd1;
        end else begin
           
            clk_div <= clk_div + 1;

            if (clk_div == 16'd50000) begin 
                clk_div <= 0;

                if (btn) begin
                   
                    if (dice_val == 3'd6)
                        dice_val <= 3'd1;
                    else
                        dice_val <= dice_val + 1;
                end
                
            end
        end
    end

endmodule

  
