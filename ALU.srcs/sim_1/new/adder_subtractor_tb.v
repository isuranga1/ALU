`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 20:21:59
// Design Name: 
// Module Name: adder_addsubtractor_tb
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


module adder_addsubtractor_tb;

    // Inputs
    reg [31:0] A_addsub;  // Input A
    reg [31:0] B_addsub;  // Input B
    reg ctrl;

    // Outputs
    wire [31:0] C_addsub; // Output C

    // Instantiate the Adder module
    Adder_Subtractor uut (
        .A_addsub(A_addsub),
        .B_addsub(B_addsub),
        .ctrl(ctrl),
        .C_addsub(C_addsub)
    );

    // Test Procedure
    initial begin
        // Initialize inputs
        A_addsub = 32'b0; 
        B_addsub = 32'b0;

        // Display header
 $display("\t\t\tA\t\t\t\t\t\t\t\t\tB\t\t\t\t\t\t\t\t\t\t\C\t\t\t\t\t\t\t\Expected\t\t\t\t\t\Correct?");
        $display("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
        
   // Test cases
        // 1. 1.0 + 2.0
        A_addsub= 32'b00111111100000000000000000000000; // 1.0
        B_addsub= 32'b01000000000000000000000000000000; // 2.0
        ctrl = 1'b0;
        #10; // Wait for 10 time units
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'b01000000010000000000000000000000, C_addsub == 32'b01000000010000000000000000000000); // Expected 3.0

        // 2. 3.0 + 5.0
        A_addsub = 32'b01000000010000000000000000000000; // 3.0
        B_addsub = 32'b01000000101000000000000000000000; // 5.0
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'b01000001000000000000000000000000, C_addsub == 32'b01000001000000000000000000000000); // Expected 8.0

        // 3. 4.5 + 3.5
        A_addsub = 32'b01000000100100000000000000000000; // 4.5
        B_addsub = 32'b01000000011000000000000000000000; // 3.5
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'b01000001000000000000000000000000, C_addsub == 32'b01000001000000000000000000000000); // Expected 8.0

        // 4. 0.5 + 1.5
        A_addsub = 32'b00111111000000000000000000000000; // 0.5
        B_addsub = 32'b00111111110000000000000000000000; // 1.5
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'b01000000000000000000000000000000, C_addsub == 32'b01000000000000000000000000000000); // Expected 2.0

        // 5. 7.25 + 2.75
        A_addsub = 32'b01000000111010000000000000000000; // 7.25
        B_addsub = 32'b01000000001100000000000000000000; // 2.75
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'b01000001001000000000000000000000, C_addsub == 32'b01000001001000000000000000000000); // Expected 10.0
        
        // 6. 1.0 + 0.0
        A_addsub = 32'b00111111100000000000000000000000; // 1.0
        B_addsub = 32'b00000000000000000000000000000000; // 0.0
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'b00111111100000000000000000000000, C_addsub == 32'b00111111100000000000000000000000); // Expected 1.0

        // 7. 10.0 + 5.0
        A_addsub = 32'h41241893; // 10.256
        B_addsub = 32'h4133ef9e; // 11.246
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'h41ac0419, C_addsub == 32'h41ac0419); // Expected 21.502
        
      // 7. 10.0 + 5.0
        A_addsub = 32'h41240000; // 10.25 
        B_addsub = 32'h4133D70A; // 11.24 
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'h41ABEB85, C_addsub == 32'h41ABEB85); // Expected 15.0

      // 7. 10.0 + 5.0
        A_addsub = 32'h460B11CD; // 8900.45 
        B_addsub = 32'h4A52E901; // 345552.333
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'h48AD1299, C_addsub == 32'h48AD1299); // Expected 354452.783
 
      // 7. 10.0 + 5.0
        A_addsub = 32'h429df0a4; // 78.97 
        B_addsub = 32'h420be148; // 34.97
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'h42e3e148, C_addsub == 32'h42e3e148); // Expected 354452.783                             
 
 // 7. 10.0 + 5.0
        A_addsub = 32'h429df127; // 78.971
        B_addsub = 32'h420be24e; // 34.971
        ctrl = 1'b0;
        #10;
        $display("%b\t%b\t%b\t%b\t%b", A_addsub, B_addsub, C_addsub,32'h42e3e24e, C_addsub == 32'h42e3e24e); // Expected 113.942                        
  
        
        
        // Finish simulation
        $finish;
    end

endmodule
