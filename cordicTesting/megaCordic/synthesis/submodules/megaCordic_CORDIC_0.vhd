-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 19.1 (Release Build #670)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2019 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from megaCordic_CORDIC_0
-- VHDL created on Mon Mar 15 16:02:10 2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity megaCordic_CORDIC_0 is
    port (
        x : in std_logic_vector(15 downto 0);  -- sfix16_en14
        y : in std_logic_vector(15 downto 0);  -- sfix16_en14
        a : in std_logic_vector(16 downto 0);  -- sfix17_en14
        xo : out std_logic_vector(9 downto 0);  -- sfix10_en8
        yo : out std_logic_vector(9 downto 0);  -- sfix10_en8
        clk : in std_logic;
        areset : in std_logic
    );
end megaCordic_CORDIC_0;

architecture normal of megaCordic_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signA_uid7_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstPiO2_uid8_vecRotateTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeA_uid9_vecRotateTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeA_uid9_vecRotateTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highABits_uid10_vecRotateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal absAEhigh_uid11_vecRotateTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal absAEhigh_uid11_vecRotateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal absAEhigh_uid11_vecRotateTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal absAEhigh_uid11_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absAEhigh_uid11_vecRotateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal absAE_uid12_vecRotateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal invMsbuAbsAE_uid14_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal firstQuadrantCond1_uid15_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignA_uid16_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal firstQuadrantCond0_uid17_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal firstQuadrant_uid18_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aInFirstQuadrant_uid19_vecRotateTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aInFirstQuadrant_uid19_vecRotateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal absA_uid21_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absA_uid21_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal padACst_uid22_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal aPostPad_uid23_vecRotateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal mx_uid24_vecRotateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal mx_uid24_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal mx_uid24_vecRotateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal mx_uid24_vecRotateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal mxR_uid25_vecRotateTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal mxR_uid25_vecRotateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal my_uid28_vecRotateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal my_uid28_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal my_uid28_vecRotateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal my_uid28_vecRotateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal myR_uid29_vecRotateTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal myR_uid29_vecRotateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal concSignAFirstQuadrant_uid30_vecRotateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal absX_uid31_vecRotateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal absX_uid31_vecRotateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal absY_uid32_vecRotateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal absY_uid32_vecRotateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xMSB_uid34_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid36_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_0_uid39_vecRotateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_1_uid41_vecRotateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_1_uid41_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_1_uid41_vecRotateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_1_uid41_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_1_uid41_vecRotateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_1_uid42_vecRotateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1E_1_uid42_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1E_1_uid42_vecRotateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1E_1_uid42_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_1_uid42_vecRotateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_1CostZeroPaddingA_uid44_vecRotateTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aip1E_1NA_uid45_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_1sumAHighB_uid46_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid46_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid46_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid46_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1sumAHighB_uid46_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_uid49_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid49_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid50_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid52_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_1_uid55_vecRotateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2NA_uid58_vecRotateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2sumAHighB_uid59_vecRotateTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_2sumAHighB_uid59_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_2sumAHighB_uid59_vecRotateTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_2sumAHighB_uid59_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2sumAHighB_uid59_vecRotateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_2NA_uid61_vecRotateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1E_2sumAHighB_uid62_vecRotateTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2sumAHighB_uid62_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2sumAHighB_uid62_vecRotateTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2sumAHighB_uid62_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2sumAHighB_uid62_vecRotateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_2_uid64_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid64_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid64_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid64_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2_uid64_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_2_uid65_vecRotateTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_2_uid65_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1_2_uid66_vecRotateTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1_2_uid66_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_uid67_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid67_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid68_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid70_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_2_uid73_vecRotateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_3CostZeroPaddingA_uid75_vecRotateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal xip1E_3NA_uid76_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_3sumAHighB_uid77_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_3sumAHighB_uid77_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_3sumAHighB_uid77_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_3sumAHighB_uid77_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3sumAHighB_uid77_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_3NA_uid79_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_3sumAHighB_uid80_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3sumAHighB_uid80_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3sumAHighB_uid80_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3sumAHighB_uid80_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3sumAHighB_uid80_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_3_uid82_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_3_uid82_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_3_uid82_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_3_uid82_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3_uid82_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_3_uid83_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_3_uid83_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_3_uid84_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_3_uid84_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid85_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid85_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid86_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid88_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_3_uid91_vecRotateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_4CostZeroPaddingA_uid93_vecRotateTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal xip1E_4NA_uid94_vecRotateTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_4sumAHighB_uid95_vecRotateTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4sumAHighB_uid95_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4sumAHighB_uid95_vecRotateTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4sumAHighB_uid95_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4sumAHighB_uid95_vecRotateTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_4NA_uid97_vecRotateTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_4sumAHighB_uid98_vecRotateTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4sumAHighB_uid98_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4sumAHighB_uid98_vecRotateTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4sumAHighB_uid98_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4sumAHighB_uid98_vecRotateTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_4_uid100_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_4_uid100_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_4_uid100_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_4_uid100_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4_uid100_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_4_uid101_vecRotateTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_4_uid101_vecRotateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_4_uid102_vecRotateTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_4_uid102_vecRotateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid103_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid103_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid104_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid106_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_4_uid109_vecRotateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_5CostZeroPaddingA_uid111_vecRotateTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal xip1E_5NA_uid112_vecRotateTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_5sumAHighB_uid113_vecRotateTest_a : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_5sumAHighB_uid113_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_5sumAHighB_uid113_vecRotateTest_o : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_5sumAHighB_uid113_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5sumAHighB_uid113_vecRotateTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1E_5NA_uid115_vecRotateTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_5sumAHighB_uid116_vecRotateTest_a : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_5sumAHighB_uid116_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_5sumAHighB_uid116_vecRotateTest_o : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_5sumAHighB_uid116_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5sumAHighB_uid116_vecRotateTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_5_uid118_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_5_uid118_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_5_uid118_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_5_uid118_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5_uid118_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_5_uid119_vecRotateTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1_5_uid119_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1_5_uid120_vecRotateTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1_5_uid120_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_uid121_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid121_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid122_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid124_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid127_vecRotateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal twoToMiSiYip_uid128_vecRotateTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal cstArcTan2Mi_5_uid129_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_6NA_uid132_vecRotateTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_6sumAHighB_uid133_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_6sumAHighB_uid133_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_6sumAHighB_uid133_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_6sumAHighB_uid133_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6sumAHighB_uid133_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_6NA_uid135_vecRotateTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_6sumAHighB_uid136_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_6sumAHighB_uid136_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_6sumAHighB_uid136_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_6sumAHighB_uid136_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6sumAHighB_uid136_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_6_uid138_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_6_uid138_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_6_uid138_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_6_uid138_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6_uid138_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_6_uid139_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_6_uid139_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_6_uid140_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_6_uid140_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_uid141_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid141_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid142_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid144_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid147_vecRotateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal twoToMiSiYip_uid148_vecRotateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal cstArcTan2Mi_6_uid149_vecRotateTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_7_uid151_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_7_uid151_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_7_uid151_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_7_uid151_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid151_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_7_uid152_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_7_uid152_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_7_uid152_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_7_uid152_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid152_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal lowRangeA_uid154_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid154_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid155_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_7high_uid156_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_7high_uid156_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_7high_uid156_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_7high_uid156_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7high_uid156_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_7_uid157_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_7_uid158_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_7_uid158_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_7_uid159_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_7_uid159_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_uid160_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid160_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid161_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid163_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid166_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal twoToMiSiYip_uid167_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal cstArcTan2Mi_7_uid168_vecRotateTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xip1E_8_uid170_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_8_uid170_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_8_uid170_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_8_uid170_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid170_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_8_uid171_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_8_uid171_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_8_uid171_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_8_uid171_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid171_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal lowRangeA_uid173_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid173_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid174_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_8high_uid175_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8high_uid175_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8high_uid175_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8high_uid175_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8high_uid175_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_8_uid176_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_8_uid177_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_8_uid177_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_8_uid178_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_8_uid178_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_uid179_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid179_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid180_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid182_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid185_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal twoToMiSiYip_uid186_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cstArcTan2Mi_8_uid187_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xip1E_9_uid189_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_9_uid189_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_9_uid189_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_9_uid189_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid189_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_9_uid190_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_9_uid190_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_9_uid190_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_9_uid190_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid190_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal lowRangeA_uid192_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid192_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid193_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_9high_uid194_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_9high_uid194_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_9high_uid194_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_9high_uid194_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9high_uid194_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_9_uid195_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_9_uid196_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_9_uid196_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_9_uid197_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_9_uid197_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_uid198_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid198_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid199_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid201_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid204_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid205_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal cstArcTan2Mi_9_uid206_vecRotateTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal xip1E_10_uid208_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_10_uid208_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_10_uid208_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_10_uid208_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid208_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_10_uid209_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_10_uid209_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_10_uid209_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_10_uid209_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid209_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal lowRangeA_uid211_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid211_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid212_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_10high_uid213_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_10high_uid213_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_10high_uid213_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_10high_uid213_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10high_uid213_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_10_uid214_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_10_uid215_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_10_uid215_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_10_uid216_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_10_uid216_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_uid217_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid217_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid218_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid220_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid223_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal twoToMiSiYip_uid224_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal cstArcTan2Mi_10_uid225_vecRotateTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal xip1E_11_uid227_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_11_uid227_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_11_uid227_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_11_uid227_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid227_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_11_uid228_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_11_uid228_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_11_uid228_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_11_uid228_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid228_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal lowRangeA_uid230_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid230_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid231_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_11high_uid232_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_11high_uid232_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_11high_uid232_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_11high_uid232_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11high_uid232_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_11_uid233_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_11_uid234_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_11_uid234_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_11_uid235_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_11_uid235_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_uid236_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid236_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid237_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid239_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid242_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal twoToMiSiYip_uid243_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_12_uid246_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_12_uid246_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_12_uid246_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_12_uid246_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid246_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_12_uid247_vecRotateTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_12_uid247_vecRotateTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_12_uid247_vecRotateTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_12_uid247_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_12_uid247_vecRotateTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1_12_uid253_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_12_uid253_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_12_uid254_vecRotateTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1_12_uid254_vecRotateTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal outX_uid259_vecRotateTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal outX_uid259_vecRotateTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal outY_uid261_vecRotateTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal outY_uid261_vecRotateTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal outXE_uid258_vecRotateTest_shift0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal outXE_uid258_vecRotateTest_shift0_qint : STD_LOGIC_VECTOR (32 downto 0);
    signal outXE_uid258_vecRotateTest_add_1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal outXE_uid258_vecRotateTest_add_1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal outXE_uid258_vecRotateTest_add_1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal outXE_uid258_vecRotateTest_add_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal outXE_uid258_vecRotateTest_shift2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal outXE_uid258_vecRotateTest_shift2_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal outXE_uid258_vecRotateTest_sub_3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal outXE_uid258_vecRotateTest_sub_3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal outXE_uid258_vecRotateTest_sub_3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal outXE_uid258_vecRotateTest_sub_3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal outXE_uid258_vecRotateTest_shift4_q : STD_LOGIC_VECTOR (39 downto 0);
    signal outXE_uid258_vecRotateTest_shift4_qint : STD_LOGIC_VECTOR (39 downto 0);
    signal outXE_uid258_vecRotateTest_sub_5_a : STD_LOGIC_VECTOR (40 downto 0);
    signal outXE_uid258_vecRotateTest_sub_5_b : STD_LOGIC_VECTOR (40 downto 0);
    signal outXE_uid258_vecRotateTest_sub_5_o : STD_LOGIC_VECTOR (40 downto 0);
    signal outXE_uid258_vecRotateTest_sub_5_q : STD_LOGIC_VECTOR (40 downto 0);
    signal outXE_uid258_vecRotateTest_shift6_q : STD_LOGIC_VECTOR (40 downto 0);
    signal outXE_uid258_vecRotateTest_shift6_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal outXE_uid258_vecRotateTest_add_7_a : STD_LOGIC_VECTOR (41 downto 0);
    signal outXE_uid258_vecRotateTest_add_7_b : STD_LOGIC_VECTOR (41 downto 0);
    signal outXE_uid258_vecRotateTest_add_7_o : STD_LOGIC_VECTOR (41 downto 0);
    signal outXE_uid258_vecRotateTest_add_7_q : STD_LOGIC_VECTOR (41 downto 0);
    signal lowRangeA_uid303_outXE_uid258_vecRotateTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal lowRangeA_uid303_outXE_uid258_vecRotateTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal highABits_uid304_outXE_uid258_vecRotateTest_in : STD_LOGIC_VECTOR (42 downto 0);
    signal highABits_uid304_outXE_uid258_vecRotateTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal srPostRndhigh_uid305_outXE_uid258_vecRotateTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid305_outXE_uid258_vecRotateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid305_outXE_uid258_vecRotateTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid305_outXE_uid258_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal srPostRnd_uid306_outXE_uid258_vecRotateTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal maxValInOutFormat_uid307_outXE_uid258_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal minValueInFormat_uid308_outXE_uid258_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal paddingX_uid309_outXE_uid258_vecRotateTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal updatedX_uid310_outXE_uid258_vecRotateTest_q : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid309_outXE_uid258_vecRotateTest_a : STD_LOGIC_VECTOR (45 downto 0);
    signal ovf_uid309_outXE_uid258_vecRotateTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal ovf_uid309_outXE_uid258_vecRotateTest_o : STD_LOGIC_VECTOR (45 downto 0);
    signal ovf_uid309_outXE_uid258_vecRotateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid313_outXE_uid258_vecRotateTest_q : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid312_outXE_uid258_vecRotateTest_a : STD_LOGIC_VECTOR (45 downto 0);
    signal udf_uid312_outXE_uid258_vecRotateTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal udf_uid312_outXE_uid258_vecRotateTest_o : STD_LOGIC_VECTOR (45 downto 0);
    signal udf_uid312_outXE_uid258_vecRotateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid315_outXE_uid258_vecRotateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid316_outXE_uid258_vecRotateTest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal sR_uid316_outXE_uid258_vecRotateTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal sRA1_uid317_outXE_uid258_vecRotateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA1_uid317_outXE_uid258_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal outYE_uid260_vecRotateTest_shift0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal outYE_uid260_vecRotateTest_shift0_qint : STD_LOGIC_VECTOR (32 downto 0);
    signal outYE_uid260_vecRotateTest_add_1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal outYE_uid260_vecRotateTest_add_1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal outYE_uid260_vecRotateTest_add_1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal outYE_uid260_vecRotateTest_add_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal outYE_uid260_vecRotateTest_shift2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal outYE_uid260_vecRotateTest_shift2_qint : STD_LOGIC_VECTOR (31 downto 0);
    signal outYE_uid260_vecRotateTest_sub_3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal outYE_uid260_vecRotateTest_sub_3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal outYE_uid260_vecRotateTest_sub_3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal outYE_uid260_vecRotateTest_sub_3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal outYE_uid260_vecRotateTest_shift4_q : STD_LOGIC_VECTOR (39 downto 0);
    signal outYE_uid260_vecRotateTest_shift4_qint : STD_LOGIC_VECTOR (39 downto 0);
    signal outYE_uid260_vecRotateTest_sub_5_a : STD_LOGIC_VECTOR (40 downto 0);
    signal outYE_uid260_vecRotateTest_sub_5_b : STD_LOGIC_VECTOR (40 downto 0);
    signal outYE_uid260_vecRotateTest_sub_5_o : STD_LOGIC_VECTOR (40 downto 0);
    signal outYE_uid260_vecRotateTest_sub_5_q : STD_LOGIC_VECTOR (40 downto 0);
    signal outYE_uid260_vecRotateTest_shift6_q : STD_LOGIC_VECTOR (40 downto 0);
    signal outYE_uid260_vecRotateTest_shift6_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal outYE_uid260_vecRotateTest_add_7_a : STD_LOGIC_VECTOR (41 downto 0);
    signal outYE_uid260_vecRotateTest_add_7_b : STD_LOGIC_VECTOR (41 downto 0);
    signal outYE_uid260_vecRotateTest_add_7_o : STD_LOGIC_VECTOR (41 downto 0);
    signal outYE_uid260_vecRotateTest_add_7_q : STD_LOGIC_VECTOR (41 downto 0);
    signal lowRangeA_uid358_outYE_uid260_vecRotateTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal lowRangeA_uid358_outYE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal highABits_uid359_outYE_uid260_vecRotateTest_in : STD_LOGIC_VECTOR (42 downto 0);
    signal highABits_uid359_outYE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal srPostRndhigh_uid360_outYE_uid260_vecRotateTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid360_outYE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid360_outYE_uid260_vecRotateTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid360_outYE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal srPostRnd_uid361_outYE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal ovf_uid364_outYE_uid260_vecRotateTest_a : STD_LOGIC_VECTOR (45 downto 0);
    signal ovf_uid364_outYE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal ovf_uid364_outYE_uid260_vecRotateTest_o : STD_LOGIC_VECTOR (45 downto 0);
    signal ovf_uid364_outYE_uid260_vecRotateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal udf_uid367_outYE_uid260_vecRotateTest_a : STD_LOGIC_VECTOR (45 downto 0);
    signal udf_uid367_outYE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal udf_uid367_outYE_uid260_vecRotateTest_o : STD_LOGIC_VECTOR (45 downto 0);
    signal udf_uid367_outYE_uid260_vecRotateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid370_outYE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid371_outYE_uid260_vecRotateTest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal sR_uid371_outYE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal sRA1_uid372_outYE_uid260_vecRotateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA1_uid372_outYE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal msbUAbsAE_uid13_vecRotateTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal msbUAbsAE_uid13_vecRotateTest_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist2_sR_uid371_outYE_uid260_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist3_lowRangeA_uid358_outYE_uid260_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal redist4_sR_uid316_outXE_uid258_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist5_lowRangeA_uid303_outXE_uid258_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal redist6_yip1_12_uid254_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist7_yip1_12_uid254_vecRotateTest_b_3_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist8_xip1_12_uid253_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist9_xip1_12_uid253_vecRotateTest_b_3_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist10_xMSB_uid237_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_yip1_11_uid235_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist12_xip1_11_uid234_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist13_aip1E_uid217_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist14_yip1_10_uid216_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist15_xip1_10_uid215_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist16_aip1E_uid198_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist17_yip1_9_uid197_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist18_xip1_9_uid196_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist19_aip1E_uid179_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist20_yip1_8_uid178_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist21_xip1_8_uid177_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist22_aip1E_uid160_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist23_yip1_7_uid159_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist24_xip1_7_uid158_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist25_aip1E_uid141_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist26_yip1_6_uid140_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist27_xip1_6_uid139_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist28_aip1E_uid121_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist29_yip1_5_uid120_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist30_xip1_5_uid119_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist31_aip1E_uid103_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist32_yip1_4_uid102_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist33_xip1_4_uid101_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist34_aip1E_uid85_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist35_yip1_3_uid84_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist36_xip1_3_uid83_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist37_aip1E_uid67_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist38_yip1_2_uid66_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist39_xip1_2_uid65_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist40_aip1E_uid49_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist41_aInFirstQuadrant_uid19_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist42_signA_uid7_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_xIn_x_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist44_xIn_y_1_q : STD_LOGIC_VECTOR (15 downto 0);

begin


    -- maxValInOutFormat_uid307_outXE_uid258_vecRotateTest(CONSTANT,306)
    maxValInOutFormat_uid307_outXE_uid258_vecRotateTest_q <= "01111111111";

    -- minValueInFormat_uid308_outXE_uid258_vecRotateTest(CONSTANT,307)
    minValueInFormat_uid308_outXE_uid258_vecRotateTest_q <= "10000000000";

    -- xMSB_uid122_vecRotateTest(BITSELECT,121)@7
    xMSB_uid122_vecRotateTest_b <= STD_LOGIC_VECTOR(redist28_aip1E_uid121_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_5_uid129_vecRotateTest(CONSTANT,128)
    cstArcTan2Mi_5_uid129_vecRotateTest_q <= "01111111111101";

    -- xMSB_uid104_vecRotateTest(BITSELECT,103)@6
    xMSB_uid104_vecRotateTest_b <= STD_LOGIC_VECTOR(redist31_aip1E_uid103_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_4_uid109_vecRotateTest(CONSTANT,108)
    cstArcTan2Mi_4_uid109_vecRotateTest_q <= "011111111101011";

    -- xMSB_uid86_vecRotateTest(BITSELECT,85)@5
    xMSB_uid86_vecRotateTest_b <= STD_LOGIC_VECTOR(redist34_aip1E_uid85_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_3_uid91_vecRotateTest(CONSTANT,90)
    cstArcTan2Mi_3_uid91_vecRotateTest_q <= "0111111101010111";

    -- xMSB_uid68_vecRotateTest(BITSELECT,67)@4
    xMSB_uid68_vecRotateTest_b <= STD_LOGIC_VECTOR(redist37_aip1E_uid67_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_2_uid73_vecRotateTest(CONSTANT,72)
    cstArcTan2Mi_2_uid73_vecRotateTest_q <= "01111101011011100";

    -- xMSB_uid50_vecRotateTest(BITSELECT,49)@3
    xMSB_uid50_vecRotateTest_b <= STD_LOGIC_VECTOR(redist40_aip1E_uid49_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_1_uid55_vecRotateTest(CONSTANT,54)
    cstArcTan2Mi_1_uid55_vecRotateTest_q <= "011101101011000110";

    -- aInFirstQuadrant_uid19_vecRotateTest(BITSELECT,18)@0
    aInFirstQuadrant_uid19_vecRotateTest_in <= STD_LOGIC_VECTOR(a(15 downto 0));
    aInFirstQuadrant_uid19_vecRotateTest_b <= STD_LOGIC_VECTOR(aInFirstQuadrant_uid19_vecRotateTest_in(15 downto 2));

    -- redist41_aInFirstQuadrant_uid19_vecRotateTest_b_1(DELAY,415)
    redist41_aInFirstQuadrant_uid19_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aInFirstQuadrant_uid19_vecRotateTest_b, xout => redist41_aInFirstQuadrant_uid19_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- signA_uid7_vecRotateTest(BITSELECT,6)@0
    signA_uid7_vecRotateTest_b <= STD_LOGIC_VECTOR(a(16 downto 16));

    -- cstPiO2_uid8_vecRotateTest(CONSTANT,7)
    cstPiO2_uid8_vecRotateTest_q <= "1100100100010";

    -- highABits_uid10_vecRotateTest(BITSELECT,9)@0
    highABits_uid10_vecRotateTest_b <= STD_LOGIC_VECTOR(a(16 downto 2));

    -- absAEhigh_uid11_vecRotateTest(ADDSUB,10)@0
    absAEhigh_uid11_vecRotateTest_s <= signA_uid7_vecRotateTest_b;
    absAEhigh_uid11_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => highABits_uid10_vecRotateTest_b(14)) & highABits_uid10_vecRotateTest_b));
    absAEhigh_uid11_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & cstPiO2_uid8_vecRotateTest_q));
    absAEhigh_uid11_vecRotateTest_combproc: PROCESS (absAEhigh_uid11_vecRotateTest_a, absAEhigh_uid11_vecRotateTest_b, absAEhigh_uid11_vecRotateTest_s)
    BEGIN
        IF (absAEhigh_uid11_vecRotateTest_s = "1") THEN
            absAEhigh_uid11_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(absAEhigh_uid11_vecRotateTest_a) + SIGNED(absAEhigh_uid11_vecRotateTest_b));
        ELSE
            absAEhigh_uid11_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(absAEhigh_uid11_vecRotateTest_a) - SIGNED(absAEhigh_uid11_vecRotateTest_b));
        END IF;
    END PROCESS;
    absAEhigh_uid11_vecRotateTest_q <= absAEhigh_uid11_vecRotateTest_o(15 downto 0);

    -- lowRangeA_uid9_vecRotateTest(BITSELECT,8)@0
    lowRangeA_uid9_vecRotateTest_in <= a(1 downto 0);
    lowRangeA_uid9_vecRotateTest_b <= lowRangeA_uid9_vecRotateTest_in(1 downto 0);

    -- absAE_uid12_vecRotateTest(BITJOIN,11)@0
    absAE_uid12_vecRotateTest_q <= absAEhigh_uid11_vecRotateTest_q & lowRangeA_uid9_vecRotateTest_b;

    -- msbUAbsAE_uid13_vecRotateTest_merged_bit_select(BITSELECT,373)@0
    msbUAbsAE_uid13_vecRotateTest_merged_bit_select_b <= STD_LOGIC_VECTOR(absAE_uid12_vecRotateTest_q(17 downto 17));
    msbUAbsAE_uid13_vecRotateTest_merged_bit_select_c <= STD_LOGIC_VECTOR(absAE_uid12_vecRotateTest_q(15 downto 2));

    -- redist1_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_c_1(DELAY,375)
    redist1_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => msbUAbsAE_uid13_vecRotateTest_merged_bit_select_c, xout => redist1_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist0_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_b_1(DELAY,374)
    redist0_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => msbUAbsAE_uid13_vecRotateTest_merged_bit_select_b, xout => redist0_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- invMsbuAbsAE_uid14_vecRotateTest(LOGICAL,13)@1
    invMsbuAbsAE_uid14_vecRotateTest_q <= not (redist0_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_b_1_q);

    -- redist42_signA_uid7_vecRotateTest_b_1(DELAY,416)
    redist42_signA_uid7_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signA_uid7_vecRotateTest_b, xout => redist42_signA_uid7_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- firstQuadrantCond1_uid15_vecRotateTest(LOGICAL,14)@1
    firstQuadrantCond1_uid15_vecRotateTest_q <= redist42_signA_uid7_vecRotateTest_b_1_q and invMsbuAbsAE_uid14_vecRotateTest_q;

    -- invSignA_uid16_vecRotateTest(LOGICAL,15)@1
    invSignA_uid16_vecRotateTest_q <= not (redist42_signA_uid7_vecRotateTest_b_1_q);

    -- firstQuadrantCond0_uid17_vecRotateTest(LOGICAL,16)@1
    firstQuadrantCond0_uid17_vecRotateTest_q <= invSignA_uid16_vecRotateTest_q and redist0_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_b_1_q;

    -- firstQuadrant_uid18_vecRotateTest(LOGICAL,17)@1
    firstQuadrant_uid18_vecRotateTest_q <= firstQuadrantCond0_uid17_vecRotateTest_q or firstQuadrantCond1_uid15_vecRotateTest_q;

    -- absA_uid21_vecRotateTest(MUX,20)@1 + 1
    absA_uid21_vecRotateTest_s <= firstQuadrant_uid18_vecRotateTest_q;
    absA_uid21_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            absA_uid21_vecRotateTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (absA_uid21_vecRotateTest_s) IS
                WHEN "0" => absA_uid21_vecRotateTest_q <= redist1_msbUAbsAE_uid13_vecRotateTest_merged_bit_select_c_1_q;
                WHEN "1" => absA_uid21_vecRotateTest_q <= redist41_aInFirstQuadrant_uid19_vecRotateTest_b_1_q;
                WHEN OTHERS => absA_uid21_vecRotateTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- xMSB_uid34_vecRotateTest(BITSELECT,33)@2
    xMSB_uid34_vecRotateTest_b <= STD_LOGIC_VECTOR(absA_uid21_vecRotateTest_q(13 downto 13));

    -- cstArcTan2Mi_0_uid39_vecRotateTest(CONSTANT,38)
    cstArcTan2Mi_0_uid39_vecRotateTest_q <= "0110010010000111111";

    -- aip1E_1CostZeroPaddingA_uid44_vecRotateTest(CONSTANT,43)
    aip1E_1CostZeroPaddingA_uid44_vecRotateTest_q <= "000000";

    -- aip1E_1NA_uid45_vecRotateTest(BITJOIN,44)@2
    aip1E_1NA_uid45_vecRotateTest_q <= absA_uid21_vecRotateTest_q & aip1E_1CostZeroPaddingA_uid44_vecRotateTest_q;

    -- aip1E_1sumAHighB_uid46_vecRotateTest(ADDSUB,45)@2
    aip1E_1sumAHighB_uid46_vecRotateTest_s <= xMSB_uid34_vecRotateTest_b;
    aip1E_1sumAHighB_uid46_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => aip1E_1NA_uid45_vecRotateTest_q(19)) & aip1E_1NA_uid45_vecRotateTest_q));
    aip1E_1sumAHighB_uid46_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 19 => cstArcTan2Mi_0_uid39_vecRotateTest_q(18)) & cstArcTan2Mi_0_uid39_vecRotateTest_q));
    aip1E_1sumAHighB_uid46_vecRotateTest_combproc: PROCESS (aip1E_1sumAHighB_uid46_vecRotateTest_a, aip1E_1sumAHighB_uid46_vecRotateTest_b, aip1E_1sumAHighB_uid46_vecRotateTest_s)
    BEGIN
        IF (aip1E_1sumAHighB_uid46_vecRotateTest_s = "1") THEN
            aip1E_1sumAHighB_uid46_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid46_vecRotateTest_a) + SIGNED(aip1E_1sumAHighB_uid46_vecRotateTest_b));
        ELSE
            aip1E_1sumAHighB_uid46_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid46_vecRotateTest_a) - SIGNED(aip1E_1sumAHighB_uid46_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_1sumAHighB_uid46_vecRotateTest_q <= aip1E_1sumAHighB_uid46_vecRotateTest_o(20 downto 0);

    -- aip1E_uid49_vecRotateTest(BITSELECT,48)@2
    aip1E_uid49_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_1sumAHighB_uid46_vecRotateTest_q(19 downto 0));
    aip1E_uid49_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid49_vecRotateTest_in(19 downto 0));

    -- redist40_aip1E_uid49_vecRotateTest_b_1(DELAY,414)
    redist40_aip1E_uid49_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid49_vecRotateTest_b, xout => redist40_aip1E_uid49_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_2_uid64_vecRotateTest(ADDSUB,63)@3
    aip1E_2_uid64_vecRotateTest_s <= xMSB_uid50_vecRotateTest_b;
    aip1E_2_uid64_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist40_aip1E_uid49_vecRotateTest_b_1_q(19)) & redist40_aip1E_uid49_vecRotateTest_b_1_q));
    aip1E_2_uid64_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 18 => cstArcTan2Mi_1_uid55_vecRotateTest_q(17)) & cstArcTan2Mi_1_uid55_vecRotateTest_q));
    aip1E_2_uid64_vecRotateTest_combproc: PROCESS (aip1E_2_uid64_vecRotateTest_a, aip1E_2_uid64_vecRotateTest_b, aip1E_2_uid64_vecRotateTest_s)
    BEGIN
        IF (aip1E_2_uid64_vecRotateTest_s = "1") THEN
            aip1E_2_uid64_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid64_vecRotateTest_a) + SIGNED(aip1E_2_uid64_vecRotateTest_b));
        ELSE
            aip1E_2_uid64_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid64_vecRotateTest_a) - SIGNED(aip1E_2_uid64_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_2_uid64_vecRotateTest_q <= aip1E_2_uid64_vecRotateTest_o(20 downto 0);

    -- aip1E_uid67_vecRotateTest(BITSELECT,66)@3
    aip1E_uid67_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_2_uid64_vecRotateTest_q(19 downto 0));
    aip1E_uid67_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid67_vecRotateTest_in(19 downto 0));

    -- redist37_aip1E_uid67_vecRotateTest_b_1(DELAY,411)
    redist37_aip1E_uid67_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid67_vecRotateTest_b, xout => redist37_aip1E_uid67_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_3_uid82_vecRotateTest(ADDSUB,81)@4
    aip1E_3_uid82_vecRotateTest_s <= xMSB_uid68_vecRotateTest_b;
    aip1E_3_uid82_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist37_aip1E_uid67_vecRotateTest_b_1_q(19)) & redist37_aip1E_uid67_vecRotateTest_b_1_q));
    aip1E_3_uid82_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 17 => cstArcTan2Mi_2_uid73_vecRotateTest_q(16)) & cstArcTan2Mi_2_uid73_vecRotateTest_q));
    aip1E_3_uid82_vecRotateTest_combproc: PROCESS (aip1E_3_uid82_vecRotateTest_a, aip1E_3_uid82_vecRotateTest_b, aip1E_3_uid82_vecRotateTest_s)
    BEGIN
        IF (aip1E_3_uid82_vecRotateTest_s = "1") THEN
            aip1E_3_uid82_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid82_vecRotateTest_a) + SIGNED(aip1E_3_uid82_vecRotateTest_b));
        ELSE
            aip1E_3_uid82_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid82_vecRotateTest_a) - SIGNED(aip1E_3_uid82_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_3_uid82_vecRotateTest_q <= aip1E_3_uid82_vecRotateTest_o(20 downto 0);

    -- aip1E_uid85_vecRotateTest(BITSELECT,84)@4
    aip1E_uid85_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_3_uid82_vecRotateTest_q(19 downto 0));
    aip1E_uid85_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid85_vecRotateTest_in(19 downto 0));

    -- redist34_aip1E_uid85_vecRotateTest_b_1(DELAY,408)
    redist34_aip1E_uid85_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid85_vecRotateTest_b, xout => redist34_aip1E_uid85_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_4_uid100_vecRotateTest(ADDSUB,99)@5
    aip1E_4_uid100_vecRotateTest_s <= xMSB_uid86_vecRotateTest_b;
    aip1E_4_uid100_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist34_aip1E_uid85_vecRotateTest_b_1_q(19)) & redist34_aip1E_uid85_vecRotateTest_b_1_q));
    aip1E_4_uid100_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => cstArcTan2Mi_3_uid91_vecRotateTest_q(15)) & cstArcTan2Mi_3_uid91_vecRotateTest_q));
    aip1E_4_uid100_vecRotateTest_combproc: PROCESS (aip1E_4_uid100_vecRotateTest_a, aip1E_4_uid100_vecRotateTest_b, aip1E_4_uid100_vecRotateTest_s)
    BEGIN
        IF (aip1E_4_uid100_vecRotateTest_s = "1") THEN
            aip1E_4_uid100_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid100_vecRotateTest_a) + SIGNED(aip1E_4_uid100_vecRotateTest_b));
        ELSE
            aip1E_4_uid100_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid100_vecRotateTest_a) - SIGNED(aip1E_4_uid100_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_4_uid100_vecRotateTest_q <= aip1E_4_uid100_vecRotateTest_o(20 downto 0);

    -- aip1E_uid103_vecRotateTest(BITSELECT,102)@5
    aip1E_uid103_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_4_uid100_vecRotateTest_q(19 downto 0));
    aip1E_uid103_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid103_vecRotateTest_in(19 downto 0));

    -- redist31_aip1E_uid103_vecRotateTest_b_1(DELAY,405)
    redist31_aip1E_uid103_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid103_vecRotateTest_b, xout => redist31_aip1E_uid103_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_5_uid118_vecRotateTest(ADDSUB,117)@6
    aip1E_5_uid118_vecRotateTest_s <= xMSB_uid104_vecRotateTest_b;
    aip1E_5_uid118_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist31_aip1E_uid103_vecRotateTest_b_1_q(19)) & redist31_aip1E_uid103_vecRotateTest_b_1_q));
    aip1E_5_uid118_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 15 => cstArcTan2Mi_4_uid109_vecRotateTest_q(14)) & cstArcTan2Mi_4_uid109_vecRotateTest_q));
    aip1E_5_uid118_vecRotateTest_combproc: PROCESS (aip1E_5_uid118_vecRotateTest_a, aip1E_5_uid118_vecRotateTest_b, aip1E_5_uid118_vecRotateTest_s)
    BEGIN
        IF (aip1E_5_uid118_vecRotateTest_s = "1") THEN
            aip1E_5_uid118_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid118_vecRotateTest_a) + SIGNED(aip1E_5_uid118_vecRotateTest_b));
        ELSE
            aip1E_5_uid118_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid118_vecRotateTest_a) - SIGNED(aip1E_5_uid118_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_5_uid118_vecRotateTest_q <= aip1E_5_uid118_vecRotateTest_o(20 downto 0);

    -- aip1E_uid121_vecRotateTest(BITSELECT,120)@6
    aip1E_uid121_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_5_uid118_vecRotateTest_q(19 downto 0));
    aip1E_uid121_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid121_vecRotateTest_in(19 downto 0));

    -- redist28_aip1E_uid121_vecRotateTest_b_1(DELAY,402)
    redist28_aip1E_uid121_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid121_vecRotateTest_b, xout => redist28_aip1E_uid121_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_6_uid138_vecRotateTest(ADDSUB,137)@7
    aip1E_6_uid138_vecRotateTest_s <= xMSB_uid122_vecRotateTest_b;
    aip1E_6_uid138_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist28_aip1E_uid121_vecRotateTest_b_1_q(19)) & redist28_aip1E_uid121_vecRotateTest_b_1_q));
    aip1E_6_uid138_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 14 => cstArcTan2Mi_5_uid129_vecRotateTest_q(13)) & cstArcTan2Mi_5_uid129_vecRotateTest_q));
    aip1E_6_uid138_vecRotateTest_combproc: PROCESS (aip1E_6_uid138_vecRotateTest_a, aip1E_6_uid138_vecRotateTest_b, aip1E_6_uid138_vecRotateTest_s)
    BEGIN
        IF (aip1E_6_uid138_vecRotateTest_s = "1") THEN
            aip1E_6_uid138_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid138_vecRotateTest_a) + SIGNED(aip1E_6_uid138_vecRotateTest_b));
        ELSE
            aip1E_6_uid138_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid138_vecRotateTest_a) - SIGNED(aip1E_6_uid138_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_6_uid138_vecRotateTest_q <= aip1E_6_uid138_vecRotateTest_o(20 downto 0);

    -- aip1E_uid141_vecRotateTest(BITSELECT,140)@7
    aip1E_uid141_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_6_uid138_vecRotateTest_q(19 downto 0));
    aip1E_uid141_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid141_vecRotateTest_in(19 downto 0));

    -- redist25_aip1E_uid141_vecRotateTest_b_1(DELAY,399)
    redist25_aip1E_uid141_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid141_vecRotateTest_b, xout => redist25_aip1E_uid141_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid142_vecRotateTest(BITSELECT,141)@8
    xMSB_uid142_vecRotateTest_b <= STD_LOGIC_VECTOR(redist25_aip1E_uid141_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_6_uid149_vecRotateTest(CONSTANT,148)
    cstArcTan2Mi_6_uid149_vecRotateTest_q <= "0100000000000";

    -- highABits_uid155_vecRotateTest(BITSELECT,154)@8
    highABits_uid155_vecRotateTest_b <= STD_LOGIC_VECTOR(redist25_aip1E_uid141_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_7high_uid156_vecRotateTest(ADDSUB,155)@8
    aip1E_7high_uid156_vecRotateTest_s <= xMSB_uid142_vecRotateTest_b;
    aip1E_7high_uid156_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid155_vecRotateTest_b(18)) & highABits_uid155_vecRotateTest_b));
    aip1E_7high_uid156_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 13 => cstArcTan2Mi_6_uid149_vecRotateTest_q(12)) & cstArcTan2Mi_6_uid149_vecRotateTest_q));
    aip1E_7high_uid156_vecRotateTest_combproc: PROCESS (aip1E_7high_uid156_vecRotateTest_a, aip1E_7high_uid156_vecRotateTest_b, aip1E_7high_uid156_vecRotateTest_s)
    BEGIN
        IF (aip1E_7high_uid156_vecRotateTest_s = "1") THEN
            aip1E_7high_uid156_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid156_vecRotateTest_a) + SIGNED(aip1E_7high_uid156_vecRotateTest_b));
        ELSE
            aip1E_7high_uid156_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid156_vecRotateTest_a) - SIGNED(aip1E_7high_uid156_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_7high_uid156_vecRotateTest_q <= aip1E_7high_uid156_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid154_vecRotateTest(BITSELECT,153)@8
    lowRangeA_uid154_vecRotateTest_in <= redist25_aip1E_uid141_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid154_vecRotateTest_b <= lowRangeA_uid154_vecRotateTest_in(0 downto 0);

    -- aip1E_7_uid157_vecRotateTest(BITJOIN,156)@8
    aip1E_7_uid157_vecRotateTest_q <= aip1E_7high_uid156_vecRotateTest_q & lowRangeA_uid154_vecRotateTest_b;

    -- aip1E_uid160_vecRotateTest(BITSELECT,159)@8
    aip1E_uid160_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_7_uid157_vecRotateTest_q(19 downto 0));
    aip1E_uid160_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid160_vecRotateTest_in(19 downto 0));

    -- redist22_aip1E_uid160_vecRotateTest_b_1(DELAY,396)
    redist22_aip1E_uid160_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid160_vecRotateTest_b, xout => redist22_aip1E_uid160_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid161_vecRotateTest(BITSELECT,160)@9
    xMSB_uid161_vecRotateTest_b <= STD_LOGIC_VECTOR(redist22_aip1E_uid160_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_7_uid168_vecRotateTest(CONSTANT,167)
    cstArcTan2Mi_7_uid168_vecRotateTest_q <= "010000000000";

    -- highABits_uid174_vecRotateTest(BITSELECT,173)@9
    highABits_uid174_vecRotateTest_b <= STD_LOGIC_VECTOR(redist22_aip1E_uid160_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_8high_uid175_vecRotateTest(ADDSUB,174)@9
    aip1E_8high_uid175_vecRotateTest_s <= xMSB_uid161_vecRotateTest_b;
    aip1E_8high_uid175_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid174_vecRotateTest_b(18)) & highABits_uid174_vecRotateTest_b));
    aip1E_8high_uid175_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 12 => cstArcTan2Mi_7_uid168_vecRotateTest_q(11)) & cstArcTan2Mi_7_uid168_vecRotateTest_q));
    aip1E_8high_uid175_vecRotateTest_combproc: PROCESS (aip1E_8high_uid175_vecRotateTest_a, aip1E_8high_uid175_vecRotateTest_b, aip1E_8high_uid175_vecRotateTest_s)
    BEGIN
        IF (aip1E_8high_uid175_vecRotateTest_s = "1") THEN
            aip1E_8high_uid175_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid175_vecRotateTest_a) + SIGNED(aip1E_8high_uid175_vecRotateTest_b));
        ELSE
            aip1E_8high_uid175_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid175_vecRotateTest_a) - SIGNED(aip1E_8high_uid175_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_8high_uid175_vecRotateTest_q <= aip1E_8high_uid175_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid173_vecRotateTest(BITSELECT,172)@9
    lowRangeA_uid173_vecRotateTest_in <= redist22_aip1E_uid160_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid173_vecRotateTest_b <= lowRangeA_uid173_vecRotateTest_in(0 downto 0);

    -- aip1E_8_uid176_vecRotateTest(BITJOIN,175)@9
    aip1E_8_uid176_vecRotateTest_q <= aip1E_8high_uid175_vecRotateTest_q & lowRangeA_uid173_vecRotateTest_b;

    -- aip1E_uid179_vecRotateTest(BITSELECT,178)@9
    aip1E_uid179_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_8_uid176_vecRotateTest_q(19 downto 0));
    aip1E_uid179_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid179_vecRotateTest_in(19 downto 0));

    -- redist19_aip1E_uid179_vecRotateTest_b_1(DELAY,393)
    redist19_aip1E_uid179_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid179_vecRotateTest_b, xout => redist19_aip1E_uid179_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid180_vecRotateTest(BITSELECT,179)@10
    xMSB_uid180_vecRotateTest_b <= STD_LOGIC_VECTOR(redist19_aip1E_uid179_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_8_uid187_vecRotateTest(CONSTANT,186)
    cstArcTan2Mi_8_uid187_vecRotateTest_q <= "01000000000";

    -- highABits_uid193_vecRotateTest(BITSELECT,192)@10
    highABits_uid193_vecRotateTest_b <= STD_LOGIC_VECTOR(redist19_aip1E_uid179_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_9high_uid194_vecRotateTest(ADDSUB,193)@10
    aip1E_9high_uid194_vecRotateTest_s <= xMSB_uid180_vecRotateTest_b;
    aip1E_9high_uid194_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid193_vecRotateTest_b(18)) & highABits_uid193_vecRotateTest_b));
    aip1E_9high_uid194_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 11 => cstArcTan2Mi_8_uid187_vecRotateTest_q(10)) & cstArcTan2Mi_8_uid187_vecRotateTest_q));
    aip1E_9high_uid194_vecRotateTest_combproc: PROCESS (aip1E_9high_uid194_vecRotateTest_a, aip1E_9high_uid194_vecRotateTest_b, aip1E_9high_uid194_vecRotateTest_s)
    BEGIN
        IF (aip1E_9high_uid194_vecRotateTest_s = "1") THEN
            aip1E_9high_uid194_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid194_vecRotateTest_a) + SIGNED(aip1E_9high_uid194_vecRotateTest_b));
        ELSE
            aip1E_9high_uid194_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid194_vecRotateTest_a) - SIGNED(aip1E_9high_uid194_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_9high_uid194_vecRotateTest_q <= aip1E_9high_uid194_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid192_vecRotateTest(BITSELECT,191)@10
    lowRangeA_uid192_vecRotateTest_in <= redist19_aip1E_uid179_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid192_vecRotateTest_b <= lowRangeA_uid192_vecRotateTest_in(0 downto 0);

    -- aip1E_9_uid195_vecRotateTest(BITJOIN,194)@10
    aip1E_9_uid195_vecRotateTest_q <= aip1E_9high_uid194_vecRotateTest_q & lowRangeA_uid192_vecRotateTest_b;

    -- aip1E_uid198_vecRotateTest(BITSELECT,197)@10
    aip1E_uid198_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_9_uid195_vecRotateTest_q(19 downto 0));
    aip1E_uid198_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid198_vecRotateTest_in(19 downto 0));

    -- redist16_aip1E_uid198_vecRotateTest_b_1(DELAY,390)
    redist16_aip1E_uid198_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid198_vecRotateTest_b, xout => redist16_aip1E_uid198_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid199_vecRotateTest(BITSELECT,198)@11
    xMSB_uid199_vecRotateTest_b <= STD_LOGIC_VECTOR(redist16_aip1E_uid198_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_9_uid206_vecRotateTest(CONSTANT,205)
    cstArcTan2Mi_9_uid206_vecRotateTest_q <= "0100000000";

    -- highABits_uid212_vecRotateTest(BITSELECT,211)@11
    highABits_uid212_vecRotateTest_b <= STD_LOGIC_VECTOR(redist16_aip1E_uid198_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_10high_uid213_vecRotateTest(ADDSUB,212)@11
    aip1E_10high_uid213_vecRotateTest_s <= xMSB_uid199_vecRotateTest_b;
    aip1E_10high_uid213_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid212_vecRotateTest_b(18)) & highABits_uid212_vecRotateTest_b));
    aip1E_10high_uid213_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 10 => cstArcTan2Mi_9_uid206_vecRotateTest_q(9)) & cstArcTan2Mi_9_uid206_vecRotateTest_q));
    aip1E_10high_uid213_vecRotateTest_combproc: PROCESS (aip1E_10high_uid213_vecRotateTest_a, aip1E_10high_uid213_vecRotateTest_b, aip1E_10high_uid213_vecRotateTest_s)
    BEGIN
        IF (aip1E_10high_uid213_vecRotateTest_s = "1") THEN
            aip1E_10high_uid213_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid213_vecRotateTest_a) + SIGNED(aip1E_10high_uid213_vecRotateTest_b));
        ELSE
            aip1E_10high_uid213_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid213_vecRotateTest_a) - SIGNED(aip1E_10high_uid213_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_10high_uid213_vecRotateTest_q <= aip1E_10high_uid213_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid211_vecRotateTest(BITSELECT,210)@11
    lowRangeA_uid211_vecRotateTest_in <= redist16_aip1E_uid198_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid211_vecRotateTest_b <= lowRangeA_uid211_vecRotateTest_in(0 downto 0);

    -- aip1E_10_uid214_vecRotateTest(BITJOIN,213)@11
    aip1E_10_uid214_vecRotateTest_q <= aip1E_10high_uid213_vecRotateTest_q & lowRangeA_uid211_vecRotateTest_b;

    -- aip1E_uid217_vecRotateTest(BITSELECT,216)@11
    aip1E_uid217_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_10_uid214_vecRotateTest_q(19 downto 0));
    aip1E_uid217_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid217_vecRotateTest_in(19 downto 0));

    -- redist13_aip1E_uid217_vecRotateTest_b_1(DELAY,387)
    redist13_aip1E_uid217_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid217_vecRotateTest_b, xout => redist13_aip1E_uid217_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid218_vecRotateTest(BITSELECT,217)@12
    xMSB_uid218_vecRotateTest_b <= STD_LOGIC_VECTOR(redist13_aip1E_uid217_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_10_uid225_vecRotateTest(CONSTANT,224)
    cstArcTan2Mi_10_uid225_vecRotateTest_q <= "010000000";

    -- highABits_uid231_vecRotateTest(BITSELECT,230)@12
    highABits_uid231_vecRotateTest_b <= STD_LOGIC_VECTOR(redist13_aip1E_uid217_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_11high_uid232_vecRotateTest(ADDSUB,231)@12
    aip1E_11high_uid232_vecRotateTest_s <= xMSB_uid218_vecRotateTest_b;
    aip1E_11high_uid232_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid231_vecRotateTest_b(18)) & highABits_uid231_vecRotateTest_b));
    aip1E_11high_uid232_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 9 => cstArcTan2Mi_10_uid225_vecRotateTest_q(8)) & cstArcTan2Mi_10_uid225_vecRotateTest_q));
    aip1E_11high_uid232_vecRotateTest_combproc: PROCESS (aip1E_11high_uid232_vecRotateTest_a, aip1E_11high_uid232_vecRotateTest_b, aip1E_11high_uid232_vecRotateTest_s)
    BEGIN
        IF (aip1E_11high_uid232_vecRotateTest_s = "1") THEN
            aip1E_11high_uid232_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid232_vecRotateTest_a) + SIGNED(aip1E_11high_uid232_vecRotateTest_b));
        ELSE
            aip1E_11high_uid232_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid232_vecRotateTest_a) - SIGNED(aip1E_11high_uid232_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_11high_uid232_vecRotateTest_q <= aip1E_11high_uid232_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid230_vecRotateTest(BITSELECT,229)@12
    lowRangeA_uid230_vecRotateTest_in <= redist13_aip1E_uid217_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid230_vecRotateTest_b <= lowRangeA_uid230_vecRotateTest_in(0 downto 0);

    -- aip1E_11_uid233_vecRotateTest(BITJOIN,232)@12
    aip1E_11_uid233_vecRotateTest_q <= aip1E_11high_uid232_vecRotateTest_q & lowRangeA_uid230_vecRotateTest_b;

    -- aip1E_uid236_vecRotateTest(BITSELECT,235)@12
    aip1E_uid236_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_11_uid233_vecRotateTest_q(19 downto 0));
    aip1E_uid236_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid236_vecRotateTest_in(19 downto 0));

    -- xMSB_uid237_vecRotateTest(BITSELECT,236)@12
    xMSB_uid237_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid236_vecRotateTest_b(19 downto 19));

    -- redist10_xMSB_uid237_vecRotateTest_b_1(DELAY,384)
    redist10_xMSB_uid237_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid237_vecRotateTest_b, xout => redist10_xMSB_uid237_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid239_vecRotateTest(LOGICAL,238)@13
    signOfSelectionSignal_uid239_vecRotateTest_q <= not (redist10_xMSB_uid237_vecRotateTest_b_1_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- signOfSelectionSignal_uid201_vecRotateTest(LOGICAL,200)@11
    signOfSelectionSignal_uid201_vecRotateTest_q <= not (xMSB_uid199_vecRotateTest_b);

    -- signOfSelectionSignal_uid163_vecRotateTest(LOGICAL,162)@9
    signOfSelectionSignal_uid163_vecRotateTest_q <= not (xMSB_uid161_vecRotateTest_b);

    -- signOfSelectionSignal_uid124_vecRotateTest(LOGICAL,123)@7
    signOfSelectionSignal_uid124_vecRotateTest_q <= not (xMSB_uid122_vecRotateTest_b);

    -- signOfSelectionSignal_uid88_vecRotateTest(LOGICAL,87)@5
    signOfSelectionSignal_uid88_vecRotateTest_q <= not (xMSB_uid86_vecRotateTest_b);

    -- signOfSelectionSignal_uid52_vecRotateTest(LOGICAL,51)@3
    signOfSelectionSignal_uid52_vecRotateTest_q <= not (xMSB_uid50_vecRotateTest_b);

    -- padACst_uid22_vecRotateTest(CONSTANT,21)
    padACst_uid22_vecRotateTest_q <= "00000000000000";

    -- aPostPad_uid23_vecRotateTest(BITJOIN,22)@1
    aPostPad_uid23_vecRotateTest_q <= GND_q & padACst_uid22_vecRotateTest_q;

    -- mx_uid24_vecRotateTest(SUB,23)@1
    mx_uid24_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aPostPad_uid23_vecRotateTest_q));
    mx_uid24_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => redist43_xIn_x_1_q(15)) & redist43_xIn_x_1_q));
    mx_uid24_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(mx_uid24_vecRotateTest_a) - SIGNED(mx_uid24_vecRotateTest_b));
    mx_uid24_vecRotateTest_q <= mx_uid24_vecRotateTest_o(16 downto 0);

    -- mxR_uid25_vecRotateTest(BITSELECT,24)@1
    mxR_uid25_vecRotateTest_in <= STD_LOGIC_VECTOR(mx_uid24_vecRotateTest_q(15 downto 0));
    mxR_uid25_vecRotateTest_b <= STD_LOGIC_VECTOR(mxR_uid25_vecRotateTest_in(15 downto 0));

    -- redist44_xIn_y_1(DELAY,418)
    redist44_xIn_y_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => y, xout => redist44_xIn_y_1_q, clk => clk, aclr => areset );

    -- redist43_xIn_x_1(DELAY,417)
    redist43_xIn_x_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => x, xout => redist43_xIn_x_1_q, clk => clk, aclr => areset );

    -- concSignAFirstQuadrant_uid30_vecRotateTest(BITJOIN,29)@1
    concSignAFirstQuadrant_uid30_vecRotateTest_q <= redist42_signA_uid7_vecRotateTest_b_1_q & firstQuadrant_uid18_vecRotateTest_q;

    -- absY_uid32_vecRotateTest(MUX,31)@1 + 1
    absY_uid32_vecRotateTest_s <= concSignAFirstQuadrant_uid30_vecRotateTest_q;
    absY_uid32_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            absY_uid32_vecRotateTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (absY_uid32_vecRotateTest_s) IS
                WHEN "00" => absY_uid32_vecRotateTest_q <= redist43_xIn_x_1_q;
                WHEN "01" => absY_uid32_vecRotateTest_q <= redist44_xIn_y_1_q;
                WHEN "10" => absY_uid32_vecRotateTest_q <= mxR_uid25_vecRotateTest_b;
                WHEN "11" => absY_uid32_vecRotateTest_q <= redist44_xIn_y_1_q;
                WHEN OTHERS => absY_uid32_vecRotateTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- my_uid28_vecRotateTest(SUB,27)@1
    my_uid28_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aPostPad_uid23_vecRotateTest_q));
    my_uid28_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => redist44_xIn_y_1_q(15)) & redist44_xIn_y_1_q));
    my_uid28_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(my_uid28_vecRotateTest_a) - SIGNED(my_uid28_vecRotateTest_b));
    my_uid28_vecRotateTest_q <= my_uid28_vecRotateTest_o(16 downto 0);

    -- myR_uid29_vecRotateTest(BITSELECT,28)@1
    myR_uid29_vecRotateTest_in <= STD_LOGIC_VECTOR(my_uid28_vecRotateTest_q(15 downto 0));
    myR_uid29_vecRotateTest_b <= STD_LOGIC_VECTOR(myR_uid29_vecRotateTest_in(15 downto 0));

    -- absX_uid31_vecRotateTest(MUX,30)@1 + 1
    absX_uid31_vecRotateTest_s <= concSignAFirstQuadrant_uid30_vecRotateTest_q;
    absX_uid31_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            absX_uid31_vecRotateTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (absX_uid31_vecRotateTest_s) IS
                WHEN "00" => absX_uid31_vecRotateTest_q <= myR_uid29_vecRotateTest_b;
                WHEN "01" => absX_uid31_vecRotateTest_q <= redist43_xIn_x_1_q;
                WHEN "10" => absX_uid31_vecRotateTest_q <= redist44_xIn_y_1_q;
                WHEN "11" => absX_uid31_vecRotateTest_q <= redist43_xIn_x_1_q;
                WHEN OTHERS => absX_uid31_vecRotateTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- xip1E_1_uid41_vecRotateTest(ADDSUB,40)@2 + 1
    xip1E_1_uid41_vecRotateTest_s <= xMSB_uid34_vecRotateTest_b;
    xip1E_1_uid41_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => absX_uid31_vecRotateTest_q(15)) & absX_uid31_vecRotateTest_q));
    xip1E_1_uid41_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => absY_uid32_vecRotateTest_q(15)) & absY_uid32_vecRotateTest_q));
    xip1E_1_uid41_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xip1E_1_uid41_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xip1E_1_uid41_vecRotateTest_s = "1") THEN
                xip1E_1_uid41_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_1_uid41_vecRotateTest_a) + SIGNED(xip1E_1_uid41_vecRotateTest_b));
            ELSE
                xip1E_1_uid41_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_1_uid41_vecRotateTest_a) - SIGNED(xip1E_1_uid41_vecRotateTest_b));
            END IF;
        END IF;
    END PROCESS;
    xip1E_1_uid41_vecRotateTest_q <= xip1E_1_uid41_vecRotateTest_o(16 downto 0);

    -- signOfSelectionSignal_uid36_vecRotateTest(LOGICAL,35)@2
    signOfSelectionSignal_uid36_vecRotateTest_q <= not (xMSB_uid34_vecRotateTest_b);

    -- yip1E_1_uid42_vecRotateTest(ADDSUB,41)@2 + 1
    yip1E_1_uid42_vecRotateTest_s <= signOfSelectionSignal_uid36_vecRotateTest_q;
    yip1E_1_uid42_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => absY_uid32_vecRotateTest_q(15)) & absY_uid32_vecRotateTest_q));
    yip1E_1_uid42_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => absX_uid31_vecRotateTest_q(15)) & absX_uid31_vecRotateTest_q));
    yip1E_1_uid42_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            yip1E_1_uid42_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (yip1E_1_uid42_vecRotateTest_s = "1") THEN
                yip1E_1_uid42_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_1_uid42_vecRotateTest_a) + SIGNED(yip1E_1_uid42_vecRotateTest_b));
            ELSE
                yip1E_1_uid42_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_1_uid42_vecRotateTest_a) - SIGNED(yip1E_1_uid42_vecRotateTest_b));
            END IF;
        END IF;
    END PROCESS;
    yip1E_1_uid42_vecRotateTest_q <= yip1E_1_uid42_vecRotateTest_o(16 downto 0);

    -- yip1E_2NA_uid61_vecRotateTest(BITJOIN,60)@3
    yip1E_2NA_uid61_vecRotateTest_q <= yip1E_1_uid42_vecRotateTest_q & GND_q;

    -- yip1E_2sumAHighB_uid62_vecRotateTest(ADDSUB,61)@3
    yip1E_2sumAHighB_uid62_vecRotateTest_s <= signOfSelectionSignal_uid52_vecRotateTest_q;
    yip1E_2sumAHighB_uid62_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => yip1E_2NA_uid61_vecRotateTest_q(17)) & yip1E_2NA_uid61_vecRotateTest_q));
    yip1E_2sumAHighB_uid62_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => xip1E_1_uid41_vecRotateTest_q(16)) & xip1E_1_uid41_vecRotateTest_q));
    yip1E_2sumAHighB_uid62_vecRotateTest_combproc: PROCESS (yip1E_2sumAHighB_uid62_vecRotateTest_a, yip1E_2sumAHighB_uid62_vecRotateTest_b, yip1E_2sumAHighB_uid62_vecRotateTest_s)
    BEGIN
        IF (yip1E_2sumAHighB_uid62_vecRotateTest_s = "1") THEN
            yip1E_2sumAHighB_uid62_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid62_vecRotateTest_a) + SIGNED(yip1E_2sumAHighB_uid62_vecRotateTest_b));
        ELSE
            yip1E_2sumAHighB_uid62_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid62_vecRotateTest_a) - SIGNED(yip1E_2sumAHighB_uid62_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_2sumAHighB_uid62_vecRotateTest_q <= yip1E_2sumAHighB_uid62_vecRotateTest_o(18 downto 0);

    -- yip1_2_uid66_vecRotateTest(BITSELECT,65)@3
    yip1_2_uid66_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_2sumAHighB_uid62_vecRotateTest_q(17 downto 0));
    yip1_2_uid66_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_2_uid66_vecRotateTest_in(17 downto 0));

    -- redist38_yip1_2_uid66_vecRotateTest_b_1(DELAY,412)
    redist38_yip1_2_uid66_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_2_uid66_vecRotateTest_b, xout => redist38_yip1_2_uid66_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_2NA_uid58_vecRotateTest(BITJOIN,57)@3
    xip1E_2NA_uid58_vecRotateTest_q <= xip1E_1_uid41_vecRotateTest_q & GND_q;

    -- xip1E_2sumAHighB_uid59_vecRotateTest(ADDSUB,58)@3
    xip1E_2sumAHighB_uid59_vecRotateTest_s <= xMSB_uid50_vecRotateTest_b;
    xip1E_2sumAHighB_uid59_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => xip1E_2NA_uid58_vecRotateTest_q(17)) & xip1E_2NA_uid58_vecRotateTest_q));
    xip1E_2sumAHighB_uid59_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => yip1E_1_uid42_vecRotateTest_q(16)) & yip1E_1_uid42_vecRotateTest_q));
    xip1E_2sumAHighB_uid59_vecRotateTest_combproc: PROCESS (xip1E_2sumAHighB_uid59_vecRotateTest_a, xip1E_2sumAHighB_uid59_vecRotateTest_b, xip1E_2sumAHighB_uid59_vecRotateTest_s)
    BEGIN
        IF (xip1E_2sumAHighB_uid59_vecRotateTest_s = "1") THEN
            xip1E_2sumAHighB_uid59_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid59_vecRotateTest_a) + SIGNED(xip1E_2sumAHighB_uid59_vecRotateTest_b));
        ELSE
            xip1E_2sumAHighB_uid59_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid59_vecRotateTest_a) - SIGNED(xip1E_2sumAHighB_uid59_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_2sumAHighB_uid59_vecRotateTest_q <= xip1E_2sumAHighB_uid59_vecRotateTest_o(18 downto 0);

    -- xip1_2_uid65_vecRotateTest(BITSELECT,64)@3
    xip1_2_uid65_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_2sumAHighB_uid59_vecRotateTest_q(17 downto 0));
    xip1_2_uid65_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_2_uid65_vecRotateTest_in(17 downto 0));

    -- redist39_xip1_2_uid65_vecRotateTest_b_1(DELAY,413)
    redist39_xip1_2_uid65_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_2_uid65_vecRotateTest_b, xout => redist39_xip1_2_uid65_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_3CostZeroPaddingA_uid75_vecRotateTest(CONSTANT,74)
    xip1E_3CostZeroPaddingA_uid75_vecRotateTest_q <= "00";

    -- xip1E_3NA_uid76_vecRotateTest(BITJOIN,75)@4
    xip1E_3NA_uid76_vecRotateTest_q <= redist39_xip1_2_uid65_vecRotateTest_b_1_q & xip1E_3CostZeroPaddingA_uid75_vecRotateTest_q;

    -- xip1E_3sumAHighB_uid77_vecRotateTest(ADDSUB,76)@4
    xip1E_3sumAHighB_uid77_vecRotateTest_s <= xMSB_uid68_vecRotateTest_b;
    xip1E_3sumAHighB_uid77_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => xip1E_3NA_uid76_vecRotateTest_q(19)) & xip1E_3NA_uid76_vecRotateTest_q));
    xip1E_3sumAHighB_uid77_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 18 => redist38_yip1_2_uid66_vecRotateTest_b_1_q(17)) & redist38_yip1_2_uid66_vecRotateTest_b_1_q));
    xip1E_3sumAHighB_uid77_vecRotateTest_combproc: PROCESS (xip1E_3sumAHighB_uid77_vecRotateTest_a, xip1E_3sumAHighB_uid77_vecRotateTest_b, xip1E_3sumAHighB_uid77_vecRotateTest_s)
    BEGIN
        IF (xip1E_3sumAHighB_uid77_vecRotateTest_s = "1") THEN
            xip1E_3sumAHighB_uid77_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid77_vecRotateTest_a) + SIGNED(xip1E_3sumAHighB_uid77_vecRotateTest_b));
        ELSE
            xip1E_3sumAHighB_uid77_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid77_vecRotateTest_a) - SIGNED(xip1E_3sumAHighB_uid77_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_3sumAHighB_uid77_vecRotateTest_q <= xip1E_3sumAHighB_uid77_vecRotateTest_o(20 downto 0);

    -- xip1_3_uid83_vecRotateTest(BITSELECT,82)@4
    xip1_3_uid83_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_3sumAHighB_uid77_vecRotateTest_q(19 downto 0));
    xip1_3_uid83_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_3_uid83_vecRotateTest_in(19 downto 0));

    -- redist36_xip1_3_uid83_vecRotateTest_b_1(DELAY,410)
    redist36_xip1_3_uid83_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_3_uid83_vecRotateTest_b, xout => redist36_xip1_3_uid83_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid70_vecRotateTest(LOGICAL,69)@4
    signOfSelectionSignal_uid70_vecRotateTest_q <= not (xMSB_uid68_vecRotateTest_b);

    -- yip1E_3NA_uid79_vecRotateTest(BITJOIN,78)@4
    yip1E_3NA_uid79_vecRotateTest_q <= redist38_yip1_2_uid66_vecRotateTest_b_1_q & xip1E_3CostZeroPaddingA_uid75_vecRotateTest_q;

    -- yip1E_3sumAHighB_uid80_vecRotateTest(ADDSUB,79)@4
    yip1E_3sumAHighB_uid80_vecRotateTest_s <= signOfSelectionSignal_uid70_vecRotateTest_q;
    yip1E_3sumAHighB_uid80_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => yip1E_3NA_uid79_vecRotateTest_q(19)) & yip1E_3NA_uid79_vecRotateTest_q));
    yip1E_3sumAHighB_uid80_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 18 => redist39_xip1_2_uid65_vecRotateTest_b_1_q(17)) & redist39_xip1_2_uid65_vecRotateTest_b_1_q));
    yip1E_3sumAHighB_uid80_vecRotateTest_combproc: PROCESS (yip1E_3sumAHighB_uid80_vecRotateTest_a, yip1E_3sumAHighB_uid80_vecRotateTest_b, yip1E_3sumAHighB_uid80_vecRotateTest_s)
    BEGIN
        IF (yip1E_3sumAHighB_uid80_vecRotateTest_s = "1") THEN
            yip1E_3sumAHighB_uid80_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid80_vecRotateTest_a) + SIGNED(yip1E_3sumAHighB_uid80_vecRotateTest_b));
        ELSE
            yip1E_3sumAHighB_uid80_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid80_vecRotateTest_a) - SIGNED(yip1E_3sumAHighB_uid80_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_3sumAHighB_uid80_vecRotateTest_q <= yip1E_3sumAHighB_uid80_vecRotateTest_o(20 downto 0);

    -- yip1_3_uid84_vecRotateTest(BITSELECT,83)@4
    yip1_3_uid84_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_3sumAHighB_uid80_vecRotateTest_q(19 downto 0));
    yip1_3_uid84_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_3_uid84_vecRotateTest_in(19 downto 0));

    -- redist35_yip1_3_uid84_vecRotateTest_b_1(DELAY,409)
    redist35_yip1_3_uid84_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_3_uid84_vecRotateTest_b, xout => redist35_yip1_3_uid84_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_4CostZeroPaddingA_uid93_vecRotateTest(CONSTANT,92)
    xip1E_4CostZeroPaddingA_uid93_vecRotateTest_q <= "000";

    -- yip1E_4NA_uid97_vecRotateTest(BITJOIN,96)@5
    yip1E_4NA_uid97_vecRotateTest_q <= redist35_yip1_3_uid84_vecRotateTest_b_1_q & xip1E_4CostZeroPaddingA_uid93_vecRotateTest_q;

    -- yip1E_4sumAHighB_uid98_vecRotateTest(ADDSUB,97)@5
    yip1E_4sumAHighB_uid98_vecRotateTest_s <= signOfSelectionSignal_uid88_vecRotateTest_q;
    yip1E_4sumAHighB_uid98_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1E_4NA_uid97_vecRotateTest_q(22)) & yip1E_4NA_uid97_vecRotateTest_q));
    yip1E_4sumAHighB_uid98_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => redist36_xip1_3_uid83_vecRotateTest_b_1_q(19)) & redist36_xip1_3_uid83_vecRotateTest_b_1_q));
    yip1E_4sumAHighB_uid98_vecRotateTest_combproc: PROCESS (yip1E_4sumAHighB_uid98_vecRotateTest_a, yip1E_4sumAHighB_uid98_vecRotateTest_b, yip1E_4sumAHighB_uid98_vecRotateTest_s)
    BEGIN
        IF (yip1E_4sumAHighB_uid98_vecRotateTest_s = "1") THEN
            yip1E_4sumAHighB_uid98_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid98_vecRotateTest_a) + SIGNED(yip1E_4sumAHighB_uid98_vecRotateTest_b));
        ELSE
            yip1E_4sumAHighB_uid98_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid98_vecRotateTest_a) - SIGNED(yip1E_4sumAHighB_uid98_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_4sumAHighB_uid98_vecRotateTest_q <= yip1E_4sumAHighB_uid98_vecRotateTest_o(23 downto 0);

    -- yip1_4_uid102_vecRotateTest(BITSELECT,101)@5
    yip1_4_uid102_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_4sumAHighB_uid98_vecRotateTest_q(22 downto 0));
    yip1_4_uid102_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_4_uid102_vecRotateTest_in(22 downto 0));

    -- redist32_yip1_4_uid102_vecRotateTest_b_1(DELAY,406)
    redist32_yip1_4_uid102_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_4_uid102_vecRotateTest_b, xout => redist32_yip1_4_uid102_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_4NA_uid94_vecRotateTest(BITJOIN,93)@5
    xip1E_4NA_uid94_vecRotateTest_q <= redist36_xip1_3_uid83_vecRotateTest_b_1_q & xip1E_4CostZeroPaddingA_uid93_vecRotateTest_q;

    -- xip1E_4sumAHighB_uid95_vecRotateTest(ADDSUB,94)@5
    xip1E_4sumAHighB_uid95_vecRotateTest_s <= xMSB_uid86_vecRotateTest_b;
    xip1E_4sumAHighB_uid95_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1E_4NA_uid94_vecRotateTest_q(22)) & xip1E_4NA_uid94_vecRotateTest_q));
    xip1E_4sumAHighB_uid95_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => redist35_yip1_3_uid84_vecRotateTest_b_1_q(19)) & redist35_yip1_3_uid84_vecRotateTest_b_1_q));
    xip1E_4sumAHighB_uid95_vecRotateTest_combproc: PROCESS (xip1E_4sumAHighB_uid95_vecRotateTest_a, xip1E_4sumAHighB_uid95_vecRotateTest_b, xip1E_4sumAHighB_uid95_vecRotateTest_s)
    BEGIN
        IF (xip1E_4sumAHighB_uid95_vecRotateTest_s = "1") THEN
            xip1E_4sumAHighB_uid95_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid95_vecRotateTest_a) + SIGNED(xip1E_4sumAHighB_uid95_vecRotateTest_b));
        ELSE
            xip1E_4sumAHighB_uid95_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid95_vecRotateTest_a) - SIGNED(xip1E_4sumAHighB_uid95_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_4sumAHighB_uid95_vecRotateTest_q <= xip1E_4sumAHighB_uid95_vecRotateTest_o(23 downto 0);

    -- xip1_4_uid101_vecRotateTest(BITSELECT,100)@5
    xip1_4_uid101_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_4sumAHighB_uid95_vecRotateTest_q(22 downto 0));
    xip1_4_uid101_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_4_uid101_vecRotateTest_in(22 downto 0));

    -- redist33_xip1_4_uid101_vecRotateTest_b_1(DELAY,407)
    redist33_xip1_4_uid101_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_4_uid101_vecRotateTest_b, xout => redist33_xip1_4_uid101_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_5CostZeroPaddingA_uid111_vecRotateTest(CONSTANT,110)
    xip1E_5CostZeroPaddingA_uid111_vecRotateTest_q <= "0000";

    -- xip1E_5NA_uid112_vecRotateTest(BITJOIN,111)@6
    xip1E_5NA_uid112_vecRotateTest_q <= redist33_xip1_4_uid101_vecRotateTest_b_1_q & xip1E_5CostZeroPaddingA_uid111_vecRotateTest_q;

    -- xip1E_5sumAHighB_uid113_vecRotateTest(ADDSUB,112)@6
    xip1E_5sumAHighB_uid113_vecRotateTest_s <= xMSB_uid104_vecRotateTest_b;
    xip1E_5sumAHighB_uid113_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => xip1E_5NA_uid112_vecRotateTest_q(26)) & xip1E_5NA_uid112_vecRotateTest_q));
    xip1E_5sumAHighB_uid113_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 23 => redist32_yip1_4_uid102_vecRotateTest_b_1_q(22)) & redist32_yip1_4_uid102_vecRotateTest_b_1_q));
    xip1E_5sumAHighB_uid113_vecRotateTest_combproc: PROCESS (xip1E_5sumAHighB_uid113_vecRotateTest_a, xip1E_5sumAHighB_uid113_vecRotateTest_b, xip1E_5sumAHighB_uid113_vecRotateTest_s)
    BEGIN
        IF (xip1E_5sumAHighB_uid113_vecRotateTest_s = "1") THEN
            xip1E_5sumAHighB_uid113_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid113_vecRotateTest_a) + SIGNED(xip1E_5sumAHighB_uid113_vecRotateTest_b));
        ELSE
            xip1E_5sumAHighB_uid113_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid113_vecRotateTest_a) - SIGNED(xip1E_5sumAHighB_uid113_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_5sumAHighB_uid113_vecRotateTest_q <= xip1E_5sumAHighB_uid113_vecRotateTest_o(27 downto 0);

    -- xip1_5_uid119_vecRotateTest(BITSELECT,118)@6
    xip1_5_uid119_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_5sumAHighB_uid113_vecRotateTest_q(26 downto 0));
    xip1_5_uid119_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_5_uid119_vecRotateTest_in(26 downto 0));

    -- redist30_xip1_5_uid119_vecRotateTest_b_1(DELAY,404)
    redist30_xip1_5_uid119_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_5_uid119_vecRotateTest_b, xout => redist30_xip1_5_uid119_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid127_vecRotateTest(BITSELECT,126)@7
    twoToMiSiXip_uid127_vecRotateTest_b <= STD_LOGIC_VECTOR(redist30_xip1_5_uid119_vecRotateTest_b_1_q(26 downto 3));

    -- signOfSelectionSignal_uid106_vecRotateTest(LOGICAL,105)@6
    signOfSelectionSignal_uid106_vecRotateTest_q <= not (xMSB_uid104_vecRotateTest_b);

    -- yip1E_5NA_uid115_vecRotateTest(BITJOIN,114)@6
    yip1E_5NA_uid115_vecRotateTest_q <= redist32_yip1_4_uid102_vecRotateTest_b_1_q & xip1E_5CostZeroPaddingA_uid111_vecRotateTest_q;

    -- yip1E_5sumAHighB_uid116_vecRotateTest(ADDSUB,115)@6
    yip1E_5sumAHighB_uid116_vecRotateTest_s <= signOfSelectionSignal_uid106_vecRotateTest_q;
    yip1E_5sumAHighB_uid116_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => yip1E_5NA_uid115_vecRotateTest_q(26)) & yip1E_5NA_uid115_vecRotateTest_q));
    yip1E_5sumAHighB_uid116_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 23 => redist33_xip1_4_uid101_vecRotateTest_b_1_q(22)) & redist33_xip1_4_uid101_vecRotateTest_b_1_q));
    yip1E_5sumAHighB_uid116_vecRotateTest_combproc: PROCESS (yip1E_5sumAHighB_uid116_vecRotateTest_a, yip1E_5sumAHighB_uid116_vecRotateTest_b, yip1E_5sumAHighB_uid116_vecRotateTest_s)
    BEGIN
        IF (yip1E_5sumAHighB_uid116_vecRotateTest_s = "1") THEN
            yip1E_5sumAHighB_uid116_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid116_vecRotateTest_a) + SIGNED(yip1E_5sumAHighB_uid116_vecRotateTest_b));
        ELSE
            yip1E_5sumAHighB_uid116_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid116_vecRotateTest_a) - SIGNED(yip1E_5sumAHighB_uid116_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_5sumAHighB_uid116_vecRotateTest_q <= yip1E_5sumAHighB_uid116_vecRotateTest_o(27 downto 0);

    -- yip1_5_uid120_vecRotateTest(BITSELECT,119)@6
    yip1_5_uid120_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_5sumAHighB_uid116_vecRotateTest_q(26 downto 0));
    yip1_5_uid120_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_5_uid120_vecRotateTest_in(26 downto 0));

    -- redist29_yip1_5_uid120_vecRotateTest_b_1(DELAY,403)
    redist29_yip1_5_uid120_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_5_uid120_vecRotateTest_b, xout => redist29_yip1_5_uid120_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_6NA_uid135_vecRotateTest(BITJOIN,134)@7
    yip1E_6NA_uid135_vecRotateTest_q <= redist29_yip1_5_uid120_vecRotateTest_b_1_q & xip1E_3CostZeroPaddingA_uid75_vecRotateTest_q;

    -- yip1E_6sumAHighB_uid136_vecRotateTest(ADDSUB,135)@7
    yip1E_6sumAHighB_uid136_vecRotateTest_s <= signOfSelectionSignal_uid124_vecRotateTest_q;
    yip1E_6sumAHighB_uid136_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => yip1E_6NA_uid135_vecRotateTest_q(28)) & yip1E_6NA_uid135_vecRotateTest_q));
    yip1E_6sumAHighB_uid136_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 24 => twoToMiSiXip_uid127_vecRotateTest_b(23)) & twoToMiSiXip_uid127_vecRotateTest_b));
    yip1E_6sumAHighB_uid136_vecRotateTest_combproc: PROCESS (yip1E_6sumAHighB_uid136_vecRotateTest_a, yip1E_6sumAHighB_uid136_vecRotateTest_b, yip1E_6sumAHighB_uid136_vecRotateTest_s)
    BEGIN
        IF (yip1E_6sumAHighB_uid136_vecRotateTest_s = "1") THEN
            yip1E_6sumAHighB_uid136_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid136_vecRotateTest_a) + SIGNED(yip1E_6sumAHighB_uid136_vecRotateTest_b));
        ELSE
            yip1E_6sumAHighB_uid136_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid136_vecRotateTest_a) - SIGNED(yip1E_6sumAHighB_uid136_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_6sumAHighB_uid136_vecRotateTest_q <= yip1E_6sumAHighB_uid136_vecRotateTest_o(29 downto 0);

    -- yip1_6_uid140_vecRotateTest(BITSELECT,139)@7
    yip1_6_uid140_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_6sumAHighB_uid136_vecRotateTest_q(28 downto 0));
    yip1_6_uid140_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_6_uid140_vecRotateTest_in(28 downto 0));

    -- redist26_yip1_6_uid140_vecRotateTest_b_1(DELAY,400)
    redist26_yip1_6_uid140_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_6_uid140_vecRotateTest_b, xout => redist26_yip1_6_uid140_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid148_vecRotateTest(BITSELECT,147)@8
    twoToMiSiYip_uid148_vecRotateTest_b <= STD_LOGIC_VECTOR(redist26_yip1_6_uid140_vecRotateTest_b_1_q(28 downto 6));

    -- twoToMiSiYip_uid128_vecRotateTest(BITSELECT,127)@7
    twoToMiSiYip_uid128_vecRotateTest_b <= STD_LOGIC_VECTOR(redist29_yip1_5_uid120_vecRotateTest_b_1_q(26 downto 3));

    -- xip1E_6NA_uid132_vecRotateTest(BITJOIN,131)@7
    xip1E_6NA_uid132_vecRotateTest_q <= redist30_xip1_5_uid119_vecRotateTest_b_1_q & xip1E_3CostZeroPaddingA_uid75_vecRotateTest_q;

    -- xip1E_6sumAHighB_uid133_vecRotateTest(ADDSUB,132)@7
    xip1E_6sumAHighB_uid133_vecRotateTest_s <= xMSB_uid122_vecRotateTest_b;
    xip1E_6sumAHighB_uid133_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => xip1E_6NA_uid132_vecRotateTest_q(28)) & xip1E_6NA_uid132_vecRotateTest_q));
    xip1E_6sumAHighB_uid133_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 24 => twoToMiSiYip_uid128_vecRotateTest_b(23)) & twoToMiSiYip_uid128_vecRotateTest_b));
    xip1E_6sumAHighB_uid133_vecRotateTest_combproc: PROCESS (xip1E_6sumAHighB_uid133_vecRotateTest_a, xip1E_6sumAHighB_uid133_vecRotateTest_b, xip1E_6sumAHighB_uid133_vecRotateTest_s)
    BEGIN
        IF (xip1E_6sumAHighB_uid133_vecRotateTest_s = "1") THEN
            xip1E_6sumAHighB_uid133_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid133_vecRotateTest_a) + SIGNED(xip1E_6sumAHighB_uid133_vecRotateTest_b));
        ELSE
            xip1E_6sumAHighB_uid133_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid133_vecRotateTest_a) - SIGNED(xip1E_6sumAHighB_uid133_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_6sumAHighB_uid133_vecRotateTest_q <= xip1E_6sumAHighB_uid133_vecRotateTest_o(29 downto 0);

    -- xip1_6_uid139_vecRotateTest(BITSELECT,138)@7
    xip1_6_uid139_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_6sumAHighB_uid133_vecRotateTest_q(28 downto 0));
    xip1_6_uid139_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_6_uid139_vecRotateTest_in(28 downto 0));

    -- redist27_xip1_6_uid139_vecRotateTest_b_1(DELAY,401)
    redist27_xip1_6_uid139_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_6_uid139_vecRotateTest_b, xout => redist27_xip1_6_uid139_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_7_uid151_vecRotateTest(ADDSUB,150)@8
    xip1E_7_uid151_vecRotateTest_s <= xMSB_uid142_vecRotateTest_b;
    xip1E_7_uid151_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist27_xip1_6_uid139_vecRotateTest_b_1_q(28)) & redist27_xip1_6_uid139_vecRotateTest_b_1_q));
    xip1E_7_uid151_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 23 => twoToMiSiYip_uid148_vecRotateTest_b(22)) & twoToMiSiYip_uid148_vecRotateTest_b));
    xip1E_7_uid151_vecRotateTest_combproc: PROCESS (xip1E_7_uid151_vecRotateTest_a, xip1E_7_uid151_vecRotateTest_b, xip1E_7_uid151_vecRotateTest_s)
    BEGIN
        IF (xip1E_7_uid151_vecRotateTest_s = "1") THEN
            xip1E_7_uid151_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid151_vecRotateTest_a) + SIGNED(xip1E_7_uid151_vecRotateTest_b));
        ELSE
            xip1E_7_uid151_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid151_vecRotateTest_a) - SIGNED(xip1E_7_uid151_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid151_vecRotateTest_q <= xip1E_7_uid151_vecRotateTest_o(29 downto 0);

    -- xip1_7_uid158_vecRotateTest(BITSELECT,157)@8
    xip1_7_uid158_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_7_uid151_vecRotateTest_q(28 downto 0));
    xip1_7_uid158_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_7_uid158_vecRotateTest_in(28 downto 0));

    -- redist24_xip1_7_uid158_vecRotateTest_b_1(DELAY,398)
    redist24_xip1_7_uid158_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_7_uid158_vecRotateTest_b, xout => redist24_xip1_7_uid158_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid166_vecRotateTest(BITSELECT,165)@9
    twoToMiSiXip_uid166_vecRotateTest_b <= STD_LOGIC_VECTOR(redist24_xip1_7_uid158_vecRotateTest_b_1_q(28 downto 7));

    -- signOfSelectionSignal_uid144_vecRotateTest(LOGICAL,143)@8
    signOfSelectionSignal_uid144_vecRotateTest_q <= not (xMSB_uid142_vecRotateTest_b);

    -- twoToMiSiXip_uid147_vecRotateTest(BITSELECT,146)@8
    twoToMiSiXip_uid147_vecRotateTest_b <= STD_LOGIC_VECTOR(redist27_xip1_6_uid139_vecRotateTest_b_1_q(28 downto 6));

    -- yip1E_7_uid152_vecRotateTest(ADDSUB,151)@8
    yip1E_7_uid152_vecRotateTest_s <= signOfSelectionSignal_uid144_vecRotateTest_q;
    yip1E_7_uid152_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist26_yip1_6_uid140_vecRotateTest_b_1_q(28)) & redist26_yip1_6_uid140_vecRotateTest_b_1_q));
    yip1E_7_uid152_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 23 => twoToMiSiXip_uid147_vecRotateTest_b(22)) & twoToMiSiXip_uid147_vecRotateTest_b));
    yip1E_7_uid152_vecRotateTest_combproc: PROCESS (yip1E_7_uid152_vecRotateTest_a, yip1E_7_uid152_vecRotateTest_b, yip1E_7_uid152_vecRotateTest_s)
    BEGIN
        IF (yip1E_7_uid152_vecRotateTest_s = "1") THEN
            yip1E_7_uid152_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid152_vecRotateTest_a) + SIGNED(yip1E_7_uid152_vecRotateTest_b));
        ELSE
            yip1E_7_uid152_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid152_vecRotateTest_a) - SIGNED(yip1E_7_uid152_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid152_vecRotateTest_q <= yip1E_7_uid152_vecRotateTest_o(29 downto 0);

    -- yip1_7_uid159_vecRotateTest(BITSELECT,158)@8
    yip1_7_uid159_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid152_vecRotateTest_q(28 downto 0));
    yip1_7_uid159_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_7_uid159_vecRotateTest_in(28 downto 0));

    -- redist23_yip1_7_uid159_vecRotateTest_b_1(DELAY,397)
    redist23_yip1_7_uid159_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_7_uid159_vecRotateTest_b, xout => redist23_yip1_7_uid159_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_8_uid171_vecRotateTest(ADDSUB,170)@9
    yip1E_8_uid171_vecRotateTest_s <= signOfSelectionSignal_uid163_vecRotateTest_q;
    yip1E_8_uid171_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist23_yip1_7_uid159_vecRotateTest_b_1_q(28)) & redist23_yip1_7_uid159_vecRotateTest_b_1_q));
    yip1E_8_uid171_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 22 => twoToMiSiXip_uid166_vecRotateTest_b(21)) & twoToMiSiXip_uid166_vecRotateTest_b));
    yip1E_8_uid171_vecRotateTest_combproc: PROCESS (yip1E_8_uid171_vecRotateTest_a, yip1E_8_uid171_vecRotateTest_b, yip1E_8_uid171_vecRotateTest_s)
    BEGIN
        IF (yip1E_8_uid171_vecRotateTest_s = "1") THEN
            yip1E_8_uid171_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid171_vecRotateTest_a) + SIGNED(yip1E_8_uid171_vecRotateTest_b));
        ELSE
            yip1E_8_uid171_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid171_vecRotateTest_a) - SIGNED(yip1E_8_uid171_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid171_vecRotateTest_q <= yip1E_8_uid171_vecRotateTest_o(29 downto 0);

    -- yip1_8_uid178_vecRotateTest(BITSELECT,177)@9
    yip1_8_uid178_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid171_vecRotateTest_q(28 downto 0));
    yip1_8_uid178_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_8_uid178_vecRotateTest_in(28 downto 0));

    -- redist20_yip1_8_uid178_vecRotateTest_b_1(DELAY,394)
    redist20_yip1_8_uid178_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_8_uid178_vecRotateTest_b, xout => redist20_yip1_8_uid178_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid186_vecRotateTest(BITSELECT,185)@10
    twoToMiSiYip_uid186_vecRotateTest_b <= STD_LOGIC_VECTOR(redist20_yip1_8_uid178_vecRotateTest_b_1_q(28 downto 8));

    -- twoToMiSiYip_uid167_vecRotateTest(BITSELECT,166)@9
    twoToMiSiYip_uid167_vecRotateTest_b <= STD_LOGIC_VECTOR(redist23_yip1_7_uid159_vecRotateTest_b_1_q(28 downto 7));

    -- xip1E_8_uid170_vecRotateTest(ADDSUB,169)@9
    xip1E_8_uid170_vecRotateTest_s <= xMSB_uid161_vecRotateTest_b;
    xip1E_8_uid170_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist24_xip1_7_uid158_vecRotateTest_b_1_q(28)) & redist24_xip1_7_uid158_vecRotateTest_b_1_q));
    xip1E_8_uid170_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 22 => twoToMiSiYip_uid167_vecRotateTest_b(21)) & twoToMiSiYip_uid167_vecRotateTest_b));
    xip1E_8_uid170_vecRotateTest_combproc: PROCESS (xip1E_8_uid170_vecRotateTest_a, xip1E_8_uid170_vecRotateTest_b, xip1E_8_uid170_vecRotateTest_s)
    BEGIN
        IF (xip1E_8_uid170_vecRotateTest_s = "1") THEN
            xip1E_8_uid170_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid170_vecRotateTest_a) + SIGNED(xip1E_8_uid170_vecRotateTest_b));
        ELSE
            xip1E_8_uid170_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid170_vecRotateTest_a) - SIGNED(xip1E_8_uid170_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid170_vecRotateTest_q <= xip1E_8_uid170_vecRotateTest_o(29 downto 0);

    -- xip1_8_uid177_vecRotateTest(BITSELECT,176)@9
    xip1_8_uid177_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_8_uid170_vecRotateTest_q(28 downto 0));
    xip1_8_uid177_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_8_uid177_vecRotateTest_in(28 downto 0));

    -- redist21_xip1_8_uid177_vecRotateTest_b_1(DELAY,395)
    redist21_xip1_8_uid177_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_8_uid177_vecRotateTest_b, xout => redist21_xip1_8_uid177_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_9_uid189_vecRotateTest(ADDSUB,188)@10
    xip1E_9_uid189_vecRotateTest_s <= xMSB_uid180_vecRotateTest_b;
    xip1E_9_uid189_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist21_xip1_8_uid177_vecRotateTest_b_1_q(28)) & redist21_xip1_8_uid177_vecRotateTest_b_1_q));
    xip1E_9_uid189_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 21 => twoToMiSiYip_uid186_vecRotateTest_b(20)) & twoToMiSiYip_uid186_vecRotateTest_b));
    xip1E_9_uid189_vecRotateTest_combproc: PROCESS (xip1E_9_uid189_vecRotateTest_a, xip1E_9_uid189_vecRotateTest_b, xip1E_9_uid189_vecRotateTest_s)
    BEGIN
        IF (xip1E_9_uid189_vecRotateTest_s = "1") THEN
            xip1E_9_uid189_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid189_vecRotateTest_a) + SIGNED(xip1E_9_uid189_vecRotateTest_b));
        ELSE
            xip1E_9_uid189_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid189_vecRotateTest_a) - SIGNED(xip1E_9_uid189_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid189_vecRotateTest_q <= xip1E_9_uid189_vecRotateTest_o(29 downto 0);

    -- xip1_9_uid196_vecRotateTest(BITSELECT,195)@10
    xip1_9_uid196_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_9_uid189_vecRotateTest_q(28 downto 0));
    xip1_9_uid196_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_9_uid196_vecRotateTest_in(28 downto 0));

    -- redist18_xip1_9_uid196_vecRotateTest_b_1(DELAY,392)
    redist18_xip1_9_uid196_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_9_uid196_vecRotateTest_b, xout => redist18_xip1_9_uid196_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid204_vecRotateTest(BITSELECT,203)@11
    twoToMiSiXip_uid204_vecRotateTest_b <= STD_LOGIC_VECTOR(redist18_xip1_9_uid196_vecRotateTest_b_1_q(28 downto 9));

    -- signOfSelectionSignal_uid182_vecRotateTest(LOGICAL,181)@10
    signOfSelectionSignal_uid182_vecRotateTest_q <= not (xMSB_uid180_vecRotateTest_b);

    -- twoToMiSiXip_uid185_vecRotateTest(BITSELECT,184)@10
    twoToMiSiXip_uid185_vecRotateTest_b <= STD_LOGIC_VECTOR(redist21_xip1_8_uid177_vecRotateTest_b_1_q(28 downto 8));

    -- yip1E_9_uid190_vecRotateTest(ADDSUB,189)@10
    yip1E_9_uid190_vecRotateTest_s <= signOfSelectionSignal_uid182_vecRotateTest_q;
    yip1E_9_uid190_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist20_yip1_8_uid178_vecRotateTest_b_1_q(28)) & redist20_yip1_8_uid178_vecRotateTest_b_1_q));
    yip1E_9_uid190_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 21 => twoToMiSiXip_uid185_vecRotateTest_b(20)) & twoToMiSiXip_uid185_vecRotateTest_b));
    yip1E_9_uid190_vecRotateTest_combproc: PROCESS (yip1E_9_uid190_vecRotateTest_a, yip1E_9_uid190_vecRotateTest_b, yip1E_9_uid190_vecRotateTest_s)
    BEGIN
        IF (yip1E_9_uid190_vecRotateTest_s = "1") THEN
            yip1E_9_uid190_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid190_vecRotateTest_a) + SIGNED(yip1E_9_uid190_vecRotateTest_b));
        ELSE
            yip1E_9_uid190_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid190_vecRotateTest_a) - SIGNED(yip1E_9_uid190_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid190_vecRotateTest_q <= yip1E_9_uid190_vecRotateTest_o(29 downto 0);

    -- yip1_9_uid197_vecRotateTest(BITSELECT,196)@10
    yip1_9_uid197_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid190_vecRotateTest_q(28 downto 0));
    yip1_9_uid197_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_9_uid197_vecRotateTest_in(28 downto 0));

    -- redist17_yip1_9_uid197_vecRotateTest_b_1(DELAY,391)
    redist17_yip1_9_uid197_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_9_uid197_vecRotateTest_b, xout => redist17_yip1_9_uid197_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_10_uid209_vecRotateTest(ADDSUB,208)@11
    yip1E_10_uid209_vecRotateTest_s <= signOfSelectionSignal_uid201_vecRotateTest_q;
    yip1E_10_uid209_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist17_yip1_9_uid197_vecRotateTest_b_1_q(28)) & redist17_yip1_9_uid197_vecRotateTest_b_1_q));
    yip1E_10_uid209_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 20 => twoToMiSiXip_uid204_vecRotateTest_b(19)) & twoToMiSiXip_uid204_vecRotateTest_b));
    yip1E_10_uid209_vecRotateTest_combproc: PROCESS (yip1E_10_uid209_vecRotateTest_a, yip1E_10_uid209_vecRotateTest_b, yip1E_10_uid209_vecRotateTest_s)
    BEGIN
        IF (yip1E_10_uid209_vecRotateTest_s = "1") THEN
            yip1E_10_uid209_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid209_vecRotateTest_a) + SIGNED(yip1E_10_uid209_vecRotateTest_b));
        ELSE
            yip1E_10_uid209_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid209_vecRotateTest_a) - SIGNED(yip1E_10_uid209_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid209_vecRotateTest_q <= yip1E_10_uid209_vecRotateTest_o(29 downto 0);

    -- yip1_10_uid216_vecRotateTest(BITSELECT,215)@11
    yip1_10_uid216_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid209_vecRotateTest_q(28 downto 0));
    yip1_10_uid216_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_10_uid216_vecRotateTest_in(28 downto 0));

    -- redist14_yip1_10_uid216_vecRotateTest_b_1(DELAY,388)
    redist14_yip1_10_uid216_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_10_uid216_vecRotateTest_b, xout => redist14_yip1_10_uid216_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid224_vecRotateTest(BITSELECT,223)@12
    twoToMiSiYip_uid224_vecRotateTest_b <= STD_LOGIC_VECTOR(redist14_yip1_10_uid216_vecRotateTest_b_1_q(28 downto 10));

    -- twoToMiSiYip_uid205_vecRotateTest(BITSELECT,204)@11
    twoToMiSiYip_uid205_vecRotateTest_b <= STD_LOGIC_VECTOR(redist17_yip1_9_uid197_vecRotateTest_b_1_q(28 downto 9));

    -- xip1E_10_uid208_vecRotateTest(ADDSUB,207)@11
    xip1E_10_uid208_vecRotateTest_s <= xMSB_uid199_vecRotateTest_b;
    xip1E_10_uid208_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist18_xip1_9_uid196_vecRotateTest_b_1_q(28)) & redist18_xip1_9_uid196_vecRotateTest_b_1_q));
    xip1E_10_uid208_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 20 => twoToMiSiYip_uid205_vecRotateTest_b(19)) & twoToMiSiYip_uid205_vecRotateTest_b));
    xip1E_10_uid208_vecRotateTest_combproc: PROCESS (xip1E_10_uid208_vecRotateTest_a, xip1E_10_uid208_vecRotateTest_b, xip1E_10_uid208_vecRotateTest_s)
    BEGIN
        IF (xip1E_10_uid208_vecRotateTest_s = "1") THEN
            xip1E_10_uid208_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid208_vecRotateTest_a) + SIGNED(xip1E_10_uid208_vecRotateTest_b));
        ELSE
            xip1E_10_uid208_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid208_vecRotateTest_a) - SIGNED(xip1E_10_uid208_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid208_vecRotateTest_q <= xip1E_10_uid208_vecRotateTest_o(29 downto 0);

    -- xip1_10_uid215_vecRotateTest(BITSELECT,214)@11
    xip1_10_uid215_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_10_uid208_vecRotateTest_q(28 downto 0));
    xip1_10_uid215_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_10_uid215_vecRotateTest_in(28 downto 0));

    -- redist15_xip1_10_uid215_vecRotateTest_b_1(DELAY,389)
    redist15_xip1_10_uid215_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_10_uid215_vecRotateTest_b, xout => redist15_xip1_10_uid215_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_11_uid227_vecRotateTest(ADDSUB,226)@12
    xip1E_11_uid227_vecRotateTest_s <= xMSB_uid218_vecRotateTest_b;
    xip1E_11_uid227_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist15_xip1_10_uid215_vecRotateTest_b_1_q(28)) & redist15_xip1_10_uid215_vecRotateTest_b_1_q));
    xip1E_11_uid227_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 19 => twoToMiSiYip_uid224_vecRotateTest_b(18)) & twoToMiSiYip_uid224_vecRotateTest_b));
    xip1E_11_uid227_vecRotateTest_combproc: PROCESS (xip1E_11_uid227_vecRotateTest_a, xip1E_11_uid227_vecRotateTest_b, xip1E_11_uid227_vecRotateTest_s)
    BEGIN
        IF (xip1E_11_uid227_vecRotateTest_s = "1") THEN
            xip1E_11_uid227_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid227_vecRotateTest_a) + SIGNED(xip1E_11_uid227_vecRotateTest_b));
        ELSE
            xip1E_11_uid227_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid227_vecRotateTest_a) - SIGNED(xip1E_11_uid227_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_11_uid227_vecRotateTest_q <= xip1E_11_uid227_vecRotateTest_o(29 downto 0);

    -- xip1_11_uid234_vecRotateTest(BITSELECT,233)@12
    xip1_11_uid234_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_11_uid227_vecRotateTest_q(28 downto 0));
    xip1_11_uid234_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_11_uid234_vecRotateTest_in(28 downto 0));

    -- redist12_xip1_11_uid234_vecRotateTest_b_1(DELAY,386)
    redist12_xip1_11_uid234_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_11_uid234_vecRotateTest_b, xout => redist12_xip1_11_uid234_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid242_vecRotateTest(BITSELECT,241)@13
    twoToMiSiXip_uid242_vecRotateTest_b <= STD_LOGIC_VECTOR(redist12_xip1_11_uid234_vecRotateTest_b_1_q(28 downto 11));

    -- signOfSelectionSignal_uid220_vecRotateTest(LOGICAL,219)@12
    signOfSelectionSignal_uid220_vecRotateTest_q <= not (xMSB_uid218_vecRotateTest_b);

    -- twoToMiSiXip_uid223_vecRotateTest(BITSELECT,222)@12
    twoToMiSiXip_uid223_vecRotateTest_b <= STD_LOGIC_VECTOR(redist15_xip1_10_uid215_vecRotateTest_b_1_q(28 downto 10));

    -- yip1E_11_uid228_vecRotateTest(ADDSUB,227)@12
    yip1E_11_uid228_vecRotateTest_s <= signOfSelectionSignal_uid220_vecRotateTest_q;
    yip1E_11_uid228_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist14_yip1_10_uid216_vecRotateTest_b_1_q(28)) & redist14_yip1_10_uid216_vecRotateTest_b_1_q));
    yip1E_11_uid228_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 19 => twoToMiSiXip_uid223_vecRotateTest_b(18)) & twoToMiSiXip_uid223_vecRotateTest_b));
    yip1E_11_uid228_vecRotateTest_combproc: PROCESS (yip1E_11_uid228_vecRotateTest_a, yip1E_11_uid228_vecRotateTest_b, yip1E_11_uid228_vecRotateTest_s)
    BEGIN
        IF (yip1E_11_uid228_vecRotateTest_s = "1") THEN
            yip1E_11_uid228_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid228_vecRotateTest_a) + SIGNED(yip1E_11_uid228_vecRotateTest_b));
        ELSE
            yip1E_11_uid228_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid228_vecRotateTest_a) - SIGNED(yip1E_11_uid228_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_11_uid228_vecRotateTest_q <= yip1E_11_uid228_vecRotateTest_o(29 downto 0);

    -- yip1_11_uid235_vecRotateTest(BITSELECT,234)@12
    yip1_11_uid235_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_11_uid228_vecRotateTest_q(28 downto 0));
    yip1_11_uid235_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_11_uid235_vecRotateTest_in(28 downto 0));

    -- redist11_yip1_11_uid235_vecRotateTest_b_1(DELAY,385)
    redist11_yip1_11_uid235_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_11_uid235_vecRotateTest_b, xout => redist11_yip1_11_uid235_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_12_uid247_vecRotateTest(ADDSUB,246)@13
    yip1E_12_uid247_vecRotateTest_s <= signOfSelectionSignal_uid239_vecRotateTest_q;
    yip1E_12_uid247_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist11_yip1_11_uid235_vecRotateTest_b_1_q(28)) & redist11_yip1_11_uid235_vecRotateTest_b_1_q));
    yip1E_12_uid247_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 18 => twoToMiSiXip_uid242_vecRotateTest_b(17)) & twoToMiSiXip_uid242_vecRotateTest_b));
    yip1E_12_uid247_vecRotateTest_combproc: PROCESS (yip1E_12_uid247_vecRotateTest_a, yip1E_12_uid247_vecRotateTest_b, yip1E_12_uid247_vecRotateTest_s)
    BEGIN
        IF (yip1E_12_uid247_vecRotateTest_s = "1") THEN
            yip1E_12_uid247_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid247_vecRotateTest_a) + SIGNED(yip1E_12_uid247_vecRotateTest_b));
        ELSE
            yip1E_12_uid247_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid247_vecRotateTest_a) - SIGNED(yip1E_12_uid247_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_12_uid247_vecRotateTest_q <= yip1E_12_uid247_vecRotateTest_o(29 downto 0);

    -- yip1_12_uid254_vecRotateTest(BITSELECT,253)@13
    yip1_12_uid254_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_12_uid247_vecRotateTest_q(28 downto 0));
    yip1_12_uid254_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_12_uid254_vecRotateTest_in(28 downto 0));

    -- redist6_yip1_12_uid254_vecRotateTest_b_1(DELAY,380)
    redist6_yip1_12_uid254_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_12_uid254_vecRotateTest_b, xout => redist6_yip1_12_uid254_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- redist7_yip1_12_uid254_vecRotateTest_b_3(DELAY,381)
    redist7_yip1_12_uid254_vecRotateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 29, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist6_yip1_12_uid254_vecRotateTest_b_1_q, xout => redist7_yip1_12_uid254_vecRotateTest_b_3_q, clk => clk, aclr => areset );

    -- outYE_uid260_vecRotateTest_shift6(BITSHIFT,354)@16
    outYE_uid260_vecRotateTest_shift6_qint <= redist7_yip1_12_uid254_vecRotateTest_b_3_q & "000000000000";
    outYE_uid260_vecRotateTest_shift6_q <= outYE_uid260_vecRotateTest_shift6_qint(40 downto 0);

    -- outYE_uid260_vecRotateTest_shift0(BITSHIFT,348)@14
    outYE_uid260_vecRotateTest_shift0_qint <= redist6_yip1_12_uid254_vecRotateTest_b_1_q & "0000";
    outYE_uid260_vecRotateTest_shift0_q <= outYE_uid260_vecRotateTest_shift0_qint(32 downto 0);

    -- outYE_uid260_vecRotateTest_add_1(ADD,349)@14 + 1
    outYE_uid260_vecRotateTest_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 29 => redist6_yip1_12_uid254_vecRotateTest_b_1_q(28)) & redist6_yip1_12_uid254_vecRotateTest_b_1_q));
    outYE_uid260_vecRotateTest_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => outYE_uid260_vecRotateTest_shift0_q(32)) & outYE_uid260_vecRotateTest_shift0_q));
    outYE_uid260_vecRotateTest_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outYE_uid260_vecRotateTest_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outYE_uid260_vecRotateTest_add_1_o <= STD_LOGIC_VECTOR(SIGNED(outYE_uid260_vecRotateTest_add_1_a) + SIGNED(outYE_uid260_vecRotateTest_add_1_b));
        END IF;
    END PROCESS;
    outYE_uid260_vecRotateTest_add_1_q <= outYE_uid260_vecRotateTest_add_1_o(33 downto 0);

    -- outYE_uid260_vecRotateTest_shift2(BITSHIFT,350)@14
    outYE_uid260_vecRotateTest_shift2_qint <= redist6_yip1_12_uid254_vecRotateTest_b_1_q & "000";
    outYE_uid260_vecRotateTest_shift2_q <= outYE_uid260_vecRotateTest_shift2_qint(31 downto 0);

    -- outYE_uid260_vecRotateTest_sub_3(SUB,351)@14 + 1
    outYE_uid260_vecRotateTest_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => outYE_uid260_vecRotateTest_shift2_q(31)) & outYE_uid260_vecRotateTest_shift2_q));
    outYE_uid260_vecRotateTest_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 29 => redist6_yip1_12_uid254_vecRotateTest_b_1_q(28)) & redist6_yip1_12_uid254_vecRotateTest_b_1_q));
    outYE_uid260_vecRotateTest_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outYE_uid260_vecRotateTest_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outYE_uid260_vecRotateTest_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(outYE_uid260_vecRotateTest_sub_3_a) - SIGNED(outYE_uid260_vecRotateTest_sub_3_b));
        END IF;
    END PROCESS;
    outYE_uid260_vecRotateTest_sub_3_q <= outYE_uid260_vecRotateTest_sub_3_o(32 downto 0);

    -- outYE_uid260_vecRotateTest_shift4(BITSHIFT,352)@15
    outYE_uid260_vecRotateTest_shift4_qint <= outYE_uid260_vecRotateTest_sub_3_q & "0000000";
    outYE_uid260_vecRotateTest_shift4_q <= outYE_uid260_vecRotateTest_shift4_qint(39 downto 0);

    -- outYE_uid260_vecRotateTest_sub_5(SUB,353)@15 + 1
    outYE_uid260_vecRotateTest_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 40 => outYE_uid260_vecRotateTest_shift4_q(39)) & outYE_uid260_vecRotateTest_shift4_q));
    outYE_uid260_vecRotateTest_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 34 => outYE_uid260_vecRotateTest_add_1_q(33)) & outYE_uid260_vecRotateTest_add_1_q));
    outYE_uid260_vecRotateTest_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outYE_uid260_vecRotateTest_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outYE_uid260_vecRotateTest_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(outYE_uid260_vecRotateTest_sub_5_a) - SIGNED(outYE_uid260_vecRotateTest_sub_5_b));
        END IF;
    END PROCESS;
    outYE_uid260_vecRotateTest_sub_5_q <= outYE_uid260_vecRotateTest_sub_5_o(40 downto 0);

    -- outYE_uid260_vecRotateTest_add_7(ADD,355)@16 + 1
    outYE_uid260_vecRotateTest_add_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 41 => outYE_uid260_vecRotateTest_sub_5_q(40)) & outYE_uid260_vecRotateTest_sub_5_q));
    outYE_uid260_vecRotateTest_add_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 41 => outYE_uid260_vecRotateTest_shift6_q(40)) & outYE_uid260_vecRotateTest_shift6_q));
    outYE_uid260_vecRotateTest_add_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outYE_uid260_vecRotateTest_add_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outYE_uid260_vecRotateTest_add_7_o <= STD_LOGIC_VECTOR(SIGNED(outYE_uid260_vecRotateTest_add_7_a) + SIGNED(outYE_uid260_vecRotateTest_add_7_b));
        END IF;
    END PROCESS;
    outYE_uid260_vecRotateTest_add_7_q <= outYE_uid260_vecRotateTest_add_7_o(41 downto 0);

    -- highABits_uid359_outYE_uid260_vecRotateTest(BITSELECT,358)@17
    highABits_uid359_outYE_uid260_vecRotateTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 42 => outYE_uid260_vecRotateTest_add_7_q(41)) & outYE_uid260_vecRotateTest_add_7_q));
    highABits_uid359_outYE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(highABits_uid359_outYE_uid260_vecRotateTest_in(42 downto 30));

    -- srPostRndhigh_uid360_outYE_uid260_vecRotateTest(ADD,359)@17 + 1
    srPostRndhigh_uid360_outYE_uid260_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => highABits_uid359_outYE_uid260_vecRotateTest_b(12)) & highABits_uid359_outYE_uid260_vecRotateTest_b));
    srPostRndhigh_uid360_outYE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & VCC_q));
    srPostRndhigh_uid360_outYE_uid260_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            srPostRndhigh_uid360_outYE_uid260_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            srPostRndhigh_uid360_outYE_uid260_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(srPostRndhigh_uid360_outYE_uid260_vecRotateTest_a) + SIGNED(srPostRndhigh_uid360_outYE_uid260_vecRotateTest_b));
        END IF;
    END PROCESS;
    srPostRndhigh_uid360_outYE_uid260_vecRotateTest_q <= srPostRndhigh_uid360_outYE_uid260_vecRotateTest_o(13 downto 0);

    -- lowRangeA_uid358_outYE_uid260_vecRotateTest(BITSELECT,357)@17
    lowRangeA_uid358_outYE_uid260_vecRotateTest_in <= outYE_uid260_vecRotateTest_add_7_q(29 downto 0);
    lowRangeA_uid358_outYE_uid260_vecRotateTest_b <= lowRangeA_uid358_outYE_uid260_vecRotateTest_in(29 downto 0);

    -- redist3_lowRangeA_uid358_outYE_uid260_vecRotateTest_b_1(DELAY,377)
    redist3_lowRangeA_uid358_outYE_uid260_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid358_outYE_uid260_vecRotateTest_b, xout => redist3_lowRangeA_uid358_outYE_uid260_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- srPostRnd_uid361_outYE_uid260_vecRotateTest(BITJOIN,360)@18
    srPostRnd_uid361_outYE_uid260_vecRotateTest_q <= srPostRndhigh_uid360_outYE_uid260_vecRotateTest_q & redist3_lowRangeA_uid358_outYE_uid260_vecRotateTest_b_1_q;

    -- sR_uid371_outYE_uid260_vecRotateTest(BITSELECT,370)@18
    sR_uid371_outYE_uid260_vecRotateTest_in <= STD_LOGIC_VECTOR(srPostRnd_uid361_outYE_uid260_vecRotateTest_q(41 downto 0));
    sR_uid371_outYE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(sR_uid371_outYE_uid260_vecRotateTest_in(41 downto 31));

    -- redist2_sR_uid371_outYE_uid260_vecRotateTest_b_1(DELAY,376)
    redist2_sR_uid371_outYE_uid260_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sR_uid371_outYE_uid260_vecRotateTest_b, xout => redist2_sR_uid371_outYE_uid260_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- paddingX_uid309_outXE_uid258_vecRotateTest(CONSTANT,308)
    paddingX_uid309_outXE_uid258_vecRotateTest_q <= "0000000000000000000000000000000";

    -- updatedX_uid310_outXE_uid258_vecRotateTest(BITJOIN,309)@18
    updatedX_uid310_outXE_uid258_vecRotateTest_q <= maxValInOutFormat_uid307_outXE_uid258_vecRotateTest_q & paddingX_uid309_outXE_uid258_vecRotateTest_q;

    -- ovf_uid364_outYE_uid260_vecRotateTest(COMPARE,365)@18 + 1
    ovf_uid364_outYE_uid260_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 42 => updatedX_uid310_outXE_uid258_vecRotateTest_q(41)) & updatedX_uid310_outXE_uid258_vecRotateTest_q));
    ovf_uid364_outYE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 44 => srPostRnd_uid361_outYE_uid260_vecRotateTest_q(43)) & srPostRnd_uid361_outYE_uid260_vecRotateTest_q));
    ovf_uid364_outYE_uid260_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ovf_uid364_outYE_uid260_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            ovf_uid364_outYE_uid260_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid364_outYE_uid260_vecRotateTest_a) - SIGNED(ovf_uid364_outYE_uid260_vecRotateTest_b));
        END IF;
    END PROCESS;
    ovf_uid364_outYE_uid260_vecRotateTest_c(0) <= ovf_uid364_outYE_uid260_vecRotateTest_o(45);

    -- updatedY_uid313_outXE_uid258_vecRotateTest(BITJOIN,312)@18
    updatedY_uid313_outXE_uid258_vecRotateTest_q <= minValueInFormat_uid308_outXE_uid258_vecRotateTest_q & paddingX_uid309_outXE_uid258_vecRotateTest_q;

    -- udf_uid367_outYE_uid260_vecRotateTest(COMPARE,368)@18 + 1
    udf_uid367_outYE_uid260_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 44 => srPostRnd_uid361_outYE_uid260_vecRotateTest_q(43)) & srPostRnd_uid361_outYE_uid260_vecRotateTest_q));
    udf_uid367_outYE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 42 => updatedY_uid313_outXE_uid258_vecRotateTest_q(41)) & updatedY_uid313_outXE_uid258_vecRotateTest_q));
    udf_uid367_outYE_uid260_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            udf_uid367_outYE_uid260_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            udf_uid367_outYE_uid260_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid367_outYE_uid260_vecRotateTest_a) - SIGNED(udf_uid367_outYE_uid260_vecRotateTest_b));
        END IF;
    END PROCESS;
    udf_uid367_outYE_uid260_vecRotateTest_c(0) <= udf_uid367_outYE_uid260_vecRotateTest_o(45);

    -- ovfudfcond_uid370_outYE_uid260_vecRotateTest(BITJOIN,369)@19
    ovfudfcond_uid370_outYE_uid260_vecRotateTest_q <= ovf_uid364_outYE_uid260_vecRotateTest_c & udf_uid367_outYE_uid260_vecRotateTest_c;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- sRA1_uid372_outYE_uid260_vecRotateTest(MUX,371)@19
    sRA1_uid372_outYE_uid260_vecRotateTest_s <= ovfudfcond_uid370_outYE_uid260_vecRotateTest_q;
    sRA1_uid372_outYE_uid260_vecRotateTest_combproc: PROCESS (sRA1_uid372_outYE_uid260_vecRotateTest_s, redist2_sR_uid371_outYE_uid260_vecRotateTest_b_1_q, minValueInFormat_uid308_outXE_uid258_vecRotateTest_q, maxValInOutFormat_uid307_outXE_uid258_vecRotateTest_q)
    BEGIN
        CASE (sRA1_uid372_outYE_uid260_vecRotateTest_s) IS
            WHEN "00" => sRA1_uid372_outYE_uid260_vecRotateTest_q <= redist2_sR_uid371_outYE_uid260_vecRotateTest_b_1_q;
            WHEN "01" => sRA1_uid372_outYE_uid260_vecRotateTest_q <= minValueInFormat_uid308_outXE_uid258_vecRotateTest_q;
            WHEN "10" => sRA1_uid372_outYE_uid260_vecRotateTest_q <= maxValInOutFormat_uid307_outXE_uid258_vecRotateTest_q;
            WHEN "11" => sRA1_uid372_outYE_uid260_vecRotateTest_q <= maxValInOutFormat_uid307_outXE_uid258_vecRotateTest_q;
            WHEN OTHERS => sRA1_uid372_outYE_uid260_vecRotateTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outY_uid261_vecRotateTest(BITSELECT,260)@19
    outY_uid261_vecRotateTest_in <= STD_LOGIC_VECTOR(sRA1_uid372_outYE_uid260_vecRotateTest_q(9 downto 0));
    outY_uid261_vecRotateTest_b <= STD_LOGIC_VECTOR(outY_uid261_vecRotateTest_in(9 downto 0));

    -- twoToMiSiYip_uid243_vecRotateTest(BITSELECT,242)@13
    twoToMiSiYip_uid243_vecRotateTest_b <= STD_LOGIC_VECTOR(redist11_yip1_11_uid235_vecRotateTest_b_1_q(28 downto 11));

    -- xip1E_12_uid246_vecRotateTest(ADDSUB,245)@13
    xip1E_12_uid246_vecRotateTest_s <= redist10_xMSB_uid237_vecRotateTest_b_1_q;
    xip1E_12_uid246_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => redist12_xip1_11_uid234_vecRotateTest_b_1_q(28)) & redist12_xip1_11_uid234_vecRotateTest_b_1_q));
    xip1E_12_uid246_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 18 => twoToMiSiYip_uid243_vecRotateTest_b(17)) & twoToMiSiYip_uid243_vecRotateTest_b));
    xip1E_12_uid246_vecRotateTest_combproc: PROCESS (xip1E_12_uid246_vecRotateTest_a, xip1E_12_uid246_vecRotateTest_b, xip1E_12_uid246_vecRotateTest_s)
    BEGIN
        IF (xip1E_12_uid246_vecRotateTest_s = "1") THEN
            xip1E_12_uid246_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid246_vecRotateTest_a) + SIGNED(xip1E_12_uid246_vecRotateTest_b));
        ELSE
            xip1E_12_uid246_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid246_vecRotateTest_a) - SIGNED(xip1E_12_uid246_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_12_uid246_vecRotateTest_q <= xip1E_12_uid246_vecRotateTest_o(29 downto 0);

    -- xip1_12_uid253_vecRotateTest(BITSELECT,252)@13
    xip1_12_uid253_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_12_uid246_vecRotateTest_q(28 downto 0));
    xip1_12_uid253_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_12_uid253_vecRotateTest_in(28 downto 0));

    -- redist8_xip1_12_uid253_vecRotateTest_b_1(DELAY,382)
    redist8_xip1_12_uid253_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_12_uid253_vecRotateTest_b, xout => redist8_xip1_12_uid253_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- redist9_xip1_12_uid253_vecRotateTest_b_3(DELAY,383)
    redist9_xip1_12_uid253_vecRotateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 29, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_xip1_12_uid253_vecRotateTest_b_1_q, xout => redist9_xip1_12_uid253_vecRotateTest_b_3_q, clk => clk, aclr => areset );

    -- outXE_uid258_vecRotateTest_shift6(BITSHIFT,299)@16
    outXE_uid258_vecRotateTest_shift6_qint <= redist9_xip1_12_uid253_vecRotateTest_b_3_q & "000000000000";
    outXE_uid258_vecRotateTest_shift6_q <= outXE_uid258_vecRotateTest_shift6_qint(40 downto 0);

    -- outXE_uid258_vecRotateTest_shift0(BITSHIFT,293)@14
    outXE_uid258_vecRotateTest_shift0_qint <= redist8_xip1_12_uid253_vecRotateTest_b_1_q & "0000";
    outXE_uid258_vecRotateTest_shift0_q <= outXE_uid258_vecRotateTest_shift0_qint(32 downto 0);

    -- outXE_uid258_vecRotateTest_add_1(ADD,294)@14 + 1
    outXE_uid258_vecRotateTest_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 29 => redist8_xip1_12_uid253_vecRotateTest_b_1_q(28)) & redist8_xip1_12_uid253_vecRotateTest_b_1_q));
    outXE_uid258_vecRotateTest_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 33 => outXE_uid258_vecRotateTest_shift0_q(32)) & outXE_uid258_vecRotateTest_shift0_q));
    outXE_uid258_vecRotateTest_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outXE_uid258_vecRotateTest_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outXE_uid258_vecRotateTest_add_1_o <= STD_LOGIC_VECTOR(SIGNED(outXE_uid258_vecRotateTest_add_1_a) + SIGNED(outXE_uid258_vecRotateTest_add_1_b));
        END IF;
    END PROCESS;
    outXE_uid258_vecRotateTest_add_1_q <= outXE_uid258_vecRotateTest_add_1_o(33 downto 0);

    -- outXE_uid258_vecRotateTest_shift2(BITSHIFT,295)@14
    outXE_uid258_vecRotateTest_shift2_qint <= redist8_xip1_12_uid253_vecRotateTest_b_1_q & "000";
    outXE_uid258_vecRotateTest_shift2_q <= outXE_uid258_vecRotateTest_shift2_qint(31 downto 0);

    -- outXE_uid258_vecRotateTest_sub_3(SUB,296)@14 + 1
    outXE_uid258_vecRotateTest_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 32 => outXE_uid258_vecRotateTest_shift2_q(31)) & outXE_uid258_vecRotateTest_shift2_q));
    outXE_uid258_vecRotateTest_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 29 => redist8_xip1_12_uid253_vecRotateTest_b_1_q(28)) & redist8_xip1_12_uid253_vecRotateTest_b_1_q));
    outXE_uid258_vecRotateTest_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outXE_uid258_vecRotateTest_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outXE_uid258_vecRotateTest_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(outXE_uid258_vecRotateTest_sub_3_a) - SIGNED(outXE_uid258_vecRotateTest_sub_3_b));
        END IF;
    END PROCESS;
    outXE_uid258_vecRotateTest_sub_3_q <= outXE_uid258_vecRotateTest_sub_3_o(32 downto 0);

    -- outXE_uid258_vecRotateTest_shift4(BITSHIFT,297)@15
    outXE_uid258_vecRotateTest_shift4_qint <= outXE_uid258_vecRotateTest_sub_3_q & "0000000";
    outXE_uid258_vecRotateTest_shift4_q <= outXE_uid258_vecRotateTest_shift4_qint(39 downto 0);

    -- outXE_uid258_vecRotateTest_sub_5(SUB,298)@15 + 1
    outXE_uid258_vecRotateTest_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 40 => outXE_uid258_vecRotateTest_shift4_q(39)) & outXE_uid258_vecRotateTest_shift4_q));
    outXE_uid258_vecRotateTest_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 34 => outXE_uid258_vecRotateTest_add_1_q(33)) & outXE_uid258_vecRotateTest_add_1_q));
    outXE_uid258_vecRotateTest_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outXE_uid258_vecRotateTest_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outXE_uid258_vecRotateTest_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(outXE_uid258_vecRotateTest_sub_5_a) - SIGNED(outXE_uid258_vecRotateTest_sub_5_b));
        END IF;
    END PROCESS;
    outXE_uid258_vecRotateTest_sub_5_q <= outXE_uid258_vecRotateTest_sub_5_o(40 downto 0);

    -- outXE_uid258_vecRotateTest_add_7(ADD,300)@16 + 1
    outXE_uid258_vecRotateTest_add_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 41 => outXE_uid258_vecRotateTest_sub_5_q(40)) & outXE_uid258_vecRotateTest_sub_5_q));
    outXE_uid258_vecRotateTest_add_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 41 => outXE_uid258_vecRotateTest_shift6_q(40)) & outXE_uid258_vecRotateTest_shift6_q));
    outXE_uid258_vecRotateTest_add_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outXE_uid258_vecRotateTest_add_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outXE_uid258_vecRotateTest_add_7_o <= STD_LOGIC_VECTOR(SIGNED(outXE_uid258_vecRotateTest_add_7_a) + SIGNED(outXE_uid258_vecRotateTest_add_7_b));
        END IF;
    END PROCESS;
    outXE_uid258_vecRotateTest_add_7_q <= outXE_uid258_vecRotateTest_add_7_o(41 downto 0);

    -- highABits_uid304_outXE_uid258_vecRotateTest(BITSELECT,303)@17
    highABits_uid304_outXE_uid258_vecRotateTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 42 => outXE_uid258_vecRotateTest_add_7_q(41)) & outXE_uid258_vecRotateTest_add_7_q));
    highABits_uid304_outXE_uid258_vecRotateTest_b <= STD_LOGIC_VECTOR(highABits_uid304_outXE_uid258_vecRotateTest_in(42 downto 30));

    -- srPostRndhigh_uid305_outXE_uid258_vecRotateTest(ADD,304)@17 + 1
    srPostRndhigh_uid305_outXE_uid258_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => highABits_uid304_outXE_uid258_vecRotateTest_b(12)) & highABits_uid304_outXE_uid258_vecRotateTest_b));
    srPostRndhigh_uid305_outXE_uid258_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & VCC_q));
    srPostRndhigh_uid305_outXE_uid258_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            srPostRndhigh_uid305_outXE_uid258_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            srPostRndhigh_uid305_outXE_uid258_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(srPostRndhigh_uid305_outXE_uid258_vecRotateTest_a) + SIGNED(srPostRndhigh_uid305_outXE_uid258_vecRotateTest_b));
        END IF;
    END PROCESS;
    srPostRndhigh_uid305_outXE_uid258_vecRotateTest_q <= srPostRndhigh_uid305_outXE_uid258_vecRotateTest_o(13 downto 0);

    -- lowRangeA_uid303_outXE_uid258_vecRotateTest(BITSELECT,302)@17
    lowRangeA_uid303_outXE_uid258_vecRotateTest_in <= outXE_uid258_vecRotateTest_add_7_q(29 downto 0);
    lowRangeA_uid303_outXE_uid258_vecRotateTest_b <= lowRangeA_uid303_outXE_uid258_vecRotateTest_in(29 downto 0);

    -- redist5_lowRangeA_uid303_outXE_uid258_vecRotateTest_b_1(DELAY,379)
    redist5_lowRangeA_uid303_outXE_uid258_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid303_outXE_uid258_vecRotateTest_b, xout => redist5_lowRangeA_uid303_outXE_uid258_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- srPostRnd_uid306_outXE_uid258_vecRotateTest(BITJOIN,305)@18
    srPostRnd_uid306_outXE_uid258_vecRotateTest_q <= srPostRndhigh_uid305_outXE_uid258_vecRotateTest_q & redist5_lowRangeA_uid303_outXE_uid258_vecRotateTest_b_1_q;

    -- sR_uid316_outXE_uid258_vecRotateTest(BITSELECT,315)@18
    sR_uid316_outXE_uid258_vecRotateTest_in <= STD_LOGIC_VECTOR(srPostRnd_uid306_outXE_uid258_vecRotateTest_q(41 downto 0));
    sR_uid316_outXE_uid258_vecRotateTest_b <= STD_LOGIC_VECTOR(sR_uid316_outXE_uid258_vecRotateTest_in(41 downto 31));

    -- redist4_sR_uid316_outXE_uid258_vecRotateTest_b_1(DELAY,378)
    redist4_sR_uid316_outXE_uid258_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sR_uid316_outXE_uid258_vecRotateTest_b, xout => redist4_sR_uid316_outXE_uid258_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- ovf_uid309_outXE_uid258_vecRotateTest(COMPARE,310)@18 + 1
    ovf_uid309_outXE_uid258_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 42 => updatedX_uid310_outXE_uid258_vecRotateTest_q(41)) & updatedX_uid310_outXE_uid258_vecRotateTest_q));
    ovf_uid309_outXE_uid258_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 44 => srPostRnd_uid306_outXE_uid258_vecRotateTest_q(43)) & srPostRnd_uid306_outXE_uid258_vecRotateTest_q));
    ovf_uid309_outXE_uid258_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ovf_uid309_outXE_uid258_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            ovf_uid309_outXE_uid258_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid309_outXE_uid258_vecRotateTest_a) - SIGNED(ovf_uid309_outXE_uid258_vecRotateTest_b));
        END IF;
    END PROCESS;
    ovf_uid309_outXE_uid258_vecRotateTest_c(0) <= ovf_uid309_outXE_uid258_vecRotateTest_o(45);

    -- udf_uid312_outXE_uid258_vecRotateTest(COMPARE,313)@18 + 1
    udf_uid312_outXE_uid258_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 44 => srPostRnd_uid306_outXE_uid258_vecRotateTest_q(43)) & srPostRnd_uid306_outXE_uid258_vecRotateTest_q));
    udf_uid312_outXE_uid258_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 42 => updatedY_uid313_outXE_uid258_vecRotateTest_q(41)) & updatedY_uid313_outXE_uid258_vecRotateTest_q));
    udf_uid312_outXE_uid258_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            udf_uid312_outXE_uid258_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            udf_uid312_outXE_uid258_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid312_outXE_uid258_vecRotateTest_a) - SIGNED(udf_uid312_outXE_uid258_vecRotateTest_b));
        END IF;
    END PROCESS;
    udf_uid312_outXE_uid258_vecRotateTest_c(0) <= udf_uid312_outXE_uid258_vecRotateTest_o(45);

    -- ovfudfcond_uid315_outXE_uid258_vecRotateTest(BITJOIN,314)@19
    ovfudfcond_uid315_outXE_uid258_vecRotateTest_q <= ovf_uid309_outXE_uid258_vecRotateTest_c & udf_uid312_outXE_uid258_vecRotateTest_c;

    -- sRA1_uid317_outXE_uid258_vecRotateTest(MUX,316)@19
    sRA1_uid317_outXE_uid258_vecRotateTest_s <= ovfudfcond_uid315_outXE_uid258_vecRotateTest_q;
    sRA1_uid317_outXE_uid258_vecRotateTest_combproc: PROCESS (sRA1_uid317_outXE_uid258_vecRotateTest_s, redist4_sR_uid316_outXE_uid258_vecRotateTest_b_1_q, minValueInFormat_uid308_outXE_uid258_vecRotateTest_q, maxValInOutFormat_uid307_outXE_uid258_vecRotateTest_q)
    BEGIN
        CASE (sRA1_uid317_outXE_uid258_vecRotateTest_s) IS
            WHEN "00" => sRA1_uid317_outXE_uid258_vecRotateTest_q <= redist4_sR_uid316_outXE_uid258_vecRotateTest_b_1_q;
            WHEN "01" => sRA1_uid317_outXE_uid258_vecRotateTest_q <= minValueInFormat_uid308_outXE_uid258_vecRotateTest_q;
            WHEN "10" => sRA1_uid317_outXE_uid258_vecRotateTest_q <= maxValInOutFormat_uid307_outXE_uid258_vecRotateTest_q;
            WHEN "11" => sRA1_uid317_outXE_uid258_vecRotateTest_q <= maxValInOutFormat_uid307_outXE_uid258_vecRotateTest_q;
            WHEN OTHERS => sRA1_uid317_outXE_uid258_vecRotateTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outX_uid259_vecRotateTest(BITSELECT,258)@19
    outX_uid259_vecRotateTest_in <= STD_LOGIC_VECTOR(sRA1_uid317_outXE_uid258_vecRotateTest_q(9 downto 0));
    outX_uid259_vecRotateTest_b <= STD_LOGIC_VECTOR(outX_uid259_vecRotateTest_in(9 downto 0));

    -- xOut(GPOUT,4)@19
    xo <= outX_uid259_vecRotateTest_b;
    yo <= outY_uid261_vecRotateTest_b;

END normal;
