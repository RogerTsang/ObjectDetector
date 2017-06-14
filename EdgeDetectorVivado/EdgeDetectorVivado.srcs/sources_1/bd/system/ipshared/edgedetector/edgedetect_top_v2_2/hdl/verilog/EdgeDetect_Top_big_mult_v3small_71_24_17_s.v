// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module EdgeDetect_Top_big_mult_v3small_71_24_17_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a_V,
        b_V,
        ap_return
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 12'b1;
parameter    ap_ST_st2_fsm_1 = 12'b10;
parameter    ap_ST_st3_fsm_2 = 12'b100;
parameter    ap_ST_st4_fsm_3 = 12'b1000;
parameter    ap_ST_st5_fsm_4 = 12'b10000;
parameter    ap_ST_st6_fsm_5 = 12'b100000;
parameter    ap_ST_st7_fsm_6 = 12'b1000000;
parameter    ap_ST_st8_fsm_7 = 12'b10000000;
parameter    ap_ST_st9_fsm_8 = 12'b100000000;
parameter    ap_ST_st10_fsm_9 = 12'b1000000000;
parameter    ap_ST_st11_fsm_10 = 12'b10000000000;
parameter    ap_ST_st12_fsm_11 = 12'b100000000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv32_9 = 32'b1001;
parameter    ap_const_lv32_A = 32'b1010;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv3_0 = 3'b000;
parameter    ap_const_lv3_1 = 3'b1;
parameter    ap_const_lv32_6 = 32'b110;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv64_0 = 64'b0000000000000000000000000000000000000000000000000000000000000000;
parameter    ap_const_lv64_4 = 64'b100;
parameter    ap_const_lv3_5 = 3'b101;
parameter    ap_const_lv3_4 = 3'b100;
parameter    ap_const_lv7_10 = 7'b10000;
parameter    ap_const_lv7_46 = 7'b1000110;
parameter    ap_const_lv32_46 = 32'b1000110;
parameter    ap_const_lv71_7FFFFFFFFFFFFFFFFF = 71'b11111111111111111111111111111111111111111111111111111111111111111111111;
parameter    ap_const_lv3_7 = 3'b111;
parameter    ap_const_lv32_11 = 32'b10001;
parameter    ap_const_lv32_28 = 32'b101000;
parameter    ap_const_lv7_5E = 7'b1011110;
parameter    ap_const_lv32_5E = 32'b1011110;
parameter    ap_const_lv95_7FFFFFFFFFFFFFFFFFFFFFFF = 95'b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
parameter    ap_const_lv32_B = 32'b1011;
parameter    ap_const_lv32_44 = 32'b1000100;
parameter    ap_const_lv95_0 = 95'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [70:0] a_V;
input  [23:0] b_V;
output  [94:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[94:0] ap_return;
(* fsm_encoding = "none" *) reg   [11:0] ap_CS_fsm = 12'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_30;
wire   [40:0] tmp_fu_200_p1;
reg   [40:0] tmp_reg_610;
wire   [2:0] i_4_fu_210_p2;
reg   [2:0] i_4_reg_618;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_52;
wire   [6:0] tmp_58_fu_297_p3;
reg   [6:0] tmp_58_reg_623;
wire   [0:0] exitcond3_fu_204_p2;
wire   [70:0] tmp_64_fu_324_p2;
reg   [70:0] tmp_64_reg_628;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_bdd_73;
wire   [63:0] tmp_42_fu_371_p1;
reg   [63:0] tmp_42_reg_646;
reg    ap_sig_cseq_ST_st8_fsm_7;
reg    ap_sig_bdd_82;
wire   [0:0] exitcond4_fu_365_p2;
wire   [2:0] i_3_fu_387_p2;
reg   [2:0] i_3_reg_661;
wire   [2:0] tmp_41_fu_420_p2;
reg   [2:0] tmp_41_reg_669;
reg    ap_sig_cseq_ST_st10_fsm_9;
reg    ap_sig_bdd_100;
wire   [5:0] Li_fu_430_p4;
reg   [5:0] Li_reg_674;
wire   [0:0] exitcond_fu_414_p2;
wire   [6:0] Ui_1_fu_448_p2;
reg   [6:0] Ui_1_reg_679;
wire   [0:0] tmp_71_fu_463_p2;
reg   [0:0] tmp_71_reg_690;
wire   [94:0] p_Result_28_fu_582_p2;
reg    ap_sig_cseq_ST_st11_fsm_10;
reg    ap_sig_bdd_124;
reg   [2:0] pp_V_address0;
reg    pp_V_ce0;
reg    pp_V_we0;
wire   [40:0] pp_V_d0;
wire   [40:0] pp_V_q0;
reg   [2:0] pps_V_address0;
reg    pps_V_ce0;
reg    pps_V_we0;
reg   [40:0] pps_V_d0;
wire   [40:0] pps_V_q0;
reg   [2:0] i_reg_154;
reg    ap_sig_cseq_ST_st6_fsm_5;
reg    ap_sig_bdd_152;
reg   [2:0] i_1_reg_166;
reg    ap_sig_cseq_ST_st7_fsm_6;
reg    ap_sig_bdd_163;
reg    ap_sig_cseq_ST_st9_fsm_8;
reg    ap_sig_bdd_170;
reg   [94:0] p_Val2_s_reg_177;
reg   [2:0] i_2_reg_189;
wire   [63:0] tmp_39_fu_360_p1;
wire   [63:0] tmp_44_fu_382_p1;
wire   [63:0] tmp_46_fu_458_p1;
wire   [40:0] grp_fu_354_p2;
wire   [40:0] tmp_45_fu_407_p2;
wire   [1:0] tmp_52_fu_222_p1;
wire   [5:0] tmp_37_fu_226_p4;
wire   [6:0] tmp_101_cast_fu_236_p1;
wire   [0:0] tmp_s_fu_216_p2;
wire   [6:0] tmp_38_fu_240_p2;
wire   [6:0] Lo_assign_fu_254_p4;
wire   [6:0] Ui_fu_246_p3;
wire   [0:0] tmp_53_fu_264_p2;
wire   [6:0] tmp_55_fu_279_p2;
wire   [6:0] tmp_57_fu_291_p2;
reg   [70:0] tmp_54_fu_270_p4;
wire   [6:0] tmp_56_fu_285_p2;
wire   [6:0] tmp_60_fu_312_p3;
wire   [70:0] tmp_59_fu_305_p3;
wire   [70:0] tmp_62_fu_320_p1;
wire   [6:0] tmp_61_fu_330_p2;
wire   [70:0] tmp_63_fu_335_p1;
wire   [70:0] tmp_65_fu_339_p2;
wire   [70:0] p_Result_29_fu_345_p2;
wire  signed [40:0] grp_fu_354_p0;
wire   [23:0] grp_fu_354_p1;
wire   [2:0] tmp_43_fu_376_p2;
wire   [23:0] r_V_fu_393_p4;
wire   [40:0] r_V_4_fu_403_p1;
wire   [1:0] tmp_69_fu_426_p1;
wire   [6:0] Li_cast1_fu_440_p1;
wire   [31:0] Li_cast_fu_444_p1;
wire   [31:0] Ui_2_cast_fu_454_p1;
wire   [16:0] tmp_70_fu_469_p1;
wire   [6:0] tmp_72_fu_477_p1;
wire   [6:0] tmp_73_fu_480_p2;
wire   [6:0] tmp_74_fu_486_p3;
wire   [6:0] tmp_76_fu_498_p3;
wire   [6:0] tmp_75_fu_492_p3;
wire   [6:0] tmp_77_fu_505_p2;
wire   [94:0] loc_V_fu_473_p1;
wire   [94:0] tmp_78_fu_511_p1;
wire   [94:0] tmp_81_fu_523_p2;
reg   [94:0] tmp_82_fu_529_p4;
wire   [94:0] tmp_79_fu_515_p1;
wire   [94:0] tmp_80_fu_519_p1;
wire   [94:0] tmp_84_fu_546_p2;
wire   [94:0] tmp_85_fu_552_p2;
wire   [94:0] p_demorgan_fu_558_p2;
wire   [94:0] tmp_86_fu_564_p2;
wire   [94:0] tmp_83_fu_539_p3;
wire   [94:0] tmp_87_fu_570_p2;
wire   [94:0] tmp_88_fu_576_p2;
reg    ap_sig_cseq_ST_st12_fsm_11;
reg    ap_sig_bdd_386;
wire   [26:0] tmp_68_fu_588_p1;
wire    grp_fu_354_ce;
wire   [94:0] p_Result_s_fu_592_p5;
reg   [94:0] ap_return_preg = 95'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
reg   [11:0] ap_NS_fsm;


EdgeDetect_Top_big_mult_v3small_71_24_17_s_pp_V #(
    .DataWidth( 41 ),
    .AddressRange( 5 ),
    .AddressWidth( 3 ))
