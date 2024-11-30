module sync_fifo (	input_data,
					clk,reset,wr_en,rd_en,
					empty,full,
					fifo_cnt,
					output_data
				 );
  
  input [7:0] input_data;
  input clk, reset, wr_en, rd_en;
  output empty, full;
  wire empty, full;
  output [4:0] fifo_cnt;
  reg [4:0] fifo_cnt;
  output [7:0] output_data;
  reg [7:0] output_data;
  
  // Internal variables
  reg [7:0] mem [0:15];
  reg [3:0] rd_ptr, wr_ptr;
  
  assign empty = (fifo_cnt == 0) ? 1 : 0;
  assign full = (fifo_cnt == 16) ? 1 : 0;
  
  //Data word counting block
  always @(posedge clk)
    begin
      if(!reset)
        fifo_cnt <= 0;
      else begin
        case ({wr_en,rd_en})
          2'b00: fifo_cnt <= fifo_cnt;
          2'b01: fifo_cnt <= (fifo_cnt == 0) ? 0 : fifo_cnt-1;
          2'b10: fifo_cnt <= (fifo_cnt == 16) ? 16 : fifo_cnt+1;
          2'b11: fifo_cnt <= fifo_cnt;
        endcase
      end
    end
  
  //Pointer block
  always @(posedge clk)
    begin
      if(!reset) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
      end
      else begin
        wr_ptr <= (wr_en && !full) || (wr_en && rd_en) ? wr_ptr+1 : wr_ptr;
        rd_ptr <= (rd_en && !empty) || (wr_en && rd_en) ? rd_ptr+1 : rd_ptr;
      end
    end
  
  //Write and read block
  always @(posedge clk)
    if (wr_en && !full)
      mem[wr_ptr] <= input_data;
    else if (wr_en && rd_en)
      mem[wr_ptr] <= input_data;
  
  always @(posedge clk)
    if (rd_en && !empty)
      output_data <= mem[rd_ptr];
    else if (wr_en && rd_en)
      output_data <= mem[rd_ptr];
/*	  
  specify
      $setup(output_data, posedge clk, 2);
      $hold(posedge clk, output_data, 2);
      $width(negedge output_data, 2);
   endspecify
*/	  
endmodule
  