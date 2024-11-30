read_verilog "sync_fifo_2.v"
synth_design -top "sync_fifo" -part "xc7a35tcpg236-1"
write_verilog -mode funcsim sync_fifo_netlist.v