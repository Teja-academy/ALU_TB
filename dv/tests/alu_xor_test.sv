//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

 
`ifndef _ALU_XOR_TEST_
`define _ALU_XOR_TEST_
class alu_xor_test extends alu_test;
  `uvm_component_utils(alu_xor_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    alu_seq::type_id::set_type_override(alu_xor_seq::type_id::get());
    super.build_phase(phase);
  endfunction : build_phase 
endclass : alu_xor_test
`endif
