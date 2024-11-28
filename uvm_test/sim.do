coverage save -onexit -assert -directive -cvg -codeAll sfifo_cov;

vcover report -html spi_test.ucdb -htmldir covhtmlreport
vcover report -file cov_report.txt sfifo_test.ucdb

add wave -r sim:/tb_top/*;
run -all