pp_V_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .address0( pp_V_address0 ),
    .ce0( pp_V_ce0 ),
    .we0( pp_V_we0 ),
    .d0( pp_V_d0 ),
    .q0( pp_V_q0 )
);

EdgeDetect_Top_big_mult_v3small_71_24_17_s_pp_V #(
    .DataWidth( 41 ),
    .AddressRange( 5 ),
    .AddressWidth( 3 ))
pps_V_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .address0( pps_V_address0 ),
    .ce0( pps_V_ce0 ),
    .we0( pps_V_we0 ),
    .d0( pps_V_d0 ),
    .q0( pps_V_q0 )
);

EdgeDetect_Top_mul_41s_24ns_41_4 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 41 ),
    .din1_WIDTH( 24 ),
    .dout_WIDTH( 41 ))
EdgeDetect_Top_mul_41s_24ns_41_4_U86(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .din0( grp_fu_354_p0 ),
    .din1( grp_fu_354_p1 ),
    .ce( grp_fu_354_ce ),
    .dout( grp_fu_354_p2 )
);



always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin : ap_ret_ap_return_preg
    if (ap_rst == 1'b1) begin
        ap_return_preg <= ap_const_lv95_0;
    end else begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st12_fsm_11)) begin
            ap_return_preg <= p_Result_s_fu_592_p5;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st9_fsm_8)) begin
        i_1_reg_166 <= i_3_reg_661;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        i_1_reg_166 <= ap_const_lv3_1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7) & ~(ap_const_lv1_0 == exitcond4_fu_365_p2))) begin
        i_2_reg_189 <= ap_const_lv3_0;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st11_fsm_10)) begin
        i_2_reg_189 <= tmp_41_reg_669;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        i_reg_154 <= ap_const_lv3_0;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        i_reg_154 <= i_4_reg_618;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st10_fsm_9) & (ap_const_lv1_0 == exitcond_fu_414_p2))) begin
        Li_reg_674[2 : 0] <= Li_fu_430_p4[2 : 0];Li_reg_674[5 : 4] <= Li_fu_430_p4[5 : 4];
        Ui_1_reg_679 <= Ui_1_fu_448_p2;
        tmp_71_reg_690 <= tmp_71_fu_463_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7) & (ap_const_lv1_0 == exitcond4_fu_365_p2))) begin
        i_3_reg_661 <= i_3_fu_387_p2;
        tmp_42_reg_646[2 : 0] <= tmp_42_fu_371_p1[2 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        i_4_reg_618 <= i_4_fu_210_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st11_fsm_10)) begin
        p_Val2_s_reg_177 <= p_Result_28_fu_582_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        tmp_41_reg_669 <= tmp_41_fu_420_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond3_fu_204_p2 == ap_const_lv1_0))) begin
        tmp_58_reg_623 <= tmp_58_fu_297_p3;
        tmp_64_reg_628 <= tmp_64_fu_324_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        tmp_reg_610[23 : 0] <= tmp_fu_200_p1[23 : 0];
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0 or ap_sig_cseq_ST_st12_fsm_11) begin
    if (((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) | (ap_const_logic_1 == ap_sig_cseq_ST_st12_fsm_11))) begin
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

