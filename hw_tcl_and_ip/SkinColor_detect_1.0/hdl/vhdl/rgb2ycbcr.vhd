-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rgb2ycbcr is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    B_V : IN STD_LOGIC_VECTOR (7 downto 0);
    G_V : IN STD_LOGIC_VECTOR (7 downto 0);
    R_V : IN STD_LOGIC_VECTOR (7 downto 0);
    y_lower : IN STD_LOGIC_VECTOR (31 downto 0);
    y_upper : IN STD_LOGIC_VECTOR (31 downto 0);
    cb_lower : IN STD_LOGIC_VECTOR (31 downto 0);
    cb_upper : IN STD_LOGIC_VECTOR (31 downto 0);
    cr_lower : IN STD_LOGIC_VECTOR (31 downto 0);
    cr_upper : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (0 downto 0);
    ap_ce : IN STD_LOGIC );
end;


architecture behav of rgb2ycbcr is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv15_4C : STD_LOGIC_VECTOR (14 downto 0) := "000000001001100";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv8_80 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv15_7FD5 : STD_LOGIC_VECTOR (14 downto 0) := "111111111010101";
    constant ap_const_lv16_FFAB : STD_LOGIC_VECTOR (15 downto 0) := "1111111110101011";
    constant ap_const_lv16_FF95 : STD_LOGIC_VECTOR (15 downto 0) := "1111111110010101";
    constant ap_const_lv14_3FEB : STD_LOGIC_VECTOR (13 downto 0) := "11111111101011";
    constant ap_const_lv16_96 : STD_LOGIC_VECTOR (15 downto 0) := "0000000010010110";
    constant ap_const_lv14_1D : STD_LOGIC_VECTOR (13 downto 0) := "00000000011101";
    constant ap_const_logic_0 : STD_LOGIC := '0';

    signal cr_upper_read_reg_310 : STD_LOGIC_VECTOR (31 downto 0);
    signal cr_lower_read_reg_315 : STD_LOGIC_VECTOR (31 downto 0);
    signal cb_upper_read_reg_320 : STD_LOGIC_VECTOR (31 downto 0);
    signal cb_lower_read_reg_325 : STD_LOGIC_VECTOR (31 downto 0);
    signal y_upper_read_reg_330 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_pipeline_reg_pp0_iter1_y_upper_read_reg_330 : STD_LOGIC_VECTOR (31 downto 0);
    signal y_lower_read_reg_335 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_pipeline_reg_pp0_iter1_y_lower_read_reg_335 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_fu_116_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal tmp_1_reg_340 : STD_LOGIC_VECTOR (14 downto 0);
    signal tmp_2_cast_fu_122_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_2_cast_reg_345 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_4_cast2_fu_126_p1 : STD_LOGIC_VECTOR (13 downto 0);
    signal tmp_4_cast2_reg_350 : STD_LOGIC_VECTOR (13 downto 0);
    signal tmp_6_reg_355 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_13_reg_360 : STD_LOGIC_VECTOR (7 downto 0);
    signal y_V_reg_365 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_18_fu_198_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_18_reg_370 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_19_fu_203_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_19_reg_375 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_21_fu_212_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_21_reg_380 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_22_fu_217_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_22_reg_385 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_fu_116_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_cast3_fu_112_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal tmp_8_fu_130_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_269_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_2_fu_151_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_278_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_303_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_295_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal cb_V_fu_184_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_17_fu_194_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal cr_V_fu_189_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_20_fu_208_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_14_fu_222_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_16_fu_230_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp6_fu_235_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_15_fu_225_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp8_fu_246_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp7_fu_250_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp5_fu_240_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_261_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_261_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_fu_261_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_269_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_269_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_261_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_278_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_278_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_286_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_286_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_286_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_fu_286_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_295_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_295_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_fu_295_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_fu_303_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_303_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_fu_261_p20 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_286_p00 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_fu_286_p20 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_295_p20 : STD_LOGIC_VECTOR (15 downto 0);

    component ImgProcess_Top_mabkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (6 downto 0);
        din2 : IN STD_LOGIC_VECTOR (14 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component ImgProcess_Top_macud IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (15 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component ImgProcess_Top_madEe IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (5 downto 0);
        din2 : IN STD_LOGIC_VECTOR (14 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component ImgProcess_Top_maeOg IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (8 downto 0);
        din2 : IN STD_LOGIC_VECTOR (14 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component ImgProcess_Top_mafYi IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (5 downto 0);
        din2 : IN STD_LOGIC_VECTOR (14 downto 0);
        dout : OUT STD_LOGIC_VECTOR (14 downto 0) );
    end component;



begin
    ImgProcess_Top_mabkb_U28 : component ImgProcess_Top_mabkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 7,
        din2_WIDTH => 15,
        dout_WIDTH => 16)
    port map (
        din0 => grp_fu_261_p0,
        din1 => grp_fu_261_p1,
        din2 => grp_fu_261_p2,
        dout => grp_fu_261_p3);

    ImgProcess_Top_macud_U29 : component ImgProcess_Top_macud
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 16,
        dout_WIDTH => 16)
    port map (
        din0 => grp_fu_269_p0,
        din1 => grp_fu_269_p1,
        din2 => grp_fu_261_p3,
        dout => grp_fu_269_p3);

    ImgProcess_Top_macud_U30 : component ImgProcess_Top_macud
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 16,
        dout_WIDTH => 16)
    port map (
        din0 => grp_fu_278_p0,
        din1 => grp_fu_278_p1,
        din2 => grp_fu_286_p3,
        dout => grp_fu_278_p3);

    ImgProcess_Top_madEe_U31 : component ImgProcess_Top_madEe
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 6,
        din2_WIDTH => 15,
        dout_WIDTH => 16)
    port map (
        din0 => grp_fu_286_p0,
        din1 => grp_fu_286_p1,
        din2 => grp_fu_286_p2,
        dout => grp_fu_286_p3);

    ImgProcess_Top_maeOg_U32 : component ImgProcess_Top_maeOg
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 9,
        din2_WIDTH => 15,
        dout_WIDTH => 16)
    port map (
        din0 => grp_fu_295_p0,
        din1 => grp_fu_295_p1,
        din2 => grp_fu_295_p2,
        dout => grp_fu_295_p3);

    ImgProcess_Top_mafYi_U33 : component ImgProcess_Top_mafYi
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 6,
        din2_WIDTH => 15,
        dout_WIDTH => 15)
    port map (
        din0 => grp_fu_303_p0,
        din1 => grp_fu_303_p1,
        din2 => tmp_1_reg_340,
        dout => grp_fu_303_p3);




    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce)) then
                ap_pipeline_reg_pp0_iter1_y_lower_read_reg_335 <= y_lower_read_reg_335;
                ap_pipeline_reg_pp0_iter1_y_upper_read_reg_330 <= y_upper_read_reg_330;
                cb_lower_read_reg_325 <= cb_lower;
                cb_upper_read_reg_320 <= cb_upper;
                cr_lower_read_reg_315 <= cr_lower;
                cr_upper_read_reg_310 <= cr_upper;
                tmp_13_reg_360 <= grp_fu_278_p3(15 downto 8);
                tmp_18_reg_370 <= tmp_18_fu_198_p2;
                tmp_19_reg_375 <= tmp_19_fu_203_p2;
                    tmp_1_reg_340(14 downto 2) <= tmp_1_fu_116_p2(14 downto 2);
                tmp_21_reg_380 <= tmp_21_fu_212_p2;
                tmp_22_reg_385 <= tmp_22_fu_217_p2;
                    tmp_2_cast_reg_345(7 downto 0) <= tmp_2_cast_fu_122_p1(7 downto 0);
                    tmp_4_cast2_reg_350(7 downto 0) <= tmp_4_cast2_fu_126_p1(7 downto 0);
                tmp_6_reg_355 <= grp_fu_269_p3(15 downto 8);
                y_V_reg_365 <= grp_fu_295_p3(15 downto 8);
                y_lower_read_reg_335 <= y_lower;
                y_upper_read_reg_330 <= y_upper;
            end if;
        end if;
    end process;
    tmp_1_reg_340(1 downto 0) <= "00";
    tmp_2_cast_reg_345(15 downto 8) <= "00000000";
    tmp_4_cast2_reg_350(13 downto 8) <= "000000";
    ap_return <= (tmp7_fu_250_p2 and tmp5_fu_240_p2);
    cb_V_fu_184_p2 <= (tmp_6_reg_355 xor ap_const_lv8_80);
    cr_V_fu_189_p2 <= (tmp_13_reg_360 xor ap_const_lv8_80);
    grp_fu_261_p0 <= tmp_cast3_fu_112_p1(8 - 1 downto 0);
    grp_fu_261_p1 <= ap_const_lv15_7FD5(7 - 1 downto 0);
    grp_fu_261_p2 <= grp_fu_261_p20(15 - 1 downto 0);
    grp_fu_261_p20 <= std_logic_vector(resize(unsigned(tmp_8_fu_130_p3),16));
    grp_fu_269_p0 <= tmp_2_cast_fu_122_p1(8 - 1 downto 0);
    grp_fu_269_p1 <= ap_const_lv16_FFAB(8 - 1 downto 0);
    grp_fu_278_p0 <= tmp_2_cast_fu_122_p1(8 - 1 downto 0);
    grp_fu_278_p1 <= ap_const_lv16_FF95(8 - 1 downto 0);
    grp_fu_286_p0 <= grp_fu_286_p00(8 - 1 downto 0);
    grp_fu_286_p00 <= std_logic_vector(resize(unsigned(B_V),14));
    grp_fu_286_p1 <= ap_const_lv14_3FEB(6 - 1 downto 0);
    grp_fu_286_p2 <= grp_fu_286_p20(15 - 1 downto 0);
    grp_fu_286_p20 <= std_logic_vector(resize(unsigned(tmp_2_fu_151_p3),16));
    grp_fu_295_p0 <= tmp_2_cast_reg_345(8 - 1 downto 0);
    grp_fu_295_p1 <= ap_const_lv16_96(9 - 1 downto 0);
    grp_fu_295_p2 <= grp_fu_295_p20(15 - 1 downto 0);
    grp_fu_295_p20 <= std_logic_vector(resize(unsigned(grp_fu_303_p3),16));
    grp_fu_303_p0 <= tmp_4_cast2_reg_350(8 - 1 downto 0);
    grp_fu_303_p1 <= ap_const_lv14_1D(6 - 1 downto 0);
    tmp5_fu_240_p2 <= (tmp6_fu_235_p2 and tmp_15_fu_225_p2);
    tmp6_fu_235_p2 <= (tmp_16_fu_230_p2 and tmp_19_reg_375);
    tmp7_fu_250_p2 <= (tmp8_fu_246_p2 and tmp_18_reg_370);
    tmp8_fu_246_p2 <= (tmp_22_reg_385 and tmp_21_reg_380);
    tmp_14_fu_222_p1 <= std_logic_vector(resize(unsigned(y_V_reg_365),32));
    tmp_15_fu_225_p2 <= "1" when (signed(tmp_14_fu_222_p1) > signed(ap_pipeline_reg_pp0_iter1_y_lower_read_reg_335)) else "0";
    tmp_16_fu_230_p2 <= "1" when (signed(tmp_14_fu_222_p1) < signed(ap_pipeline_reg_pp0_iter1_y_upper_read_reg_330)) else "0";
    tmp_17_fu_194_p1 <= std_logic_vector(resize(unsigned(cb_V_fu_184_p2),32));
    tmp_18_fu_198_p2 <= "1" when (signed(tmp_17_fu_194_p1) > signed(cb_lower_read_reg_325)) else "0";
    tmp_19_fu_203_p2 <= "1" when (signed(tmp_17_fu_194_p1) < signed(cb_upper_read_reg_320)) else "0";
    tmp_1_fu_116_p0 <= tmp_cast3_fu_112_p1(8 - 1 downto 0);
    tmp_1_fu_116_p2 <= std_logic_vector(resize(unsigned(tmp_1_fu_116_p0) * unsigned(ap_const_lv15_4C), 15));
    tmp_20_fu_208_p1 <= std_logic_vector(resize(unsigned(cr_V_fu_189_p2),32));
    tmp_21_fu_212_p2 <= "1" when (signed(tmp_20_fu_208_p1) > signed(cr_lower_read_reg_315)) else "0";
    tmp_22_fu_217_p2 <= "1" when (signed(tmp_20_fu_208_p1) < signed(cr_upper_read_reg_310)) else "0";
    tmp_2_cast_fu_122_p1 <= std_logic_vector(resize(unsigned(G_V),16));
    tmp_2_fu_151_p3 <= (R_V & ap_const_lv7_0);
    tmp_4_cast2_fu_126_p1 <= std_logic_vector(resize(unsigned(B_V),14));
    tmp_8_fu_130_p3 <= (B_V & ap_const_lv7_0);
    tmp_cast3_fu_112_p1 <= std_logic_vector(resize(unsigned(R_V),15));
end behav;