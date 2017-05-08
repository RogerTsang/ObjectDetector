// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module AXIvideo2Mat (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        INPUT_STREAM_TDATA,
        INPUT_STREAM_TVALID,
        INPUT_STREAM_TREADY,
        INPUT_STREAM_TKEEP,
        INPUT_STREAM_TSTRB,
        INPUT_STREAM_TUSER,
        INPUT_STREAM_TLAST,
        INPUT_STREAM_TID,
        INPUT_STREAM_TDEST,
        img_rows_V_read,
        img_cols_V_read,
        img_data_stream_0_V_din,
        img_data_stream_0_V_full_n,
        img_data_stream_0_V_write,
        img_data_stream_1_V_din,
        img_data_stream_1_V_full_n,
        img_data_stream_1_V_write,
        img_data_stream_2_V_din,
        img_data_stream_2_V_full_n,
        img_data_stream_2_V_write
);

parameter    ap_ST_fsm_state1 = 8'b1;
parameter    ap_ST_fsm_state2 = 8'b10;
parameter    ap_ST_fsm_state3 = 8'b100;
parameter    ap_ST_fsm_state4 = 8'b1000;
parameter    ap_ST_fsm_pp1_stage0 = 8'b10000;
parameter    ap_ST_fsm_state7 = 8'b100000;
parameter    ap_ST_fsm_pp2_stage0 = 8'b1000000;
parameter    ap_ST_fsm_state10 = 8'b10000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv2_2 = 2'b10;
parameter    ap_const_lv2_3 = 2'b11;
parameter    ap_const_lv2_1 = 2'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_6 = 32'b110;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv9_0 = 9'b000000000;
parameter    ap_const_lv10_0 = 10'b0000000000;
parameter    ap_const_lv9_1 = 9'b1;
parameter    ap_const_lv10_1 = 10'b1;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv32_10 = 32'b10000;
parameter    ap_const_lv32_17 = 32'b10111;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [23:0] INPUT_STREAM_TDATA;
input   INPUT_STREAM_TVALID;
output   INPUT_STREAM_TREADY;
input  [2:0] INPUT_STREAM_TKEEP;
input  [2:0] INPUT_STREAM_TSTRB;
input  [0:0] INPUT_STREAM_TUSER;
input  [0:0] INPUT_STREAM_TLAST;
input  [0:0] INPUT_STREAM_TID;
input  [0:0] INPUT_STREAM_TDEST;
input  [11:0] img_rows_V_read;
input  [11:0] img_cols_V_read;
output  [7:0] img_data_stream_0_V_din;
input   img_data_stream_0_V_full_n;
output   img_data_stream_0_V_write;
output  [7:0] img_data_stream_1_V_din;
input   img_data_stream_1_V_full_n;
output   img_data_stream_1_V_write;
output  [7:0] img_data_stream_2_V_din;
input   img_data_stream_2_V_full_n;
output   img_data_stream_2_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg img_data_stream_0_V_write;
reg img_data_stream_1_V_write;
reg img_data_stream_2_V_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire   [0:0] ap_CS_fsm_state1;
reg   [23:0] AXI_video_strm_V_data_V_0_data_out;
wire    AXI_video_strm_V_data_V_0_vld_in;
wire    AXI_video_strm_V_data_V_0_vld_out;
wire    AXI_video_strm_V_data_V_0_ack_in;
reg    AXI_video_strm_V_data_V_0_ack_out;
reg   [23:0] AXI_video_strm_V_data_V_0_payload_A;
reg   [23:0] AXI_video_strm_V_data_V_0_payload_B;
reg    AXI_video_strm_V_data_V_0_sel_rd;
reg    AXI_video_strm_V_data_V_0_sel_wr;
wire    AXI_video_strm_V_data_V_0_sel;
wire    AXI_video_strm_V_data_V_0_load_A;
wire    AXI_video_strm_V_data_V_0_load_B;
reg   [1:0] AXI_video_strm_V_data_V_0_state;
wire    AXI_video_strm_V_data_V_0_state_cmp_full;
reg   [0:0] AXI_video_strm_V_user_V_0_data_out;
wire    AXI_video_strm_V_user_V_0_vld_in;
wire    AXI_video_strm_V_user_V_0_vld_out;
wire    AXI_video_strm_V_user_V_0_ack_in;
reg    AXI_video_strm_V_user_V_0_ack_out;
reg   [0:0] AXI_video_strm_V_user_V_0_payload_A;
reg   [0:0] AXI_video_strm_V_user_V_0_payload_B;
reg    AXI_video_strm_V_user_V_0_sel_rd;
reg    AXI_video_strm_V_user_V_0_sel_wr;
wire    AXI_video_strm_V_user_V_0_sel;
wire    AXI_video_strm_V_user_V_0_load_A;
wire    AXI_video_strm_V_user_V_0_load_B;
reg   [1:0] AXI_video_strm_V_user_V_0_state;
wire    AXI_video_strm_V_user_V_0_state_cmp_full;
reg   [0:0] AXI_video_strm_V_last_V_0_data_out;
wire    AXI_video_strm_V_last_V_0_vld_in;
wire    AXI_video_strm_V_last_V_0_vld_out;
wire    AXI_video_strm_V_last_V_0_ack_in;
reg    AXI_video_strm_V_last_V_0_ack_out;
reg   [0:0] AXI_video_strm_V_last_V_0_payload_A;
reg   [0:0] AXI_video_strm_V_last_V_0_payload_B;
reg    AXI_video_strm_V_last_V_0_sel_rd;
reg    AXI_video_strm_V_last_V_0_sel_wr;
wire    AXI_video_strm_V_last_V_0_sel;
wire    AXI_video_strm_V_last_V_0_load_A;
wire    AXI_video_strm_V_last_V_0_load_B;
reg   [1:0] AXI_video_strm_V_last_V_0_state;
wire    AXI_video_strm_V_last_V_0_state_cmp_full;
wire    AXI_video_strm_V_dest_V_0_vld_in;
reg    AXI_video_strm_V_dest_V_0_ack_out;
reg   [1:0] AXI_video_strm_V_dest_V_0_state;
reg    INPUT_STREAM_TDATA_blk_n;
wire   [0:0] ap_CS_fsm_state2;
wire   [0:0] ap_CS_fsm_pp1_stage0;
reg    ap_enable_reg_pp1_iter1;
reg   [0:0] exitcond_reg_428;
reg   [0:0] brmerge_reg_437;
wire   [0:0] ap_CS_fsm_pp2_stage0;
reg    ap_enable_reg_pp2_iter1;
reg   [0:0] eol_2_reg_256;
reg    img_data_stream_0_V_blk_n;
reg    img_data_stream_1_V_blk_n;
reg    img_data_stream_2_V_blk_n;
reg   [9:0] p_4_reg_186;
reg   [0:0] eol_reg_197;
reg   [0:0] eol_1_reg_209;
reg   [23:0] axi_data_V_1_reg_220;
reg   [0:0] axi_last_V_3_reg_267;
reg   [23:0] axi_data_V_3_reg_279;
wire   [9:0] tmp_17_fu_301_p1;
reg   [9:0] tmp_17_reg_389;
wire   [10:0] tmp_18_fu_305_p1;
reg   [10:0] tmp_18_reg_394;
reg   [23:0] tmp_data_V_reg_399;
reg   [0:0] tmp_last_V_reg_407;
wire   [0:0] exitcond2_fu_322_p2;
wire   [0:0] ap_CS_fsm_state4;
wire   [8:0] i_V_fu_327_p2;
reg   [8:0] i_V_reg_423;
wire   [0:0] exitcond_fu_337_p2;
reg    ap_condition_546;
wire   [9:0] j_V_fu_342_p2;
reg    ap_enable_reg_pp1_iter0;
wire   [0:0] brmerge_fu_351_p2;
reg    ap_enable_reg_pp2_iter0;
wire   [0:0] ap_CS_fsm_state7;
reg   [0:0] eol_2_phi_fu_259_p4;
reg   [0:0] axi_last_V1_reg_155;
wire   [0:0] ap_CS_fsm_state10;
wire   [0:0] ap_CS_fsm_state3;
reg   [23:0] axi_data_V1_reg_165;
reg   [8:0] p_s_reg_175;
reg   [0:0] eol_phi_fu_201_p4;
reg   [0:0] axi_last_V_2_phi_fu_236_p4;
reg   [23:0] p_Val2_s_phi_fu_248_p4;
wire   [0:0] ap_phi_precharge_reg_pp1_iter1_axi_last_V_2_reg_231;
wire   [23:0] ap_phi_precharge_reg_pp1_iter1_p_Val2_s_reg_244;
reg   [0:0] sof_1_fu_100;
wire   [9:0] p_cast_fu_318_p1;
wire   [10:0] p_4_cast_fu_333_p1;
wire   [0:0] tmp_user_V_fu_309_p1;
reg   [7:0] ap_NS_fsm;
reg    ap_condition_488;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 8'b1;
#0 AXI_video_strm_V_data_V_0_sel_rd = 1'b0;
#0 AXI_video_strm_V_data_V_0_sel_wr = 1'b0;
#0 AXI_video_strm_V_data_V_0_state = 2'b00;
#0 AXI_video_strm_V_user_V_0_sel_rd = 1'b0;
#0 AXI_video_strm_V_user_V_0_sel_wr = 1'b0;
#0 AXI_video_strm_V_user_V_0_state = 2'b00;
#0 AXI_video_strm_V_last_V_0_sel_rd = 1'b0;
#0 AXI_video_strm_V_last_V_0_sel_wr = 1'b0;
#0 AXI_video_strm_V_last_V_0_state = 2'b00;
#0 AXI_video_strm_V_dest_V_0_state = 2'b00;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
#0 ap_enable_reg_pp2_iter1 = 1'b0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp2_iter0 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_data_V_0_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == AXI_video_strm_V_data_V_0_ack_out) & (1'b1 == AXI_video_strm_V_data_V_0_vld_out))) begin
            AXI_video_strm_V_data_V_0_sel_rd <= ~AXI_video_strm_V_data_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_data_V_0_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == AXI_video_strm_V_data_V_0_vld_in) & (1'b1 == AXI_video_strm_V_data_V_0_ack_in))) begin
            AXI_video_strm_V_data_V_0_sel_wr <= ~AXI_video_strm_V_data_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_data_V_0_state <= ap_const_lv2_0;
    end else begin
        if ((((1'b0 == AXI_video_strm_V_data_V_0_vld_in) & (1'b1 == AXI_video_strm_V_data_V_0_ack_out) & (AXI_video_strm_V_data_V_0_state == ap_const_lv2_3)) | ((1'b0 == AXI_video_strm_V_data_V_0_vld_in) & (AXI_video_strm_V_data_V_0_state == ap_const_lv2_2)))) begin
            AXI_video_strm_V_data_V_0_state <= ap_const_lv2_2;
        end else if ((((1'b1 == AXI_video_strm_V_data_V_0_vld_in) & (1'b0 == AXI_video_strm_V_data_V_0_ack_out) & (AXI_video_strm_V_data_V_0_state == ap_const_lv2_3)) | ((1'b0 == AXI_video_strm_V_data_V_0_ack_out) & (AXI_video_strm_V_data_V_0_state == ap_const_lv2_1)))) begin
            AXI_video_strm_V_data_V_0_state <= ap_const_lv2_1;
        end else if ((((1'b1 == AXI_video_strm_V_data_V_0_vld_in) & (AXI_video_strm_V_data_V_0_state == ap_const_lv2_2)) | ((1'b1 == AXI_video_strm_V_data_V_0_ack_out) & (AXI_video_strm_V_data_V_0_state == ap_const_lv2_1)) | ((AXI_video_strm_V_data_V_0_state == ap_const_lv2_3) & ~((1'b1 == AXI_video_strm_V_data_V_0_vld_in) & (1'b0 == AXI_video_strm_V_data_V_0_ack_out)) & ~((1'b0 == AXI_video_strm_V_data_V_0_vld_in) & (1'b1 == AXI_video_strm_V_data_V_0_ack_out))))) begin
            AXI_video_strm_V_data_V_0_state <= ap_const_lv2_3;
        end else begin
            AXI_video_strm_V_data_V_0_state <= ap_const_lv2_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_dest_V_0_state <= ap_const_lv2_0;
    end else begin
        if ((((1'b0 == AXI_video_strm_V_dest_V_0_vld_in) & (1'b1 == AXI_video_strm_V_dest_V_0_ack_out) & (ap_const_lv2_3 == AXI_video_strm_V_dest_V_0_state)) | ((1'b0 == AXI_video_strm_V_dest_V_0_vld_in) & (ap_const_lv2_2 == AXI_video_strm_V_dest_V_0_state)))) begin
            AXI_video_strm_V_dest_V_0_state <= ap_const_lv2_2;
        end else if ((((1'b1 == AXI_video_strm_V_dest_V_0_vld_in) & (1'b0 == AXI_video_strm_V_dest_V_0_ack_out) & (ap_const_lv2_3 == AXI_video_strm_V_dest_V_0_state)) | ((1'b0 == AXI_video_strm_V_dest_V_0_ack_out) & (ap_const_lv2_1 == AXI_video_strm_V_dest_V_0_state)))) begin
            AXI_video_strm_V_dest_V_0_state <= ap_const_lv2_1;
        end else if ((((1'b1 == AXI_video_strm_V_dest_V_0_vld_in) & (ap_const_lv2_2 == AXI_video_strm_V_dest_V_0_state)) | ((1'b1 == AXI_video_strm_V_dest_V_0_ack_out) & (ap_const_lv2_1 == AXI_video_strm_V_dest_V_0_state)) | ((ap_const_lv2_3 == AXI_video_strm_V_dest_V_0_state) & ~((1'b1 == AXI_video_strm_V_dest_V_0_vld_in) & (1'b0 == AXI_video_strm_V_dest_V_0_ack_out)) & ~((1'b0 == AXI_video_strm_V_dest_V_0_vld_in) & (1'b1 == AXI_video_strm_V_dest_V_0_ack_out))))) begin
            AXI_video_strm_V_dest_V_0_state <= ap_const_lv2_3;
        end else begin
            AXI_video_strm_V_dest_V_0_state <= ap_const_lv2_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_last_V_0_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == AXI_video_strm_V_last_V_0_ack_out) & (1'b1 == AXI_video_strm_V_last_V_0_vld_out))) begin
            AXI_video_strm_V_last_V_0_sel_rd <= ~AXI_video_strm_V_last_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_last_V_0_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == AXI_video_strm_V_last_V_0_vld_in) & (1'b1 == AXI_video_strm_V_last_V_0_ack_in))) begin
            AXI_video_strm_V_last_V_0_sel_wr <= ~AXI_video_strm_V_last_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_last_V_0_state <= ap_const_lv2_0;
    end else begin
        if ((((1'b0 == AXI_video_strm_V_last_V_0_vld_in) & (1'b1 == AXI_video_strm_V_last_V_0_ack_out) & (ap_const_lv2_3 == AXI_video_strm_V_last_V_0_state)) | ((1'b0 == AXI_video_strm_V_last_V_0_vld_in) & (ap_const_lv2_2 == AXI_video_strm_V_last_V_0_state)))) begin
            AXI_video_strm_V_last_V_0_state <= ap_const_lv2_2;
        end else if ((((1'b1 == AXI_video_strm_V_last_V_0_vld_in) & (1'b0 == AXI_video_strm_V_last_V_0_ack_out) & (ap_const_lv2_3 == AXI_video_strm_V_last_V_0_state)) | ((1'b0 == AXI_video_strm_V_last_V_0_ack_out) & (ap_const_lv2_1 == AXI_video_strm_V_last_V_0_state)))) begin
            AXI_video_strm_V_last_V_0_state <= ap_const_lv2_1;
        end else if ((((1'b1 == AXI_video_strm_V_last_V_0_vld_in) & (ap_const_lv2_2 == AXI_video_strm_V_last_V_0_state)) | ((1'b1 == AXI_video_strm_V_last_V_0_ack_out) & (ap_const_lv2_1 == AXI_video_strm_V_last_V_0_state)) | ((ap_const_lv2_3 == AXI_video_strm_V_last_V_0_state) & ~((1'b1 == AXI_video_strm_V_last_V_0_vld_in) & (1'b0 == AXI_video_strm_V_last_V_0_ack_out)) & ~((1'b0 == AXI_video_strm_V_last_V_0_vld_in) & (1'b1 == AXI_video_strm_V_last_V_0_ack_out))))) begin
            AXI_video_strm_V_last_V_0_state <= ap_const_lv2_3;
        end else begin
            AXI_video_strm_V_last_V_0_state <= ap_const_lv2_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_user_V_0_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == AXI_video_strm_V_user_V_0_ack_out) & (1'b1 == AXI_video_strm_V_user_V_0_vld_out))) begin
            AXI_video_strm_V_user_V_0_sel_rd <= ~AXI_video_strm_V_user_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_user_V_0_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == AXI_video_strm_V_user_V_0_vld_in) & (1'b1 == AXI_video_strm_V_user_V_0_ack_in))) begin
            AXI_video_strm_V_user_V_0_sel_wr <= ~AXI_video_strm_V_user_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        AXI_video_strm_V_user_V_0_state <= ap_const_lv2_0;
    end else begin
        if ((((1'b0 == AXI_video_strm_V_user_V_0_vld_in) & (1'b1 == AXI_video_strm_V_user_V_0_ack_out) & (ap_const_lv2_3 == AXI_video_strm_V_user_V_0_state)) | ((1'b0 == AXI_video_strm_V_user_V_0_vld_in) & (ap_const_lv2_2 == AXI_video_strm_V_user_V_0_state)))) begin
            AXI_video_strm_V_user_V_0_state <= ap_const_lv2_2;
        end else if ((((1'b1 == AXI_video_strm_V_user_V_0_vld_in) & (1'b0 == AXI_video_strm_V_user_V_0_ack_out) & (ap_const_lv2_3 == AXI_video_strm_V_user_V_0_state)) | ((1'b0 == AXI_video_strm_V_user_V_0_ack_out) & (ap_const_lv2_1 == AXI_video_strm_V_user_V_0_state)))) begin
            AXI_video_strm_V_user_V_0_state <= ap_const_lv2_1;
        end else if ((((1'b1 == AXI_video_strm_V_user_V_0_vld_in) & (ap_const_lv2_2 == AXI_video_strm_V_user_V_0_state)) | ((1'b1 == AXI_video_strm_V_user_V_0_ack_out) & (ap_const_lv2_1 == AXI_video_strm_V_user_V_0_state)) | ((ap_const_lv2_3 == AXI_video_strm_V_user_V_0_state) & ~((1'b1 == AXI_video_strm_V_user_V_0_vld_in) & (1'b0 == AXI_video_strm_V_user_V_0_ack_out)) & ~((1'b0 == AXI_video_strm_V_user_V_0_vld_in) & (1'b1 == AXI_video_strm_V_user_V_0_ack_out))))) begin
            AXI_video_strm_V_user_V_0_state <= ap_const_lv2_3;
        end else begin
            AXI_video_strm_V_user_V_0_state <= ap_const_lv2_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_continue)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state4) & ~(1'b0 == exitcond2_fu_322_p2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp1_stage0) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)) & ~(1'b0 == exitcond_fu_337_p2))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == exitcond2_fu_322_p2))) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp1_stage0) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)))) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == exitcond2_fu_322_p2))) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp2_stage0) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0)) & ~(1'b0 == eol_2_phi_fu_259_p4))) begin
            ap_enable_reg_pp2_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_enable_reg_pp2_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp2_stage0) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0)))) begin
            ap_enable_reg_pp2_iter1 <= ap_enable_reg_pp2_iter0;
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_enable_reg_pp2_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        axi_data_V1_reg_165 <= tmp_data_V_reg_399;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        axi_data_V1_reg_165 <= axi_data_V_3_reg_279;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)))) begin
        axi_data_V_1_reg_220 <= p_Val2_s_phi_fu_248_p4;
    end else if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == exitcond2_fu_322_p2))) begin
        axi_data_V_1_reg_220 <= axi_data_V1_reg_165;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        axi_data_V_3_reg_279 <= axi_data_V_1_reg_220;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0)))) begin
        axi_data_V_3_reg_279 <= AXI_video_strm_V_data_V_0_data_out;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        axi_last_V1_reg_155 <= tmp_last_V_reg_407;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        axi_last_V1_reg_155 <= axi_last_V_3_reg_267;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        axi_last_V_3_reg_267 <= eol_1_reg_209;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0)))) begin
        axi_last_V_3_reg_267 <= AXI_video_strm_V_last_V_0_data_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)))) begin
        eol_1_reg_209 <= axi_last_V_2_phi_fu_236_p4;
    end else if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == exitcond2_fu_322_p2))) begin
        eol_1_reg_209 <= axi_last_V1_reg_155;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        eol_2_reg_256 <= eol_reg_197;
    end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0)))) begin
        eol_2_reg_256 <= AXI_video_strm_V_last_V_0_data_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)))) begin
        eol_reg_197 <= axi_last_V_2_phi_fu_236_p4;
    end else if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == exitcond2_fu_322_p2))) begin
        eol_reg_197 <= 1'b0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)) & (1'b1 == ap_enable_reg_pp1_iter0) & (1'b0 == exitcond_fu_337_p2))) begin
        p_4_reg_186 <= j_V_fu_342_p2;
    end else if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == exitcond2_fu_322_p2))) begin
        p_4_reg_186 <= ap_const_lv10_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        p_s_reg_175 <= ap_const_lv9_0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        p_s_reg_175 <= i_V_reg_423;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)) & (1'b1 == ap_enable_reg_pp1_iter0) & (1'b0 == exitcond_fu_337_p2))) begin
        sof_1_fu_100 <= 1'b0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        sof_1_fu_100 <= 1'b1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == AXI_video_strm_V_data_V_0_load_A)) begin
        AXI_video_strm_V_data_V_0_payload_A <= INPUT_STREAM_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == AXI_video_strm_V_data_V_0_load_B)) begin
        AXI_video_strm_V_data_V_0_payload_B <= INPUT_STREAM_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == AXI_video_strm_V_last_V_0_load_A)) begin
        AXI_video_strm_V_last_V_0_payload_A <= INPUT_STREAM_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == AXI_video_strm_V_last_V_0_load_B)) begin
        AXI_video_strm_V_last_V_0_payload_B <= INPUT_STREAM_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == AXI_video_strm_V_user_V_0_load_A)) begin
        AXI_video_strm_V_user_V_0_payload_A <= INPUT_STREAM_TUSER;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == AXI_video_strm_V_user_V_0_load_B)) begin
        AXI_video_strm_V_user_V_0_payload_B <= INPUT_STREAM_TUSER;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)) & (1'b0 == exitcond_fu_337_p2))) begin
        brmerge_reg_437 <= brmerge_fu_351_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)))) begin
        exitcond_reg_428 <= exitcond_fu_337_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        i_V_reg_423 <= i_V_fu_327_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~((ap_start == 1'b0) | (ap_done_reg == 1'b1)))) begin
        tmp_17_reg_389 <= tmp_17_fu_301_p1;
        tmp_18_reg_394 <= tmp_18_fu_305_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & ~(AXI_video_strm_V_data_V_0_vld_out == 1'b0))) begin
        tmp_data_V_reg_399 <= AXI_video_strm_V_data_V_0_data_out;
        tmp_last_V_reg_407 <= AXI_video_strm_V_last_V_0_data_out;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state2) & ~(AXI_video_strm_V_data_V_0_vld_out == 1'b0)) | ((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0))) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & (1'b0 == brmerge_reg_437) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1))))) begin
        AXI_video_strm_V_data_V_0_ack_out = 1'b1;
    end else begin
        AXI_video_strm_V_data_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == AXI_video_strm_V_data_V_0_sel)) begin
        AXI_video_strm_V_data_V_0_data_out = AXI_video_strm_V_data_V_0_payload_B;
    end else begin
        AXI_video_strm_V_data_V_0_data_out = AXI_video_strm_V_data_V_0_payload_A;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state2) & ~(AXI_video_strm_V_data_V_0_vld_out == 1'b0)) | ((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0))) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & (1'b0 == brmerge_reg_437) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1))))) begin
        AXI_video_strm_V_dest_V_0_ack_out = 1'b1;
    end else begin
        AXI_video_strm_V_dest_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state2) & ~(AXI_video_strm_V_data_V_0_vld_out == 1'b0)) | ((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0))) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & (1'b0 == brmerge_reg_437) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1))))) begin
        AXI_video_strm_V_last_V_0_ack_out = 1'b1;
    end else begin
        AXI_video_strm_V_last_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == AXI_video_strm_V_last_V_0_sel)) begin
        AXI_video_strm_V_last_V_0_data_out = AXI_video_strm_V_last_V_0_payload_B;
    end else begin
        AXI_video_strm_V_last_V_0_data_out = AXI_video_strm_V_last_V_0_payload_A;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state2) & ~(AXI_video_strm_V_data_V_0_vld_out == 1'b0)) | ((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0))) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & (1'b0 == brmerge_reg_437) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1))))) begin
        AXI_video_strm_V_user_V_0_ack_out = 1'b1;
    end else begin
        AXI_video_strm_V_user_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == AXI_video_strm_V_user_V_0_sel)) begin
        AXI_video_strm_V_user_V_0_data_out = AXI_video_strm_V_user_V_0_payload_B;
    end else begin
        AXI_video_strm_V_user_V_0_data_out = AXI_video_strm_V_user_V_0_payload_A;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & (1'b0 == brmerge_reg_437)) | ((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256)))) begin
        INPUT_STREAM_TDATA_blk_n = AXI_video_strm_V_data_V_0_state[1'b0];
    end else begin
        INPUT_STREAM_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_done_reg) | ((1'b1 == ap_CS_fsm_state4) & ~(1'b0 == exitcond2_fu_322_p2)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (ap_CS_fsm_state1 == 1'b1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & ~(1'b0 == exitcond2_fu_322_p2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((ap_condition_488 == 1'b1)) begin
        if (~(1'b0 == brmerge_reg_437)) begin
            axi_last_V_2_phi_fu_236_p4 = eol_1_reg_209;
        end else if ((1'b0 == brmerge_reg_437)) begin
            axi_last_V_2_phi_fu_236_p4 = AXI_video_strm_V_last_V_0_data_out;
        end else begin
            axi_last_V_2_phi_fu_236_p4 = ap_phi_precharge_reg_pp1_iter1_axi_last_V_2_reg_231;
        end
    end else begin
        axi_last_V_2_phi_fu_236_p4 = ap_phi_precharge_reg_pp1_iter1_axi_last_V_2_reg_231;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256))) begin
        eol_2_phi_fu_259_p4 = AXI_video_strm_V_last_V_0_data_out;
    end else begin
        eol_2_phi_fu_259_p4 = eol_2_reg_256;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428))) begin
        eol_phi_fu_201_p4 = axi_last_V_2_phi_fu_236_p4;
    end else begin
        eol_phi_fu_201_p4 = eol_reg_197;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428))) begin
        img_data_stream_0_V_blk_n = img_data_stream_0_V_full_n;
    end else begin
        img_data_stream_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)))) begin
        img_data_stream_0_V_write = 1'b1;
    end else begin
        img_data_stream_0_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428))) begin
        img_data_stream_1_V_blk_n = img_data_stream_1_V_full_n;
    end else begin
        img_data_stream_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)))) begin
        img_data_stream_1_V_write = 1'b1;
    end else begin
        img_data_stream_1_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428))) begin
        img_data_stream_2_V_blk_n = img_data_stream_2_V_full_n;
    end else begin
        img_data_stream_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)))) begin
        img_data_stream_2_V_write = 1'b1;
    end else begin
        img_data_stream_2_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((ap_condition_488 == 1'b1)) begin
        if (~(1'b0 == brmerge_reg_437)) begin
            p_Val2_s_phi_fu_248_p4 = axi_data_V_1_reg_220;
        end else if ((1'b0 == brmerge_reg_437)) begin
            p_Val2_s_phi_fu_248_p4 = AXI_video_strm_V_data_V_0_data_out;
        end else begin
            p_Val2_s_phi_fu_248_p4 = ap_phi_precharge_reg_pp1_iter1_p_Val2_s_reg_244;
        end
    end else begin
        p_Val2_s_phi_fu_248_p4 = ap_phi_precharge_reg_pp1_iter1_p_Val2_s_reg_244;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (~((ap_start == 1'b0) | (ap_done_reg == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~(AXI_video_strm_V_data_V_0_vld_out == 1'b0) & (1'b0 == tmp_user_V_fu_309_p1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~(AXI_video_strm_V_data_V_0_vld_out == 1'b0) & ~(1'b0 == tmp_user_V_fu_309_p1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (~(1'b0 == exitcond2_fu_322_p2)) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_pp1_stage0 : begin
            if (~((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)) & ~(1'b1 == ap_enable_reg_pp1_iter0))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & ~((1'b1 == ap_enable_reg_pp1_iter1) & (ap_condition_546 == 1'b1)) & ~(1'b1 == ap_enable_reg_pp1_iter0))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_pp2_stage0;
        end
        ap_ST_fsm_pp2_stage0 : begin
            if (~((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0)) & ~(1'b1 == ap_enable_reg_pp2_iter0))) begin
                ap_NS_fsm = ap_ST_fsm_pp2_stage0;
            end else if (((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b1 == ap_enable_reg_pp2_iter1) & ~((1'b1 == ap_enable_reg_pp2_iter1) & (1'b0 == eol_2_reg_256) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0)) & ~(1'b1 == ap_enable_reg_pp2_iter0))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp2_stage0;
            end
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign AXI_video_strm_V_data_V_0_ack_in = AXI_video_strm_V_data_V_0_state[1'b1];

assign AXI_video_strm_V_data_V_0_load_A = (AXI_video_strm_V_data_V_0_state_cmp_full & ~AXI_video_strm_V_data_V_0_sel_wr);

assign AXI_video_strm_V_data_V_0_load_B = (AXI_video_strm_V_data_V_0_sel_wr & AXI_video_strm_V_data_V_0_state_cmp_full);

assign AXI_video_strm_V_data_V_0_sel = AXI_video_strm_V_data_V_0_sel_rd;

assign AXI_video_strm_V_data_V_0_state_cmp_full = ((AXI_video_strm_V_data_V_0_state != ap_const_lv2_1) ? 1'b1 : 1'b0);

assign AXI_video_strm_V_data_V_0_vld_in = INPUT_STREAM_TVALID;

assign AXI_video_strm_V_data_V_0_vld_out = AXI_video_strm_V_data_V_0_state[1'b0];

assign AXI_video_strm_V_dest_V_0_vld_in = INPUT_STREAM_TVALID;

assign AXI_video_strm_V_last_V_0_ack_in = AXI_video_strm_V_last_V_0_state[1'b1];

assign AXI_video_strm_V_last_V_0_load_A = (AXI_video_strm_V_last_V_0_state_cmp_full & ~AXI_video_strm_V_last_V_0_sel_wr);

assign AXI_video_strm_V_last_V_0_load_B = (AXI_video_strm_V_last_V_0_sel_wr & AXI_video_strm_V_last_V_0_state_cmp_full);

assign AXI_video_strm_V_last_V_0_sel = AXI_video_strm_V_last_V_0_sel_rd;

assign AXI_video_strm_V_last_V_0_state_cmp_full = ((AXI_video_strm_V_last_V_0_state != ap_const_lv2_1) ? 1'b1 : 1'b0);

assign AXI_video_strm_V_last_V_0_vld_in = INPUT_STREAM_TVALID;

assign AXI_video_strm_V_last_V_0_vld_out = AXI_video_strm_V_last_V_0_state[1'b0];

assign AXI_video_strm_V_user_V_0_ack_in = AXI_video_strm_V_user_V_0_state[1'b1];

assign AXI_video_strm_V_user_V_0_load_A = (AXI_video_strm_V_user_V_0_state_cmp_full & ~AXI_video_strm_V_user_V_0_sel_wr);

assign AXI_video_strm_V_user_V_0_load_B = (AXI_video_strm_V_user_V_0_sel_wr & AXI_video_strm_V_user_V_0_state_cmp_full);

assign AXI_video_strm_V_user_V_0_sel = AXI_video_strm_V_user_V_0_sel_rd;

assign AXI_video_strm_V_user_V_0_state_cmp_full = ((AXI_video_strm_V_user_V_0_state != ap_const_lv2_1) ? 1'b1 : 1'b0);

assign AXI_video_strm_V_user_V_0_vld_in = INPUT_STREAM_TVALID;

assign AXI_video_strm_V_user_V_0_vld_out = AXI_video_strm_V_user_V_0_state[1'b0];

assign INPUT_STREAM_TREADY = AXI_video_strm_V_dest_V_0_state[1'b1];

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[ap_const_lv32_4];

assign ap_CS_fsm_pp2_stage0 = ap_CS_fsm[ap_const_lv32_6];

assign ap_CS_fsm_state1 = ap_CS_fsm[ap_const_lv32_0];

assign ap_CS_fsm_state10 = ap_CS_fsm[ap_const_lv32_7];

assign ap_CS_fsm_state2 = ap_CS_fsm[ap_const_lv32_1];

assign ap_CS_fsm_state3 = ap_CS_fsm[ap_const_lv32_2];

assign ap_CS_fsm_state4 = ap_CS_fsm[ap_const_lv32_3];

assign ap_CS_fsm_state7 = ap_CS_fsm[ap_const_lv32_5];

always @ (*) begin
    ap_condition_488 = ((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_enable_reg_pp1_iter1) & (1'b0 == exitcond_reg_428));
end

always @ (*) begin
    ap_condition_546 = (((1'b0 == exitcond_reg_428) & (1'b0 == brmerge_reg_437) & (AXI_video_strm_V_data_V_0_vld_out == 1'b0)) | ((1'b0 == exitcond_reg_428) & (img_data_stream_0_V_full_n == 1'b0)) | ((1'b0 == exitcond_reg_428) & (img_data_stream_1_V_full_n == 1'b0)) | ((1'b0 == exitcond_reg_428) & (img_data_stream_2_V_full_n == 1'b0)));
end

assign ap_phi_precharge_reg_pp1_iter1_axi_last_V_2_reg_231 = 'bx;

assign ap_phi_precharge_reg_pp1_iter1_p_Val2_s_reg_244 = 'bx;

assign brmerge_fu_351_p2 = (sof_1_fu_100 | eol_phi_fu_201_p4);

assign exitcond2_fu_322_p2 = ((p_cast_fu_318_p1 == tmp_17_reg_389) ? 1'b1 : 1'b0);

assign exitcond_fu_337_p2 = ((p_4_cast_fu_333_p1 == tmp_18_reg_394) ? 1'b1 : 1'b0);

assign i_V_fu_327_p2 = (p_s_reg_175 + ap_const_lv9_1);

assign img_data_stream_0_V_din = p_Val2_s_phi_fu_248_p4[7:0];

assign img_data_stream_1_V_din = {{p_Val2_s_phi_fu_248_p4[ap_const_lv32_F : ap_const_lv32_8]}};

assign img_data_stream_2_V_din = {{p_Val2_s_phi_fu_248_p4[ap_const_lv32_17 : ap_const_lv32_10]}};

assign j_V_fu_342_p2 = (p_4_reg_186 + ap_const_lv10_1);

assign p_4_cast_fu_333_p1 = p_4_reg_186;

assign p_cast_fu_318_p1 = p_s_reg_175;

assign tmp_17_fu_301_p1 = img_rows_V_read[9:0];

assign tmp_18_fu_305_p1 = img_cols_V_read[10:0];

assign tmp_user_V_fu_309_p1 = AXI_video_strm_V_user_V_0_data_out;

endmodule //AXIvideo2Mat