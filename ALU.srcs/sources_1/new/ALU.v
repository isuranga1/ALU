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
    module ALU(
    input wire [2:0] ctrl,  // 2-bit control signal to select the operation
    output reg [3:0] led         // LED output: lights up if the result is correct
);

    // Hardcoded 32-bit operands (example values)
    localparam [31:0] A = 32'h40000000;  // Example: 2.0 in IEEE 754
    localparam [31:0] B = 32'h3f800000;  // Example: 1.0 in IEEE 754

    wire [31:0] add_sub_result;  // Output from adder/subtractor
    wire [31:0] mul_result;      // Output from multiplier
    wire [31:0] div_result;      // Output from divider

    // Predefined "correct" results for each operation
    localparam [31:0] CORRECT_ADD = 32'h40400000;  // 5.0 in IEEE 754
    localparam [31:0] CORRECT_SUB = 32'h3f800000;  // 1.0 in IEEE 754
    localparam [31:0] CORRECT_MUL = 32'h40000000;  // 6.0 in IEEE 754
    localparam [31:0] CORRECT_DIV = 32'h40000000;  // 1.5 in IEEE 754

    // Instantiate the adder/subtractor module
    Adder_Subtractor adder_sub(
        .A_addsub(A),
        .B_addsub(B),
        .C_addsub(add_sub_result),
        .ctrl(ctrl[0])           // Use ctrl[0] to distinguish add/sub
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

    // LED logic: light up if the result matches the correct value
   // LED logic: light up the corresponding LED if the result matches
    // LED logic: light up the corresponding LED if the result matches
    always @(*) begin
        case(ctrl)
            3'b100: begin // Addition
                led[0] = (add_sub_result == CORRECT_ADD); // Turn on LED[0] if addition is correct
                led[1] = 1'b0;
                led[2] = 1'b0;
                led[3] = 1'b0;
            end
            3'b101: begin // Subtraction
                led[1] = (add_sub_result == CORRECT_SUB); // Turn on LED[1] if subtraction is correct
                led[0] = 1'b0;
                led[2] = 1'b0;
                led[3] = 1'b0;
            end
            3'b110: begin // Multiplication
                led[2] = (mul_result == CORRECT_MUL);     // Turn on LED[2] if multiplication is correct
                led[0] = 1'b0;
                led[1] = 1'b0;
                led[3] = 1'b0;
            end
            3'b111: begin // Division
                led[3] = (div_result == CORRECT_DIV);     // Turn on LED[3] if division is correct
                led[0] = 1'b0;
                led[1] = 1'b0;
                led[2] = 1'b0;
            end
            default: led = 4'b0000; // Default: all LEDs off
        endcase
    end

endmodule



