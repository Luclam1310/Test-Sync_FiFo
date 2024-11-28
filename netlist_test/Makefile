compile:
	vlib work
	vmap work work
	vlog -f tb.f
simulate:
	vsim -c -L unisims_ver work.tb_top glbl +UVM_TESTNAME=sfifo_test -do sim.do