always @ (ap_sig_cseq_ST_st12_fsm_11) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st12_fsm_11)) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st12_fsm_11 or p_Result_s_fu_592_p5 or ap_return_preg) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st12_fsm_11)) begin
        ap_return = p_Result_s_fu_592_p5;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (ap_sig_bdd_100) begin
    if (ap_sig_bdd_100) begin
        ap_sig_cseq_ST_st10_fsm_9 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st10_fsm_9 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_124) begin
    if (ap_sig_bdd_124) begin
        ap_sig_cseq_ST_st11_fsm_10 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st11_fsm_10 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_386) begin
    if (ap_sig_bdd_386) begin
        ap_sig_cseq_ST_st12_fsm_11 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st12_fsm_11 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_30) begin
    if (ap_sig_bdd_30) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_52) begin
    if (ap_sig_bdd_52) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_73) begin
    if (ap_sig_bdd_73) begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_152) begin
    if (ap_sig_bdd_152) begin
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_163) begin
    if (ap_sig_bdd_163) begin
        ap_sig_cseq_ST_st7_fsm_6 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st7_fsm_6 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_82) begin
    if (ap_sig_bdd_82) begin
        ap_sig_cseq_ST_st8_fsm_7 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st8_fsm_7 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_170) begin
    if (ap_sig_bdd_170) begin
        ap_sig_cseq_ST_st9_fsm_8 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st9_fsm_8 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st2_fsm_1 or tmp_42_fu_371_p1 or ap_sig_cseq_ST_st8_fsm_7 or ap_sig_cseq_ST_st6_fsm_5 or tmp_39_fu_360_p1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        pp_V_address0 = tmp_39_fu_360_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        pp_V_address0 = tmp_42_fu_371_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        pp_V_address0 = ap_const_lv64_0;
    end else begin
        pp_V_address0 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st2_fsm_1 or ap_sig_cseq_ST_st8_fsm_7 or ap_sig_cseq_ST_st6_fsm_5) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) | (ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7) | (ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5))) begin
        pp_V_ce0 = ap_const_logic_1;
    end else begin
        pp_V_ce0 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st6_fsm_5) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        pp_V_we0 = ap_const_logic_1;
    end else begin
        pp_V_we0 = ap_const_logic_0;
    end
