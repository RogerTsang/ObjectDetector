-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ImgProcess is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    p_src_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_stream_0_V_empty_n : IN STD_LOGIC;
    p_src_data_stream_0_V_read : OUT STD_LOGIC;
    p_src_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_stream_1_V_empty_n : IN STD_LOGIC;
    p_src_data_stream_1_V_read : OUT STD_LOGIC;
    p_src_data_stream_2_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    p_src_data_stream_2_V_empty_n : IN STD_LOGIC;
    p_src_data_stream_2_V_read : OUT STD_LOGIC;
    p_dst_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_stream_0_V_full_n : IN STD_LOGIC;
    p_dst_data_stream_0_V_write : OUT STD_LOGIC;
    p_dst_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_stream_1_V_full_n : IN STD_LOGIC;
    p_dst_data_stream_1_V_write : OUT STD_LOGIC;
    p_dst_data_stream_2_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    p_dst_data_stream_2_V_full_n : IN STD_LOGIC;
    p_dst_data_stream_2_V_write : OUT STD_LOGIC;
    y_lower_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    y_lower_empty_n : IN STD_LOGIC;
    y_lower_read : OUT STD_LOGIC;
    y_upper_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    y_upper_empty_n : IN STD_LOGIC;
    y_upper_read : OUT STD_LOGIC;
    cb_lower_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    cb_lower_empty_n : IN STD_LOGIC;
    cb_lower_read : OUT STD_LOGIC;
    cb_upper_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    cb_upper_empty_n : IN STD_LOGIC;
    cb_upper_read : OUT STD_LOGIC;
    cr_lower_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    cr_lower_empty_n : IN STD_LOGIC;
    cr_lower_read : OUT STD_LOGIC;
    cr_upper_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    cr_upper_empty_n : IN STD_LOGIC;
    cr_upper_read : OUT STD_LOGIC );
end;


architecture behav of ImgProcess is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv19_4B000 : STD_LOGIC_VECTOR (18 downto 0) := "1001011000000000000";
    constant ap_const_lv19_1 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000001";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0);
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal p_src_data_stream_0_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0);
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal exitcond_flatten_reg_236 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_src_data_stream_1_V_blk_n : STD_LOGIC;
    signal p_src_data_stream_2_V_blk_n : STD_LOGIC;
    signal p_dst_data_stream_0_V_blk_n : STD_LOGIC;
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_dst_data_stream_1_V_blk_n : STD_LOGIC;
    signal p_dst_data_stream_2_V_blk_n : STD_LOGIC;
    signal y_lower_blk_n : STD_LOGIC;
    signal y_upper_blk_n : STD_LOGIC;
    signal cb_lower_blk_n : STD_LOGIC;
    signal cb_upper_blk_n : STD_LOGIC;
    signal cr_lower_blk_n : STD_LOGIC;
    signal cr_upper_blk_n : STD_LOGIC;
    signal indvar_flatten_reg_149 : STD_LOGIC_VECTOR (18 downto 0);
    signal y_lower_read_reg_206 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_condition_126 : BOOLEAN;
    signal y_upper_read_reg_211 : STD_LOGIC_VECTOR (31 downto 0);
    signal cb_lower_read_reg_216 : STD_LOGIC_VECTOR (31 downto 0);
    signal cb_upper_read_reg_221 : STD_LOGIC_VECTOR (31 downto 0);
    signal cr_lower_read_reg_226 : STD_LOGIC_VECTOR (31 downto 0);
    signal cr_upper_read_reg_231 : STD_LOGIC_VECTOR (31 downto 0);
    signal exitcond_flatten_fu_173_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_150 : BOOLEAN;
    signal ap_condition_161 : BOOLEAN;
    signal ap_pipeline_reg_pp0_iter1_exitcond_flatten_reg_236 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_pipeline_reg_pp0_iter2_exitcond_flatten_reg_236 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_pipeline_reg_pp0_iter3_exitcond_flatten_reg_236 : STD_LOGIC_VECTOR (0 downto 0);
    signal indvar_flatten_next_fu_179_p2 : STD_LOGIC_VECTOR (18 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal tmp_9_reg_245 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_pipeline_reg_pp0_iter2_tmp_9_reg_245 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_pipeline_reg_pp0_iter3_tmp_9_reg_245 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_10_reg_251 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_pipeline_reg_pp0_iter2_tmp_10_reg_251 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_pipeline_reg_pp0_iter3_tmp_10_reg_251 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_11_reg_257 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_pipeline_reg_pp0_iter2_tmp_11_reg_257 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_pipeline_reg_pp0_iter3_tmp_11_reg_257 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_V_fu_185_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_V_reg_263 : STD_LOGIC_VECTOR (7 downto 0);
    signal g_V_fu_192_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal g_V_reg_268 : STD_LOGIC_VECTOR (7 downto 0);
    signal r_V_fu_199_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal r_V_reg_273 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal grp_rgb2ycbcr_fu_160_ap_return : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_rgb2ycbcr_fu_160_ap_ce : STD_LOGIC;
    signal ap_CS_fsm_state8 : STD_LOGIC_VECTOR (0 downto 0);
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);

    component rgb2ycbcr IS
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
    end component;



