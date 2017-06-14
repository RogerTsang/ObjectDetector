// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module EdgeDetect_Top_CvtColor (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rows,
        cols,
        p_src_data_stream_0_V_dout,
        p_src_data_stream_0_V_empty_n,
        p_src_data_stream_0_V_read,
        p_src_data_stream_1_V_dout,
        p_src_data_stream_1_V_empty_n,
        p_src_data_stream_1_V_read,
        p_src_data_stream_2_V_dout,
        p_src_data_stream_2_V_empty_n,
        p_src_data_stream_2_V_read,
        p_dst_data_stream_V_din,
        p_dst_data_stream_V_full_n,
        p_dst_data_stream_V_write
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 4'b1;
parameter    ap_ST_st2_fsm_1 = 4'b10;
parameter    ap_ST_pp0_stg0_fsm_2 = 4'b100;
parameter    ap_ST_st6_fsm_3 = 4'b1000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv8_0 = 8'b00000000;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv8_1 = 8'b1;
parameter    ap_const_lv32_16 = 32'b10110;
parameter    ap_const_lv32_1D = 32'b11101;
parameter    ap_const_lv32_15 = 32'b10101;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv8_FF = 8'b11111111;
parameter    ap_const_lv29_1322D0 = 29'b100110010001011010000;
parameter    ap_const_lv30_259168 = 30'b1001011001000101101000;
parameter    ap_const_lv28_74BC6 = 28'b1110100101111000110;
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
input  [7:0] p_src_data_stream_0_V_dout;
input   p_src_data_stream_0_V_empty_n;
output   p_src_data_stream_0_V_read;
input  [7:0] p_src_data_stream_1_V_dout;
input   p_src_data_stream_1_V_empty_n;
output   p_src_data_stream_1_V_read;
input  [7:0] p_src_data_stream_2_V_dout;
input   p_src_data_stream_2_V_empty_n;
output   p_src_data_stream_2_V_read;
output  [7:0] p_dst_data_stream_V_din;
input   p_dst_data_stream_V_full_n;
output   p_dst_data_stream_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg p_src_data_stream_0_V_read;
reg p_src_data_stream_1_V_read;
reg p_src_data_stream_2_V_read;
reg p_dst_data_stream_V_write;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm = 4'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_23;
reg   [7:0] j_i_reg_140;
reg    ap_sig_bdd_55;
wire   [0:0] exitcond2_i_fu_151_p2;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_67;
wire   [7:0] i_fu_156_p2;
reg   [7:0] i_reg_287;
wire   [0:0] exitcond_i_fu_162_p2;
reg   [0:0] exitcond_i_reg_292;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_2;
reg    ap_sig_bdd_78;
reg    ap_reg_ppiten_pp0_it0 = 1'b0;
reg    ap_sig_bdd_92;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
reg   [0:0] ap_reg_ppstg_exitcond_i_reg_292_pp0_it1;
reg    ap_sig_bdd_100;
reg    ap_reg_ppiten_pp0_it2 = 1'b0;
wire   [7:0] j_fu_167_p2;
reg   [7:0] p_Val2_6_reg_301;
reg   [0:0] tmp_reg_306;
reg   [0:0] tmp_85_reg_311;
reg   [7:0] i_i_reg_129;
reg    ap_sig_cseq_ST_st6_fsm_3;
reg    ap_sig_bdd_134;
wire   [28:0] grp_fu_264_p3;
wire   [29:0] grp_fu_253_p3;
wire   [7:0] tmp_3_i_i_i_i_fu_211_p1;
wire   [7:0] p_Val2_7_fu_214_p2;
wire   [0:0] tmp_86_fu_219_p3;
wire   [0:0] p_Result_2_i_i_i_i_not_fu_227_p2;
wire   [0:0] not_carry_fu_232_p2;
wire   [7:0] r_V_i_i_fu_247_p0;
wire   [21:0] r_V_i_i_fu_247_p1;
wire   [7:0] grp_fu_253_p0;
wire   [22:0] grp_fu_253_p1;
wire   [28:0] grp_fu_253_p2;
wire   [7:0] grp_fu_264_p0;
wire   [19:0] grp_fu_264_p1;
wire   [28:0] r_V_i_i_fu_247_p2;
reg   [3:0] ap_NS_fsm;
wire   [29:0] grp_fu_253_p00;
wire   [29:0] grp_fu_253_p20;
wire   [27:0] grp_fu_264_p00;
wire   [28:0] r_V_i_i_fu_247_p00;


