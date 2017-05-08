// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rgb2ycbcr (
        ap_clk,
        ap_rst,
        B_V,
        G_V,
        R_V,
        y_lower,
        y_upper,
        cb_lower,
        cb_upper,
        cr_lower,
        cr_upper,
        ap_return,
        ap_ce
);

parameter    ap_const_lv15_4C = 15'b1001100;
parameter    ap_const_lv7_0 = 7'b0000000;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv8_80 = 8'b10000000;
parameter    ap_const_lv15_7FD5 = 15'b111111111010101;
parameter    ap_const_lv16_FFAB = 16'b1111111110101011;
parameter    ap_const_lv16_FF95 = 16'b1111111110010101;
parameter    ap_const_lv14_3FEB = 14'b11111111101011;
parameter    ap_const_lv16_96 = 16'b10010110;
parameter    ap_const_lv14_1D = 14'b11101;

input   ap_clk;
input   ap_rst;
input  [7:0] B_V;
input  [7:0] G_V;
input  [7:0] R_V;
input  [31:0] y_lower;
input  [31:0] y_upper;
input  [31:0] cb_lower;
input  [31:0] cb_upper;
input  [31:0] cr_lower;
input  [31:0] cr_upper;
output  [0:0] ap_return;
input   ap_ce;

reg   [31:0] cr_upper_read_reg_310;
reg   [31:0] cr_lower_read_reg_315;
reg   [31:0] cb_upper_read_reg_320;
reg   [31:0] cb_lower_read_reg_325;
reg   [31:0] y_upper_read_reg_330;
reg   [31:0] ap_pipeline_reg_pp0_iter1_y_upper_read_reg_330;
reg   [31:0] y_lower_read_reg_335;
reg   [31:0] ap_pipeline_reg_pp0_iter1_y_lower_read_reg_335;
wire   [14:0] tmp_1_fu_116_p2;
reg   [14:0] tmp_1_reg_340;
wire   [15:0] tmp_2_cast_fu_122_p1;
reg   [15:0] tmp_2_cast_reg_345;
wire   [13:0] tmp_4_cast2_fu_126_p1;
reg   [13:0] tmp_4_cast2_reg_350;
reg   [7:0] tmp_6_reg_355;
reg   [7:0] tmp_13_reg_360;
reg   [7:0] y_V_reg_365;
wire   [0:0] tmp_18_fu_198_p2;
reg   [0:0] tmp_18_reg_370;
wire   [0:0] tmp_19_fu_203_p2;
reg   [0:0] tmp_19_reg_375;
wire   [0:0] tmp_21_fu_212_p2;
reg   [0:0] tmp_21_reg_380;
wire   [0:0] tmp_22_fu_217_p2;
reg   [0:0] tmp_22_reg_385;
wire   [7:0] tmp_1_fu_116_p0;
wire   [14:0] tmp_cast3_fu_112_p1;
wire   [14:0] tmp_8_fu_130_p3;
wire  signed [15:0] grp_fu_269_p3;
wire   [14:0] tmp_2_fu_151_p3;
wire  signed [15:0] grp_fu_278_p3;
wire   [14:0] grp_fu_303_p3;
wire   [15:0] grp_fu_295_p3;
wire   [7:0] cb_V_fu_184_p2;
wire   [31:0] tmp_17_fu_194_p1;
wire   [7:0] cr_V_fu_189_p2;
wire   [31:0] tmp_20_fu_208_p1;
wire   [31:0] tmp_14_fu_222_p1;
wire   [0:0] tmp_16_fu_230_p2;
wire   [0:0] tmp6_fu_235_p2;
wire   [0:0] tmp_15_fu_225_p2;
wire   [0:0] tmp8_fu_246_p2;
wire   [0:0] tmp7_fu_250_p2;
wire   [0:0] tmp5_fu_240_p2;
wire   [7:0] grp_fu_261_p0;
wire  signed [6:0] grp_fu_261_p1;
wire   [14:0] grp_fu_261_p2;
wire   [7:0] grp_fu_269_p0;
wire  signed [7:0] grp_fu_269_p1;
wire  signed [15:0] grp_fu_261_p3;
wire   [7:0] grp_fu_278_p0;
wire  signed [7:0] grp_fu_278_p1;
wire  signed [15:0] grp_fu_286_p3;
wire   [7:0] grp_fu_286_p0;
wire  signed [5:0] grp_fu_286_p1;
wire   [14:0] grp_fu_286_p2;
wire   [7:0] grp_fu_295_p0;
wire   [8:0] grp_fu_295_p1;
wire   [14:0] grp_fu_295_p2;
wire   [7:0] grp_fu_303_p0;
wire   [5:0] grp_fu_303_p1;
wire   [15:0] grp_fu_261_p20;
wire   [13:0] grp_fu_286_p00;
wire   [15:0] grp_fu_286_p20;
wire   [15:0] grp_fu_295_p20;

