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
    output reg [31:0] C_addsub, // Output C
    input wire ctrl          // Control signal: 0 to add, 1 to subtract
);

    reg [31:0] A_addsub_reg; // Registered input for Adder/Subtractor
    reg [31:0] B_addsub_reg; // Registered input for Adder/Subtractor

    wire [31:0] C_addout;    // Output from Adder
    wire [31:0] C_subout;    // Output from Subtractor

    // Instantiate the Adder module (only activated when adding)
    Adder u1 (
        .A(A_addsub_reg),    // Pass registered input A
        .B(B_addsub_reg),    // Pass registered input B
        .C(C_addout)         // Output goes to C_addout
    );

    // Instantiate the Subtractor module (only activated when subtracting)
    Subtractor u2 (
        .A_sub(A_addsub_reg), // Pass registered input A
        .B_sub(B_addsub_reg), // Pass registered input B
        .C_sub(C_subout)      // Output goes to C_subout
    );

    always @(*) begin
        // Ensure A_addsub[31] and B_addsub[31] are both 0 (positive numbers)
        if (A_addsub[31] == 1'b0 && B_addsub[31] == 1'b0) begin
            // Pass the inputs to the respective module based on the control signal
            A_addsub_reg = A_addsub;
            B_addsub_reg = B_addsub;

            // If control signal is 0, perform addition (disable Subtractor)
            if (ctrl == 1'b0) begin
                C_addsub = C_addout;  // Result from the Adder
            end
            // If control signal is 1, perform subtraction (disable Adder)
            else if (ctrl == 1'b1) begin
                C_addsub = C_subout;  // Result from the Subtractor
            end
        end 
        else if  (A_addsub[31] == 1'b0 && B_addsub[31] == 1'b1) begin // A=+ B=-
            // Pass the inputs to the respective module based on the control signal
            A_addsub_reg = A_addsub;
            B_addsub_reg = B_addsub;

            // If control signal is 0, perform subtraction (disable Adder)
            if (ctrl == 1'b0) begin
                B_addsub_reg[31] = 0'b0;
                C_addsub = C_subout;  // Result from the Subtractor
            end
            // If control signal is 1, perform Addition (disable Subtractor)
            else if (ctrl == 1'b1) begin
                B_addsub_reg[31] = 0'b0;
                C_addsub = C_addout;  // Result from the Adder
            end
        end 
        else if  (A_addsub[31] == 1'b1 && B_addsub[31] == 1'b0) begin // A=+ B=-
            // Pass the inputs to the respective module based on the control signal


            // If control signal is 0, perform subtraction (disable Adder)
            if (ctrl == 1'b0) begin
                A_addsub_reg = B_addsub;
                B_addsub_reg = A_addsub;
                B_addsub_reg[31] = 0'b0;
                C_addsub = C_subout;  // Result from the Subtractor
            end
            // If control signal is 1, perform Addition (disable Subtractor)
            else if (ctrl == 1'b1) begin
                A_addsub_reg = A_addsub;
                B_addsub_reg = B_addsub;
                C_addsub = C_addout;  // Result from the Adder
            end
        end
        else if  (A_addsub[31] == 1'b1 && B_addsub[31] == 1'b1) begin // A=+ B=-
            // Pass the inputs to the respective module based on the control signal


            // If control signal is 0, perform subtraction (disable Adder)
            if (ctrl == 1'b0) begin
                A_addsub_reg = A_addsub;
                B_addsub_reg = B_addsub;
                C_addsub = C_addout;  // Result from the Subtractor
            end
            // If control signal is 1, perform Addition (disable Subtractor)
            else if (ctrl == 1'b1) begin
                A_addsub_reg = B_addsub;
                B_addsub_reg = A_addsub;
                A_addsub_reg[31] = 0'b0;
                B_addsub_reg[31] = 0'b0;
                C_addsub = C_subout;  // Result from the Adder
            end
        end         
        else begin
            // If condition is not met, don't pass inputs and assign 0 to output
            A_addsub_reg = 32'd0;
            B_addsub_reg = 32'd0;
            C_addsub = 32'd0;
        end
    end

endmodule