EdgeDetect_Top_mul_mul_8ns_22ns_29_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 29 ))
EdgeDetect_Top_mul_mul_8ns_22ns_29_1_U55(
    .din0( r_V_i_i_fu_247_p0 ),
    .din1( r_V_i_i_fu_247_p1 ),
    .dout( r_V_i_i_fu_247_p2 )
);

EdgeDetect_Top_mac_muladd_8ns_23ns_29ns_30_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 23 ),
    .din2_WIDTH( 29 ),
    .dout_WIDTH( 30 ))
EdgeDetect_Top_mac_muladd_8ns_23ns_29ns_30_1_U56(
    .din0( grp_fu_253_p0 ),
    .din1( grp_fu_253_p1 ),
    .din2( grp_fu_253_p2 ),
    .dout( grp_fu_253_p3 )
);

EdgeDetect_Top_mac_muladd_8ns_20ns_29ns_29_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 20 ),
    .din2_WIDTH( 29 ),
    .dout_WIDTH( 29 ))
EdgeDetect_Top_mac_muladd_8ns_20ns_29ns_29_1_U57(
    .din0( grp_fu_264_p0 ),
    .din1( grp_fu_264_p1 ),
    .din2( r_V_i_i_fu_247_p2 ),
    .dout( grp_fu_264_p3 )
);



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
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond2_i_fu_151_p2 == ap_const_lv1_0))) begin
            ap_done_reg <= ap_const_logic_1;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_ap_reg_ppiten_pp0_it0
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(exitcond_i_fu_162_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond2_i_fu_151_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_ap_reg_ppiten_pp0_it1
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (exitcond_i_fu_162_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond2_i_fu_151_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(exitcond_i_fu_162_p2 == ap_const_lv1_0)))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_ap_reg_ppiten_pp0_it2
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
    end else begin
        if (~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
            ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond2_i_fu_151_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_3)) begin
        i_i_reg_129 <= i_reg_287;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_55)) begin
        i_i_reg_129 <= ap_const_lv8_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (exitcond_i_fu_162_p2 == ap_const_lv1_0))) begin
        j_i_reg_140 <= j_fu_167_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond2_i_fu_151_p2 == ap_const_lv1_0))) begin
        j_i_reg_140 <= ap_const_lv8_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        ap_reg_ppstg_exitcond_i_reg_292_pp0_it1 <= exitcond_i_reg_292;
        exitcond_i_reg_292 <= exitcond_i_fu_162_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        i_reg_287 <= i_fu_156_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_i_reg_292 == ap_const_lv1_0) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_Val2_6_reg_301 <= {{grp_fu_253_p3[ap_const_lv32_1D : ap_const_lv32_16]}};
        tmp_85_reg_311 <= grp_fu_253_p3[ap_const_lv32_1D];
        tmp_reg_306 <= grp_fu_253_p3[ap_const_lv32_15];
    end
end

always @ (ap_done_reg or exitcond2_i_fu_151_p2 or ap_sig_cseq_ST_st2_fsm_1) begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond2_i_fu_151_p2 == ap_const_lv1_0)))) begin
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

always @ (exitcond2_i_fu_151_p2 or ap_sig_cseq_ST_st2_fsm_1) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond2_i_fu_151_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_78) begin
    if (ap_sig_bdd_78) begin
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

