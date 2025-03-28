//==================================================
// Author : Tejas-Academy
// Email  : info@tejas-academy.com
// Date   : 22-03-2025
//==================================================

 
`ifndef _ALU_TEST_PKG_
`define _ALU_TEST_PKG_
package alu_test_pkg;
  import uvm_pkg::*;
  import alu_env_pkg::*;
  import alu_seq_pkg::*;
  `include "alu_test.sv"
  `include "alu_add_test.sv"
  `include "alu_sub_test.sv"
  `include "alu_and_test.sv"
  `include "alu_or_test.sv"
  `include "alu_xor_test.sv"
  `include "alu_not_test.sv"
  `include "alu_sll_test.sv"
  `include "alu_srl_test.sv"
  `include "alu_rll_test.sv"
  `include "alu_rrl_test.sv"
  `include "alu_cmpeq_test.sv"
  `include "alu_cmplt_test.sv"
  `include "alu_cmpgt_test.sv"
  `include "alu_reg_reset_test.sv"
  `include "alu_reg_bitbash_test.sv"
  `include "alu_nodelay_test.sv"
  `include "alu_longdelay_test.sv"
  `include "alu_error_test.sv"
endpackage : alu_test_pkg
`endif

