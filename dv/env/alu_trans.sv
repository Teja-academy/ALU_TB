//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================
`ifndef _ALU_TRANS_
`define _ALU_TRANS_
typedef enum bit[4:0] {
  ADD   = 5'b00001,
  SUB   = 5'b00010,
  AND   = 5'b00011,
  OR    = 5'b00100,
  XOR   = 5'b00101,
  NOT   = 5'b00110,
  SLL   = 5'b00111,
  SRL   = 5'b01000,
  RLL   = 5'b01001,
  RRL   = 5'b01010,
  CMPEQ = 5'b01011,
  CMPLT = 5'b01100,
  CMPGT = 5'b01101
} opcode_e;

class alu_trans extends uvm_sequence_item;
  bit[4:0]      status_m;
  bit[7:0]      result_m;
  rand bit[4:0] opcode_m;
  rand bit[7:0] operand1_m;
  rand bit[7:0] operand2_m;
  rand bit[7:0] delay_m;

  constraint c_delay {
    delay_m inside {[0:5]};
  }

  constraint c_operand1 {
    operand1_m dist {
      8'h00         :/ 1,
      8'h01         :/ 1,
      [8'h02:8'hfd] :/ 10,
      8'hfe         :/ 1,
      8'hff         :/ 1
    };
  }

  constraint c_operand2 {
    operand2_m dist {
      8'h00         :/ 1,
      8'h01         :/ 1,
      [8'h02:8'hfd] :/ 10,
      8'hfe         :/ 1,
      8'hff         :/ 1
    };
  }

  `uvm_object_utils_begin(alu_trans)
    `uvm_field_int(delay_m, UVM_ALL_ON)
    `uvm_field_int(opcode_m, UVM_ALL_ON)
    `uvm_field_int(operand1_m, UVM_ALL_ON)
    `uvm_field_int(operand2_m, UVM_ALL_ON)
    `uvm_field_int(status_m, UVM_ALL_ON)
    `uvm_field_int(result_m, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="alu_trans");
    super.new(name);
  endfunction : new
endclass : alu_trans
`endif
