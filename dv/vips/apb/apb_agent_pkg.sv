//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

package apb_agent_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "apb_seq_item.svh"
typedef uvm_sequencer #(apb_seq_item) apb_sequencer;
`include "apb_agent_config.svh"
`include "apb_driver.svh"
`include "apb_coverage_monitor.svh"
`include "apb_monitor.svh"
`include "apb_agent.svh"

// Utility Sequences
`include "apb_seq.svh"
`include "apb_read_seq.svh"
`include "apb_write_seq.svh"

endpackage: apb_agent_pkg
