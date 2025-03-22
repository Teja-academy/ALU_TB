`timescale 1ns/1ns

`include "uvm_macros.svh"

import uvm_pkg::*;    
import alu_pkg::*;

module top;
    
    logic clk;

    alu_interface alu_if(.clk(clk));

 	// dut instantiation
	alu8bit dut(
		.clock(alu_if.clk), 
		.reset(alu_if.reset), 
		.A(alu_if.A), 
		.B(alu_if.B), 
		.ALU_Out(alu_if.result), 
		.ALU_Sel(alu_if.op_code),
		.CarryOut(alu_if.CarryOut)
		);

    // Interface Setting
    initial begin
        uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", alu_if);
    end

    // Start The Test
    initial begin
        run_test("alu_test");
    end

    // Clock Generation
    initial begin
        clk = 1'b0;
        #5;
        forever begin
            clk = ~clk;
            #2;
        end
    end

    // Maximum Simulation Time
    initial begin
        #5000;
        $display("Ran out of clock cycles!");
        $stop();
      end

endmodule: top
