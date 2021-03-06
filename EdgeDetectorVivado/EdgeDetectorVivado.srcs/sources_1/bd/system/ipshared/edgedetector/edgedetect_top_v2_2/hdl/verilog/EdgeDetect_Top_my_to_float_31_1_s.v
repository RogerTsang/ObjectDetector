// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module EdgeDetect_Top_my_to_float_31_1_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in_V,
        prescale,
        ap_return
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 6'b1;
parameter    ap_ST_st2_fsm_1 = 6'b10;
parameter    ap_ST_st3_fsm_2 = 6'b100;
parameter    ap_ST_st4_fsm_3 = 6'b1000;
parameter    ap_ST_st5_fsm_4 = 6'b10000;
parameter    ap_ST_st6_fsm_5 = 6'b100000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv64_0 = 64'b0000000000000000000000000000000000000000000000000000000000000000;
parameter    ap_const_lv64_1 = 64'b1;
parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv32_1E = 32'b11110;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv32_10 = 32'b10000;
parameter    ap_const_lv2_2 = 2'b10;
parameter    ap_const_lv2_1 = 2'b1;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv32_1D = 32'b11101;
parameter    ap_const_lv31_0 = 31'b0000000000000000000000000000000;
parameter    ap_const_lv8_7F = 8'b1111111;
parameter    ap_const_lv8_0 = 8'b00000000;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [30:0] in_V;
input  [8:0] prescale;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] ap_return;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm = 6'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_24;
wire   [1:0] i_fu_266_p2;
reg   [1:0] i_reg_440;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_46;
wire   [63:0] tmp_s_fu_272_p1;
reg   [63:0] tmp_s_reg_445;
wire   [0:0] exitcond_fu_260_p2;
wire   [0:0] tmp_39_fu_286_p3;
reg   [0:0] tmp_39_reg_455;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_bdd_63;
wire   [1:0] i_1_fu_294_p2;
reg   [1:0] i_1_reg_459;
wire   [31:0] c_q0;
reg   [31:0] c_load_reg_469;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_bdd_78;
wire   [30:0] in_shift_V_fu_351_p3;
reg   [30:0] in_shift_V_reg_475;
wire   [31:0] shift_2_fu_359_p2;
reg    ap_sig_cseq_ST_st6_fsm_5;
reg    ap_sig_bdd_89;
reg   [0:0] out_bits_V_address0;
reg    out_bits_V_ce0;
reg    out_bits_V_we0;
wire   [31:0] out_bits_V_d0;
wire   [31:0] out_bits_V_q0;
wire   [0:0] out_bits_V_address1;
reg    out_bits_V_ce1;
reg    out_bits_V_we1;
wire   [31:0] out_bits_V_d1;
reg   [0:0] c_address0;
reg    c_ce0;
reg    c_we0;
reg   [31:0] c_d0;
reg   [1:0] i1_reg_140;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_bdd_124;
reg   [30:0] in_shift_reg_151;
wire   [0:0] tmp_34_fu_365_p2;
reg   [31:0] shift_reg_161;
reg   [1:0] i2_reg_173;
reg   [30:0] p_Val2_in_phi_fu_187_p4;
reg   [30:0] p_Val2_in_reg_184;
reg   [31:0] shift_1_phi_fu_197_p4;
reg   [31:0] shift_1_reg_194;
wire   [63:0] tmp_29_fu_300_p1;
wire   [15:0] p_Result_s_fu_204_p4;
wire   [16:0] tmp_23_fu_214_p3;
wire   [14:0] tmp_fu_235_p1;
wire   [15:0] tmp_22_fu_239_p3;
wire   [0:0] isNeg_fu_305_p3;
wire   [31:0] tmp_30_fu_313_p2;
wire  signed [31:0] tmp_31_fu_327_p1;
wire   [31:0] sh_assign_1_fu_319_p3;
wire   [31:0] tmp_32_fu_331_p2;
wire   [31:0] tmp_33_fu_337_p2;
wire   [30:0] tmp_41_fu_343_p1;
wire   [30:0] tmp_42_fu_347_p1;
wire   [7:0] tmp_44_fu_385_p1;
wire   [7:0] tmp_36_fu_388_p2;
wire   [7:0] tmp_45_fu_394_p1;
wire   [0:0] tmp_35_fu_380_p2;
wire   [7:0] phitmp_fu_398_p2;
wire   [7:0] out_exp_V_fu_404_p3;
wire   [22:0] p_Val2_s_fu_370_p4;
wire   [31:0] p_Result_26_fu_412_p4;
wire   [31:0] result_write_assign_fu_422_p1;
reg   [31:0] ap_return_preg = 32'b00000000000000000000000000000000;
reg   [5:0] ap_NS_fsm;