end

always @ (tmp_42_reg_646 or ap_sig_cseq_ST_st8_fsm_7 or ap_sig_cseq_ST_st10_fsm_9 or exitcond_fu_414_p2 or ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st9_fsm_8 or tmp_44_fu_382_p1 or tmp_46_fu_458_p1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st9_fsm_8)) begin
        pps_V_address0 = tmp_42_reg_646;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        pps_V_address0 = ap_const_lv64_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st10_fsm_9) & ~(ap_const_lv1_0 == exitcond_fu_414_p2))) begin
        pps_V_address0 = ap_const_lv64_4;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st10_fsm_9) & (ap_const_lv1_0 == exitcond_fu_414_p2))) begin
        pps_V_address0 = tmp_46_fu_458_p1;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        pps_V_address0 = tmp_44_fu_382_p1;
    end else begin
        pps_V_address0 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st8_fsm_7 or ap_sig_cseq_ST_st10_fsm_9 or exitcond_fu_414_p2 or ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st9_fsm_8) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7) | ((ap_const_logic_1 == ap_sig_cseq_ST_st10_fsm_9) & (ap_const_lv1_0 == exitcond_fu_414_p2)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st10_fsm_9) & ~(ap_const_lv1_0 == exitcond_fu_414_p2)) | (ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6) | (ap_const_logic_1 == ap_sig_cseq_ST_st9_fsm_8))) begin
        pps_V_ce0 = ap_const_logic_1;
    end else begin
        pps_V_ce0 = ap_const_logic_0;
    end
