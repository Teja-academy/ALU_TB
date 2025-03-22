class alu_env extends uvm_env;
    `uvm_component_utils(alu_env)

    alu_agent agent;
    alu_scoreboard scoreboard;

    // Constructor
    function new(string name = "alu_env", uvm_component parent);
        super.new(name, parent);
        `uvm_info("alu_env", "Constructor called", UVM_HIGH)
    endfunction: new

    // Build phase
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("alu_env", "Build phase called", UVM_HIGH)

        agent = alu_agent::type_id::create("agent", this);
        scoreboard = alu_scoreboard::type_id::create("scoreboard", this);

    endfunction: build_phase

    // Connect phase
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("alu_env", "Connect phase called", UVM_HIGH)

        agent.monitor.monitor_port.connect(scoreboard.scoreboard_port);

    endfunction: connect_phase

    // Run phase
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("alu_env", "Run phase called", UVM_HIGH)
    endtask: run_phase

endclass: alu_env
  