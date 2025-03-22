class alu_base_sequence extends uvm_sequence;
    `uvm_object_utils(alu_base_sequence)

    alu_sequence_item reset_pkt;

    // Constructor
    function new(string name = "alu_base_sequence");
        super.new(name);
        `uvm_info("alu_base_sequence", "Constructor called", UVM_HIGH)
    endfunction: new

    virtual task body();
        `uvm_info("alu_base_sequence", "Body called", UVM_HIGH)

        reset_pkt = alu_sequence_item::type_id::create("reset_pkt");

        start_item(reset_pkt);
        reset_pkt.randomize() with { reset == 1'b1;};
        finish_item(reset_pkt);

    endtask: body

endclass: alu_base_sequence


class alu_test_sequence extends alu_base_sequence;
    `uvm_object_utils(alu_test_sequence)

    alu_sequence_item test_pkt;

    // Constructor
    function new(string name = "alu_test_sequence");
        super.new(name);
        `uvm_info("alu_test_sequence", "Constructor called", UVM_HIGH)
    endfunction: new

    virtual task body();
        `uvm_info("alu_test_sequence", "Body called", UVM_HIGH)

        test_pkt = alu_sequence_item::type_id::create("test_pkt");

        start_item(test_pkt);
		test_pkt.randomize() with { reset == 1'b0; };
        finish_item(test_pkt);

    endtask: body

endclass: alu_test_sequence