ImgProcess_Top_mabkb #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 7 ),
    .din2_WIDTH( 15 ),
    .dout_WIDTH( 16 ))
ImgProcess_Top_mabkb_U28(
    .din0(grp_fu_261_p0),
    .din1(grp_fu_261_p1),
    .din2(grp_fu_261_p2),
    .dout(grp_fu_261_p3)
);

ImgProcess_Top_macud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
ImgProcess_Top_macud_U29(
    .din0(grp_fu_269_p0),
    .din1(grp_fu_269_p1),
    .din2(grp_fu_261_p3),
    .dout(grp_fu_269_p3)
);

ImgProcess_Top_macud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
ImgProcess_Top_macud_U30(
    .din0(grp_fu_278_p0),
    .din1(grp_fu_278_p1),
    .din2(grp_fu_286_p3),
    .dout(grp_fu_278_p3)
);

ImgProcess_Top_madEe #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 6 ),
    .din2_WIDTH( 15 ),
    .dout_WIDTH( 16 ))
ImgProcess_Top_madEe_U31(
    .din0(grp_fu_286_p0),
    .din1(grp_fu_286_p1),
    .din2(grp_fu_286_p2),
    .dout(grp_fu_286_p3)
);

ImgProcess_Top_maeOg #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 9 ),
    .din2_WIDTH( 15 ),
    .dout_WIDTH( 16 ))
ImgProcess_Top_maeOg_U32(
    .din0(grp_fu_295_p0),
    .din1(grp_fu_295_p1),
    .din2(grp_fu_295_p2),
    .dout(grp_fu_295_p3)
);

ImgProcess_Top_mafYi #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 6 ),
    .din2_WIDTH( 15 ),
    .dout_WIDTH( 15 ))
ImgProcess_Top_mafYi_U33(
    .din0(grp_fu_303_p0),
    .din1(grp_fu_303_p1),
    .din2(tmp_1_reg_340),
    .dout(grp_fu_303_p3)
);

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        ap_pipeline_reg_pp0_iter1_y_lower_read_reg_335 <= y_lower_read_reg_335;
        ap_pipeline_reg_pp0_iter1_y_upper_read_reg_330 <= y_upper_read_reg_330;
        cb_lower_read_reg_325 <= cb_lower;
        cb_upper_read_reg_320 <= cb_upper;
        cr_lower_read_reg_315 <= cr_lower;
        cr_upper_read_reg_310 <= cr_upper;
        tmp_13_reg_360 <= {{grp_fu_278_p3[ap_const_lv32_F : ap_const_lv32_8]}};
        tmp_18_reg_370 <= tmp_18_fu_198_p2;
        tmp_19_reg_375 <= tmp_19_fu_203_p2;
        tmp_1_reg_340[14 : 2] <= tmp_1_fu_116_p2[14 : 2];
        tmp_21_reg_380 <= tmp_21_fu_212_p2;
        tmp_22_reg_385 <= tmp_22_fu_217_p2;
        tmp_2_cast_reg_345[7 : 0] <= tmp_2_cast_fu_122_p1[7 : 0];
        tmp_4_cast2_reg_350[7 : 0] <= tmp_4_cast2_fu_126_p1[7 : 0];
        tmp_6_reg_355 <= {{grp_fu_269_p3[ap_const_lv32_F : ap_const_lv32_8]}};
        y_V_reg_365 <= {{grp_fu_295_p3[ap_const_lv32_F : ap_const_lv32_8]}};
        y_lower_read_reg_335 <= y_lower;
        y_upper_read_reg_330 <= y_upper;
    end
end

assign ap_return = (tmp7_fu_250_p2 & tmp5_fu_240_p2);

