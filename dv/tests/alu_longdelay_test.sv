//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

 
`ifndef _ALU_LONGDELAY_TEST_
`define _ALU_LONGDELAY_TEST_
class alu_longdelay_test extends alu_test;
  `uvm_component_utils(alu_longdelay_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    alu_seq::type_id::set_type_override(alu_longdelay_seq::type_id::get());
    super.build_phase(phase);
  endfunction : build_phase 
endclass : alu_longdelay_test
`endif
