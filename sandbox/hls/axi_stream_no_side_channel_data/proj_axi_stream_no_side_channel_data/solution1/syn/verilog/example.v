// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="example,hls_ip_2019_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-2,HLS_INPUT_CLOCK=13.333000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.896000,HLS_SYN_LAT=101,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=15,HLS_SYN_LUT=55,HLS_VERSION=2019_2}" *)

module example (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        A_TDATA,
        A_TVALID,
        A_TREADY,
        B_TDATA,
        B_TVALID,
        B_TREADY
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] A_TDATA;
input   A_TVALID;
output   A_TREADY;
output  [31:0] B_TDATA;
output   B_TVALID;
input   B_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg A_TREADY;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    A_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln99_fu_62_p2;
reg    B_TDATA_blk_n;
wire    ap_CS_fsm_state3;
wire   [5:0] i_fu_68_p2;
reg   [5:0] i_reg_84;
wire    regslice_both_B_U_apdone_blk;
reg    ap_block_state2;
reg    ap_block_state2_io;
reg   [5:0] i_0_reg_51;
reg   [2:0] ap_NS_fsm;
wire    regslice_both_A_U_apdone_blk;
wire   [31:0] A_TDATA_int;
wire    A_TVALID_int;
reg    A_TREADY_int;
wire    regslice_both_A_U_ack_in;
wire   [31:0] B_TDATA_int;
reg    B_TVALID_int;
wire    B_TREADY_int;
wire    regslice_both_B_U_vld_out;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
end

regslice_both #(
    .DataWidth( 32 ))
regslice_both_A_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(A_TDATA),
    .vld_in(A_TVALID),
    .ack_in(regslice_both_A_U_ack_in),
    .data_out(A_TDATA_int),
    .vld_out(A_TVALID_int),
    .ack_out(A_TREADY_int),
    .apdone_blk(regslice_both_A_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 32 ))
regslice_both_B_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(B_TDATA_int),
    .vld_in(B_TVALID_int),
    .ack_in(B_TREADY_int),
    .data_out(B_TDATA),
    .vld_out(regslice_both_B_U_vld_out),
    .ack_out(B_TREADY),
    .apdone_blk(regslice_both_B_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == B_TREADY_int))) begin
        i_0_reg_51 <= i_reg_84;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_0_reg_51 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_B_U_apdone_blk == 1'b1) | ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b0 == A_TVALID_int))) & (1'b1 == ap_CS_fsm_state2))) begin
        i_reg_84 <= i_fu_68_p2;
    end
end

always @ (*) begin
    if (((icmp_ln99_fu_62_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        A_TDATA_blk_n = A_TVALID_int;
    end else begin
        A_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == A_TVALID) & (regslice_both_A_U_ack_in == 1'b1))) begin
        A_TREADY = 1'b1;
    end else begin
        A_TREADY = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_B_U_apdone_blk == 1'b1) | ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b0 == A_TVALID_int))) & (icmp_ln99_fu_62_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        A_TREADY_int = 1'b1;
    end else begin
        A_TREADY_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        B_TDATA_blk_n = B_TREADY_int;
    end else begin
        B_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_B_U_apdone_blk == 1'b1) | ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b0 == A_TVALID_int))) & (icmp_ln99_fu_62_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        B_TVALID_int = 1'b1;
    end else begin
        B_TVALID_int = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_B_U_apdone_blk == 1'b1) | ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b0 == A_TVALID_int))) & (icmp_ln99_fu_62_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_B_U_apdone_blk == 1'b1) | ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b0 == A_TVALID_int))) & (icmp_ln99_fu_62_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | (regslice_both_B_U_apdone_blk == 1'b1) | ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b0 == A_TVALID_int))) & (icmp_ln99_fu_62_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((1'b1 == ap_block_state2_io) | (regslice_both_B_U_apdone_blk == 1'b1) | ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b0 == A_TVALID_int))) & (icmp_ln99_fu_62_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == B_TREADY_int))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign B_TDATA_int = (A_TDATA_int + 32'd5);

assign B_TVALID = regslice_both_B_U_vld_out;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state2 = ((regslice_both_B_U_apdone_blk == 1'b1) | ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b0 == A_TVALID_int)));
end

always @ (*) begin
    ap_block_state2_io = ((icmp_ln99_fu_62_p2 == 1'd0) & (1'b0 == B_TREADY_int));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign i_fu_68_p2 = (i_0_reg_51 + 6'd1);

assign icmp_ln99_fu_62_p2 = ((i_0_reg_51 == 6'd50) ? 1'b1 : 1'b0);

endmodule //example
