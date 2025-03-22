class alu_agent extends uvm_agent;
    `uvm_component_utils(alu_agent)

    alu_driver driver;
    alu_monitor monitor;
    alu_sequencer sequencer;

    // Constructor
    function new(string name = "alu_agent", uvm_component parent);
        super.new(name, parent);
        `uvm_info("alu_agent", "Constructor called", UVM_HIGH)
    endfunction: new

    // Build phase
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("alu_agent", "Build phase called", UVM_HIGH)

        driver = alu_driver::type_id::create("driver", this);
        monitor = alu_monitor::type_id::create("monitor", this);
        sequencer = alu_sequencer::type_id::create("sequencer", this);

    endfunction: build_phase

    // Connect phase
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("alu_agent", "Connect phase called", UVM_HIGH)

        driver.seq_item_port.connect(sequencer.seq_item_export);

    endfunction: connect_phase
    
    // Run phase
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("alu_agent", "Run phase called", UVM_HIGH)
    endtask: run_phase
    
endclass: alu_agent
