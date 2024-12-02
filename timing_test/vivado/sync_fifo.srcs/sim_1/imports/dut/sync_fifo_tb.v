// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module sync_fifo_tb ();

	parameter DEPTH_FIFO = 4 ;
	parameter DATA_WIDTH = 8;

	reg                   clk        ;
	reg                   reset      ;
	reg                   wr_en      ;
	reg                   rd_en      ;
	reg  [DATA_WIDTH-1:0] input_data ;
	wire                  empty      ;
	wire                  full       ;
	wire [DATA_WIDTH-1:0] output_data;

	reg                      stop_the_clock;
	integer                  i             ;
	reg     [DATA_WIDTH-1:0] rdata         ;

	sync_fifo #(
		.fifo_depth(DEPTH_FIFO),
		.data_width(DATA_WIDTH)
	) dut (
		.clk        (clk        ),
		.reset      (reset      ),
		.wr_en      (wr_en      ),
		.rd_en      (rd_en      ),
		.input_data (input_data ),
		.empty      (empty      ),
		.full       (full       ),
		.output_data(output_data)
	);

	initial begin
		clk <= 1;
		reset <= 1;

		wr_en <= 0;
		rd_en <= 0;
		stop_the_clock <= 0;
		#20;
		reset <= 0;
	end

	initial begin
		@(posedge clk);
		for (i = 0; i < 50; i = i + 1) begin
			// Wait util there is space in fifo
			while (full) begin
				@(posedge clk);
				$display("[%0t] FIFO is full, wait for reads to happen", $time);
			end
			// Drive new values into FIFO
			wr_en <= $random;
			input_data <= $random;
			$display("[%0t] clk i = %0d wr_en = %0d data_in=0x%h",$time, i, wr_en, input_data);
			// Wait for next clock edge
			@(posedge clk);
		end
		stop_the_clock <= 1;
	end

	initial begin
		@(posedge clk);
		while (!stop_the_clock) begin
			while (empty) begin
				rd_en <= 0;
				$display("[%0t] FIFO is empty, wait for writes to happen", $time);
				@(posedge clk);
			end
			rd_en <= $random;
			@(posedge clk);
			rdata <= output_data;
			$display("[%0t] clk i = %0d rd_en=%0d rdata=0x%0h", $time, i, rd_en, rdata);
		end
		#500 $finish;
	end

	always #10 clk <= ~clk;
endmodule