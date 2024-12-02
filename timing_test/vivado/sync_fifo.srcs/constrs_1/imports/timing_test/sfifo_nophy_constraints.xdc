# Saample Xilinx constraints: https://github.com/Digilent/digilent-xdc

# define a clock
Clk0: period = 10, waveform = {0 5}

set_input_delay -clock [get_clocks {Clk0}] -max 1.1 [get_ports {clk}]
set_input_delay -clock [get_clocks {Clk0}] -min 0.9 [get_ports {clk}]
set_max_delay -from [get_ports {clk}] 2.0


##### Input ####
set_input_delay -clock [get_clocks {clk}] -max 1.1 [get_ports {input_data[*]}]
set_input_delay -clock [get_clocks {clk}] -min 0.9 [get_ports {input_data[*]}]
set_max_delay -from [get_ports {input_data[*]}] 1.500


##### Output ####
set_max_delay -to [get_ports {output_data[*]}] 10.000
set_output_delay -clock [get_clocks {clk}] -max 1.1 [get_ports {output_data[*]}]
set_output_delay -clock [get_clocks {clk}] -min 0.9 [get_ports {output_data[*]}]


##### Combination Paths Constraints #####
set_input_delay -clock [get_clocks {clk}] -min -add_delay 0.01 [get_ports {input_data[*]}]
set_input_delay -clock [get_clocks {clk}] -max -add_delay 0.09 [get_ports {input_data[*]}]
set_output_delay -clock [get_clocks {clk}] -min -add_delay 1.25 [get_ports {output_data[*]}]
set_output_delay -clock [get_clocks {clk}] -max -add_delay 1.50 [get_ports {output_data[*]}]


##### reset #####
set_input_delay -clock [get_clocks {clk}] -max 1.1 [get_ports {reset}]
set_input_delay -clock [get_clocks {clk}] -min 1.1 [get_ports {reset}]
set_max_delay -from [get_ports {reset}] 3.000


##### full #####
# specifes output delay value relatve to a clk clock with diﬀerent values for min (hold) and max (setup) analysis:
set_output_delay -clock [get_clocks {clk}] -max 1.1 [get_ports {full}]
set_output_delay -clock [get_clocks {clk}] -min 0.9 [get_ports {full}]
set_max_delay -to [get_ports {full}] 1.5

##### empty #####
# specifes output delay value relatve to a clk clock with diﬀerent values for min (hold) and max (setup) analysis:
set_output_delay -clock [get_clocks {clk}] -max 1.1 [get_ports {empty}]
set_output_delay -clock [get_clocks {clk}] -min 0.9 [get_ports {empty}]
set_max_delay -to [get_ports {empty}] 1.5

##### rd_en #####
set_input_delay -clock [get_clocks {clk}] -max 1.1 [get_ports {rd_en}]
set_input_delay -clock [get_clocks {clk}] -min 0.9 [get_ports {rd_en}]
set_max_delay -from [get_ports {rd_en}] 1.5

##### wr_en #####
set_input_delay -clock [get_clocks {clk}] -max 1.1 [get_ports {wr_en}]
set_input_delay -clock [get_clocks {clk}] -min 0.9 [get_ports {wr_en}]
set_max_delay -from [get_ports {wr_en}] 1.5
