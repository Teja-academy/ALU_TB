# add source tcl file:
#	QuestaSim> source C:/Users/grigori/Oleg/alu_uvm/qsim/qsim.tcl  # source <dir>/<project_name>/qsim/qsim.tcl 
#
# run complile command (aliase)
#	QuestaSim> c_all


set prjPath "C:/Users/grigori/Oleg/alu_uvm"
set srcPath "${prjPath}/src"

set tbPath "${srcPath}/tb"
set dutPath "${tbPath}/dut"

set tstPath "${tbPath}/test"
set envPath "${tstPath}/env"
set agntsPath "${envPath}/agents"
set agntPath "${agntsPath}/agent"

set utlPath "${srcPath}/util"

set VLOG_INC " +incdir+${srcPath}" 
set VLOG_CMD "vlog -O0 -incr -mfcu -sv" 
set VSIM_CMD "vsim -voptargs=+acc"

# Compile TOP
alias c_top {
	puts "--------------- Compile TOP"

	set v_inc ${VLOG_INC} 
	append v_inc " +incdir+${tbPath}"
	append v_inc " +incdir+${tstPath}"
	append v_inc " +incdir+${envPath}"
	append v_inc " +incdir+${agntsPath}"
	append v_inc " +incdir+${agntPath}"

	set v_cmd ${VLOG_CMD} 
	append v_cmd ${v_inc}

	eval "${v_cmd} ${tbPath}/alu_pkg.sv"
	eval "${v_cmd} ${tbPath}/alu_interface.sv"
	eval "${v_cmd} ${tbPath}/alu_testbench.sv"	

	puts "--------------- Compile TOP - END\n"
}

alias c_dut {
	puts "--------------- Compile dut"
	
	set v_inc ${VLOG_INC} 
	append v_inc " +incdir+${dutPath}"
	
	set v_cmd ${VLOG_CMD} 
	append v_cmd ${v_inc}
	
	eval "${v_cmd} ${dutPath}/alu8bit.v"
	puts "--------------- Compile TOP - END\n"
}

# Compile
alias c_all {
    set start_compile [clock seconds]
	puts "--------------- Start compile at: [clock format $start_compile -format {%d.%m.%Y %H:%M:%S}]\n"
	
	c_dut
	c_top

	set end_compile [clock seconds]
	puts "--------------- End compile at: [clock format $end_compile -format {%d.%m.%Y %H:%M:%S}]"
}
                                  
#  Clear Transcript and Console
alias clear {
	.main clear
}

alias ld {
    eval "vsim -voptargs=+acc top +UVM_TESTNAME=alu_test"
}

alias rl {
    restart -force
}

alias rn {
    log -r /*
    run -all    
} 

alias rr {   
    rl
    rn  
}

alias rt {
    c_tst
    rr  
}

alias ry {
    c_xml
    rr  
}

alias rx {
    c_all
    rr  
}

alias aw {
    if [ file exist work wave.do ] {
        do wave.do
    }
}

alias dq {
    do qsim.tcl
}
	