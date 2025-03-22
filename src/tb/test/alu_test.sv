class alu_test extends uvm_test;
	`uvm_component_utils(alu_test)
	
    alu_env env;
    alu_base_sequence base_sequence;  // Reset sequence
    alu_test_sequence test_sequence;

    // Constructor
    function new(string name = "alu_test", uvm_component parent);
        super.new(name, parent);
        `uvm_info("alu_test", "Constructor called", UVM_HIGH)
    endfunction: new

    // Build phase
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("alu_test", "Build phase called", UVM_HIGH)

        env = alu_env::type_id::create("env", this);

    endfunction: build_phase

    // Connect phase
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("alu_test", "Connect phase called", UVM_HIGH)

        // Connect monitor

    endfunction: connect_phase

    // Run phase
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("alu_test", "Run phase called", UVM_HIGH)

        phase.raise_objection(this);

        base_sequence = alu_base_sequence::type_id::create("base_sequence");
        base_sequence.start(env.agent.sequencer);

        repeat(100) begin        
            test_sequence = alu_test_sequence::type_id::create("test_sequence");
            test_sequence.start(env.agent.sequencer);
            #10;
        end
        
        phase.drop_objection(this);

    endtask: run_phase
    
endclass : alu_test