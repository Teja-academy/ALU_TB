class alu_scoreboard extends uvm_test;
    `uvm_component_utils(alu_scoreboard)

    uvm_analysis_imp#(alu_sequence_item, alu_scoreboard) scoreboard_port;

    alu_sequence_item transactions[$];

    // Constructor
    function new(string name = "alu_scoreboard", uvm_component parent);
        super.new(name, parent);
        `uvm_info("alu_scoreboard", "Constructor called", UVM_HIGH)
    endfunction: new

    // Bild phase
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("alu_scoreboard", "Build phase called", UVM_HIGH)

        scoreboard_port = new("scoreboard_port", this);

    endfunction: build_phase

    // Connect phase
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("alu_scoreboard", "Connect phase called", UVM_HIGH)
    endfunction: connect_phase

    // Write function
    function void write(alu_sequence_item item);
        `uvm_info("alu_scoreboard", "Write function", UVM_HIGH)

        transactions.push_back(item);

    endfunction: write

    // Run phase
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("alu_scoreboard", "Run phase called", UVM_NONE)

        forever begin
            // get the packet
            // generate the expected value
            // compare the expected value with the actual value
            // score the transaction acordingly

            alu_sequence_item item;
            wait(transactions.size() != 0);

            item = transactions.pop_front();
            compare(item);
        end

    endtask: run_phase
    
    
    // Compare function
    task compare(alu_sequence_item item);
	    logic [7:0] exp_value;
	    logic exp_CarryOut;
	    logic [7:0] actual_value;
	    `uvm_info("alu_scoreboard", "Compare function", UVM_HIGH)
	    actual_value = item.result;
        case (item.op_code)
	        4'b0000: exp_value = item.A + item.B; // Addition
	        4'b0001: exp_value = item.A - item.B; // Subtraction
	        4'b0010: exp_value = item.A * item.B; // Multiplication
	        4'b0011: exp_value = item.A / item.B; // Division
	        4'b0100: exp_value = item.A & item.B; // Bitwise AND
	        4'b0101: exp_value = item.A | item.B; // Bitwise OR
	        4'b0110: exp_value = item.A ^ item.B; // Bitwise XOR
	        4'b0111: exp_value = item.A << item.B; // Shift Left
	        4'b1000: exp_value = item.A >> item.B; // Shift Right
	        // Add more operations as needed
	        default: exp_value = 8'bzzzzzzzz; // Default to zero
        endcase 
        $display("A is %b B is %b exp_value %b actual_value %b op_code is %b", item.A, item.B, exp_value, actual_value, item.op_code);

        if(exp_value === actual_value) begin
	    	`uvm_info(get_name(),$sformatf("As expected"), UVM_NONE)
        end 
        else begin
	    	`uvm_info(get_name(),$sformatf("Mismatch!!!"), UVM_NONE)
	    end
        
        // TODO: Compare the expected value with the actual value
	    
	    
    endtask: compare

endclass: alu_scoreboard