class alu_monitor extends uvm_monitor;
    `uvm_component_utils(alu_monitor)

    virtual alu_interface vif;
    alu_sequence_item item;

    uvm_analysis_port#(alu_sequence_item) monitor_port;

    function new(string name = "alu_monitor", uvm_component parent);
        super.new(name, parent);
        `uvm_info("alu_monitor", "Constructor called", UVM_HIGH)
    endfunction: new

    // Build phase
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("alu_monitor", "Build phase called", UVM_HIGH)

        monitor_port = new("monitor_port", this);

        if(!uvm_config_db#(virtual alu_interface)::get(this, "", "vif", vif))
            `uvm_fatal("alu_monitor", "virtual interface not defined! Simulation aborted!")
        else
            `uvm_info("alu_monitor", "virtual interface defined!", UVM_HIGH)

    endfunction: build_phase

    // Connect phase
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("alu_monitor", "Connect phase called", UVM_HIGH)
    endfunction: connect_phase

    // Run phase
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("alu_monitor", "Run phase called", UVM_HIGH)

        // Bclocking assignment for the Monitor
        forever begin
            item = alu_sequence_item::type_id::create("item");

            wait(!vif.reset);

            // Inputs
            @(posedge vif.clk);
            item.A   = 	   vif.A    ;
            item.B   = 	   vif.B 	;
	        item.op_code = vif.op_code;

            // Outputs
            @(posedge vif.clk);
            @(posedge vif.clk);
	        item.result = vif.result;
	        item.CarryOut = vif.CarryOut;
            monitor_port.write(item);

        end
    endtask: run_phase

endclass: alu_monitor
