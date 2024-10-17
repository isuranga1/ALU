`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2024 19:01:50
// Design Name: 
// Module Name: Subtractor_tb
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


module Subtractor_tb;
    // Inputs
    reg [31:0] A_sub;  // Input A
    reg [31:0] B_sub;  // Input B

    // Outputs
    wire [31:0] C_sub; // Output C

    // Instantiate the Adder module
    Subtractor uut (
        .A_sub(A_sub),
        .B_sub(B_sub),
        .C_sub(C_sub)
    );

    // Test Procedure
    initial begin
        // Initialize inputs
        A_sub = 32'b0; 
        B_sub = 32'b0;

        // Display header
 $display("\t\t\tA\t\t\t\t\t\t\t\t\tB\t\t\t\t\t\t\t\t\t\t\C\t\t\t\t\t\t\t\Expected\t\t\t\t\t\Correct?");
        $display("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
        
                // Test cases
        // 1. 1.0 - 2.0
        A_sub = 32'h40000000; // 2.0
        B_sub = 32'h3f800000; // 1.0 
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'h3f800000, C_sub == 32'h3f800000); // Expected 1.0

        // 2. 3.0 - 5.0
        A_sub = 32'h40400000; // 3.0
        B_sub = 32'h40a00000; // 5.0
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'hc0000000, C_sub == 32'hc0000000); // Expected -2.0

        // 3. 4.5 - 3.5
        A_sub = 32'h40900000; // 4.5
        B_sub = 32'h40600000; // 3.5
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'h3f800000, C_sub == 32'h3f800000); // Expected 1.0

        // 4. 0.5 - 1.5
        A_sub = 32'h3f000000; // 0.5
        B_sub = 32'h3fc00000; // 1.5
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'hbf800000, C_sub == 32'hbf800000); // Expected -1

        // 5. 7.25 - 2.75
        A_sub = 32'h40e80000; // 7.25
        B_sub = 32'h40300000; // 2.75
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'h40900000, C_sub == 32'h40900000); // Expected 4.5
        
        // 6. 1.0 + 0.0
        A_sub = 32'h3f800000; // 1.0
        B_sub = 32'h00000000; // 0.0
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'h3f800000, C_sub == 32'h3f800000); // Expected 1.0

        // 7. 10.0 + 5.0
        A_sub = 32'h41241893; // 10.256
        B_sub = 32'h4133EF9E; // 11.246
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'hbf7d70a4, C_sub == 32'hbf7d70a4); // Expected -0.99
        
      // 7. 10.0 + 5.0
        A_sub = 32'h41240000; // 10.25 
        B_sub = 32'h4133D70A; // 11.24 
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'hbf7d70a4, C_sub == 32'hbf7d70a4); // Expected 15.0

      // 7. 10.0 + 5.0
        A_sub = 32'h48a8ba0b; //345552.33
        B_sub = 32'h460b11cd; // 8900.45 
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'h46c867c3, C_sub == 32'h46c867c3); // Expected 25651.88
 
      // 7. 10.0 + 5.0
        A_sub = 32'h429df0a4; // 78.97 
        B_sub = 32'h420be148; // 34.97
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'h42300000, C_sub == 32'h42300000); // Expected 354452.783                             
 
 // 7. 10.0 + 5.0
        A_sub = 32'h429df127; // 78.971
        B_sub = 32'h420be24e; // 34.971
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'h42300000, C_sub == 32'h42300000); // Expected 113.942                
                // 6. 1.0 + 0.0
        A_sub = 32'h3f800000; // 1.0
        B_sub = 32'h00000000; // 0.0
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_sub, B_sub, C_sub,32'h3f800000, C_sub == 32'h3f800000);
        
        
        
        // Finish simulation
        $finish;
    end

endmodule
