class alu_sequencer extends uvm_sequencer #(alu_sequence_item);
    `uvm_component_utils(alu_sequencer)

    // Constructor
    function new(string name, uvm_component parent);
        super.new(name, parent);
        `uvm_info("alu_sequencer", "Constructor called", UVM_HIGH)
    endfunction: new

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("alu_sequencer", "Build phase called", UVM_HIGH)
    endfunction: build_phase

    // Connect phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("alu_sequencer", "Connect phase called", UVM_HIGH)
    endfunction: connect_phase

endclass: alu_sequencer