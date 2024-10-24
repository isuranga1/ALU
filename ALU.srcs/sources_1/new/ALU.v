`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 21:55:07
// Design Name: 
// Module Name: ALU
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


module ALU(
    input wire [31:0]  A,    // First operand (32-bit floating point)
    input wire [31:0]  B,    // Second operand (32-bit floating point)
    input wire [1:0] ctrl,      // 2-bit control signal to select the operation
    output reg [31:0] result       // Final result (32-bit floating point)
);

    wire [31:0] add_sub_result;    // Output from adder_subtractor
    wire [31:0] mul_result;        // Output from multiplicator
    wire [31:0] div_result;        // Output from divider

    // Instantiate the adder_subtractor module
    Adder_Subtractor adder_sub(
        .A_addsub(A),
        .B_addsub(B),
        .C_addsub(add_sub_result),
        .ctrl(ctrl[0])
    );

    // Instantiate the multiplicator module
    Multiplication mul(
        .A_mult(A),
        .B_mult(B),
        .C_mult(mul_result)
    );

    // Instantiate the divider module
    Divider div(
        .A_div(A),
        .B_div(B),
        .C_div(div_result)
    );

    // MUX to select the result based on control signal
    always @(*) begin
        case(ctrl)
            2'b00: result  = add_sub_result; // Select adder  for 00
            2'b01: result  = add_sub_result; // Select subtractor for 01
            2'b10: result  = mul_result;     // Select multiplicator for 10
            2'b11: result  = div_result;     // Select divider for 11
            //default: result  = 32'b0;        // Default case, if needed
        endcase
    end

endmodule
