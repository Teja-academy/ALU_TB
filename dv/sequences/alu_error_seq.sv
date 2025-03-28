//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

 
`ifndef _ALU_ERROR_SEQ_
`define _ALU_ERROR_SEQ_
class alu_error_seq extends alu_seq;
  `uvm_object_utils(alu_error_seq)

  function new(string name="alu_error_seq");
    super.new(name);
  endfunction : new

  virtual function bit get_trans(alu_trans trans);
    return (trans.randomize() with {
      opcode_m inside {5'b00000, [5'b01110:5'b11111]};
    });
  endfunction : get_trans

  virtual task body;
    super.body();
  endtask : body
endclass : alu_error_seq
`endif