EdgeDetect_Top_my_to_float_31_1_s_out_bits_V #(
    .DataWidth( 32 ),
    .AddressRange( 2 ),
    .AddressWidth( 1 ))
out_bits_V_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .address0( out_bits_V_address0 ),
    .ce0( out_bits_V_ce0 ),
    .we0( out_bits_V_we0 ),
    .d0( out_bits_V_d0 ),
    .q0( out_bits_V_q0 ),
    .address1( out_bits_V_address1 ),
    .ce1( out_bits_V_ce1 ),
    .we1( out_bits_V_we1 ),
    .d1( out_bits_V_d1 )
);

EdgeDetect_Top_my_to_float_31_1_s_c #(
    .DataWidth( 32 ),
    .AddressRange( 2 ),
    .AddressWidth( 1 ))
c_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .address0( c_address0 ),
    .ce0( c_ce0 ),
    .we0( c_we0 ),
    .d0( c_d0 ),
    .q0( c_q0 )
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
        ap_return_preg[0] <= 1'b0;
        ap_return_preg[1] <= 1'b0;
        ap_return_preg[2] <= 1'b0;
        ap_return_preg[3] <= 1'b0;
        ap_return_preg[4] <= 1'b0;
        ap_return_preg[5] <= 1'b0;
        ap_return_preg[6] <= 1'b0;
        ap_return_preg[7] <= 1'b0;
        ap_return_preg[8] <= 1'b0;
        ap_return_preg[9] <= 1'b0;
        ap_return_preg[10] <= 1'b0;
        ap_return_preg[11] <= 1'b0;
        ap_return_preg[12] <= 1'b0;
        ap_return_preg[13] <= 1'b0;
        ap_return_preg[14] <= 1'b0;
        ap_return_preg[15] <= 1'b0;
        ap_return_preg[16] <= 1'b0;
        ap_return_preg[17] <= 1'b0;
        ap_return_preg[18] <= 1'b0;
        ap_return_preg[19] <= 1'b0;
        ap_return_preg[20] <= 1'b0;
        ap_return_preg[21] <= 1'b0;
        ap_return_preg[22] <= 1'b0;
        ap_return_preg[23] <= 1'b0;
        ap_return_preg[24] <= 1'b0;
        ap_return_preg[25] <= 1'b0;
        ap_return_preg[26] <= 1'b0;
        ap_return_preg[27] <= 1'b0;
        ap_return_preg[28] <= 1'b0;
        ap_return_preg[29] <= 1'b0;
        ap_return_preg[30] <= 1'b0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & ((ap_const_lv1_0 == tmp_34_fu_365_p2) | ~(ap_const_lv1_0 == tmp_39_reg_455)))) begin
                        ap_return_preg[30 : 0] <= result_write_assign_fu_422_p1[30 : 0];
        end
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        i1_reg_140 <= i_reg_440;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        i1_reg_140 <= ap_const_lv2_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond_fu_260_p2 == ap_const_lv1_0))) begin
        i2_reg_173 <= ap_const_lv2_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & (ap_const_lv1_0 == tmp_39_reg_455) & ~(ap_const_lv1_0 == tmp_34_fu_365_p2))) begin
        i2_reg_173 <= i_1_reg_459;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond_fu_260_p2 == ap_const_lv1_0))) begin
        in_shift_reg_151 <= in_V;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & (ap_const_lv1_0 == tmp_39_reg_455) & ~(ap_const_lv1_0 == tmp_34_fu_365_p2))) begin
        in_shift_reg_151 <= in_shift_V_reg_475;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & (ap_const_lv1_0 == tmp_39_reg_455) & (ap_const_lv1_0 == tmp_34_fu_365_p2))) begin
        p_Val2_in_reg_184 <= in_shift_V_reg_475;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3) & ~(ap_const_lv1_0 == tmp_39_fu_286_p3))) begin
        p_Val2_in_reg_184 <= in_shift_reg_151;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & (ap_const_lv1_0 == tmp_39_reg_455) & (ap_const_lv1_0 == tmp_34_fu_365_p2))) begin
        shift_1_reg_194 <= shift_2_fu_359_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3) & ~(ap_const_lv1_0 == tmp_39_fu_286_p3))) begin
        shift_1_reg_194 <= shift_reg_161;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond_fu_260_p2 == ap_const_lv1_0))) begin
        shift_reg_161 <= ap_const_lv32_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & (ap_const_lv1_0 == tmp_39_reg_455) & ~(ap_const_lv1_0 == tmp_34_fu_365_p2))) begin
        shift_reg_161 <= shift_2_fu_359_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        c_load_reg_469 <= c_q0;
        in_shift_V_reg_475 <= in_shift_V_fu_351_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        i_1_reg_459 <= i_1_fu_294_p2;
        tmp_39_reg_455 <= i2_reg_173[ap_const_lv32_1];
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        i_reg_440 <= i_fu_266_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_260_p2 == ap_const_lv1_0))) begin
        tmp_s_reg_445[1 : 0] <= tmp_s_fu_272_p1[1 : 0];
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0 or tmp_39_reg_455 or ap_sig_cseq_ST_st6_fsm_5 or tmp_34_fu_365_p2) begin
    if (((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & ((ap_const_lv1_0 == tmp_34_fu_365_p2) | ~(ap_const_lv1_0 == tmp_39_reg_455))))) begin
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

