class alu_driver extends uvm_driver #(alu_sequence_item);
    `uvm_component_utils(alu_driver)

    virtual alu_interface vif;
    alu_sequence_item item;

    // Constructor
    function new(string name = "alu_driver", uvm_component parent);
        super.new(name, parent);
        `uvm_info("alu_driver", "Constructor called", UVM_HIGH)
    endfunction: new

    // Build phase
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("alu_driver", "Build phase called", UVM_HIGH)

        if(!uvm_config_db #(virtual alu_interface)::get(this, "", "vif", vif))
            `uvm_fatal("alu_driver", "Virtual interface not defined! Simulation aborted!")
        else
            `uvm_info("alu_driver", "Virtual interface defined!", UVM_HIGH)

    endfunction: build_phase

    // Connect phase
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("alu_driver", "Connect phase called", UVM_HIGH)
    endfunction: connect_phase

    // Run phase
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("alu_driver", "Run phase called", UVM_HIGH)

        forever begin
            item = alu_sequence_item::type_id::create("item");
            seq_item_port.get_next_item(item);

            drive_item(item);

            seq_item_port.item_done();
        end      

    endtask: run_phase

    task drive_item(alu_sequence_item item);
        `uvm_info("alu_driver", "Drive item called", UVM_HIGH)
        
        // Anblocking assignment for the Driver
        @(posedge vif.clk);
	    
	    vif.reset <= item.reset;
	    
	    vif.A <= item.A;
	    vif.B <= item.B;
	    vif.op_code <= item.op_code;
	    
	    vif.result <= item.result;
	    vif.CarryOut <= item.CarryOut;

  
    endtask: drive_item

endclass: alu_driver