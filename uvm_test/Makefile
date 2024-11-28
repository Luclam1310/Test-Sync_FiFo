compile:
	vlib work
	vmap work work
	vlog -f tb.f
simulate:
	vopt work.tb_top -o top_optimized +acc +cover=sbfect
	vsim -c top_optimized -coverage +UVM_TESTNAME=sfifo_test -do sim.do
	vcover report -html sfifo_cov