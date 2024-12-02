# Post-Implementation Timing Simulation without SDF file -----------------------------------------------------

create_project -force imp_time_sfifo D:/UVM_COURSE/imp_sfifo/vivado_test/imp_time_sfifo -part xc7a35tcpg236-1

add_files -norecurse -scan_for_includes D:/TESTING_CHIP/1_synchronous_fifo/timing_test/dut/sync_fifo.v
import_files -norecurse D:/TESTING_CHIP/1_synchronous_fifo/timing_test/dut/sync_fifo.v
update_compile_order -fileset sources_1

set_property SOURCE_SET sources_1 [get_filesets sim_1]

add_files -fileset sim_1 -norecurse -scan_for_includes D:/TESTING_CHIP/1_synchronous_fifo/timing_test/sync_fifo_tb.v
import_files -fileset sim_1 -norecurse D:/TESTING_CHIP/1_synchronous_fifo/timing_test/sync_fifo_tb.v
update_compile_order -fileset sim_1

update_compile_order -fileset sim_1

# Run Synthesis:
launch_runs synth_1

# Run Implementation:
launch_runs impl_1

wait_on_run impl_1
open_run impl_1

# Output Verilog netlist + SDC for timing simulation:
#write_verilog -mode timesim -sdf_anno true postRoute_netlist.v
#write_sdf D:/fpga_projects/imp_time_sfifo/postRoute.sdf

check_timing -verbose                                                   -file reports/check_timing.rpt
report_timing -max_paths 10 -nworst 10 -delay_type max -sort_by slack   -file reports/timing_WORST_10.rpt
report_timing -nworst 1 -delay_type max -sort_by group                  -file reports/timing.rpt
report_utilization -hierarchical                                        -file reports/utilization.rpt
#report_cdc                                                              -file reports/cdc.rpt
#report_clock_interaction                                                -file reports/clock_interaction.rpt

launch_simulation -mode post-implementation -type timing

#close_project
