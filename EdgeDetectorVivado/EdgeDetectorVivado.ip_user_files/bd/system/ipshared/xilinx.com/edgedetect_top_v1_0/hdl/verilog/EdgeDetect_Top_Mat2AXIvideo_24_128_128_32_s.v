// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module EdgeDetect_Top_Mat2AXIvideo_24_128_128_32_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rows,
        cols,
        img_data_stream_0_V_dout,
        img_data_stream_0_V_empty_n,
        img_data_stream_0_V_read,
        img_data_stream_1_V_dout,
        img_data_stream_1_V_empty_n,
        img_data_stream_1_V_read,
        img_data_stream_2_V_dout,
        img_data_stream_2_V_empty_n,
        img_data_stream_2_V_read,
        AXI_video_strm_V_data_V_din,
        AXI_video_strm_V_data_V_full_n,
        AXI_video_strm_V_data_V_write,
        AXI_video_strm_V_keep_V_din,
        AXI_video_strm_V_keep_V_full_n,
        AXI_video_strm_V_keep_V_write,
        AXI_video_strm_V_strb_V_din,
        AXI_video_strm_V_strb_V_full_n,
        AXI_video_strm_V_strb_V_write,
        AXI_video_strm_V_user_V_din,
        AXI_video_strm_V_user_V_full_n,
        AXI_video_strm_V_user_V_write,
        AXI_video_strm_V_last_V_din,
        AXI_video_strm_V_last_V_full_n,
        AXI_video_strm_V_last_V_write,
        AXI_video_strm_V_id_V_din,
        AXI_video_strm_V_id_V_full_n,
        AXI_video_strm_V_id_V_write,
        AXI_video_strm_V_dest_V_din,
        AXI_video_strm_V_dest_V_full_n,
        AXI_video_strm_V_dest_V_write
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 4'b1;
parameter    ap_ST_st2_fsm_1 = 4'b10;
parameter    ap_ST_pp0_stg0_fsm_2 = 4'b100;
parameter    ap_ST_st5_fsm_3 = 4'b1000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv8_0 = 8'b00000000;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv3_7 = 3'b111;
parameter    ap_const_lv3_0 = 3'b000;
parameter    ap_const_lv8_FF = 8'b11111111;
parameter    ap_const_lv8_1 = 8'b1;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [7:0] rows;
input  [7:0] cols;
input  [7:0] img_data_stream_0_V_dout;
input   img_data_stream_0_V_empty_n;
output   img_data_stream_0_V_read;
input  [7:0] img_data_stream_1_V_dout;
input   img_data_stream_1_V_empty_n;
output   img_data_stream_1_V_read;
input  [7:0] img_data_stream_2_V_dout;
input   img_data_stream_2_V_empty_n;
output   img_data_stream_2_V_read;
output  [23:0] AXI_video_strm_V_data_V_din;
input   AXI_video_strm_V_data_V_full_n;
output   AXI_video_strm_V_data_V_write;
output  [2:0] AXI_video_strm_V_keep_V_din;
input   AXI_video_strm_V_keep_V_full_n;
output   AXI_video_strm_V_keep_V_write;
output  [2:0] AXI_video_strm_V_strb_V_din;
input   AXI_video_strm_V_strb_V_full_n;
output   AXI_video_strm_V_strb_V_write;
output  [0:0] AXI_video_strm_V_user_V_din;
input   AXI_video_strm_V_user_V_full_n;
output   AXI_video_strm_V_user_V_write;
output  [0:0] AXI_video_strm_V_last_V_din;
input   AXI_video_strm_V_last_V_full_n;
output   AXI_video_strm_V_last_V_write;
output  [0:0] AXI_video_strm_V_id_V_din;
input   AXI_video_strm_V_id_V_full_n;
output   AXI_video_strm_V_id_V_write;
output  [0:0] AXI_video_strm_V_dest_V_din;
input   AXI_video_strm_V_dest_V_full_n;
output   AXI_video_strm_V_dest_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg img_data_stream_0_V_read;
reg img_data_stream_1_V_read;
reg img_data_stream_2_V_read;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm = 4'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_23;
reg   [7:0] p_1_i_reg_170;
reg    ap_sig_bdd_79;
wire   [7:0] r_V_fu_181_p2;
wire   [0:0] exitcond2_i_fu_192_p2;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_93;
wire   [7:0] i_V_fu_197_p2;
reg   [7:0] i_V_reg_265;
wire   [0:0] exitcond3_i_fu_203_p2;
reg   [0:0] exitcond3_i_reg_270;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_2;
reg    ap_sig_bdd_104;
reg    ap_reg_ppiten_pp0_it0 = 1'b0;
wire    AXI_video_strm_V_id_V1_status;
reg    ap_sig_bdd_122;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
wire   [7:0] j_V_fu_208_p2;
wire   [0:0] axi_last_V_fu_214_p2;
reg   [0:0] axi_last_V_reg_279;
reg   [7:0] p_i_reg_159;
reg    ap_sig_cseq_ST_st5_fsm_3;
reg    ap_sig_bdd_149;
reg    AXI_video_strm_V_id_V1_update;
reg   [0:0] tmp_user_V_fu_96;
reg   [3:0] ap_NS_fsm;




