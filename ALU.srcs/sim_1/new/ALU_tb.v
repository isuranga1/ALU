`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 22:37:39
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
   // Inputs
    reg [31:0] A;  // Input A
    reg [31:0] B;  // Input B
    reg [1:0] ctrl;

    // Outputs
    wire [31:0] result; // Output C

    // Instantiate the Adder module
    ALU uut (
        .A(A),
        .B(B),
        .ctrl(ctrl),
        .result(result)
    );

    // Test Procedure
    initial begin
        // Initialize inputs
        A = 32'b0; 
        B = 32'b0;

        // Display header
 $display("\t\t\tA\t\t\t\t\t\t\t\t\tB\t\t\t\t\t\t\t\t\t\t\result\t\t\t\t\t\t\t\Expected\t\t\t\t\t\Correct?");
        $display("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
        
   // Test cases
   
   // Addition
        // 1. 1.0 + 2.0
        A = 32'b00111111100000000000000000000000; // 1.0
        B = 32'b01000000000000000000000000000000; // 2.0
        ctrl = 2'b00;
        #20; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A , B, result,32'b01000000010000000000000000000000, result == 32'b01000000010000000000000000000000); // Experesultted 3.0

        // 2. 3.0 + 5.0
        A = 32'b01000000010000000000000000000000; // 3.0
        B = 32'b01000000101000000000000000000000; // 5.0
        ctrl = 2'b00;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'b01000001000000000000000000000000, result == 32'b01000001000000000000000000000000); // Experesultted 8.0

        // 3. 4.5 + 3.5
        A = 32'b01000000100100000000000000000000; // 4.5
        B = 32'b01000000011000000000000000000000; // 3.5
        ctrl = 2'b00;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'b01000001000000000000000000000000, result == 32'b01000001000000000000000000000000); // Experesultted 8.0

        // 4. 0.5 + 1.5
        A = 32'b00111111000000000000000000000000; // 0.5
        B = 32'b00111111110000000000000000000000; // 1.5
        ctrl = 2'b00;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'b01000000000000000000000000000000, result == 32'b01000000000000000000000000000000); // Experesultted 2.0

        // 5. 7.25 + 2.75
        A = 32'b01000000111010000000000000000000; // 7.25
        B = 32'b01000000001100000000000000000000; // 2.75
        ctrl = 2'b00;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'b01000001001000000000000000000000, result == 32'b01000001001000000000000000000000); // Experesultted 10.0
        
        // 6. 1.0 + 0.0
        A  = 32'b00111111100000000000000000000000; // 1.0
        B = 32'b00000000000000000000000000000000; // 0.0
        ctrl = 2'b00;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'b00111111100000000000000000000000, result == 32'b00111111100000000000000000000000); // Experesultted 1.0

        
      // 7. 10.0 + 5.0
        A = 32'h41240000; // 10.25 
        B = 32'h4133D70A; // 11.24 
        ctrl = 2'b00;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h41ABEB85, result == 32'h41ABEB85); // Experesultted 15.0

 
 
      // 7. 10.0 + 5.0
        A = 32'h429df0a4; // 78.97 
        B = 32'h420be148; // 34.97
        ctrl = 2'b00;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h42e3e148, result == 32'h42e3e148); // Experesultted 354452.783                             
 
 // 7. 10.0 + 5.0
        A = 32'h429df127; // 78.971
        B = 32'h420be24e; // 34.971
        ctrl = 2'b00;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B,result,32'h42e3e24e, result == 32'h42e3e24e); // Experesultted 113.942                        
  
   // Subtraction
        // 1. 2 - 1 
        A = 32'h40000000; // 2.0
        B = 32'h3f800000; // 1.0
        ctrl = 2'b01;
        #20; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A , B, result,32'h3f800000, result == 32'h3f800000); // Experesultted 1.0

        // 2. 5 - 3 
        A = 32'h40a00000; // 5.0
        B = 32'h40400000; // 3.0
        ctrl = 2'b01;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h40000000, result == 32'h40000000); // Experesultted 2.0

        // 3. 4.5 - 3.5
        A = 32'h40900000; // 4.5
        B = 32'h40600000; // 3.5
        ctrl = 2'b01;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h3f800000, result == 32'h3f800000); // Experesultted 1.0

        // 4. 0.5 - 1.5
        A = 32'h3f000000; // 0.5
        B = 32'h3fc00000; // 1.5
        ctrl = 2'b01;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'hbf800000, result == 32'hbf800000); // Experesultted -1


       
 // Multiplication
        // 1. 1.0 - 2.0
        A = 32'h40000000; // 2.0
        B = 32'h3f800000; // 1.0 
        ctrl = 2'b10;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h40000000, result == 32'h40000000); // Expected 2.0

  // 1. 1.0 - 2.0
        A = 32'h40400000; // 3.0
        B = 32'h40a00000; // 5.0 
        ctrl = 2'b10;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h41700000, result == 32'h41700000); // Expected 15.0

       A = 32'h42480000; // 50
        B = 32'h41c00000; // 24
        ctrl = 2'b10;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h44960000, result == 32'h44960000); // Expected 1200

  // 1. 1.0 - 2.0
        A = 32'h3fab851f; // 1.34
        B = 32'h4023d70a; // 2.56
        ctrl = 2'b10;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h405b8bac, result == 32'h405b8bac); // Expected 3.4304


  // 1. 1.0 - 2.0
        A = 32'h405b8bac; // 3.4304
        B = 32'h40bccbfb; // 5.8999
        ctrl = 2'b10;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h41a1e982, result == 32'h41a1e982); // Expected 20.23901696

//Division
        // 1. 1.0 - 2.0
        A = 32'h40000000; // 2.0
        B = 32'h3f800000; // 1.0 
        ctrl = 2'b11;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h40000000, result == 32'h40000000); // Expected 2.0
      
        A = 32'h40000000; // 2
        B = 32'h42340000; // 45 
        ctrl = 2'b11;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h3d360b60, result == 32'h3d360b60); // Expected 0.04444

        A = 32'h43480000; // 200
        B = 32'h3c23d70a; // 0.01 
        ctrl = 2'b11;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h469c4000, result == 32'h469c4000); // Expected 20000

        A = 32'h3bc49ba6; // 0.006
        B = 32'h42200000; // 40
        ctrl = 2'b11;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A, B, result,32'h391d4952, result == 32'h391d4952); // Expected 0.00015

             
        
        // Finish simulation
        $finish;
    end

endmodule
