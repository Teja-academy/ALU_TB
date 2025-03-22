//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

//
// Class Description:
//
//
class apb_seq extends uvm_sequence #(apb_seq_item);

// UVM Factory Registration Macro
//
`uvm_object_utils(apb_seq)

//------------------------------------------
// Data Members (Outputs rand, inputs non-rand)
//------------------------------------------


//------------------------------------------
// Constraints
//------------------------------------------



//------------------------------------------
// Methods
//------------------------------------------

// Standard UVM Methods:
extern function new(string name = "apb_seq");
extern task body;

endclass:apb_seq

function apb_seq::new(string name = "apb_seq");
  super.new(name);
endfunction

task apb_seq::body;
  apb_seq_item req;

  begin
    req = apb_seq_item::type_id::create("req");
    start_item(req);
    if(!req.randomize()) begin
      `uvm_error("body", "req randomization failure")
    end
    finish_item(req);
  end

endtask:body
