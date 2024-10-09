`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2024 22:00:00
// Design Name: 
// Module Name: Subtractor
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

module Subtractor (
    input [31:0] A_sub,   // Input A (floating point)
    input [31:0] B_sub,   // Input B (floating point)
    output reg [31:0] C_sub  // Output C (floating point result)
);

    reg [7:0] A_sub_EXPO;
    reg [7:0] B_sub_EXPO;
    reg [7:0] sub_EXPO_DIF;
    reg [23:0] mantissa_A_sub; 
    reg [23:0] mantissa_B_sub;
    reg [23:0] mantissa_C_sub;

    always @(*) begin
        // Assign the exponent and mantissa parts from A and B
        A_sub_EXPO = A_sub[30:23]; // Extract exponent from A (custom format, assuming 8 bits)
        B_sub_EXPO = B_sub[30:23]; // Extract exponent from B (custom format, assuming 8 bits)

        // Add the implicit leading 1 for normalized floating-point numbers
        mantissa_A_sub = {1'b1, A_sub[22:0]}; // Extract mantissa of A
        mantissa_B_sub = {1'b1, B_sub[22:0]}; // Extract mantissa of B
        
        // Initialize output C to zero
        C_sub = 32'b0;

        // Compare exponents and shift the mantissa accordingly
        if (A_sub_EXPO > B_sub_EXPO) begin
            sub_EXPO_DIF = A_sub_EXPO - B_sub_EXPO;
            mantissa_B_sub = mantissa_B_sub >> sub_EXPO_DIF;  // Shift B's mantissa right
            C_sub[30:23] = A_sub_EXPO;  // Use A's exponent in the result
        end 
        else if (A_sub_EXPO < B_sub_EXPO) begin
            sub_EXPO_DIF = B_sub_EXPO - A_sub_EXPO;
            mantissa_A_sub = mantissa_A_sub >> sub_EXPO_DIF;  // Shift A's mantissa right
            C_sub[30:23] = B_sub_EXPO;  // Use B's exponent in the result
        end
        else begin
            C_sub[30:23] = B_sub_EXPO;
            end
 // Compare exponents and shift mantissa accordingly
        if (mantissa_A_sub >= mantissa_B_sub) begin
            C_sub[31] = A_sub[31];
            mantissa_C_sub = mantissa_A_sub - mantissa_B_sub;
        end 
        else  begin
           C_sub[31] = !A_sub[31];
           mantissa_C_sub = mantissa_B_sub - mantissa_A_sub ;
        end
 

        // Handle underflow of mantissa (renormalization)
        if (mantissa_C_sub[23:0] == 24'b0) begin
            C_sub = 32'b0;  // Result is zero
        end
        else if (mantissa_C_sub[23] == 1'b0) begin //24th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization
            
            if (mantissa_C_sub[23] == 1'b0) begin //23rd
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization
             
             if (mantissa_C_sub[23] == 1'b0) begin //22nd
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization
            
            if (mantissa_C_sub[23] == 1'b0) begin //21st
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization
            
             if (mantissa_C_sub[23] == 1'b0) begin //20th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization   
                 
             if (mantissa_C_sub[23] == 1'b0) begin //19th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        

             if (mantissa_C_sub[23] == 1'b0) begin //18th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        

             if (mantissa_C_sub[23] == 1'b0) begin //17th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
 
 
             if (mantissa_C_sub[23] == 1'b0) begin //16th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //15th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //14th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //13th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //12th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //11th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //10th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //9th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //8th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //7th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //6th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //5th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //4th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //3th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
             if (mantissa_C_sub[23] == 1'b0) begin //2th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
        
             if (mantissa_C_sub[23] == 1'b0) begin //1th
            // Normalize if leading bit is not 1
            mantissa_C_sub = mantissa_C_sub << 1;  // Shift left to normalize
            C_sub[30:23] = C_sub[30:23] - 1; // Decrease exponent due to normalization        
        
        end        
        end       
        end   
        end
        end        
        end        
        end
        end
        end
        end 
        end         
        end 
        end
        end                  
        end
        end
        end 
        end         
        end 
        end
        end 
        end 
        end
        end
                                     
                
                
                
                
                
                       
        // Assemble the final output
        C_sub[22:0] = mantissa_C_sub[22:0]; // Assign mantissa to output
        
    end

endmodule