always @ (ap_sig_bdd_67) begin
    if (ap_sig_bdd_67) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_134) begin
    if (ap_sig_bdd_134) begin
        ap_sig_cseq_ST_st6_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_3 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_92 or ap_reg_ppiten_pp0_it1 or ap_reg_ppstg_exitcond_i_reg_292_pp0_it1 or ap_sig_bdd_100 or ap_reg_ppiten_pp0_it2) begin
    if (((ap_const_lv1_0 == ap_reg_ppstg_exitcond_i_reg_292_pp0_it1) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_dst_data_stream_V_write = ap_const_logic_1;
    end else begin
        p_dst_data_stream_V_write = ap_const_logic_0;
    end
end

always @ (exitcond_i_reg_292 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_92 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_100 or ap_reg_ppiten_pp0_it2) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_i_reg_292 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_src_data_stream_0_V_read = ap_const_logic_1;
    end else begin
        p_src_data_stream_0_V_read = ap_const_logic_0;
    end
end

always @ (exitcond_i_reg_292 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_92 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_100 or ap_reg_ppiten_pp0_it2) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_i_reg_292 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_src_data_stream_1_V_read = ap_const_logic_1;
    end else begin
        p_src_data_stream_1_V_read = ap_const_logic_0;
    end
end

always @ (exitcond_i_reg_292 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_92 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_100 or ap_reg_ppiten_pp0_it2) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (exitcond_i_reg_292 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        p_src_data_stream_2_V_read = ap_const_logic_1;
    end else begin
        p_src_data_stream_2_V_read = ap_const_logic_0;
    end
end
always @ (ap_CS_fsm or ap_sig_bdd_55 or exitcond2_i_fu_151_p2 or exitcond_i_fu_162_p2 or ap_reg_ppiten_pp0_it0 or ap_sig_bdd_92 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_100 or ap_reg_ppiten_pp0_it2) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~ap_sig_bdd_55) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(exitcond2_i_fu_151_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_pp0_stg0_fsm_2 : 
        begin
            if ((~((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) & ~((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(exitcond_i_fu_162_p2 == ap_const_lv1_0) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end else if ((((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_92 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)) | (ap_sig_bdd_100 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(exitcond_i_fu_162_p2 == ap_const_lv1_0) & ~(ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) begin
                ap_NS_fsm = ap_ST_st6_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_st6_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st2_fsm_1;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end



always @ (p_dst_data_stream_V_full_n or ap_reg_ppstg_exitcond_i_reg_292_pp0_it1) begin
    ap_sig_bdd_100 = ((p_dst_data_stream_V_full_n == ap_const_logic_0) & (ap_const_lv1_0 == ap_reg_ppstg_exitcond_i_reg_292_pp0_it1));
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_134 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_23 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end


always @ (ap_start or ap_done_reg) begin
    ap_sig_bdd_55 = ((ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_67 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_78 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end


always @ (p_src_data_stream_0_V_empty_n or p_src_data_stream_1_V_empty_n or p_src_data_stream_2_V_empty_n or exitcond_i_reg_292) begin
    ap_sig_bdd_92 = (((p_src_data_stream_0_V_empty_n == ap_const_logic_0) & (exitcond_i_reg_292 == ap_const_lv1_0)) | ((exitcond_i_reg_292 == ap_const_lv1_0) & (p_src_data_stream_1_V_empty_n == ap_const_logic_0)) | ((exitcond_i_reg_292 == ap_const_lv1_0) & (p_src_data_stream_2_V_empty_n == ap_const_logic_0)));
end

assign exitcond2_i_fu_151_p2 = (i_i_reg_129 == rows? 1'b1: 1'b0);

assign exitcond_i_fu_162_p2 = (j_i_reg_140 == cols? 1'b1: 1'b0);

assign grp_fu_253_p0 = grp_fu_253_p00;

assign grp_fu_253_p00 = p_src_data_stream_1_V_dout;

assign grp_fu_253_p1 = ap_const_lv30_259168;

assign grp_fu_253_p2 = grp_fu_253_p20;

assign grp_fu_253_p20 = grp_fu_264_p3;

assign grp_fu_264_p0 = grp_fu_264_p00;

assign grp_fu_264_p00 = p_src_data_stream_2_V_dout;

assign grp_fu_264_p1 = ap_const_lv28_74BC6;

assign i_fu_156_p2 = (i_i_reg_129 + ap_const_lv8_1);

assign j_fu_167_p2 = (j_i_reg_140 + ap_const_lv8_1);

assign not_carry_fu_232_p2 = (tmp_86_fu_219_p3 | p_Result_2_i_i_i_i_not_fu_227_p2);

assign p_Result_2_i_i_i_i_not_fu_227_p2 = (tmp_85_reg_311 ^ ap_const_lv1_1);

assign p_Val2_7_fu_214_p2 = (p_Val2_6_reg_301 + tmp_3_i_i_i_i_fu_211_p1);

assign p_dst_data_stream_V_din = ((not_carry_fu_232_p2[0:0] === 1'b1) ? p_Val2_7_fu_214_p2 : ap_const_lv8_FF);

assign r_V_i_i_fu_247_p0 = r_V_i_i_fu_247_p00;

assign r_V_i_i_fu_247_p00 = p_src_data_stream_0_V_dout;

assign r_V_i_i_fu_247_p1 = ap_const_lv29_1322D0;

assign tmp_3_i_i_i_i_fu_211_p1 = tmp_reg_306;

assign tmp_86_fu_219_p3 = p_Val2_7_fu_214_p2[ap_const_lv32_7];


endmodule //EdgeDetect_Top_CvtColor