always @ (tmp_39_reg_455 or ap_sig_cseq_ST_st6_fsm_5 or tmp_34_fu_365_p2) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & ((ap_const_lv1_0 == tmp_34_fu_365_p2) | ~(ap_const_lv1_0 == tmp_39_reg_455)))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

always @ (tmp_39_reg_455 or ap_sig_cseq_ST_st6_fsm_5 or tmp_34_fu_365_p2 or result_write_assign_fu_422_p1 or ap_return_preg) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & ((ap_const_lv1_0 == tmp_34_fu_365_p2) | ~(ap_const_lv1_0 == tmp_39_reg_455)))) begin
        ap_return = result_write_assign_fu_422_p1;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (ap_sig_bdd_24) begin
    if (ap_sig_bdd_24) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_46) begin
    if (ap_sig_bdd_46) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_124) begin
    if (ap_sig_bdd_124) begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_63) begin
    if (ap_sig_bdd_63) begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_78) begin
    if (ap_sig_bdd_78) begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_89) begin
    if (ap_sig_bdd_89) begin
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_0;
    end
end

always @ (tmp_s_reg_445 or ap_sig_cseq_ST_st4_fsm_3 or ap_sig_cseq_ST_st3_fsm_2 or tmp_29_fu_300_p1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        c_address0 = tmp_s_reg_445;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        c_address0 = tmp_29_fu_300_p1;
    end else begin
        c_address0 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st4_fsm_3 or ap_sig_cseq_ST_st3_fsm_2) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3) | (ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2))) begin
        c_ce0 = ap_const_logic_1;
    end else begin
        c_ce0 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st3_fsm_2) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        c_we0 = ap_const_logic_1;
    end else begin
        c_we0 = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st1_fsm_0 or ap_sig_cseq_ST_st2_fsm_1 or tmp_s_fu_272_p1) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) begin
        out_bits_V_address0 = ap_const_lv64_0;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        out_bits_V_address0 = tmp_s_fu_272_p1;
    end else begin
        out_bits_V_address0 = 'bx;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0 or ap_sig_cseq_ST_st2_fsm_1) begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0)) | (ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1))) begin
        out_bits_V_ce0 = ap_const_logic_1;
    end else begin
        out_bits_V_ce0 = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        out_bits_V_ce1 = ap_const_logic_1;
    end else begin
        out_bits_V_ce1 = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        out_bits_V_we0 = ap_const_logic_1;
    end else begin
        out_bits_V_we0 = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        out_bits_V_we1 = ap_const_logic_1;
    end else begin
        out_bits_V_we1 = ap_const_logic_0;
    end
end

always @ (tmp_39_reg_455 or in_shift_V_reg_475 or ap_sig_cseq_ST_st6_fsm_5 or tmp_34_fu_365_p2 or p_Val2_in_reg_184) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & (ap_const_lv1_0 == tmp_39_reg_455) & (ap_const_lv1_0 == tmp_34_fu_365_p2))) begin
        p_Val2_in_phi_fu_187_p4 = in_shift_V_reg_475;
    end else begin
        p_Val2_in_phi_fu_187_p4 = p_Val2_in_reg_184;
    end
end

