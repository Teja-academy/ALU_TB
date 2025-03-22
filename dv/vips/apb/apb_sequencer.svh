//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

//
// Class Description:
//
//
class apb_sequencer extends uvm_sequencer #(apb_seq_item, apb_seq_item);

// UVM Factory Registration Macro
//
`uvm_component_utils(apb_sequencer)

// Standard UVM Methods:
extern function new(string name="apb_sequencer", uvm_component parent = null);

endclass: apb_sequencer

function apb_sequencer::new(string name="apb_sequencer", uvm_component parent = null);
  super.new(name, parent);
endfunction
