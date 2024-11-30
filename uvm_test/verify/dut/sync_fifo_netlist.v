// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Nov 30 12:03:04 2024
// Host        : Lam running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim sync_fifo_netlist.v
// Design      : sync_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module sync_fifo
   (input_data,
    clk,
    reset,
    wr_en,
    rd_en,
    empty,
    full,
    fifo_cnt,
    output_data);
  input [7:0]input_data;
  input clk;
  input reset;
  input wr_en;
  input rd_en;
  output empty;
  output full;
  output [4:0]fifo_cnt;
  output [7:0]output_data;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire empty;
  wire empty_OBUF;
  wire [4:0]fifo_cnt;
  wire \fifo_cnt[4]_i_1_n_0 ;
  wire \fifo_cnt[4]_i_2_n_0 ;
  wire [4:0]fifo_cnt_OBUF;
  wire full;
  wire full_OBUF;
  wire [7:0]input_data;
  wire [7:0]input_data_IBUF;
  wire [7:0]output_data;
  wire [7:0]output_data0;
  wire \output_data[7]_i_2_n_0 ;
  wire [7:0]output_data_OBUF;
  wire [3:0]p_0_in;
  wire [4:0]p_2_in;
  wire rd_en;
  wire rd_en_IBUF;
  wire [3:0]rd_ptr;
  wire rd_ptr0;
  wire \rd_ptr[0]_i_1_n_0 ;
  wire \rd_ptr[1]_i_1_n_0 ;
  wire \rd_ptr[2]_i_1_n_0 ;
  wire \rd_ptr[3]_i_1_n_0 ;
  wire reset;
  wire reset_IBUF;
  wire wr_en;
  wire wr_en_IBUF;
  wire wr_ptr0;
  wire [3:0]wr_ptr_reg;
  wire [1:0]NLW_mem_reg_0_15_0_5_DOD_UNCONNECTED;
  wire NLW_mem_reg_0_15_6_7_SPO_UNCONNECTED;
  wire NLW_mem_reg_0_15_6_7__0_SPO_UNCONNECTED;

  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF empty_OBUF_inst
       (.I(empty_OBUF),
        .O(empty));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    empty_OBUF_inst_i_1
       (.I0(fifo_cnt_OBUF[3]),
        .I1(fifo_cnt_OBUF[0]),
        .I2(fifo_cnt_OBUF[1]),
        .I3(fifo_cnt_OBUF[2]),
        .I4(fifo_cnt_OBUF[4]),
        .O(empty_OBUF));
  LUT6 #(
    .INIT(64'h00000000FFFFFFF6)) 
    \fifo_cnt[0]_i_1 
       (.I0(wr_en_IBUF),
        .I1(fifo_cnt_OBUF[4]),
        .I2(fifo_cnt_OBUF[3]),
        .I3(fifo_cnt_OBUF[2]),
        .I4(fifo_cnt_OBUF[1]),
        .I5(fifo_cnt_OBUF[0]),
        .O(p_2_in[0]));
  LUT6 #(
    .INIT(64'h5555AAAAAAAA5554)) 
    \fifo_cnt[1]_i_1 
       (.I0(wr_en_IBUF),
        .I1(fifo_cnt_OBUF[4]),
        .I2(fifo_cnt_OBUF[3]),
        .I3(fifo_cnt_OBUF[2]),
        .I4(fifo_cnt_OBUF[1]),
        .I5(fifo_cnt_OBUF[0]),
        .O(p_2_in[1]));
  LUT6 #(
    .INIT(64'h55FFFFAAAA000054)) 
    \fifo_cnt[2]_i_1 
       (.I0(wr_en_IBUF),
        .I1(fifo_cnt_OBUF[4]),
        .I2(fifo_cnt_OBUF[3]),
        .I3(fifo_cnt_OBUF[1]),
        .I4(fifo_cnt_OBUF[0]),
        .I5(fifo_cnt_OBUF[2]),
        .O(p_2_in[2]));
  LUT6 #(
    .INIT(64'h5FFFFFFAA0000004)) 
    \fifo_cnt[3]_i_1 
       (.I0(wr_en_IBUF),
        .I1(fifo_cnt_OBUF[4]),
        .I2(fifo_cnt_OBUF[2]),
        .I3(fifo_cnt_OBUF[0]),
        .I4(fifo_cnt_OBUF[1]),
        .I5(fifo_cnt_OBUF[3]),
        .O(p_2_in[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \fifo_cnt[4]_i_1 
       (.I0(reset_IBUF),
        .O(\fifo_cnt[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \fifo_cnt[4]_i_2 
       (.I0(wr_en_IBUF),
        .I1(rd_en_IBUF),
        .O(\fifo_cnt[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFE80000000)) 
    \fifo_cnt[4]_i_3 
       (.I0(wr_en_IBUF),
        .I1(fifo_cnt_OBUF[3]),
        .I2(fifo_cnt_OBUF[1]),
        .I3(fifo_cnt_OBUF[0]),
        .I4(fifo_cnt_OBUF[2]),
        .I5(fifo_cnt_OBUF[4]),
        .O(p_2_in[4]));
  OBUF \fifo_cnt_OBUF[0]_inst 
       (.I(fifo_cnt_OBUF[0]),
        .O(fifo_cnt[0]));
  OBUF \fifo_cnt_OBUF[1]_inst 
       (.I(fifo_cnt_OBUF[1]),
        .O(fifo_cnt[1]));
  OBUF \fifo_cnt_OBUF[2]_inst 
       (.I(fifo_cnt_OBUF[2]),
        .O(fifo_cnt[2]));
  OBUF \fifo_cnt_OBUF[3]_inst 
       (.I(fifo_cnt_OBUF[3]),
        .O(fifo_cnt[3]));
  OBUF \fifo_cnt_OBUF[4]_inst 
       (.I(fifo_cnt_OBUF[4]),
        .O(fifo_cnt[4]));
  FDRE \fifo_cnt_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\fifo_cnt[4]_i_2_n_0 ),
        .D(p_2_in[0]),
        .Q(fifo_cnt_OBUF[0]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \fifo_cnt_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\fifo_cnt[4]_i_2_n_0 ),
        .D(p_2_in[1]),
        .Q(fifo_cnt_OBUF[1]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \fifo_cnt_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\fifo_cnt[4]_i_2_n_0 ),
        .D(p_2_in[2]),
        .Q(fifo_cnt_OBUF[2]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \fifo_cnt_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\fifo_cnt[4]_i_2_n_0 ),
        .D(p_2_in[3]),
        .Q(fifo_cnt_OBUF[3]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \fifo_cnt_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\fifo_cnt[4]_i_2_n_0 ),
        .D(p_2_in[4]),
        .Q(fifo_cnt_OBUF[4]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  OBUF full_OBUF_inst
       (.I(full_OBUF),
        .O(full));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    full_OBUF_inst_i_1
       (.I0(fifo_cnt_OBUF[3]),
        .I1(fifo_cnt_OBUF[0]),
        .I2(fifo_cnt_OBUF[1]),
        .I3(fifo_cnt_OBUF[2]),
        .I4(fifo_cnt_OBUF[4]),
        .O(full_OBUF));
  IBUF \input_data_IBUF[0]_inst 
       (.I(input_data[0]),
        .O(input_data_IBUF[0]));
  IBUF \input_data_IBUF[1]_inst 
       (.I(input_data[1]),
        .O(input_data_IBUF[1]));
  IBUF \input_data_IBUF[2]_inst 
       (.I(input_data[2]),
        .O(input_data_IBUF[2]));
  IBUF \input_data_IBUF[3]_inst 
       (.I(input_data[3]),
        .O(input_data_IBUF[3]));
  IBUF \input_data_IBUF[4]_inst 
       (.I(input_data[4]),
        .O(input_data_IBUF[4]));
  IBUF \input_data_IBUF[5]_inst 
       (.I(input_data[5]),
        .O(input_data_IBUF[5]));
  IBUF \input_data_IBUF[6]_inst 
       (.I(input_data[6]),
        .O(input_data_IBUF[6]));
  IBUF \input_data_IBUF[7]_inst 
       (.I(input_data[7]),
        .O(input_data_IBUF[7]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "mem_reg_0_15_0_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M mem_reg_0_15_0_5
       (.ADDRA({1'b0,rd_ptr}),
        .ADDRB({1'b0,rd_ptr}),
        .ADDRC({1'b0,rd_ptr}),
        .ADDRD({1'b0,wr_ptr_reg}),
        .DIA(input_data_IBUF[1:0]),
        .DIB(input_data_IBUF[3:2]),
        .DIC(input_data_IBUF[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(output_data0[1:0]),
        .DOB(output_data0[3:2]),
        .DOC(output_data0[5:4]),
        .DOD(NLW_mem_reg_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(wr_ptr0));
  LUT4 #(
    .INIT(16'hEF00)) 
    mem_reg_0_15_0_5_i_1
       (.I0(rd_en_IBUF),
        .I1(\output_data[7]_i_2_n_0 ),
        .I2(fifo_cnt_OBUF[4]),
        .I3(wr_en_IBUF),
        .O(wr_ptr0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "mem_reg_0_15_6_7" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1D mem_reg_0_15_6_7
       (.A0(wr_ptr_reg[0]),
        .A1(wr_ptr_reg[1]),
        .A2(wr_ptr_reg[2]),
        .A3(wr_ptr_reg[3]),
        .A4(1'b0),
        .D(input_data_IBUF[6]),
        .DPO(output_data0[6]),
        .DPRA0(rd_ptr[0]),
        .DPRA1(rd_ptr[1]),
        .DPRA2(rd_ptr[2]),
        .DPRA3(rd_ptr[3]),
        .DPRA4(1'b0),
        .SPO(NLW_mem_reg_0_15_6_7_SPO_UNCONNECTED),
        .WCLK(clk_IBUF_BUFG),
        .WE(wr_ptr0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "mem_reg_0_15_6_7" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1D mem_reg_0_15_6_7__0
       (.A0(wr_ptr_reg[0]),
        .A1(wr_ptr_reg[1]),
        .A2(wr_ptr_reg[2]),
        .A3(wr_ptr_reg[3]),
        .A4(1'b0),
        .D(input_data_IBUF[7]),
        .DPO(output_data0[7]),
        .DPRA0(rd_ptr[0]),
        .DPRA1(rd_ptr[1]),
        .DPRA2(rd_ptr[2]),
        .DPRA3(rd_ptr[3]),
        .DPRA4(1'b0),
        .SPO(NLW_mem_reg_0_15_6_7__0_SPO_UNCONNECTED),
        .WCLK(clk_IBUF_BUFG),
        .WE(wr_ptr0));
  LUT4 #(
    .INIT(16'hFE00)) 
    \output_data[7]_i_1 
       (.I0(wr_en_IBUF),
        .I1(fifo_cnt_OBUF[4]),
        .I2(\output_data[7]_i_2_n_0 ),
        .I3(rd_en_IBUF),
        .O(rd_ptr0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \output_data[7]_i_2 
       (.I0(fifo_cnt_OBUF[2]),
        .I1(fifo_cnt_OBUF[0]),
        .I2(fifo_cnt_OBUF[1]),
        .I3(fifo_cnt_OBUF[3]),
        .O(\output_data[7]_i_2_n_0 ));
  OBUF \output_data_OBUF[0]_inst 
       (.I(output_data_OBUF[0]),
        .O(output_data[0]));
  OBUF \output_data_OBUF[1]_inst 
       (.I(output_data_OBUF[1]),
        .O(output_data[1]));
  OBUF \output_data_OBUF[2]_inst 
       (.I(output_data_OBUF[2]),
        .O(output_data[2]));
  OBUF \output_data_OBUF[3]_inst 
       (.I(output_data_OBUF[3]),
        .O(output_data[3]));
  OBUF \output_data_OBUF[4]_inst 
       (.I(output_data_OBUF[4]),
        .O(output_data[4]));
  OBUF \output_data_OBUF[5]_inst 
       (.I(output_data_OBUF[5]),
        .O(output_data[5]));
  OBUF \output_data_OBUF[6]_inst 
       (.I(output_data_OBUF[6]),
        .O(output_data[6]));
  OBUF \output_data_OBUF[7]_inst 
       (.I(output_data_OBUF[7]),
        .O(output_data[7]));
  FDRE \output_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(output_data0[0]),
        .Q(output_data_OBUF[0]),
        .R(1'b0));
  FDRE \output_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(output_data0[1]),
        .Q(output_data_OBUF[1]),
        .R(1'b0));
  FDRE \output_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(output_data0[2]),
        .Q(output_data_OBUF[2]),
        .R(1'b0));
  FDRE \output_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(output_data0[3]),
        .Q(output_data_OBUF[3]),
        .R(1'b0));
  FDRE \output_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(output_data0[4]),
        .Q(output_data_OBUF[4]),
        .R(1'b0));
  FDRE \output_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(output_data0[5]),
        .Q(output_data_OBUF[5]),
        .R(1'b0));
  FDRE \output_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(output_data0[6]),
        .Q(output_data_OBUF[6]),
        .R(1'b0));
  FDRE \output_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(output_data0[7]),
        .Q(output_data_OBUF[7]),
        .R(1'b0));
  IBUF rd_en_IBUF_inst
       (.I(rd_en),
        .O(rd_en_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \rd_ptr[0]_i_1 
       (.I0(rd_ptr[0]),
        .O(\rd_ptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_ptr[1]_i_1 
       (.I0(rd_ptr[0]),
        .I1(rd_ptr[1]),
        .O(\rd_ptr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \rd_ptr[2]_i_1 
       (.I0(rd_ptr[2]),
        .I1(rd_ptr[0]),
        .I2(rd_ptr[1]),
        .O(\rd_ptr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \rd_ptr[3]_i_1 
       (.I0(rd_ptr[3]),
        .I1(rd_ptr[0]),
        .I2(rd_ptr[1]),
        .I3(rd_ptr[2]),
        .O(\rd_ptr[3]_i_1_n_0 ));
  FDRE \rd_ptr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(\rd_ptr[0]_i_1_n_0 ),
        .Q(rd_ptr[0]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \rd_ptr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(\rd_ptr[1]_i_1_n_0 ),
        .Q(rd_ptr[1]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \rd_ptr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(\rd_ptr[2]_i_1_n_0 ),
        .Q(rd_ptr[2]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \rd_ptr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(rd_ptr0),
        .D(\rd_ptr[3]_i_1_n_0 ),
        .Q(rd_ptr[3]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  IBUF wr_en_IBUF_inst
       (.I(wr_en),
        .O(wr_en_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \wr_ptr[0]_i_1 
       (.I0(wr_ptr_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_ptr[1]_i_1 
       (.I0(wr_ptr_reg[1]),
        .I1(wr_ptr_reg[0]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \wr_ptr[2]_i_1 
       (.I0(wr_ptr_reg[2]),
        .I1(wr_ptr_reg[1]),
        .I2(wr_ptr_reg[0]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \wr_ptr[3]_i_1 
       (.I0(wr_ptr_reg[3]),
        .I1(wr_ptr_reg[1]),
        .I2(wr_ptr_reg[0]),
        .I3(wr_ptr_reg[2]),
        .O(p_0_in[3]));
  FDRE \wr_ptr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(wr_ptr0),
        .D(p_0_in[0]),
        .Q(wr_ptr_reg[0]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \wr_ptr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(wr_ptr0),
        .D(p_0_in[1]),
        .Q(wr_ptr_reg[1]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \wr_ptr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(wr_ptr0),
        .D(p_0_in[2]),
        .Q(wr_ptr_reg[2]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
  FDRE \wr_ptr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(wr_ptr0),
        .D(p_0_in[3]),
        .Q(wr_ptr_reg[3]),
        .R(\fifo_cnt[4]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
