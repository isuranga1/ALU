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
        
        div_EXPO_Sum = A_div_EXPO - B_div_EXPO  + 8'b01111111 ;
        
        if (div_EXPO_Sum[8] == 1'b1) begin
             div_EXPO_Sum = div_EXPO_Sum >> 1;
        end
         // Handle special cases
        if (A_div == 32'h7FC00000 || B_div == 32'h7FC00000) begin
            // If either input is NaN, result is NaN
            C_div = 32'h7FC00000; // Set result to NaN
        end else if (B_div == 32'h00000000) begin
            // Handle division by zero (set result to infinity)
            C_div = {A_div[31] ^ B_div[31], 8'hFF, 23'h000000}; // Set result to +inf or -inf
        end else if (A_div == 32'h00000000) begin
            // If the numerator is zero, result is zero
            C_div = 32'h00000000; // Set result to 0
        end else if (A_div_EXPO == 8'hFF && B_div_EXPO == 8'hFF) begin
            // Handle special case: 0 / 0 = NaN
            C_div = 32'h7FC00000; // Set result to NaN
        end else if (A_div_EXPO == 8'hFF) begin
            // If numerator is NaN, return NaN
            C_div = 32'h7FC00000; // Set result to NaN
        end else if (B_div_EXPO  == 8'hFF) begin
            // If denominator is NaN, return NaN
            C_div = 32'h7FC00000; // Set result to NaN
        end else begin
        // diviply mantissas
        mantissa_C_div = ((mantissa_A_div<< 23) / mantissa_B_div );
 // Normalizing the result (if needed)
         if (mantissa_C_div[23] == 1'b0) begin //24th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization
        end     
            if (mantissa_C_div[23] == 1'b0) begin //23rd
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization
        end      
             if (mantissa_C_div[23] == 1'b0) begin //22nd
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization
        end     
            if (mantissa_C_div[23] == 1'b0) begin //21st
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization
        end     
             if (mantissa_C_div[23] == 1'b0) begin //20th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization   
       end           
             if (mantissa_C_div[23] == 1'b0) begin //19th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //18th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //17th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
 
             if (mantissa_C_div[23] == 1'b0) begin //16th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //15th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //14th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //13th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //12th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
      end   
             if (mantissa_C_div[23] == 1'b0) begin //11th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
     end    
             if (mantissa_C_div[23] == 1'b0) begin //10th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
       end  
           if (mantissa_C_div[23] == 1'b0) begin //9th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //8th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //7th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //6th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //5th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //4th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //3th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
             if (mantissa_C_div[23] == 1'b0) begin //2th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        end 
        
             if (mantissa_C_div[23] == 1'b0) begin //1th
            // Normalize if leading bit is not 1
            mantissa_C_div = mantissa_C_div << 1;  // Shift left to normalize
            div_EXPO_Sum = div_EXPO_Sum - 1; // Decrease exponent due to normalization        
        
        end        
    
        
        // Assemble the final output
        C_div[30:23] = div_EXPO_Sum[7:0];
        C_div[22:0] = mantissa_C_div[22:0];
        C_div[31] = A_div[31] ^ B_div[31]; 
        
        end 
        end  
endmodule