end

always @ (pp_V_q0 or ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st9_fsm_8 or tmp_45_fu_407_p2) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st9_fsm_8)) begin
        pps_V_d0 = tmp_45_fu_407_p2;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        pps_V_d0 = pp_V_q0;
    end else begin
        pps_V_d0 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st7_fsm_6 or ap_sig_cseq_ST_st9_fsm_8) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st7_fsm_6) | (ap_const_logic_1 == ap_sig_cseq_ST_st9_fsm_8))) begin
        pps_V_we0 = ap_const_logic_1;
    end else begin
        pps_V_we0 = ap_const_logic_0;
    end
end
always @ (ap_start or ap_CS_fsm or exitcond3_fu_204_p2 or exitcond4_fu_365_p2 or exitcond_fu_414_p2) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(ap_start == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(exitcond3_fu_204_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st7_fsm_6;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : 
        begin
            ap_NS_fsm = ap_ST_st4_fsm_3;
        end
        ap_ST_st4_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        ap_ST_st5_fsm_4 : 
        begin
            ap_NS_fsm = ap_ST_st6_fsm_5;
        end
        ap_ST_st6_fsm_5 : 
        begin
            ap_NS_fsm = ap_ST_st2_fsm_1;
        end
        ap_ST_st7_fsm_6 : 
        begin
            ap_NS_fsm = ap_ST_st8_fsm_7;
        end
        ap_ST_st8_fsm_7 : 
        begin
            if (~(ap_const_lv1_0 == exitcond4_fu_365_p2)) begin
                ap_NS_fsm = ap_ST_st10_fsm_9;
            end else begin
                ap_NS_fsm = ap_ST_st9_fsm_8;
            end
        end
        ap_ST_st9_fsm_8 : 
        begin
            ap_NS_fsm = ap_ST_st8_fsm_7;
        end
        ap_ST_st10_fsm_9 : 
        begin
            if (~(ap_const_lv1_0 == exitcond_fu_414_p2)) begin
                ap_NS_fsm = ap_ST_st12_fsm_11;
            end else begin
                ap_NS_fsm = ap_ST_st11_fsm_10;
            end
        end
        ap_ST_st11_fsm_10 : 
        begin
            ap_NS_fsm = ap_ST_st10_fsm_9;
        end
        ap_ST_st12_fsm_11 : 
        begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end


assign Li_cast1_fu_440_p1 = Li_fu_430_p4;

assign Li_cast_fu_444_p1 = Li_fu_430_p4;

assign Li_fu_430_p4 = {{{tmp_69_fu_426_p1}, {ap_const_lv1_0}}, {i_2_reg_189}};

assign Lo_assign_fu_254_p4 = {{{i_reg_154}, {ap_const_lv1_0}}, {i_reg_154}};

assign Ui_1_fu_448_p2 = (ap_const_lv7_10 + Li_cast1_fu_440_p1);

assign Ui_2_cast_fu_454_p1 = Ui_1_fu_448_p2;

assign Ui_fu_246_p3 = ((tmp_s_fu_216_p2[0:0] === 1'b1) ? ap_const_lv7_46 : tmp_38_fu_240_p2);


always @ (ap_CS_fsm) begin
    ap_sig_bdd_100 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_9]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_124 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_A]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_152 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_5]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_163 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_6]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_170 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_8]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_30 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_386 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_B]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_52 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_73 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_82 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_7]);
end

assign exitcond3_fu_204_p2 = (i_reg_154 == ap_const_lv3_5? 1'b1: 1'b0);

assign exitcond4_fu_365_p2 = (i_1_reg_166 == ap_const_lv3_5? 1'b1: 1'b0);

assign exitcond_fu_414_p2 = (i_2_reg_189 == ap_const_lv3_4? 1'b1: 1'b0);

