`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2024 21:27:42
// Design Name: 
// Module Name: Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Floating-point adder using IEEE 754 format
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Adder (
    input [31:0] A,   // Input A
    input [31:0] B,   // Input B
    output reg [31:0] C  // Output C
);

    reg [7:0] A_EXPO;
    reg [7:0] B_EXPO;
    reg [7:0] EXPO_DIF;
    reg [24:0] mantissa_A; 
    reg [24:0] mantissa_B;
    reg [24:0] mantissa_C;
    

    always @(*) begin
        // Assign the exponent and mantissa parts from A and B
        A_EXPO = A[30:23]; // Exponent from A (bits [30:23])
        B_EXPO = B[30:23]; // Exponent from B (bits [30:23])
        
        // Add implicit leading 1 for normalized numbers
        mantissa_A = {1'b0,1'b1, A[22:0]}; // Mantissa of A
        mantissa_B = {1'b0,1'b1, B[22:0]}; // Mantissa of B
        
        C = 32'b0; // Initialize output

        // Compare exponents and shift mantissa accordingly
        if (A_EXPO > B_EXPO) begin
            EXPO_DIF = A_EXPO - B_EXPO;
            mantissa_B = mantissa_B >> EXPO_DIF;  // Shift B's mantissa right
            C[30:23] = A_EXPO;  // Use A's exponent
        end 
        else if (A_EXPO < B_EXPO) begin
            EXPO_DIF = B_EXPO - A_EXPO;
            mantissa_A = mantissa_A >> EXPO_DIF;  // Shift A's mantissa right
            C[30:23] = B_EXPO;  // Use B's exponent
        end
        else begin
            // If exponents are equal, no shift is needed
            EXPO_DIF = 8'b0;
            C[30:23] = A_EXPO;  // Use either exponent
        end

        // Add mantissas
        mantissa_C = mantissa_A  + mantissa_B ;

        // Handle overflow of mantissa if needed
        if ( mantissa_C[24] == 1'b1 ) begin
            mantissa_C = mantissa_C >> 1;  // Normalize if overflow occurs
            C[30:23] = C[30:23] + 1; // Increment exponent if mantissa overflows
        end

        // Assemble the final output
        C[22:0] = mantissa_C[22:0]; // Assign mantissa
        C[31] = A[31]; // Update sign bit based on A and B (this is a placeholder for addition)
    end

endmodule