always @ (tmp_39_reg_455 or shift_2_fu_359_p2 or ap_sig_cseq_ST_st6_fsm_5 or tmp_34_fu_365_p2 or shift_1_reg_194) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_5) & (ap_const_lv1_0 == tmp_39_reg_455) & (ap_const_lv1_0 == tmp_34_fu_365_p2))) begin
        shift_1_phi_fu_197_p4 = shift_2_fu_359_p2;
    end else begin
        shift_1_phi_fu_197_p4 = shift_1_reg_194;
    end
end
always @ (ap_start or ap_CS_fsm or exitcond_fu_260_p2 or tmp_39_fu_286_p3 or tmp_39_reg_455 or tmp_34_fu_365_p2) begin
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
            if (~(exitcond_fu_260_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : 
        begin
            ap_NS_fsm = ap_ST_st2_fsm_1;
        end
        ap_ST_st4_fsm_3 : 
        begin
            if (~(ap_const_lv1_0 == tmp_39_fu_286_p3)) begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end else begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end
        end
        ap_ST_st5_fsm_4 : 
        begin
            ap_NS_fsm = ap_ST_st6_fsm_5;
        end
        ap_ST_st6_fsm_5 : 
        begin
            if (((ap_const_lv1_0 == tmp_34_fu_365_p2) | ~(ap_const_lv1_0 == tmp_39_reg_455))) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end



always @ (ap_CS_fsm) begin
    ap_sig_bdd_124 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_24 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_46 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_63 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_78 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_4]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_89 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_5]);
end


