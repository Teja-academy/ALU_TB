class alu_sequence_item extends uvm_sequence_item;
    `uvm_object_utils(alu_sequence_item)

    // Fields
    rand logic reset;
  	rand logic [7:0] A, B;  // ALU 8-bit Inputs                 
    rand logic [3:0] op_code; // ALU Selection
    logic [7:0] result; // ALU 8-bit Output
    logic CarryOut; // Carry Out Flag
    // Default Constraints
	constraint op_code_c { op_code inside {[0:8]}; }
    // Constructor
    function new(string name = "alu_sequence_item");
        super.new(name);
    endfunction: new
    
    
endclass: alu_sequence_item
