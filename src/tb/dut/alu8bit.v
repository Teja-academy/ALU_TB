module alu8bit (
  input wire clock,
  input wire reset,
  input wire [7:0] A, B,  // ALU 8-bit Inputs                 
  input wire [3:0] ALU_Sel, // ALU Selection
  output reg [7:0] ALU_Out, // ALU 8-bit Output
  output reg CarryOut // Carry Out Flag
);

  reg [7:0] ALU_Result;

  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ALU_Out <= 8'd0;
      CarryOut <= 1'd0;
    end
    else begin
      case (ALU_Sel)
        4'b0000: ALU_Result <= A + B; // Addition
        4'b0001: ALU_Result <= A - B; // Subtraction
        4'b0010: ALU_Result <= A * B; // Multiplication
        4'b0011: ALU_Result <= A / B; // Division
        4'b0100: ALU_Result <= A & B; // Bitwise AND
        4'b0101: ALU_Result <= A | B; // Bitwise OR
        4'b0110: ALU_Result <= A ^ B; // Bitwise XOR
        4'b0111: ALU_Result <= A << B; // Shift Left
        4'b1000: ALU_Result <= A >> B; // Shift Right
        // Add more operations as needed
        default: ALU_Result <= 8'bzzzzzzzz; // Default to zero
      endcase
      
      ALU_Out <= ALU_Result;
      CarryOut <= ALU_Result[8]; // Consider using ALU_Result[8] as the carry-out
    end
  end

endmodule
