`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 20:19:32
// Design Name: 
// Module Name: Divider_tb
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


module Divider_tb;
    // Inputs
    reg [31:0] A_div;  // Input A
    reg [31:0] B_div;  // Input B

    // Outputs
    wire [31:0] C_div; // Output C

    // Instantiate the Adder module
    Divider uut (
        .A_div(A_div),
        .B_div(B_div),
        .C_div(C_div)
    );

    // Test Procedure
    initial begin
        // Initialize inputs
        A_div = 32'b0; 
        B_div = 32'b0;

        // Display header
        $display("A\t\t\tB\t\t\tC\t\t\tExpected");
        $display("---------------------------------------------------------");
        
                // Test cases
        // 1. 1.0 - 2.0
        A_div = 32'h40000000; // 2.0
        B_div = 32'h3f800000; // 1.0 
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_div, B_div, C_div,32'h40000000, C_div == 32'h40000000); // Expected 2.0
      
       A_div = 32'h40000000; // 2
        B_div = 32'h42340000; // 45 
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_div, B_div, C_div,32'h3d360b60, C_div == 32'h3d360b60); // Expected 0.04444

   A_div = 32'h43480000; // 200
        B_div = 32'h3c23d70a; // 0.01 
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_div, B_div, C_div,32'h469c4000, C_div == 32'h469c4000); // Expected 20000

  A_div = 32'h3bc49ba6; // 0.006
        B_div = 32'h42200000; // 40
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_div, B_div, C_div,32'h391d4952, C_div == 32'h391d4952); // Expected 0.00015

       
        
        
        // Finish simulation
        $finish;
    end

endmodule