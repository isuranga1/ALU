`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 01:02:18
// Design Name: 
// Module Name: Multiplication
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


module Multiplication(

   input [31:0] A_mult,   // Input A
    input [31:0] B_mult,   // Input B
    output reg [31:0] C_mult // Output C
);

    reg [7:0] A_mult_EXPO;
    reg [7:0] B_mult_EXPO;
    reg [7:0] mult_EXPO_DIF;
    reg [8:0] mult_EXPO_Sum;
    reg [23:0] mantissa_A_mult; 
    reg [23:0] mantissa_B_mult;
    reg [47:0] mantissa_C_mult;
    

    always @(*) begin
        // Assign the exponent and mantissa parts from A and B
        A_mult_EXPO = A_mult[30:23]; // Exponent from A (bits [30:23])
        B_mult_EXPO = B_mult[30:23]; // Exponent from B (bits [30:23])
        
        // Add implicit leading 1 for normalized numbers
        mantissa_A_mult = {1'b1, A_mult[22:0]}; // Mantissa of A
        mantissa_B_mult = {1'b1, B_mult[22:0]}; // Mantissa of B
        
        C_mult = 32'b0; // Initialize output
        
        mult_EXPO_Sum = A_mult_EXPO + B_mult_EXPO -8'b01111111 ;
        
        if (mult_EXPO_Sum[8] == 1'b1) begin
             mult_EXPO_Sum = mult_EXPO_Sum >> 1;
        end
        // multiply mantissas
        mantissa_C_mult = mantissa_A_mult * mantissa_B_mult ;

        // Handle overflow of mantissa if needed
        if ( mantissa_C_mult[47] == 1'b1 ) begin
           C_mult[22:0] = mantissa_C_mult[46:24]; // Assign mantissa
            mult_EXPO_Sum = mult_EXPO_Sum + 1'b1  ;
        end
         else begin
          C_mult[22:0] = mantissa_C_mult[45:23];
        end
        
        

        // Assemble the final output
        C_mult[30:23] = mult_EXPO_Sum[7:0];
        
        C_mult[31] = A_mult[31] ^ B_mult[31]; 
         
        end  
endmodule