begin
    grp_rgb2ycbcr_fu_160 : component rgb2ycbcr
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        B_V => tmp_9_reg_245,
        G_V => tmp_10_reg_251,
        R_V => tmp_11_reg_257,
        y_lower => y_lower_read_reg_206,
        y_upper => y_upper_read_reg_211,
        cb_lower => cb_lower_read_reg_216,
        cb_upper => cb_upper_read_reg_221,
        cr_lower => cr_lower_read_reg_226,
        cr_upper => cr_upper_read_reg_231,
        ap_return => grp_rgb2ycbcr_fu_160_ap_return,
        ap_ce => grp_rgb2ycbcr_fu_160_ap_ce);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_continue)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_lv1_1 = ap_CS_fsm_state8))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))) and not((ap_const_lv1_0 = exitcond_flatten_fu_173_p2)))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))) and (ap_const_lv1_0 = exitcond_flatten_fu_173_p2))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_1;
                elsif ((((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1))) or ((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))) and not((ap_const_lv1_0 = exitcond_flatten_fu_173_p2))))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if (not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1))))) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if (not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1))))) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if (not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1))))) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if (not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1))))) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                elsif (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then 
                    ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    indvar_flatten_reg_149_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_enable_reg_pp0_iter0) and (ap_const_lv1_0 = exitcond_flatten_fu_173_p2))) then 
                indvar_flatten_reg_149 <= indvar_flatten_next_fu_179_p2;
            elsif (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then 
                indvar_flatten_reg_149 <= ap_const_lv19_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))))) then
                ap_pipeline_reg_pp0_iter1_exitcond_flatten_reg_236 <= exitcond_flatten_reg_236;
                exitcond_flatten_reg_236 <= exitcond_flatten_fu_173_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1))))) then
                ap_pipeline_reg_pp0_iter2_exitcond_flatten_reg_236 <= ap_pipeline_reg_pp0_iter1_exitcond_flatten_reg_236;
                ap_pipeline_reg_pp0_iter2_tmp_10_reg_251 <= tmp_10_reg_251;
                ap_pipeline_reg_pp0_iter2_tmp_11_reg_257 <= tmp_11_reg_257;
                ap_pipeline_reg_pp0_iter2_tmp_9_reg_245 <= tmp_9_reg_245;
                ap_pipeline_reg_pp0_iter3_exitcond_flatten_reg_236 <= ap_pipeline_reg_pp0_iter2_exitcond_flatten_reg_236;
                ap_pipeline_reg_pp0_iter3_tmp_10_reg_251 <= ap_pipeline_reg_pp0_iter2_tmp_10_reg_251;
                ap_pipeline_reg_pp0_iter3_tmp_11_reg_257 <= ap_pipeline_reg_pp0_iter2_tmp_11_reg_257;
                ap_pipeline_reg_pp0_iter3_tmp_9_reg_245 <= ap_pipeline_reg_pp0_iter2_tmp_9_reg_245;
                ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236 <= ap_pipeline_reg_pp0_iter3_exitcond_flatten_reg_236;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))) and (ap_const_lv1_0 = ap_pipeline_reg_pp0_iter3_exitcond_flatten_reg_236))) then
                b_V_reg_263 <= b_V_fu_185_p3;
                g_V_reg_268 <= g_V_fu_192_p3;
                r_V_reg_273 <= r_V_fu_199_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then
                cb_lower_read_reg_216 <= cb_lower_dout;
                cb_upper_read_reg_221 <= cb_upper_dout;
                cr_lower_read_reg_226 <= cr_lower_dout;
                cr_upper_read_reg_231 <= cr_upper_dout;
                y_lower_read_reg_206 <= y_lower_dout;
                y_upper_read_reg_211 <= y_upper_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and (exitcond_flatten_reg_236 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))))) then
                tmp_10_reg_251 <= p_src_data_stream_1_V_dout;
                tmp_11_reg_257 <= p_src_data_stream_2_V_dout;
                tmp_9_reg_245 <= p_src_data_stream_0_V_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter5, ap_condition_126, exitcond_flatten_fu_173_p2, ap_condition_150, ap_condition_161, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (not((ap_condition_126 = ap_const_boolean_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))) and not((ap_const_logic_1 = ap_enable_reg_pp0_iter4)))) and not((not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_enable_reg_pp0_iter0) and not((ap_const_lv1_0 = exitcond_flatten_fu_173_p2)) and not((ap_const_logic_1 = ap_enable_reg_pp0_iter1)))))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))) and not((ap_const_logic_1 = ap_enable_reg_pp0_iter4))) or (not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_enable_reg_pp0_iter0) and not((ap_const_lv1_0 = exitcond_flatten_fu_173_p2)) and not((ap_const_logic_1 = ap_enable_reg_pp0_iter1))))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1 downto 1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0 downto 0);
    ap_CS_fsm_state8 <= ap_CS_fsm(2 downto 2);

    ap_condition_126_assign_proc : process(ap_start, ap_done_reg, y_lower_empty_n, y_upper_empty_n, cb_lower_empty_n, cb_upper_empty_n, cr_lower_empty_n, cr_upper_empty_n)
    begin
                ap_condition_126 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (y_lower_empty_n = ap_const_logic_0) or (y_upper_empty_n = ap_const_logic_0) or (cb_lower_empty_n = ap_const_logic_0) or (cb_upper_empty_n = ap_const_logic_0) or (cr_lower_empty_n = ap_const_logic_0) or (cr_upper_empty_n = ap_const_logic_0));
    end process;


    ap_condition_150_assign_proc : process(p_src_data_stream_0_V_empty_n, p_src_data_stream_1_V_empty_n, p_src_data_stream_2_V_empty_n, exitcond_flatten_reg_236)
    begin
                ap_condition_150 <= (((exitcond_flatten_reg_236 = ap_const_lv1_0) and (p_src_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_236 = ap_const_lv1_0) and (p_src_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_236 = ap_const_lv1_0) and (p_src_data_stream_2_V_empty_n = ap_const_logic_0)));
    end process;


    ap_condition_161_assign_proc : process(p_dst_data_stream_0_V_full_n, p_dst_data_stream_1_V_full_n, p_dst_data_stream_2_V_full_n, ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236)
    begin
                ap_condition_161 <= (((ap_const_lv1_0 = ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236) and (p_dst_data_stream_0_V_full_n = ap_const_logic_0)) or ((ap_const_lv1_0 = ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236) and (p_dst_data_stream_1_V_full_n = ap_const_logic_0)) or ((ap_const_lv1_0 = ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236) and (p_dst_data_stream_2_V_full_n = ap_const_logic_0)));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state8)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_lv1_1 = ap_CS_fsm_state8)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_CS_fsm_state1 = ap_const_lv1_1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state8)
    begin
        if (((ap_const_lv1_1 = ap_CS_fsm_state8))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    b_V_fu_185_p3 <= 
        ap_pipeline_reg_pp0_iter3_tmp_9_reg_245 when (grp_rgb2ycbcr_fu_160_ap_return(0) = '1') else 
        ap_const_lv8_0;

    cb_lower_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cb_lower_empty_n)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))))) then 
            cb_lower_blk_n <= cb_lower_empty_n;
        else 
            cb_lower_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    cb_lower_read_assign_proc : process(ap_CS_fsm_state1, ap_condition_126)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then 
            cb_lower_read <= ap_const_logic_1;
        else 
            cb_lower_read <= ap_const_logic_0;
        end if; 
    end process;


    cb_upper_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cb_upper_empty_n)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))))) then 
            cb_upper_blk_n <= cb_upper_empty_n;
        else 
            cb_upper_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    cb_upper_read_assign_proc : process(ap_CS_fsm_state1, ap_condition_126)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then 
            cb_upper_read <= ap_const_logic_1;
        else 
            cb_upper_read <= ap_const_logic_0;
        end if; 
    end process;


    cr_lower_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cr_lower_empty_n)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))))) then 
            cr_lower_blk_n <= cr_lower_empty_n;
        else 
            cr_lower_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    cr_lower_read_assign_proc : process(ap_CS_fsm_state1, ap_condition_126)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then 
            cr_lower_read <= ap_const_logic_1;
        else 
            cr_lower_read <= ap_const_logic_0;
        end if; 
    end process;


    cr_upper_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cr_upper_empty_n)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))))) then 
            cr_upper_blk_n <= cr_upper_empty_n;
        else 
            cr_upper_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    cr_upper_read_assign_proc : process(ap_CS_fsm_state1, ap_condition_126)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then 
            cr_upper_read <= ap_const_logic_1;
        else 
            cr_upper_read <= ap_const_logic_0;
        end if; 
    end process;

    exitcond_flatten_fu_173_p2 <= "1" when (indvar_flatten_reg_149 = ap_const_lv19_4B000) else "0";
    g_V_fu_192_p3 <= 
        ap_pipeline_reg_pp0_iter3_tmp_10_reg_251 when (grp_rgb2ycbcr_fu_160_ap_return(0) = '1') else 
        ap_const_lv8_0;

    grp_rgb2ycbcr_fu_160_ap_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter5, ap_condition_150, ap_condition_161)
    begin
        if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))))) then 
            grp_rgb2ycbcr_fu_160_ap_ce <= ap_const_logic_1;
        else 
            grp_rgb2ycbcr_fu_160_ap_ce <= ap_const_logic_0;
        end if; 
    end process;

    indvar_flatten_next_fu_179_p2 <= std_logic_vector(unsigned(indvar_flatten_reg_149) + unsigned(ap_const_lv19_1));

    p_dst_data_stream_0_V_blk_n_assign_proc : process(p_dst_data_stream_0_V_full_n, ap_enable_reg_pp0_iter5, ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236)
    begin
        if (((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_const_lv1_0 = ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236))) then 
            p_dst_data_stream_0_V_blk_n <= p_dst_data_stream_0_V_full_n;
        else 
            p_dst_data_stream_0_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    p_dst_data_stream_0_V_din <= b_V_reg_263;

    p_dst_data_stream_0_V_write_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter5, ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236, ap_condition_150, ap_condition_161)
    begin
        if (((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_const_lv1_0 = ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))))) then 
            p_dst_data_stream_0_V_write <= ap_const_logic_1;
        else 
            p_dst_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;


    p_dst_data_stream_1_V_blk_n_assign_proc : process(p_dst_data_stream_1_V_full_n, ap_enable_reg_pp0_iter5, ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236)
    begin
        if (((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_const_lv1_0 = ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236))) then 
            p_dst_data_stream_1_V_blk_n <= p_dst_data_stream_1_V_full_n;
        else 
            p_dst_data_stream_1_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    p_dst_data_stream_1_V_din <= g_V_reg_268;

    p_dst_data_stream_1_V_write_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter5, ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236, ap_condition_150, ap_condition_161)
    begin
        if (((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_const_lv1_0 = ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))))) then 
            p_dst_data_stream_1_V_write <= ap_const_logic_1;
        else 
            p_dst_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;


    p_dst_data_stream_2_V_blk_n_assign_proc : process(p_dst_data_stream_2_V_full_n, ap_enable_reg_pp0_iter5, ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236)
    begin
        if (((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_const_lv1_0 = ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236))) then 
            p_dst_data_stream_2_V_blk_n <= p_dst_data_stream_2_V_full_n;
        else 
            p_dst_data_stream_2_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    p_dst_data_stream_2_V_din <= r_V_reg_273;

    p_dst_data_stream_2_V_write_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter5, ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236, ap_condition_150, ap_condition_161)
    begin
        if (((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_const_lv1_0 = ap_pipeline_reg_pp0_iter4_exitcond_flatten_reg_236) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))))) then 
            p_dst_data_stream_2_V_write <= ap_const_logic_1;
        else 
            p_dst_data_stream_2_V_write <= ap_const_logic_0;
        end if; 
    end process;


    p_src_data_stream_0_V_blk_n_assign_proc : process(p_src_data_stream_0_V_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_236)
    begin
        if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (exitcond_flatten_reg_236 = ap_const_lv1_0))) then 
            p_src_data_stream_0_V_blk_n <= p_src_data_stream_0_V_empty_n;
        else 
            p_src_data_stream_0_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    p_src_data_stream_0_V_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_236, ap_enable_reg_pp0_iter5, ap_condition_150, ap_condition_161)
    begin
        if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (exitcond_flatten_reg_236 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))))) then 
            p_src_data_stream_0_V_read <= ap_const_logic_1;
        else 
            p_src_data_stream_0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    p_src_data_stream_1_V_blk_n_assign_proc : process(p_src_data_stream_1_V_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_236)
    begin
        if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (exitcond_flatten_reg_236 = ap_const_lv1_0))) then 
            p_src_data_stream_1_V_blk_n <= p_src_data_stream_1_V_empty_n;
        else 
            p_src_data_stream_1_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    p_src_data_stream_1_V_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_236, ap_enable_reg_pp0_iter5, ap_condition_150, ap_condition_161)
    begin
        if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (exitcond_flatten_reg_236 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))))) then 
            p_src_data_stream_1_V_read <= ap_const_logic_1;
        else 
            p_src_data_stream_1_V_read <= ap_const_logic_0;
        end if; 
    end process;


    p_src_data_stream_2_V_blk_n_assign_proc : process(p_src_data_stream_2_V_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_236)
    begin
        if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (exitcond_flatten_reg_236 = ap_const_lv1_0))) then 
            p_src_data_stream_2_V_blk_n <= p_src_data_stream_2_V_empty_n;
        else 
            p_src_data_stream_2_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    p_src_data_stream_2_V_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_236, ap_enable_reg_pp0_iter5, ap_condition_150, ap_condition_161)
    begin
        if (((ap_const_lv1_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (exitcond_flatten_reg_236 = ap_const_lv1_0) and not((((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_condition_150 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter5) and (ap_condition_161 = ap_const_boolean_1)))))) then 
            p_src_data_stream_2_V_read <= ap_const_logic_1;
        else 
            p_src_data_stream_2_V_read <= ap_const_logic_0;
        end if; 
    end process;

    r_V_fu_199_p3 <= 
        ap_pipeline_reg_pp0_iter3_tmp_11_reg_257 when (grp_rgb2ycbcr_fu_160_ap_return(0) = '1') else 
        ap_const_lv8_0;

    y_lower_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, y_lower_empty_n)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))))) then 
            y_lower_blk_n <= y_lower_empty_n;
        else 
            y_lower_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    y_lower_read_assign_proc : process(ap_CS_fsm_state1, ap_condition_126)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then 
            y_lower_read <= ap_const_logic_1;
        else 
            y_lower_read <= ap_const_logic_0;
        end if; 
    end process;


    y_upper_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, y_upper_empty_n)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))))) then 
            y_upper_blk_n <= y_upper_empty_n;
        else 
            y_upper_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    y_upper_read_assign_proc : process(ap_CS_fsm_state1, ap_condition_126)
    begin
        if (((ap_CS_fsm_state1 = ap_const_lv1_1) and not((ap_condition_126 = ap_const_boolean_1)))) then 
            y_upper_read <= ap_const_logic_1;
        else 
            y_upper_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;