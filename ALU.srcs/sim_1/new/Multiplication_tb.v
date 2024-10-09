`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 12:23:11
// Design Name: 
// Module Name: Multiplicator_tb
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


module Multiplicator_tb ;
    // Inputs
    reg [31:0] A_mult;  // Input A
    reg [31:0] B_mult;  // Input B

    // Outputs
    wire [31:0] C_mult; // Output C

    // Instantiate the Adder module
    Multiplication uut (
        .A_mult(A_mult),
        .B_mult(B_mult),
        .C_mult(C_mult)
    );

    // Test Procedure
    initial begin
        // Initialize inputs
        A_mult = 32'b0; 
        B_mult = 32'b0;

        // Display header
        $display("A\t\t\tB\t\t\tC\t\t\tExpected");
        $display("---------------------------------------------------------");
        
                // Test cases
        // 1. 1.0 - 2.0
        A_mult = 32'h40000000; // 2.0
        B_mult = 32'h3f800000; // 1.0 
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_mult, B_mult, C_mult,32'h40000000, C_mult == 32'h40000000); // Expected 2.0

  // 1. 1.0 - 2.0
        A_mult = 32'h40400000; // 3.0
        B_mult = 32'h40a00000; // 5.0 
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_mult, B_mult, C_mult,32'h41700000, C_mult == 32'h41700000); // Expected 15.0

       A_mult = 32'h42480000; // 50
        B_mult = 32'h41c00000; // 24
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_mult, B_mult, C_mult,32'h44960000, C_mult == 32'h44960000); // Expected 1200

  // 1. 1.0 - 2.0
        A_mult = 32'h3fab851f; // 1.34
        B_mult = 32'h4023d70a; // 2.56
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_mult, B_mult, C_mult,32'h405b8bac, C_mult == 32'h405b8bac); // Expected 3.4304


  // 1. 1.0 - 2.0
        A_mult = 32'h405b8bac; // 3.4304
        B_mult = 32'h40bccbfb; // 5.8999
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_mult, B_mult, C_mult,32'h41a1e982, C_mult == 32'h41a1e982); // Expected 20.23901696


       
        
        
        // Finish simulation
        $finish;
    end

endmodule

