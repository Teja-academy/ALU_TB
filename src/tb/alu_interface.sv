interface alu_interface(input logic clk);
  
  logic reset;			// reset
  logic [7:0] A, B; 	// ALU 8-bit Inputs                 
  logic [3:0] op_code; 	// ALU Selection
  logic [7:0] result; 	// ALU 8-bit Output
  logic CarryOut; 		// Carry Out Flag
  
endinterface: alu_interface