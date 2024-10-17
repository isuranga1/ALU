`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 20:06:14
// Design Name: 
// Module Name: Divider
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


module Divider(
 input [31:0] A_div,   // Input A
 input [31:0] B_div,   // Input B
 output reg [31:0] C_div // Output C
);

    reg [7:0] A_div_EXPO;
    reg [7:0] B_div_EXPO;
    reg [7:0] div_EXPO_DIF;
    reg [8:0] div_EXPO_Sum;
    reg [23:0] mantissa_A_div; 
    reg [23:0] mantissa_B_div;
    reg [47:0] mantissa_C_div;
    

    always @(*) begin
        // Assign the exponent and mantissa parts from A and B
        A_div_EXPO = A_div[30:23]; // Exponent from A (bits [30:23])
        B_div_EXPO = B_div[30:23]; // Exponent from B (bits [30:23])
        
        // Add implicit leading 1 for normalized numbers
        mantissa_A_div = {1'b1, A_div[22:0]}; // Mantissa of A
        mantissa_B_div = {1'b1, B_div[22:0]}; // Mantissa of B
        
        C_div = 32'b0; // Initialize output
        
        div_EXPO_Sum = A_div_EXPO - B_div_EXPO + 8'b01111111 ;
        
        if (div_EXPO_Sum[8] == 1'b1) begin
             div_EXPO_Sum = div_EXPO_Sum >> 1;
        end
     
        // diviply mantissas
        mantissa_C_div = ((mantissa_A_div) / mantissa_B_div );
 // Normalizing the result (if needed)
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1; 
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
        end
        if (mantissa_C_div[47] == 0) begin
                mantissa_C_div = mantissa_C_div << 1;
                div_EXPO_Sum = div_EXPO_Sum - 1;
            
        end
        
        // Assemble the final output
        C_div[30:23] = div_EXPO_Sum[7:0];
        C_div[22:0] = mantissa_C_div[46:24];
        C_div[31] = A_div[31] ^ B_div[31]; 
         
        end  
endmodule