assign grp_fu_354_ce = ap_const_logic_1;

assign grp_fu_354_p0 = p_Result_29_fu_345_p2[40:0];

assign grp_fu_354_p1 = tmp_reg_610;

assign i_3_fu_387_p2 = (i_1_reg_166 + ap_const_lv3_1);

assign i_4_fu_210_p2 = (i_reg_154 + ap_const_lv3_1);

assign loc_V_fu_473_p1 = tmp_70_fu_469_p1;

assign p_Result_28_fu_582_p2 = (tmp_87_fu_570_p2 | tmp_88_fu_576_p2);

assign p_Result_29_fu_345_p2 = (tmp_64_reg_628 & tmp_65_fu_339_p2);

assign p_Result_s_fu_592_p5 = {{tmp_68_fu_588_p1}, {p_Val2_s_reg_177[32'd67 : 32'd0]}};

assign p_demorgan_fu_558_p2 = (tmp_84_fu_546_p2 & tmp_85_fu_552_p2);

assign pp_V_d0 = grp_fu_354_p2;

assign r_V_4_fu_403_p1 = r_V_fu_393_p4;

assign r_V_fu_393_p4 = {{pps_V_q0[ap_const_lv32_28 : ap_const_lv32_11]}};

assign tmp_101_cast_fu_236_p1 = tmp_37_fu_226_p4;

assign tmp_37_fu_226_p4 = {{{tmp_52_fu_222_p1}, {ap_const_lv1_0}}, {i_reg_154}};

assign tmp_38_fu_240_p2 = (ap_const_lv7_10 + tmp_101_cast_fu_236_p1);

assign tmp_39_fu_360_p1 = i_reg_154;

assign tmp_41_fu_420_p2 = (i_2_reg_189 + ap_const_lv3_1);

assign tmp_42_fu_371_p1 = i_1_reg_166;

assign tmp_43_fu_376_p2 = ($signed(i_1_reg_166) + $signed(ap_const_lv3_7));

assign tmp_44_fu_382_p1 = tmp_43_fu_376_p2;

assign tmp_45_fu_407_p2 = (pp_V_q0 + r_V_4_fu_403_p1);

assign tmp_46_fu_458_p1 = i_2_reg_189;

assign tmp_52_fu_222_p1 = i_reg_154[1:0];

assign tmp_53_fu_264_p2 = (Lo_assign_fu_254_p4 > Ui_fu_246_p3? 1'b1: 1'b0);


integer ap_tvar_int_0;

always @ (a_V) begin
    for (ap_tvar_int_0 = 71 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > ap_const_lv32_46 - ap_const_lv32_0) begin
            tmp_54_fu_270_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_54_fu_270_p4[ap_tvar_int_0] = a_V[ap_const_lv32_46 - ap_tvar_int_0];
        end
    end
end



assign tmp_55_fu_279_p2 = (Lo_assign_fu_254_p4 - Ui_fu_246_p3);

assign tmp_56_fu_285_p2 = ($signed(ap_const_lv7_46) - $signed(Lo_assign_fu_254_p4));

assign tmp_57_fu_291_p2 = (Ui_fu_246_p3 - Lo_assign_fu_254_p4);