always @ (out_bits_V_q0) begin
    if (out_bits_V_q0[31] == 1'b1) begin
        c_d0 = 32'd0;
    end else if (out_bits_V_q0[30] == 1'b1) begin
        c_d0 = 32'd1;
    end else if (out_bits_V_q0[29] == 1'b1) begin
        c_d0 = 32'd2;
    end else if (out_bits_V_q0[28] == 1'b1) begin
        c_d0 = 32'd3;
    end else if (out_bits_V_q0[27] == 1'b1) begin
        c_d0 = 32'd4;
    end else if (out_bits_V_q0[26] == 1'b1) begin
        c_d0 = 32'd5;
    end else if (out_bits_V_q0[25] == 1'b1) begin
        c_d0 = 32'd6;
    end else if (out_bits_V_q0[24] == 1'b1) begin
        c_d0 = 32'd7;
    end else if (out_bits_V_q0[23] == 1'b1) begin
        c_d0 = 32'd8;
    end else if (out_bits_V_q0[22] == 1'b1) begin
        c_d0 = 32'd9;
    end else if (out_bits_V_q0[21] == 1'b1) begin
        c_d0 = 32'd10;
    end else if (out_bits_V_q0[20] == 1'b1) begin
        c_d0 = 32'd11;
    end else if (out_bits_V_q0[19] == 1'b1) begin
        c_d0 = 32'd12;
    end else if (out_bits_V_q0[18] == 1'b1) begin
        c_d0 = 32'd13;
    end else if (out_bits_V_q0[17] == 1'b1) begin
        c_d0 = 32'd14;
    end else if (out_bits_V_q0[16] == 1'b1) begin
        c_d0 = 32'd15;
    end else if (out_bits_V_q0[15] == 1'b1) begin
        c_d0 = 32'd16;
    end else if (out_bits_V_q0[14] == 1'b1) begin
        c_d0 = 32'd17;
    end else if (out_bits_V_q0[13] == 1'b1) begin
        c_d0 = 32'd18;
    end else if (out_bits_V_q0[12] == 1'b1) begin
        c_d0 = 32'd19;
    end else if (out_bits_V_q0[11] == 1'b1) begin
        c_d0 = 32'd20;
    end else if (out_bits_V_q0[10] == 1'b1) begin
        c_d0 = 32'd21;
    end else if (out_bits_V_q0[9] == 1'b1) begin
        c_d0 = 32'd22;
    end else if (out_bits_V_q0[8] == 1'b1) begin
        c_d0 = 32'd23;
    end else if (out_bits_V_q0[7] == 1'b1) begin
        c_d0 = 32'd24;
    end else if (out_bits_V_q0[6] == 1'b1) begin
        c_d0 = 32'd25;
    end else if (out_bits_V_q0[5] == 1'b1) begin
        c_d0 = 32'd26;
    end else if (out_bits_V_q0[4] == 1'b1) begin
        c_d0 = 32'd27;
    end else if (out_bits_V_q0[3] == 1'b1) begin
        c_d0 = 32'd28;
    end else if (out_bits_V_q0[2] == 1'b1) begin
        c_d0 = 32'd29;
    end else if (out_bits_V_q0[1] == 1'b1) begin
        c_d0 = 32'd30;
    end else if (out_bits_V_q0[0] == 1'b1) begin
        c_d0 = 32'd31;
    end else begin
        c_d0 = 32'd32;
    end
end



assign exitcond_fu_260_p2 = (i1_reg_140 == ap_const_lv2_2? 1'b1: 1'b0);

assign i_1_fu_294_p2 = (i2_reg_173 + ap_const_lv2_1);

assign i_fu_266_p2 = (i1_reg_140 + ap_const_lv2_1);

assign in_shift_V_fu_351_p3 = ((isNeg_fu_305_p3[0:0] === 1'b1) ? tmp_41_fu_343_p1 : tmp_42_fu_347_p1);

assign isNeg_fu_305_p3 = c_q0[ap_const_lv32_1F];

assign out_bits_V_address1 = ap_const_lv64_1;

assign out_bits_V_d0 = {{tmp_23_fu_214_p3}, {ap_const_lv32_0[32'd14 : 32'd0]}};

assign out_bits_V_d1 = {{tmp_22_fu_239_p3}, {ap_const_lv32_0[32'd15 : 32'd0]}};

assign out_exp_V_fu_404_p3 = ((tmp_35_fu_380_p2[0:0] === 1'b1) ? ap_const_lv8_0 : phitmp_fu_398_p2);

assign p_Result_26_fu_412_p4 = {{{{ap_const_lv1_0}, {out_exp_V_fu_404_p3}}}, {p_Val2_s_fu_370_p4}};

assign p_Result_s_fu_204_p4 = {{in_V[ap_const_lv32_1E : ap_const_lv32_F]}};

assign p_Val2_s_fu_370_p4 = {{p_Val2_in_phi_fu_187_p4[ap_const_lv32_1D : ap_const_lv32_7]}};

assign phitmp_fu_398_p2 = (tmp_36_fu_388_p2 - tmp_45_fu_394_p1);

assign result_write_assign_fu_422_p1 = p_Result_26_fu_412_p4;

assign sh_assign_1_fu_319_p3 = ((isNeg_fu_305_p3[0:0] === 1'b1) ? tmp_30_fu_313_p2 : c_q0);

assign shift_2_fu_359_p2 = (shift_reg_161 + c_load_reg_469);

assign tmp_22_fu_239_p3 = {{tmp_fu_235_p1}, {ap_const_lv1_1}};

assign tmp_23_fu_214_p3 = {{p_Result_s_fu_204_p4}, {ap_const_lv1_1}};

assign tmp_29_fu_300_p1 = i2_reg_173;

assign tmp_30_fu_313_p2 = (ap_const_lv32_0 - c_q0);

assign tmp_31_fu_327_p1 = $signed(in_shift_reg_151);

assign tmp_32_fu_331_p2 = $signed(tmp_31_fu_327_p1) >>> sh_assign_1_fu_319_p3;

assign tmp_33_fu_337_p2 = tmp_31_fu_327_p1 << sh_assign_1_fu_319_p3;

assign tmp_34_fu_365_p2 = (c_load_reg_469 == ap_const_lv32_10? 1'b1: 1'b0);

assign tmp_35_fu_380_p2 = (in_V == ap_const_lv31_0? 1'b1: 1'b0);

assign tmp_36_fu_388_p2 = (ap_const_lv8_7F - tmp_44_fu_385_p1);

assign tmp_39_fu_286_p3 = i2_reg_173[ap_const_lv32_1];

assign tmp_41_fu_343_p1 = tmp_32_fu_331_p2[30:0];

assign tmp_42_fu_347_p1 = tmp_33_fu_337_p2[30:0];

assign tmp_44_fu_385_p1 = prescale[7:0];

assign tmp_45_fu_394_p1 = shift_1_phi_fu_197_p4[7:0];

assign tmp_fu_235_p1 = in_V[14:0];

assign tmp_s_fu_272_p1 = i1_reg_140;
always @ (posedge ap_clk) begin
    tmp_s_reg_445[63:2] <= 62'b00000000000000000000000000000000000000000000000000000000000000;
    ap_return_preg[31] <= 1'b0;
end



endmodule //EdgeDetect_Top_my_to_float_31_1_s

