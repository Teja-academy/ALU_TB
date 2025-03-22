//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

interface alu_if(
  input clk,
  input reset_n
);
  logic [7:0] alu_out;
  logic [4:0] alu_status;
  logic       alu_ready;
  logic       alu_enable;
  logic [7:0] alu_in1;
  logic [7:0] alu_in2;
  logic [4:0] alu_op;
endinterface : alu_if
