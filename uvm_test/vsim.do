#_____library and mapping_____
vlib work
vmap work work

#_____compile_____
vlog -f tb.f

#_____simulation_____
vsim -coverage tb_top +UVM_TESTNAME=sfifo_test

#_____coverage report_____
coverage save -onexit -assert -directive -cvg -codeAll sfifo_test.ucdb

#_____coverage report with html_____
vcover report -html spi_test.ucdb -htmldir covhtmlreport
vcover report -file cov_report.txt sfifo_test.ucdb

#_____wave and run_____
add wave -r /*
run -all