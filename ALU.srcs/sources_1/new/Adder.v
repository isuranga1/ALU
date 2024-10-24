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
    input [31:0] A_add,   // Input A
    input [31:0] B_add,   // Input B
    output reg [31:0] C_add  // Output C
);

    reg [7:0] A_add_EXPO;
    reg [7:0] B_add_EXPO;
    reg [7:0] add_EXPO_DIF;
    reg [24:0] mantissa_A_add; 
    reg [24:0] mantissa_B_add;
    reg [24:0] mantissa_C_add;
    

    always @(*) begin
        // Assign the exponent and mantissa parts from A and B
        A_add_EXPO = A_add[30:23]; // Exponent from A (bits [30:23])
        B_add_EXPO = B_add[30:23]; // Exponent from B (bits [30:23])
        
        // Add implicit leading 1 for normalized numbers
        mantissa_A_add = {1'b0,1'b1, A_add[22:0]}; // Mantissa of A
        mantissa_B_add = {1'b0,1'b1, B_add[22:0]}; // Mantissa of B
        
        C_add = 32'b0; // Initialize output

        // Compare exponents and shift mantissa accordingly
        if (A_add_EXPO > B_add_EXPO) begin
            add_EXPO_DIF = A_add_EXPO - B_add_EXPO;
            mantissa_B_add = mantissa_B_add >> add_EXPO_DIF;  // Shift B's mantissa right
            C_add[30:23] = A_add_EXPO;  // Use A's exponent
        end 
        else if (A_add_EXPO < B_add_EXPO) begin
            add_EXPO_DIF = B_add_EXPO - A_add_EXPO;
            mantissa_A_add = mantissa_A_add >> add_EXPO_DIF;  // Shift A's mantissa right
            C_add[30:23] = B_add_EXPO;  // Use B's exponent
        end
        else begin
            // If exponents are equal, no shift is needed
            add_EXPO_DIF = 8'b0;
            C_add[30:23] = A_add_EXPO;  // Use either exponent
        end

        // Add mantissas
        mantissa_C_add = mantissa_A_add  + mantissa_B_add ;

        // Handle overflow of mantissa if needed
        if ( mantissa_C_add[24] == 1'b1 ) begin
            mantissa_C_add = mantissa_C_add >> 1;  // Normalize if overflow occurs
            C_add[30:23] = C_add[30:23] + 1; // Increment exponent if mantissa overflows
        end

        // Assemble the final output
        C_add[22:0] = mantissa_C_add[22:0]; // Assign mantissa
        C_add[31] = A_add[31]; // Update sign bit based on A and B (this is a placeholder for addition)
    end

endmodule