assign tmp_58_fu_297_p3 = ((tmp_53_fu_264_p2[0:0] === 1'b1) ? tmp_55_fu_279_p2 : tmp_57_fu_291_p2);

assign tmp_59_fu_305_p3 = ((tmp_53_fu_264_p2[0:0] === 1'b1) ? tmp_54_fu_270_p4 : a_V);

assign tmp_60_fu_312_p3 = ((tmp_53_fu_264_p2[0:0] === 1'b1) ? tmp_56_fu_285_p2 : Lo_assign_fu_254_p4);

assign tmp_61_fu_330_p2 = ($signed(ap_const_lv7_46) - $signed(tmp_58_reg_623));

assign tmp_62_fu_320_p1 = tmp_60_fu_312_p3;

assign tmp_63_fu_335_p1 = tmp_61_fu_330_p2;

assign tmp_64_fu_324_p2 = tmp_59_fu_305_p3 >> tmp_62_fu_320_p1;

assign tmp_65_fu_339_p2 = ap_const_lv71_7FFFFFFFFFFFFFFFFF >> tmp_63_fu_335_p1;

assign tmp_68_fu_588_p1 = pps_V_q0[26:0];

assign tmp_69_fu_426_p1 = i_2_reg_189[1:0];

assign tmp_70_fu_469_p1 = pps_V_q0[16:0];

assign tmp_71_fu_463_p2 = (Li_cast_fu_444_p1 > Ui_2_cast_fu_454_p1? 1'b1: 1'b0);

assign tmp_72_fu_477_p1 = Li_reg_674;

assign tmp_73_fu_480_p2 = ($signed(ap_const_lv7_5E) - $signed(tmp_72_fu_477_p1));

assign tmp_74_fu_486_p3 = ((tmp_71_reg_690[0:0] === 1'b1) ? tmp_72_fu_477_p1 : Ui_1_reg_679);

assign tmp_75_fu_492_p3 = ((tmp_71_reg_690[0:0] === 1'b1) ? Ui_1_reg_679 : tmp_72_fu_477_p1);

assign tmp_76_fu_498_p3 = ((tmp_71_reg_690[0:0] === 1'b1) ? tmp_73_fu_480_p2 : tmp_72_fu_477_p1);

assign tmp_77_fu_505_p2 = ($signed(ap_const_lv7_5E) - $signed(tmp_74_fu_486_p3));

assign tmp_78_fu_511_p1 = tmp_76_fu_498_p3;

assign tmp_79_fu_515_p1 = tmp_75_fu_492_p3;

assign tmp_80_fu_519_p1 = tmp_77_fu_505_p2;

assign tmp_81_fu_523_p2 = loc_V_fu_473_p1 << tmp_78_fu_511_p1;


integer ap_tvar_int_1;

always @ (tmp_81_fu_523_p2) begin
    for (ap_tvar_int_1 = 95 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
        if (ap_tvar_int_1 > ap_const_lv32_5E - ap_const_lv32_0) begin
            tmp_82_fu_529_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            tmp_82_fu_529_p4[ap_tvar_int_1] = tmp_81_fu_523_p2[ap_const_lv32_5E - ap_tvar_int_1];
        end
    end
end



assign tmp_83_fu_539_p3 = ((tmp_71_reg_690[0:0] === 1'b1) ? tmp_82_fu_529_p4 : tmp_81_fu_523_p2);

assign tmp_84_fu_546_p2 = ap_const_lv95_7FFFFFFFFFFFFFFFFFFFFFFF << tmp_79_fu_515_p1;

assign tmp_85_fu_552_p2 = ap_const_lv95_7FFFFFFFFFFFFFFFFFFFFFFF >> tmp_80_fu_519_p1;

assign tmp_86_fu_564_p2 = (p_demorgan_fu_558_p2 ^ ap_const_lv95_7FFFFFFFFFFFFFFFFFFFFFFF);

assign tmp_87_fu_570_p2 = (p_Val2_s_reg_177 & tmp_86_fu_564_p2);

assign tmp_88_fu_576_p2 = (tmp_83_fu_539_p3 & p_demorgan_fu_558_p2);

assign tmp_fu_200_p1 = b_V;

assign tmp_s_fu_216_p2 = (i_reg_154 == ap_const_lv3_4? 1'b1: 1'b0);
always @ (posedge ap_clk) begin
    tmp_reg_610[40:24] <= 17'b00000000000000000;
    tmp_42_reg_646[63:3] <= 61'b0000000000000000000000000000000000000000000000000000000000000;
    Li_reg_674[3] <= 1'b0;
end



endmodule //EdgeDetect_Top_big_mult_v3small_71_24_17_s
