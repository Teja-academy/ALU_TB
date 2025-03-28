//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

 
`ifndef _ALU_NODELAY_SEQ_
`define _ALU_NODELAY_SEQ_
class alu_nodelay_seq extends alu_seq;
  `uvm_object_utils(alu_nodelay_seq)

  function new(string name="alu_nodelay_seq");
    super.new(name);
  endfunction : new

  virtual function bit get_trans(alu_trans trans);
    return (trans.randomize() with {
      delay_m == 0;
      opcode_m inside {ADD, SUB, AND, OR, XOR, NOT, SLL, SRL, RLL, RRL, CMPEQ, CMPLT, CMPGT};
    });
  endfunction : get_trans
  
  virtual task body;
    super.body();
  endtask : body
endclass : alu_nodelay_seq
`endif