always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin : ap_ret_ap_done_reg
    if (ap_rst == 1'b1) begin
        ap_done_reg <= ap_const_logic_0;
    end else begin
        if ((ap_const_logic_1 == ap_continue)) begin
            ap_done_reg <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond2_i_fu_192_p2 == ap_const_lv1_0))) begin
            ap_done_reg <= ap_const_logic_1;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_ap_reg_ppiten_pp0_it0
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond3_i_fu_203_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond2_i_fu_192_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_ap_reg_ppiten_pp0_it1
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & (exitcond3_i_fu_203_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond2_i_fu_192_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond3_i_fu_203_p2 == ap_const_lv1_0)))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & (exitcond3_i_fu_203_p2 == ap_const_lv1_0))) begin
        p_1_i_reg_170 <= j_V_fu_208_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond2_i_fu_192_p2 == ap_const_lv1_0))) begin
        p_1_i_reg_170 <= ap_const_lv8_0;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_3)) begin
        p_i_reg_159 <= i_V_reg_265;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_79)) begin
        p_i_reg_159 <= ap_const_lv8_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond3_i_reg_270 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        tmp_user_V_fu_96 <= ap_const_lv1_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_79)) begin
        tmp_user_V_fu_96 <= ap_const_lv1_1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & (exitcond3_i_fu_203_p2 == ap_const_lv1_0))) begin
        axi_last_V_reg_279 <= axi_last_V_fu_214_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        exitcond3_i_reg_270 <= exitcond3_i_fu_203_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        i_V_reg_265 <= i_V_fu_197_p2;
    end
end

always @ (exitcond3_i_reg_270 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_122 or ap_reg_ppiten_pp0_it1) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond3_i_reg_270 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        AXI_video_strm_V_id_V1_update = ap_const_logic_1;
    end else begin
        AXI_video_strm_V_id_V1_update = ap_const_logic_0;
    end
end

always @ (ap_done_reg or exitcond2_i_fu_192_p2 or ap_sig_cseq_ST_st2_fsm_1) begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond2_i_fu_192_p2 == ap_const_lv1_0)))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

always @ (exitcond2_i_fu_192_p2 or ap_sig_cseq_ST_st2_fsm_1) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond2_i_fu_192_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_104) begin
    if (ap_sig_bdd_104) begin
        ap_sig_cseq_ST_pp0_stg0_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_pp0_stg0_fsm_2 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_23) begin
    if (ap_sig_bdd_23) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_93) begin
    if (ap_sig_bdd_93) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_149) begin
    if (ap_sig_bdd_149) begin
        ap_sig_cseq_ST_st5_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_3 = ap_const_logic_0;
    end
end

always @ (exitcond3_i_reg_270 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_122 or ap_reg_ppiten_pp0_it1) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond3_i_reg_270 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        img_data_stream_0_V_read = ap_const_logic_1;
    end else begin
        img_data_stream_0_V_read = ap_const_logic_0;
    end
end

always @ (exitcond3_i_reg_270 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_122 or ap_reg_ppiten_pp0_it1) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond3_i_reg_270 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        img_data_stream_1_V_read = ap_const_logic_1;
    end else begin
        img_data_stream_1_V_read = ap_const_logic_0;
    end
end

always @ (exitcond3_i_reg_270 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_122 or ap_reg_ppiten_pp0_it1) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond3_i_reg_270 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
        img_data_stream_2_V_read = ap_const_logic_1;
    end else begin
        img_data_stream_2_V_read = ap_const_logic_0;
    end
