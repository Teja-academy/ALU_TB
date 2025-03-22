//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

 
`ifndef _ALU_RRL_SEQ_
`define _ALU_RRL_SEQ_
class alu_rrl_seq extends alu_seq;
  `uvm_object_utils(alu_rrl_seq)

  function new(string name="alu_rrl_seq");
    super.new(name);
  endfunction : new

  virtual function bit get_trans(alu_trans trans);
    return (trans.randomize() with {
      opcode_m == RRL;
    });
  endfunction : get_trans

  virtual task body;
    super.body();
  endtask : body
endclass : alu_rrl_seq
`endif
