`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2024 21:27:42
// Design Name: 
// Module Name: Adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Test bench for the floating-point Adder module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Adder_tb;

    // Inputs
    reg [31:0] A;  // Input A
    reg [31:0] B;  // Input B

    // Outputs
    wire [31:0] C; // Output C
    

    // Instantiate the Adder module
    Adder uut (
        .A(A),
        .B(B),
        .C(C)
    );

    // Test Procedure
    initial begin
        // Initialize inputs
        A = 32'b0; 
        B = 32'b0;

        // Display header
        $display("A\t\t\tB\t\t\tC\t\t\tExpected");
        $display("---------------------------------------------------------");
        
        // Test cases
        // 1. 1.0 + 2.0
        A = 32'b00111111100000000000000000000000; // 1.0
        B = 32'b01000000000000000000000000000000; // 2.0
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'b01000000010000000000000000000000); // Expected 3.0

        // 2. 3.0 + 5.0
        A = 32'b01000000010000000000000000000000; // 3.0
        B = 32'b01000000101000000000000000000000; // 5.0
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'b01000001000000000000000000000000); // Expected 8.0

        // 3. 4.5 + 3.5
        A = 32'b01000000100100000000000000000000; // 4.5
        B = 32'b01000000011000000000000000000000; // 3.5
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'b01000001000000000000000000000000); // Expected 8.0

        // 4. 0.5 + 1.5
        A = 32'b00111111000000000000000000000000; // 0.5
        B = 32'b00111111110000000000000000000000; // 1.5
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'b01000000000000000000000000000000); // Expected 2.0

        // 5. 7.25 + 2.75
        A = 32'b01000000111010000000000000000000; // 7.25
        B = 32'b01000000001100000000000000000000; // 2.75
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'b01000001001000000000000000000000); // Expected 10.0
        
        // 6. 1.0 + 0.0
        A = 32'b00111111100000000000000000000000; // 1.0
        B = 32'b00000000000000000000000000000000; // 0.0
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'b00111111100000000000000000000000); // Expected 1.0

        // 7. 10.0 + 5.0
        A = 32'h41241893; // 10.256
        B = 32'h4133ef9e; // 11.246
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'h41ac0419); // Expected 21.502
        
      // 7. 10.0 + 5.0
        A = 32'h41240000; // 10.25 
        B = 32'h4133D70A; // 11.24 
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'h41ABEB85); // Expected 15.0

      // 7. 10.0 + 5.0
        A = 32'h460B11CD; // 8900.45 
        B = 32'h4A52E901; // 345552.333
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'h48AD1299); // Expected 354452.783
 
      // 7. 10.0 + 5.0
        A = 32'h429df0a4; // 78.97 
        B = 32'h420be148; // 34.97
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'h42e3e148); // Expected 354452.783                             
 
 // 7. 10.0 + 5.0
        A = 32'h429df127; // 78.971
        B = 32'h420be24e; // 34.971
        #10;
        $display("%b\t%b\t%b\t%b", A, B, C, C == 32'h42e3e24e); // Expected 113.942                        
  
        // Finish simulation
        $finish;
    end

endmodule