end
always @ (ap_CS_fsm or ap_sig_bdd_79 or exitcond2_i_fu_192_p2 or exitcond3_i_fu_203_p2 or ap_reg_ppiten_pp0_it0 or ap_sig_bdd_122 or ap_reg_ppiten_pp0_it1) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~ap_sig_bdd_79) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(exitcond2_i_fu_192_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_pp0_stg0_fsm_2 : 
        begin
            if (~((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond3_i_fu_203_p2 == ap_const_lv1_0))) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end else if (((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(ap_sig_bdd_122 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~(exitcond3_i_fu_203_p2 == ap_const_lv1_0))) begin
                ap_NS_fsm = ap_ST_st5_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_st5_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st2_fsm_1;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end


assign AXI_video_strm_V_data_V_din = {{{img_data_stream_2_V_dout}, {img_data_stream_1_V_dout}}, {img_data_stream_0_V_dout}};

assign AXI_video_strm_V_data_V_write = AXI_video_strm_V_id_V1_update;

assign AXI_video_strm_V_dest_V_din = ap_const_lv1_0;

assign AXI_video_strm_V_dest_V_write = AXI_video_strm_V_id_V1_update;

assign AXI_video_strm_V_id_V1_status = (AXI_video_strm_V_data_V_full_n & AXI_video_strm_V_keep_V_full_n & AXI_video_strm_V_strb_V_full_n & AXI_video_strm_V_user_V_full_n & AXI_video_strm_V_last_V_full_n & AXI_video_strm_V_id_V_full_n & AXI_video_strm_V_dest_V_full_n);

assign AXI_video_strm_V_id_V_din = ap_const_lv1_0;

assign AXI_video_strm_V_id_V_write = AXI_video_strm_V_id_V1_update;

assign AXI_video_strm_V_keep_V_din = ap_const_lv3_7;

assign AXI_video_strm_V_keep_V_write = AXI_video_strm_V_id_V1_update;

assign AXI_video_strm_V_last_V_din = axi_last_V_reg_279;

assign AXI_video_strm_V_last_V_write = AXI_video_strm_V_id_V1_update;

assign AXI_video_strm_V_strb_V_din = ap_const_lv3_0;

assign AXI_video_strm_V_strb_V_write = AXI_video_strm_V_id_V1_update;

assign AXI_video_strm_V_user_V_din = tmp_user_V_fu_96;

assign AXI_video_strm_V_user_V_write = AXI_video_strm_V_id_V1_update;


always @ (ap_CS_fsm) begin
    ap_sig_bdd_104 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end


always @ (img_data_stream_0_V_empty_n or img_data_stream_1_V_empty_n or img_data_stream_2_V_empty_n or exitcond3_i_reg_270 or AXI_video_strm_V_id_V1_status) begin
    ap_sig_bdd_122 = (((img_data_stream_0_V_empty_n == ap_const_logic_0) & (exitcond3_i_reg_270 == ap_const_lv1_0)) | ((exitcond3_i_reg_270 == ap_const_lv1_0) & (img_data_stream_1_V_empty_n == ap_const_logic_0)) | ((exitcond3_i_reg_270 == ap_const_lv1_0) & (img_data_stream_2_V_empty_n == ap_const_logic_0)) | ((exitcond3_i_reg_270 == ap_const_lv1_0) & (AXI_video_strm_V_id_V1_status == ap_const_logic_0)));
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_149 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_23 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end


always @ (ap_start or ap_done_reg) begin
    ap_sig_bdd_79 = ((ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_93 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

assign axi_last_V_fu_214_p2 = (p_1_i_reg_170 == r_V_fu_181_p2? 1'b1: 1'b0);

assign exitcond2_i_fu_192_p2 = (p_i_reg_159 == rows? 1'b1: 1'b0);

assign exitcond3_i_fu_203_p2 = (p_1_i_reg_170 == cols? 1'b1: 1'b0);

assign i_V_fu_197_p2 = (p_i_reg_159 + ap_const_lv8_1);

assign j_V_fu_208_p2 = (p_1_i_reg_170 + ap_const_lv8_1);

assign r_V_fu_181_p2 = ($signed(cols) + $signed(ap_const_lv8_FF));


endmodule //EdgeDetect_Top_Mat2AXIvideo_24_128_128_32_s

