//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

 
`ifndef _ALU_SUB_SEQ_
`define _ALU_SUB_SEQ_
class alu_sub_seq extends alu_seq;
  `uvm_object_utils(alu_sub_seq)

  function new(string name="alu_sub_seq");
    super.new(name);
  endfunction : new

  virtual function bit get_trans(alu_trans trans);
    return (trans.randomize() with {
      opcode_m == SUB;
    });
  endfunction : get_trans

  virtual task body;
    super.body();
  endtask : body
endclass : alu_sub_seq
`endif