assign cb_V_fu_184_p2 = (tmp_6_reg_355 ^ ap_const_lv8_80);

assign cr_V_fu_189_p2 = (tmp_13_reg_360 ^ ap_const_lv8_80);

assign grp_fu_261_p0 = tmp_cast3_fu_112_p1;

assign grp_fu_261_p1 = ap_const_lv15_7FD5;

assign grp_fu_261_p2 = grp_fu_261_p20;

assign grp_fu_261_p20 = tmp_8_fu_130_p3;

assign grp_fu_269_p0 = tmp_2_cast_fu_122_p1;

assign grp_fu_269_p1 = ap_const_lv16_FFAB;

assign grp_fu_278_p0 = tmp_2_cast_fu_122_p1;

assign grp_fu_278_p1 = ap_const_lv16_FF95;

assign grp_fu_286_p0 = grp_fu_286_p00;

assign grp_fu_286_p00 = B_V;

assign grp_fu_286_p1 = ap_const_lv14_3FEB;

assign grp_fu_286_p2 = grp_fu_286_p20;

assign grp_fu_286_p20 = tmp_2_fu_151_p3;

assign grp_fu_295_p0 = tmp_2_cast_reg_345;

assign grp_fu_295_p1 = ap_const_lv16_96;

assign grp_fu_295_p2 = grp_fu_295_p20;

assign grp_fu_295_p20 = grp_fu_303_p3;

assign grp_fu_303_p0 = tmp_4_cast2_reg_350;

assign grp_fu_303_p1 = ap_const_lv14_1D;

assign tmp5_fu_240_p2 = (tmp6_fu_235_p2 & tmp_15_fu_225_p2);

assign tmp6_fu_235_p2 = (tmp_16_fu_230_p2 & tmp_19_reg_375);

assign tmp7_fu_250_p2 = (tmp8_fu_246_p2 & tmp_18_reg_370);

assign tmp8_fu_246_p2 = (tmp_22_reg_385 & tmp_21_reg_380);

assign tmp_14_fu_222_p1 = y_V_reg_365;

assign tmp_15_fu_225_p2 = (($signed(tmp_14_fu_222_p1) > $signed(ap_pipeline_reg_pp0_iter1_y_lower_read_reg_335)) ? 1'b1 : 1'b0);

assign tmp_16_fu_230_p2 = (($signed(tmp_14_fu_222_p1) < $signed(ap_pipeline_reg_pp0_iter1_y_upper_read_reg_330)) ? 1'b1 : 1'b0);

assign tmp_17_fu_194_p1 = cb_V_fu_184_p2;

assign tmp_18_fu_198_p2 = (($signed(tmp_17_fu_194_p1) > $signed(cb_lower_read_reg_325)) ? 1'b1 : 1'b0);

assign tmp_19_fu_203_p2 = (($signed(tmp_17_fu_194_p1) < $signed(cb_upper_read_reg_320)) ? 1'b1 : 1'b0);

assign tmp_1_fu_116_p0 = tmp_cast3_fu_112_p1;

assign tmp_1_fu_116_p2 = (tmp_1_fu_116_p0 * $signed('h4C));

assign tmp_20_fu_208_p1 = cr_V_fu_189_p2;

assign tmp_21_fu_212_p2 = (($signed(tmp_20_fu_208_p1) > $signed(cr_lower_read_reg_315)) ? 1'b1 : 1'b0);

assign tmp_22_fu_217_p2 = (($signed(tmp_20_fu_208_p1) < $signed(cr_upper_read_reg_310)) ? 1'b1 : 1'b0);

assign tmp_2_cast_fu_122_p1 = G_V;

assign tmp_2_fu_151_p3 = {{R_V}, {ap_const_lv7_0}};

assign tmp_4_cast2_fu_126_p1 = B_V;

assign tmp_8_fu_130_p3 = {{B_V}, {ap_const_lv7_0}};

assign tmp_cast3_fu_112_p1 = R_V;

always @ (posedge ap_clk) begin
    tmp_1_reg_340[1:0] <= 2'b00;
    tmp_2_cast_reg_345[15:8] <= 8'b00000000;
    tmp_4_cast2_reg_350[13:8] <= 6'b000000;
end

endmodule //rgb2ycbcr