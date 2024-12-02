module sync_fifo (
    clk,        // The Synchronous FIFO has 
                // a single clock for both data-read and data-write opertions,
                // it means it is used for synchronising across two process
                // when two process are running on same clock
    reset,
    wr_en,      // Write Enable
    rd_en,      // Read Enable
    input_data,
    empty,
    full,
    output_data
);
parameter fifo_depth = 8;
parameter data_width = 16;

input clk, reset, wr_en, rd_en;
input [data_width-1:0] input_data;
output empty, full;
output [data_width-1:0] output_data;

wire empty, full;
reg [data_width-1:0] output_data;

reg [$clog2(fifo_depth):0] wr_ptr; // Write pointer
reg [$clog2(fifo_depth):0] rd_ptr; // Read pointer
reg [data_width-1:0] static_mem [fifo_depth-1:0];

wire put_e;
wire get_e;

assign put_e = (wr_en && ~full);
assign get_e = (rd_en && ~empty);

always @(posedge clk) begin
    if (reset) begin
        wr_ptr <= 1'b0;
        rd_ptr <= 1'b0;
    end else begin
        if (put_e) begin
            static_mem[wr_ptr] <= input_data;
            wr_ptr <= wr_ptr + 1;
        end
        if (get_e) begin
            rd_ptr <= rd_ptr + 1;
        end
    end
end

always @(rd_ptr) begin
    output_data <= static_mem[rd_ptr - 1'b1];
end

assign empty = (rd_ptr == wr_ptr);
assign full =  ((wr_ptr[$clog2(fifo_depth)-1:0] == rd_ptr[$clog2(fifo_depth)-1:0]) &&
		(wr_ptr[$clog2(fifo_depth)] != rd_ptr[$clog2(fifo_depth)]));
endmodule

