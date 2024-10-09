`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2024 22:45:22
// Design Name: 
// Module Name: Adder_Subtractor
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


module Adder_Subtractor(
    input [31:0] A_addsub,   // Input A
    input [31:0] B_addsub,   // Input B
    output reg [31:0] C_addsub  // Output C
    );
    
    reg [7:0] A_EXPO_addsub;
    reg [7:0] B_EXPO_addsub;
    reg [7:0] EXPO_DIF_addsub;
    reg [24:0] mantissa_A_addsub; 
    reg [24:0] mantissa_B_addsub;
    reg [24:0] mantissa_C_addsub;  
    
     // Instantiate the and_gate module
    Adder u1 (
        .A(A_addsub),            // Connect input 1
        .B(B_addsub),            // Connect input 2
        .C(C_addout)         // Output goes to add_out
    );   
    
    
    
    
    
    
endmodule
