//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

 
`ifndef _ALU_OR_SEQ_
`define _ALU_OR_SEQ_
class alu_or_seq extends alu_seq;
  `uvm_object_utils(alu_or_seq)

  function new(string name="alu_or_seq");
    super.new(name);
  endfunction : new

  virtual function bit get_trans(alu_trans trans);
    return (trans.randomize() with {
      opcode_m == OR;
    });
  endfunction : get_trans

  virtual task body;
    super.body();
  endtask : body
endclass : alu_or_seq
`endif
