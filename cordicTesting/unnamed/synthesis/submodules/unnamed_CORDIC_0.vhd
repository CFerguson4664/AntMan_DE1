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

-- VHDL created from unnamed_CORDIC_0
-- VHDL created on Sat Mar 20 18:31:20 2021


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

entity unnamed_CORDIC_0 is
    port (
        x : in std_logic_vector(11 downto 0);  -- sfix12_en10
        y : in std_logic_vector(11 downto 0);  -- sfix12_en10
        a : in std_logic_vector(12 downto 0);  -- sfix13_en10
        xo : out std_logic_vector(9 downto 0);  -- sfix10_en8
        yo : out std_logic_vector(9 downto 0);  -- sfix10_en8
        clk : in std_logic;
        areset : in std_logic
    );
end unnamed_CORDIC_0;

architecture normal of unnamed_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstPiO2_uid8_vecRotateTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal absAECostZeroPaddingA_uid9_vecRotateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal absAENA_uid10_vecRotateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal absAEsumAHighB_uid11_vecRotateTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal absAEsumAHighB_uid11_vecRotateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal absAEsumAHighB_uid11_vecRotateTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal absAEsumAHighB_uid11_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absAEsumAHighB_uid11_vecRotateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal invMsbuAbsAE_uid13_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal firstQuadrantCond1_uid14_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignA_uid15_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal firstQuadrantCond0_uid16_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal firstQuadrant_uid17_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aInFirstQuadrant_mergedSignalTM_uid20_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal absA_uid23_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absA_uid23_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal padACst_uid24_vecRotateTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal aPostPad_uid25_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal mx_uid26_vecRotateTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal mx_uid26_vecRotateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal mx_uid26_vecRotateTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal mx_uid26_vecRotateTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal mxR_uid27_vecRotateTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal mxR_uid27_vecRotateTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal my_uid30_vecRotateTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal my_uid30_vecRotateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal my_uid30_vecRotateTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal my_uid30_vecRotateTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal myR_uid31_vecRotateTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal myR_uid31_vecRotateTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal concSignAFirstQuadrant_uid32_vecRotateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal absX_uid33_vecRotateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal absX_uid33_vecRotateTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal absY_uid34_vecRotateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal absY_uid34_vecRotateTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xMSB_uid36_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid38_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_0_uid41_vecRotateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_1_uid43_vecRotateTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_1_uid43_vecRotateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_1_uid43_vecRotateTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_1_uid43_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_1_uid43_vecRotateTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal yip1E_1_uid44_vecRotateTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1E_1_uid44_vecRotateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1E_1_uid44_vecRotateTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1E_1_uid44_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_1_uid44_vecRotateTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_1CostZeroPaddingA_uid46_vecRotateTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aip1E_1NA_uid47_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_1sumAHighB_uid48_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid48_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid48_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid48_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1sumAHighB_uid48_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_uid51_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid51_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid52_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid54_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_1_uid57_vecRotateTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2NA_uid60_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_2sumAHighB_uid61_vecRotateTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_2sumAHighB_uid61_vecRotateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_2sumAHighB_uid61_vecRotateTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_2sumAHighB_uid61_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2sumAHighB_uid61_vecRotateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal yip1E_2NA_uid63_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1E_2sumAHighB_uid64_vecRotateTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1E_2sumAHighB_uid64_vecRotateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1E_2sumAHighB_uid64_vecRotateTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1E_2sumAHighB_uid64_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2sumAHighB_uid64_vecRotateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_2_uid66_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid66_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid66_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid66_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2_uid66_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_2_uid67_vecRotateTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1_2_uid67_vecRotateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1_2_uid68_vecRotateTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal yip1_2_uid68_vecRotateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_uid69_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid69_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid70_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid72_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_2_uid75_vecRotateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_3NA_uid78_vecRotateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_3sumAHighB_uid79_vecRotateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_3sumAHighB_uid79_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_3sumAHighB_uid79_vecRotateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_3sumAHighB_uid79_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3sumAHighB_uid79_vecRotateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_3NA_uid81_vecRotateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1E_3sumAHighB_uid82_vecRotateTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1E_3sumAHighB_uid82_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1E_3sumAHighB_uid82_vecRotateTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1E_3sumAHighB_uid82_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3sumAHighB_uid82_vecRotateTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_3_uid84_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_3_uid84_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_3_uid84_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_3_uid84_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3_uid84_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_3_uid85_vecRotateTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_3_uid85_vecRotateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1_3_uid86_vecRotateTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal yip1_3_uid86_vecRotateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_uid87_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid87_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid88_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid90_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_3_uid93_vecRotateTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_4CostZeroPaddingA_uid95_vecRotateTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal xip1E_4NA_uid96_vecRotateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_4sumAHighB_uid97_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_4sumAHighB_uid97_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_4sumAHighB_uid97_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_4sumAHighB_uid97_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4sumAHighB_uid97_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_4NA_uid99_vecRotateTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1E_4sumAHighB_uid100_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_4sumAHighB_uid100_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_4sumAHighB_uid100_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_4sumAHighB_uid100_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4sumAHighB_uid100_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_4_uid102_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_4_uid102_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_4_uid102_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_4_uid102_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4_uid102_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_4_uid103_vecRotateTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_4_uid103_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1_4_uid104_vecRotateTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1_4_uid104_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_uid105_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid105_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid106_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid108_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_4_uid111_vecRotateTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_5CostZeroPaddingA_uid113_vecRotateTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal xip1E_5NA_uid114_vecRotateTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_5sumAHighB_uid115_vecRotateTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5sumAHighB_uid115_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5sumAHighB_uid115_vecRotateTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5sumAHighB_uid115_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5sumAHighB_uid115_vecRotateTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_5NA_uid117_vecRotateTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_5sumAHighB_uid118_vecRotateTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5sumAHighB_uid118_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5sumAHighB_uid118_vecRotateTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5sumAHighB_uid118_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5sumAHighB_uid118_vecRotateTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_5_uid120_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_5_uid120_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_5_uid120_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_5_uid120_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5_uid120_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_5_uid121_vecRotateTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_5_uid121_vecRotateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_5_uid122_vecRotateTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_5_uid122_vecRotateTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid123_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid123_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid124_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid126_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid129_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid130_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal cstArcTan2Mi_5_uid131_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_6NA_uid134_vecRotateTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_6sumAHighB_uid135_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_6sumAHighB_uid135_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_6sumAHighB_uid135_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_6sumAHighB_uid135_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6sumAHighB_uid135_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_6NA_uid137_vecRotateTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6sumAHighB_uid138_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_6sumAHighB_uid138_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_6sumAHighB_uid138_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_6sumAHighB_uid138_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6sumAHighB_uid138_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_6_uid140_vecRotateTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_6_uid140_vecRotateTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_6_uid140_vecRotateTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_6_uid140_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6_uid140_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_6_uid141_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_6_uid141_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_6_uid142_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_6_uid142_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid143_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid143_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid144_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid146_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid149_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal twoToMiSiYip_uid150_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal cstArcTan2Mi_6_uid151_vecRotateTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_7_uid153_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_7_uid153_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_7_uid153_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_7_uid153_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid153_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_7_uid154_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_7_uid154_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_7_uid154_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_7_uid154_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid154_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal lowRangeA_uid156_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid156_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid157_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_7high_uid158_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_7high_uid158_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_7high_uid158_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_7high_uid158_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7high_uid158_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_7_uid159_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_7_uid160_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_7_uid160_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_7_uid161_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_7_uid161_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid162_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid162_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid163_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid165_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid168_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal twoToMiSiYip_uid169_vecRotateTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal cstArcTan2Mi_7_uid170_vecRotateTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xip1E_8_uid172_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_8_uid172_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_8_uid172_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_8_uid172_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid172_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_8_uid173_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_8_uid173_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_8_uid173_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_8_uid173_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid173_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal lowRangeA_uid175_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid175_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid176_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_8high_uid177_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8high_uid177_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8high_uid177_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8high_uid177_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8high_uid177_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_8_uid178_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_8_uid179_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_8_uid179_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_8_uid180_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_8_uid180_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid181_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid181_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid182_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid184_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid187_vecRotateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal twoToMiSiYip_uid188_vecRotateTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal cstArcTan2Mi_8_uid189_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xip1E_9_uid191_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_9_uid191_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_9_uid191_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_9_uid191_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid191_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_9_uid192_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_9_uid192_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_9_uid192_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_9_uid192_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid192_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal lowRangeA_uid194_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid194_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid195_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_9high_uid196_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_9high_uid196_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_9high_uid196_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_9high_uid196_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9high_uid196_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_9_uid197_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_9_uid198_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_9_uid198_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_9_uid199_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_9_uid199_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid200_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid200_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid201_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid203_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid206_vecRotateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal twoToMiSiYip_uid207_vecRotateTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal cstArcTan2Mi_9_uid208_vecRotateTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal xip1E_10_uid210_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_10_uid210_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_10_uid210_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_10_uid210_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid210_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_10_uid211_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_10_uid211_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_10_uid211_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_10_uid211_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid211_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal lowRangeA_uid213_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid213_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid214_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_10high_uid215_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_10high_uid215_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_10high_uid215_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_10high_uid215_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10high_uid215_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_10_uid216_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_10_uid217_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_10_uid217_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_10_uid218_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_10_uid218_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid219_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid219_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid220_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid222_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid225_vecRotateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal twoToMiSiYip_uid226_vecRotateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal cstArcTan2Mi_10_uid227_vecRotateTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal xip1E_11_uid229_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_11_uid229_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_11_uid229_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_11_uid229_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid229_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_11_uid230_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_11_uid230_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_11_uid230_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_11_uid230_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid230_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal lowRangeA_uid232_vecRotateTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid232_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid233_vecRotateTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_11high_uid234_vecRotateTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_11high_uid234_vecRotateTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_11high_uid234_vecRotateTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_11high_uid234_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11high_uid234_vecRotateTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_11_uid235_vecRotateTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_11_uid236_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_11_uid236_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_11_uid237_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_11_uid237_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid238_vecRotateTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid238_vecRotateTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid239_vecRotateTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid241_vecRotateTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid244_vecRotateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal twoToMiSiYip_uid245_vecRotateTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_12_uid248_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_12_uid248_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_12_uid248_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_12_uid248_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid248_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_12_uid249_vecRotateTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_12_uid249_vecRotateTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_12_uid249_vecRotateTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_12_uid249_vecRotateTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_12_uid249_vecRotateTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_12_uid255_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_12_uid255_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_12_uid256_vecRotateTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_12_uid256_vecRotateTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal outX_uid261_vecRotateTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal outX_uid261_vecRotateTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal outY_uid263_vecRotateTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal outY_uid263_vecRotateTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal outXE_uid260_vecRotateTest_shift0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal outXE_uid260_vecRotateTest_shift0_qint : STD_LOGIC_VECTOR (28 downto 0);
    signal outXE_uid260_vecRotateTest_add_1_a : STD_LOGIC_VECTOR (29 downto 0);
    signal outXE_uid260_vecRotateTest_add_1_b : STD_LOGIC_VECTOR (29 downto 0);
    signal outXE_uid260_vecRotateTest_add_1_o : STD_LOGIC_VECTOR (29 downto 0);
    signal outXE_uid260_vecRotateTest_add_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal outXE_uid260_vecRotateTest_shift2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal outXE_uid260_vecRotateTest_shift2_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal outXE_uid260_vecRotateTest_sub_3_a : STD_LOGIC_VECTOR (28 downto 0);
    signal outXE_uid260_vecRotateTest_sub_3_b : STD_LOGIC_VECTOR (28 downto 0);
    signal outXE_uid260_vecRotateTest_sub_3_o : STD_LOGIC_VECTOR (28 downto 0);
    signal outXE_uid260_vecRotateTest_sub_3_q : STD_LOGIC_VECTOR (28 downto 0);
    signal outXE_uid260_vecRotateTest_shift4_q : STD_LOGIC_VECTOR (35 downto 0);
    signal outXE_uid260_vecRotateTest_shift4_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal outXE_uid260_vecRotateTest_sub_5_a : STD_LOGIC_VECTOR (36 downto 0);
    signal outXE_uid260_vecRotateTest_sub_5_b : STD_LOGIC_VECTOR (36 downto 0);
    signal outXE_uid260_vecRotateTest_sub_5_o : STD_LOGIC_VECTOR (36 downto 0);
    signal outXE_uid260_vecRotateTest_sub_5_q : STD_LOGIC_VECTOR (36 downto 0);
    signal outXE_uid260_vecRotateTest_shift6_q : STD_LOGIC_VECTOR (36 downto 0);
    signal outXE_uid260_vecRotateTest_shift6_qint : STD_LOGIC_VECTOR (36 downto 0);
    signal outXE_uid260_vecRotateTest_add_7_a : STD_LOGIC_VECTOR (37 downto 0);
    signal outXE_uid260_vecRotateTest_add_7_b : STD_LOGIC_VECTOR (37 downto 0);
    signal outXE_uid260_vecRotateTest_add_7_o : STD_LOGIC_VECTOR (37 downto 0);
    signal outXE_uid260_vecRotateTest_add_7_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lowRangeA_uid305_outXE_uid260_vecRotateTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal lowRangeA_uid305_outXE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal highABits_uid306_outXE_uid260_vecRotateTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal highABits_uid306_outXE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal srPostRndhigh_uid307_outXE_uid260_vecRotateTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid307_outXE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid307_outXE_uid260_vecRotateTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid307_outXE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal srPostRnd_uid308_outXE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal maxValInOutFormat_uid309_outXE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal minValueInFormat_uid310_outXE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal paddingX_uid311_outXE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal updatedX_uid312_outXE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal ovf_uid311_outXE_uid260_vecRotateTest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid311_outXE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid311_outXE_uid260_vecRotateTest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid311_outXE_uid260_vecRotateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid315_outXE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal udf_uid314_outXE_uid260_vecRotateTest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid314_outXE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid314_outXE_uid260_vecRotateTest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid314_outXE_uid260_vecRotateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid317_outXE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid318_outXE_uid260_vecRotateTest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal sR_uid318_outXE_uid260_vecRotateTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal sRA1_uid319_outXE_uid260_vecRotateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA1_uid319_outXE_uid260_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal outYE_uid262_vecRotateTest_shift0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal outYE_uid262_vecRotateTest_shift0_qint : STD_LOGIC_VECTOR (28 downto 0);
    signal outYE_uid262_vecRotateTest_add_1_a : STD_LOGIC_VECTOR (29 downto 0);
    signal outYE_uid262_vecRotateTest_add_1_b : STD_LOGIC_VECTOR (29 downto 0);
    signal outYE_uid262_vecRotateTest_add_1_o : STD_LOGIC_VECTOR (29 downto 0);
    signal outYE_uid262_vecRotateTest_add_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal outYE_uid262_vecRotateTest_shift2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal outYE_uid262_vecRotateTest_shift2_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal outYE_uid262_vecRotateTest_sub_3_a : STD_LOGIC_VECTOR (28 downto 0);
    signal outYE_uid262_vecRotateTest_sub_3_b : STD_LOGIC_VECTOR (28 downto 0);
    signal outYE_uid262_vecRotateTest_sub_3_o : STD_LOGIC_VECTOR (28 downto 0);
    signal outYE_uid262_vecRotateTest_sub_3_q : STD_LOGIC_VECTOR (28 downto 0);
    signal outYE_uid262_vecRotateTest_shift4_q : STD_LOGIC_VECTOR (35 downto 0);
    signal outYE_uid262_vecRotateTest_shift4_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal outYE_uid262_vecRotateTest_sub_5_a : STD_LOGIC_VECTOR (36 downto 0);
    signal outYE_uid262_vecRotateTest_sub_5_b : STD_LOGIC_VECTOR (36 downto 0);
    signal outYE_uid262_vecRotateTest_sub_5_o : STD_LOGIC_VECTOR (36 downto 0);
    signal outYE_uid262_vecRotateTest_sub_5_q : STD_LOGIC_VECTOR (36 downto 0);
    signal outYE_uid262_vecRotateTest_shift6_q : STD_LOGIC_VECTOR (36 downto 0);
    signal outYE_uid262_vecRotateTest_shift6_qint : STD_LOGIC_VECTOR (36 downto 0);
    signal outYE_uid262_vecRotateTest_add_7_a : STD_LOGIC_VECTOR (37 downto 0);
    signal outYE_uid262_vecRotateTest_add_7_b : STD_LOGIC_VECTOR (37 downto 0);
    signal outYE_uid262_vecRotateTest_add_7_o : STD_LOGIC_VECTOR (37 downto 0);
    signal outYE_uid262_vecRotateTest_add_7_q : STD_LOGIC_VECTOR (37 downto 0);
    signal lowRangeA_uid360_outYE_uid262_vecRotateTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal lowRangeA_uid360_outYE_uid262_vecRotateTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal highABits_uid361_outYE_uid262_vecRotateTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal highABits_uid361_outYE_uid262_vecRotateTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal srPostRndhigh_uid362_outYE_uid262_vecRotateTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid362_outYE_uid262_vecRotateTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid362_outYE_uid262_vecRotateTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal srPostRndhigh_uid362_outYE_uid262_vecRotateTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal srPostRnd_uid363_outYE_uid262_vecRotateTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal ovf_uid366_outYE_uid262_vecRotateTest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid366_outYE_uid262_vecRotateTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid366_outYE_uid262_vecRotateTest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal ovf_uid366_outYE_uid262_vecRotateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal udf_uid369_outYE_uid262_vecRotateTest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid369_outYE_uid262_vecRotateTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid369_outYE_uid262_vecRotateTest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal udf_uid369_outYE_uid262_vecRotateTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfudfcond_uid372_outYE_uid262_vecRotateTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sR_uid373_outYE_uid262_vecRotateTest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal sR_uid373_outYE_uid262_vecRotateTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal sRA1_uid374_outYE_uid262_vecRotateTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sRA1_uid374_outYE_uid262_vecRotateTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signA_uid7_vecRotateTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signA_uid7_vecRotateTest_merged_bit_select_c : STD_LOGIC_VECTOR (11 downto 0);
    signal msbUAbsAE_uid12_vecRotateTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal msbUAbsAE_uid12_vecRotateTest_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist2_signA_uid7_vecRotateTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_signA_uid7_vecRotateTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist4_sR_uid373_outYE_uid262_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist5_lowRangeA_uid360_outYE_uid262_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist6_sR_uid318_outXE_uid260_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist7_lowRangeA_uid305_outXE_uid260_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist8_yip1_12_uid256_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist9_yip1_12_uid256_vecRotateTest_b_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist10_xip1_12_uid255_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist11_xip1_12_uid255_vecRotateTest_b_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist12_xMSB_uid239_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_yip1_11_uid237_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist14_xip1_11_uid236_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist15_aip1E_uid219_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist16_yip1_10_uid218_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist17_xip1_10_uid217_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist18_aip1E_uid200_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist19_yip1_9_uid199_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist20_xip1_9_uid198_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist21_aip1E_uid181_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist22_yip1_8_uid180_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist23_xip1_8_uid179_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist24_aip1E_uid162_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist25_yip1_7_uid161_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist26_xip1_7_uid160_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist27_aip1E_uid143_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist28_yip1_6_uid142_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist29_xip1_6_uid141_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist30_aip1E_uid123_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist31_yip1_5_uid122_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist32_xip1_5_uid121_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist33_aip1E_uid105_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist34_yip1_4_uid104_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist35_xip1_4_uid103_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist36_aip1E_uid87_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist37_yip1_3_uid86_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist38_xip1_3_uid85_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist39_aip1E_uid69_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist40_yip1_2_uid68_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist41_xip1_2_uid67_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist42_aip1E_uid51_vecRotateTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist43_xIn_x_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist44_xIn_y_1_q : STD_LOGIC_VECTOR (11 downto 0);

begin


    -- maxValInOutFormat_uid309_outXE_uid260_vecRotateTest(CONSTANT,308)
    maxValInOutFormat_uid309_outXE_uid260_vecRotateTest_q <= "01111111111";

    -- minValueInFormat_uid310_outXE_uid260_vecRotateTest(CONSTANT,309)
    minValueInFormat_uid310_outXE_uid260_vecRotateTest_q <= "10000000000";

    -- xMSB_uid124_vecRotateTest(BITSELECT,123)@7
    xMSB_uid124_vecRotateTest_b <= STD_LOGIC_VECTOR(redist30_aip1E_uid123_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_5_uid131_vecRotateTest(CONSTANT,130)
    cstArcTan2Mi_5_uid131_vecRotateTest_q <= "01111111111101";

    -- xMSB_uid106_vecRotateTest(BITSELECT,105)@6
    xMSB_uid106_vecRotateTest_b <= STD_LOGIC_VECTOR(redist33_aip1E_uid105_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_4_uid111_vecRotateTest(CONSTANT,110)
    cstArcTan2Mi_4_uid111_vecRotateTest_q <= "011111111101011";

    -- xMSB_uid88_vecRotateTest(BITSELECT,87)@5
    xMSB_uid88_vecRotateTest_b <= STD_LOGIC_VECTOR(redist36_aip1E_uid87_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_3_uid93_vecRotateTest(CONSTANT,92)
    cstArcTan2Mi_3_uid93_vecRotateTest_q <= "0111111101010111";

    -- xMSB_uid70_vecRotateTest(BITSELECT,69)@4
    xMSB_uid70_vecRotateTest_b <= STD_LOGIC_VECTOR(redist39_aip1E_uid69_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_2_uid75_vecRotateTest(CONSTANT,74)
    cstArcTan2Mi_2_uid75_vecRotateTest_q <= "01111101011011100";

    -- xMSB_uid52_vecRotateTest(BITSELECT,51)@3
    xMSB_uid52_vecRotateTest_b <= STD_LOGIC_VECTOR(redist42_aip1E_uid51_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_1_uid57_vecRotateTest(CONSTANT,56)
    cstArcTan2Mi_1_uid57_vecRotateTest_q <= "011101101011000110";

    -- signA_uid7_vecRotateTest_merged_bit_select(BITSELECT,375)@0
    signA_uid7_vecRotateTest_merged_bit_select_b <= STD_LOGIC_VECTOR(a(12 downto 12));
    signA_uid7_vecRotateTest_merged_bit_select_c <= STD_LOGIC_VECTOR(a(11 downto 0));

    -- redist3_signA_uid7_vecRotateTest_merged_bit_select_c_1(DELAY,380)
    redist3_signA_uid7_vecRotateTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signA_uid7_vecRotateTest_merged_bit_select_c, xout => redist3_signA_uid7_vecRotateTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- absAECostZeroPaddingA_uid9_vecRotateTest(CONSTANT,8)
    absAECostZeroPaddingA_uid9_vecRotateTest_q <= "00";

    -- aInFirstQuadrant_mergedSignalTM_uid20_vecRotateTest(BITJOIN,19)@1
    aInFirstQuadrant_mergedSignalTM_uid20_vecRotateTest_q <= redist3_signA_uid7_vecRotateTest_merged_bit_select_c_1_q & absAECostZeroPaddingA_uid9_vecRotateTest_q;

    -- cstPiO2_uid8_vecRotateTest(CONSTANT,7)
    cstPiO2_uid8_vecRotateTest_q <= "1100100100010";

    -- absAENA_uid10_vecRotateTest(BITJOIN,9)@0
    absAENA_uid10_vecRotateTest_q <= a & absAECostZeroPaddingA_uid9_vecRotateTest_q;

    -- absAEsumAHighB_uid11_vecRotateTest(ADDSUB,10)@0
    absAEsumAHighB_uid11_vecRotateTest_s <= signA_uid7_vecRotateTest_merged_bit_select_b;
    absAEsumAHighB_uid11_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => absAENA_uid10_vecRotateTest_q(14)) & absAENA_uid10_vecRotateTest_q));
    absAEsumAHighB_uid11_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & cstPiO2_uid8_vecRotateTest_q));
    absAEsumAHighB_uid11_vecRotateTest_combproc: PROCESS (absAEsumAHighB_uid11_vecRotateTest_a, absAEsumAHighB_uid11_vecRotateTest_b, absAEsumAHighB_uid11_vecRotateTest_s)
    BEGIN
        IF (absAEsumAHighB_uid11_vecRotateTest_s = "1") THEN
            absAEsumAHighB_uid11_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(absAEsumAHighB_uid11_vecRotateTest_a) + SIGNED(absAEsumAHighB_uid11_vecRotateTest_b));
        ELSE
            absAEsumAHighB_uid11_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(absAEsumAHighB_uid11_vecRotateTest_a) - SIGNED(absAEsumAHighB_uid11_vecRotateTest_b));
        END IF;
    END PROCESS;
    absAEsumAHighB_uid11_vecRotateTest_q <= absAEsumAHighB_uid11_vecRotateTest_o(15 downto 0);

    -- msbUAbsAE_uid12_vecRotateTest_merged_bit_select(BITSELECT,376)@0
    msbUAbsAE_uid12_vecRotateTest_merged_bit_select_b <= STD_LOGIC_VECTOR(absAEsumAHighB_uid11_vecRotateTest_q(15 downto 15));
    msbUAbsAE_uid12_vecRotateTest_merged_bit_select_c <= STD_LOGIC_VECTOR(absAEsumAHighB_uid11_vecRotateTest_q(13 downto 0));

    -- redist1_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_c_1(DELAY,378)
    redist1_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => msbUAbsAE_uid12_vecRotateTest_merged_bit_select_c, xout => redist1_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- redist0_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_b_1(DELAY,377)
    redist0_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => msbUAbsAE_uid12_vecRotateTest_merged_bit_select_b, xout => redist0_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- invMsbuAbsAE_uid13_vecRotateTest(LOGICAL,12)@1
    invMsbuAbsAE_uid13_vecRotateTest_q <= not (redist0_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_b_1_q);

    -- redist2_signA_uid7_vecRotateTest_merged_bit_select_b_1(DELAY,379)
    redist2_signA_uid7_vecRotateTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signA_uid7_vecRotateTest_merged_bit_select_b, xout => redist2_signA_uid7_vecRotateTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- firstQuadrantCond1_uid14_vecRotateTest(LOGICAL,13)@1
    firstQuadrantCond1_uid14_vecRotateTest_q <= redist2_signA_uid7_vecRotateTest_merged_bit_select_b_1_q and invMsbuAbsAE_uid13_vecRotateTest_q;

    -- invSignA_uid15_vecRotateTest(LOGICAL,14)@1
    invSignA_uid15_vecRotateTest_q <= not (redist2_signA_uid7_vecRotateTest_merged_bit_select_b_1_q);

    -- firstQuadrantCond0_uid16_vecRotateTest(LOGICAL,15)@1
    firstQuadrantCond0_uid16_vecRotateTest_q <= invSignA_uid15_vecRotateTest_q and redist0_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_b_1_q;

    -- firstQuadrant_uid17_vecRotateTest(LOGICAL,16)@1
    firstQuadrant_uid17_vecRotateTest_q <= firstQuadrantCond0_uid16_vecRotateTest_q or firstQuadrantCond1_uid14_vecRotateTest_q;

    -- absA_uid23_vecRotateTest(MUX,22)@1 + 1
    absA_uid23_vecRotateTest_s <= firstQuadrant_uid17_vecRotateTest_q;
    absA_uid23_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            absA_uid23_vecRotateTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (absA_uid23_vecRotateTest_s) IS
                WHEN "0" => absA_uid23_vecRotateTest_q <= redist1_msbUAbsAE_uid12_vecRotateTest_merged_bit_select_c_1_q;
                WHEN "1" => absA_uid23_vecRotateTest_q <= aInFirstQuadrant_mergedSignalTM_uid20_vecRotateTest_q;
                WHEN OTHERS => absA_uid23_vecRotateTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- xMSB_uid36_vecRotateTest(BITSELECT,35)@2
    xMSB_uid36_vecRotateTest_b <= STD_LOGIC_VECTOR(absA_uid23_vecRotateTest_q(13 downto 13));

    -- cstArcTan2Mi_0_uid41_vecRotateTest(CONSTANT,40)
    cstArcTan2Mi_0_uid41_vecRotateTest_q <= "0110010010000111111";

    -- aip1E_1CostZeroPaddingA_uid46_vecRotateTest(CONSTANT,45)
    aip1E_1CostZeroPaddingA_uid46_vecRotateTest_q <= "000000";

    -- aip1E_1NA_uid47_vecRotateTest(BITJOIN,46)@2
    aip1E_1NA_uid47_vecRotateTest_q <= absA_uid23_vecRotateTest_q & aip1E_1CostZeroPaddingA_uid46_vecRotateTest_q;

    -- aip1E_1sumAHighB_uid48_vecRotateTest(ADDSUB,47)@2
    aip1E_1sumAHighB_uid48_vecRotateTest_s <= xMSB_uid36_vecRotateTest_b;
    aip1E_1sumAHighB_uid48_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => aip1E_1NA_uid47_vecRotateTest_q(19)) & aip1E_1NA_uid47_vecRotateTest_q));
    aip1E_1sumAHighB_uid48_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 19 => cstArcTan2Mi_0_uid41_vecRotateTest_q(18)) & cstArcTan2Mi_0_uid41_vecRotateTest_q));
    aip1E_1sumAHighB_uid48_vecRotateTest_combproc: PROCESS (aip1E_1sumAHighB_uid48_vecRotateTest_a, aip1E_1sumAHighB_uid48_vecRotateTest_b, aip1E_1sumAHighB_uid48_vecRotateTest_s)
    BEGIN
        IF (aip1E_1sumAHighB_uid48_vecRotateTest_s = "1") THEN
            aip1E_1sumAHighB_uid48_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid48_vecRotateTest_a) + SIGNED(aip1E_1sumAHighB_uid48_vecRotateTest_b));
        ELSE
            aip1E_1sumAHighB_uid48_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid48_vecRotateTest_a) - SIGNED(aip1E_1sumAHighB_uid48_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_1sumAHighB_uid48_vecRotateTest_q <= aip1E_1sumAHighB_uid48_vecRotateTest_o(20 downto 0);

    -- aip1E_uid51_vecRotateTest(BITSELECT,50)@2
    aip1E_uid51_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_1sumAHighB_uid48_vecRotateTest_q(19 downto 0));
    aip1E_uid51_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid51_vecRotateTest_in(19 downto 0));

    -- redist42_aip1E_uid51_vecRotateTest_b_1(DELAY,419)
    redist42_aip1E_uid51_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid51_vecRotateTest_b, xout => redist42_aip1E_uid51_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_2_uid66_vecRotateTest(ADDSUB,65)@3
    aip1E_2_uid66_vecRotateTest_s <= xMSB_uid52_vecRotateTest_b;
    aip1E_2_uid66_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist42_aip1E_uid51_vecRotateTest_b_1_q(19)) & redist42_aip1E_uid51_vecRotateTest_b_1_q));
    aip1E_2_uid66_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 18 => cstArcTan2Mi_1_uid57_vecRotateTest_q(17)) & cstArcTan2Mi_1_uid57_vecRotateTest_q));
    aip1E_2_uid66_vecRotateTest_combproc: PROCESS (aip1E_2_uid66_vecRotateTest_a, aip1E_2_uid66_vecRotateTest_b, aip1E_2_uid66_vecRotateTest_s)
    BEGIN
        IF (aip1E_2_uid66_vecRotateTest_s = "1") THEN
            aip1E_2_uid66_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid66_vecRotateTest_a) + SIGNED(aip1E_2_uid66_vecRotateTest_b));
        ELSE
            aip1E_2_uid66_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid66_vecRotateTest_a) - SIGNED(aip1E_2_uid66_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_2_uid66_vecRotateTest_q <= aip1E_2_uid66_vecRotateTest_o(20 downto 0);

    -- aip1E_uid69_vecRotateTest(BITSELECT,68)@3
    aip1E_uid69_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_2_uid66_vecRotateTest_q(19 downto 0));
    aip1E_uid69_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid69_vecRotateTest_in(19 downto 0));

    -- redist39_aip1E_uid69_vecRotateTest_b_1(DELAY,416)
    redist39_aip1E_uid69_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid69_vecRotateTest_b, xout => redist39_aip1E_uid69_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_3_uid84_vecRotateTest(ADDSUB,83)@4
    aip1E_3_uid84_vecRotateTest_s <= xMSB_uid70_vecRotateTest_b;
    aip1E_3_uid84_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist39_aip1E_uid69_vecRotateTest_b_1_q(19)) & redist39_aip1E_uid69_vecRotateTest_b_1_q));
    aip1E_3_uid84_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 17 => cstArcTan2Mi_2_uid75_vecRotateTest_q(16)) & cstArcTan2Mi_2_uid75_vecRotateTest_q));
    aip1E_3_uid84_vecRotateTest_combproc: PROCESS (aip1E_3_uid84_vecRotateTest_a, aip1E_3_uid84_vecRotateTest_b, aip1E_3_uid84_vecRotateTest_s)
    BEGIN
        IF (aip1E_3_uid84_vecRotateTest_s = "1") THEN
            aip1E_3_uid84_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid84_vecRotateTest_a) + SIGNED(aip1E_3_uid84_vecRotateTest_b));
        ELSE
            aip1E_3_uid84_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid84_vecRotateTest_a) - SIGNED(aip1E_3_uid84_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_3_uid84_vecRotateTest_q <= aip1E_3_uid84_vecRotateTest_o(20 downto 0);

    -- aip1E_uid87_vecRotateTest(BITSELECT,86)@4
    aip1E_uid87_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_3_uid84_vecRotateTest_q(19 downto 0));
    aip1E_uid87_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid87_vecRotateTest_in(19 downto 0));

    -- redist36_aip1E_uid87_vecRotateTest_b_1(DELAY,413)
    redist36_aip1E_uid87_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid87_vecRotateTest_b, xout => redist36_aip1E_uid87_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_4_uid102_vecRotateTest(ADDSUB,101)@5
    aip1E_4_uid102_vecRotateTest_s <= xMSB_uid88_vecRotateTest_b;
    aip1E_4_uid102_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist36_aip1E_uid87_vecRotateTest_b_1_q(19)) & redist36_aip1E_uid87_vecRotateTest_b_1_q));
    aip1E_4_uid102_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => cstArcTan2Mi_3_uid93_vecRotateTest_q(15)) & cstArcTan2Mi_3_uid93_vecRotateTest_q));
    aip1E_4_uid102_vecRotateTest_combproc: PROCESS (aip1E_4_uid102_vecRotateTest_a, aip1E_4_uid102_vecRotateTest_b, aip1E_4_uid102_vecRotateTest_s)
    BEGIN
        IF (aip1E_4_uid102_vecRotateTest_s = "1") THEN
            aip1E_4_uid102_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid102_vecRotateTest_a) + SIGNED(aip1E_4_uid102_vecRotateTest_b));
        ELSE
            aip1E_4_uid102_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid102_vecRotateTest_a) - SIGNED(aip1E_4_uid102_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_4_uid102_vecRotateTest_q <= aip1E_4_uid102_vecRotateTest_o(20 downto 0);

    -- aip1E_uid105_vecRotateTest(BITSELECT,104)@5
    aip1E_uid105_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_4_uid102_vecRotateTest_q(19 downto 0));
    aip1E_uid105_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid105_vecRotateTest_in(19 downto 0));

    -- redist33_aip1E_uid105_vecRotateTest_b_1(DELAY,410)
    redist33_aip1E_uid105_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid105_vecRotateTest_b, xout => redist33_aip1E_uid105_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_5_uid120_vecRotateTest(ADDSUB,119)@6
    aip1E_5_uid120_vecRotateTest_s <= xMSB_uid106_vecRotateTest_b;
    aip1E_5_uid120_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist33_aip1E_uid105_vecRotateTest_b_1_q(19)) & redist33_aip1E_uid105_vecRotateTest_b_1_q));
    aip1E_5_uid120_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 15 => cstArcTan2Mi_4_uid111_vecRotateTest_q(14)) & cstArcTan2Mi_4_uid111_vecRotateTest_q));
    aip1E_5_uid120_vecRotateTest_combproc: PROCESS (aip1E_5_uid120_vecRotateTest_a, aip1E_5_uid120_vecRotateTest_b, aip1E_5_uid120_vecRotateTest_s)
    BEGIN
        IF (aip1E_5_uid120_vecRotateTest_s = "1") THEN
            aip1E_5_uid120_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid120_vecRotateTest_a) + SIGNED(aip1E_5_uid120_vecRotateTest_b));
        ELSE
            aip1E_5_uid120_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid120_vecRotateTest_a) - SIGNED(aip1E_5_uid120_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_5_uid120_vecRotateTest_q <= aip1E_5_uid120_vecRotateTest_o(20 downto 0);

    -- aip1E_uid123_vecRotateTest(BITSELECT,122)@6
    aip1E_uid123_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_5_uid120_vecRotateTest_q(19 downto 0));
    aip1E_uid123_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid123_vecRotateTest_in(19 downto 0));

    -- redist30_aip1E_uid123_vecRotateTest_b_1(DELAY,407)
    redist30_aip1E_uid123_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid123_vecRotateTest_b, xout => redist30_aip1E_uid123_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_6_uid140_vecRotateTest(ADDSUB,139)@7
    aip1E_6_uid140_vecRotateTest_s <= xMSB_uid124_vecRotateTest_b;
    aip1E_6_uid140_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist30_aip1E_uid123_vecRotateTest_b_1_q(19)) & redist30_aip1E_uid123_vecRotateTest_b_1_q));
    aip1E_6_uid140_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 14 => cstArcTan2Mi_5_uid131_vecRotateTest_q(13)) & cstArcTan2Mi_5_uid131_vecRotateTest_q));
    aip1E_6_uid140_vecRotateTest_combproc: PROCESS (aip1E_6_uid140_vecRotateTest_a, aip1E_6_uid140_vecRotateTest_b, aip1E_6_uid140_vecRotateTest_s)
    BEGIN
        IF (aip1E_6_uid140_vecRotateTest_s = "1") THEN
            aip1E_6_uid140_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid140_vecRotateTest_a) + SIGNED(aip1E_6_uid140_vecRotateTest_b));
        ELSE
            aip1E_6_uid140_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid140_vecRotateTest_a) - SIGNED(aip1E_6_uid140_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_6_uid140_vecRotateTest_q <= aip1E_6_uid140_vecRotateTest_o(20 downto 0);

    -- aip1E_uid143_vecRotateTest(BITSELECT,142)@7
    aip1E_uid143_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_6_uid140_vecRotateTest_q(19 downto 0));
    aip1E_uid143_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid143_vecRotateTest_in(19 downto 0));

    -- redist27_aip1E_uid143_vecRotateTest_b_1(DELAY,404)
    redist27_aip1E_uid143_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid143_vecRotateTest_b, xout => redist27_aip1E_uid143_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid144_vecRotateTest(BITSELECT,143)@8
    xMSB_uid144_vecRotateTest_b <= STD_LOGIC_VECTOR(redist27_aip1E_uid143_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_6_uid151_vecRotateTest(CONSTANT,150)
    cstArcTan2Mi_6_uid151_vecRotateTest_q <= "0100000000000";

    -- highABits_uid157_vecRotateTest(BITSELECT,156)@8
    highABits_uid157_vecRotateTest_b <= STD_LOGIC_VECTOR(redist27_aip1E_uid143_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_7high_uid158_vecRotateTest(ADDSUB,157)@8
    aip1E_7high_uid158_vecRotateTest_s <= xMSB_uid144_vecRotateTest_b;
    aip1E_7high_uid158_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid157_vecRotateTest_b(18)) & highABits_uid157_vecRotateTest_b));
    aip1E_7high_uid158_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 13 => cstArcTan2Mi_6_uid151_vecRotateTest_q(12)) & cstArcTan2Mi_6_uid151_vecRotateTest_q));
    aip1E_7high_uid158_vecRotateTest_combproc: PROCESS (aip1E_7high_uid158_vecRotateTest_a, aip1E_7high_uid158_vecRotateTest_b, aip1E_7high_uid158_vecRotateTest_s)
    BEGIN
        IF (aip1E_7high_uid158_vecRotateTest_s = "1") THEN
            aip1E_7high_uid158_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid158_vecRotateTest_a) + SIGNED(aip1E_7high_uid158_vecRotateTest_b));
        ELSE
            aip1E_7high_uid158_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid158_vecRotateTest_a) - SIGNED(aip1E_7high_uid158_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_7high_uid158_vecRotateTest_q <= aip1E_7high_uid158_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid156_vecRotateTest(BITSELECT,155)@8
    lowRangeA_uid156_vecRotateTest_in <= redist27_aip1E_uid143_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid156_vecRotateTest_b <= lowRangeA_uid156_vecRotateTest_in(0 downto 0);

    -- aip1E_7_uid159_vecRotateTest(BITJOIN,158)@8
    aip1E_7_uid159_vecRotateTest_q <= aip1E_7high_uid158_vecRotateTest_q & lowRangeA_uid156_vecRotateTest_b;

    -- aip1E_uid162_vecRotateTest(BITSELECT,161)@8
    aip1E_uid162_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_7_uid159_vecRotateTest_q(19 downto 0));
    aip1E_uid162_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid162_vecRotateTest_in(19 downto 0));

    -- redist24_aip1E_uid162_vecRotateTest_b_1(DELAY,401)
    redist24_aip1E_uid162_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid162_vecRotateTest_b, xout => redist24_aip1E_uid162_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid163_vecRotateTest(BITSELECT,162)@9
    xMSB_uid163_vecRotateTest_b <= STD_LOGIC_VECTOR(redist24_aip1E_uid162_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_7_uid170_vecRotateTest(CONSTANT,169)
    cstArcTan2Mi_7_uid170_vecRotateTest_q <= "010000000000";

    -- highABits_uid176_vecRotateTest(BITSELECT,175)@9
    highABits_uid176_vecRotateTest_b <= STD_LOGIC_VECTOR(redist24_aip1E_uid162_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_8high_uid177_vecRotateTest(ADDSUB,176)@9
    aip1E_8high_uid177_vecRotateTest_s <= xMSB_uid163_vecRotateTest_b;
    aip1E_8high_uid177_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid176_vecRotateTest_b(18)) & highABits_uid176_vecRotateTest_b));
    aip1E_8high_uid177_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 12 => cstArcTan2Mi_7_uid170_vecRotateTest_q(11)) & cstArcTan2Mi_7_uid170_vecRotateTest_q));
    aip1E_8high_uid177_vecRotateTest_combproc: PROCESS (aip1E_8high_uid177_vecRotateTest_a, aip1E_8high_uid177_vecRotateTest_b, aip1E_8high_uid177_vecRotateTest_s)
    BEGIN
        IF (aip1E_8high_uid177_vecRotateTest_s = "1") THEN
            aip1E_8high_uid177_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid177_vecRotateTest_a) + SIGNED(aip1E_8high_uid177_vecRotateTest_b));
        ELSE
            aip1E_8high_uid177_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid177_vecRotateTest_a) - SIGNED(aip1E_8high_uid177_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_8high_uid177_vecRotateTest_q <= aip1E_8high_uid177_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid175_vecRotateTest(BITSELECT,174)@9
    lowRangeA_uid175_vecRotateTest_in <= redist24_aip1E_uid162_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid175_vecRotateTest_b <= lowRangeA_uid175_vecRotateTest_in(0 downto 0);

    -- aip1E_8_uid178_vecRotateTest(BITJOIN,177)@9
    aip1E_8_uid178_vecRotateTest_q <= aip1E_8high_uid177_vecRotateTest_q & lowRangeA_uid175_vecRotateTest_b;

    -- aip1E_uid181_vecRotateTest(BITSELECT,180)@9
    aip1E_uid181_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_8_uid178_vecRotateTest_q(19 downto 0));
    aip1E_uid181_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid181_vecRotateTest_in(19 downto 0));

    -- redist21_aip1E_uid181_vecRotateTest_b_1(DELAY,398)
    redist21_aip1E_uid181_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid181_vecRotateTest_b, xout => redist21_aip1E_uid181_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid182_vecRotateTest(BITSELECT,181)@10
    xMSB_uid182_vecRotateTest_b <= STD_LOGIC_VECTOR(redist21_aip1E_uid181_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_8_uid189_vecRotateTest(CONSTANT,188)
    cstArcTan2Mi_8_uid189_vecRotateTest_q <= "01000000000";

    -- highABits_uid195_vecRotateTest(BITSELECT,194)@10
    highABits_uid195_vecRotateTest_b <= STD_LOGIC_VECTOR(redist21_aip1E_uid181_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_9high_uid196_vecRotateTest(ADDSUB,195)@10
    aip1E_9high_uid196_vecRotateTest_s <= xMSB_uid182_vecRotateTest_b;
    aip1E_9high_uid196_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid195_vecRotateTest_b(18)) & highABits_uid195_vecRotateTest_b));
    aip1E_9high_uid196_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 11 => cstArcTan2Mi_8_uid189_vecRotateTest_q(10)) & cstArcTan2Mi_8_uid189_vecRotateTest_q));
    aip1E_9high_uid196_vecRotateTest_combproc: PROCESS (aip1E_9high_uid196_vecRotateTest_a, aip1E_9high_uid196_vecRotateTest_b, aip1E_9high_uid196_vecRotateTest_s)
    BEGIN
        IF (aip1E_9high_uid196_vecRotateTest_s = "1") THEN
            aip1E_9high_uid196_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid196_vecRotateTest_a) + SIGNED(aip1E_9high_uid196_vecRotateTest_b));
        ELSE
            aip1E_9high_uid196_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid196_vecRotateTest_a) - SIGNED(aip1E_9high_uid196_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_9high_uid196_vecRotateTest_q <= aip1E_9high_uid196_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid194_vecRotateTest(BITSELECT,193)@10
    lowRangeA_uid194_vecRotateTest_in <= redist21_aip1E_uid181_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid194_vecRotateTest_b <= lowRangeA_uid194_vecRotateTest_in(0 downto 0);

    -- aip1E_9_uid197_vecRotateTest(BITJOIN,196)@10
    aip1E_9_uid197_vecRotateTest_q <= aip1E_9high_uid196_vecRotateTest_q & lowRangeA_uid194_vecRotateTest_b;

    -- aip1E_uid200_vecRotateTest(BITSELECT,199)@10
    aip1E_uid200_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_9_uid197_vecRotateTest_q(19 downto 0));
    aip1E_uid200_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid200_vecRotateTest_in(19 downto 0));

    -- redist18_aip1E_uid200_vecRotateTest_b_1(DELAY,395)
    redist18_aip1E_uid200_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid200_vecRotateTest_b, xout => redist18_aip1E_uid200_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid201_vecRotateTest(BITSELECT,200)@11
    xMSB_uid201_vecRotateTest_b <= STD_LOGIC_VECTOR(redist18_aip1E_uid200_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_9_uid208_vecRotateTest(CONSTANT,207)
    cstArcTan2Mi_9_uid208_vecRotateTest_q <= "0100000000";

    -- highABits_uid214_vecRotateTest(BITSELECT,213)@11
    highABits_uid214_vecRotateTest_b <= STD_LOGIC_VECTOR(redist18_aip1E_uid200_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_10high_uid215_vecRotateTest(ADDSUB,214)@11
    aip1E_10high_uid215_vecRotateTest_s <= xMSB_uid201_vecRotateTest_b;
    aip1E_10high_uid215_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid214_vecRotateTest_b(18)) & highABits_uid214_vecRotateTest_b));
    aip1E_10high_uid215_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 10 => cstArcTan2Mi_9_uid208_vecRotateTest_q(9)) & cstArcTan2Mi_9_uid208_vecRotateTest_q));
    aip1E_10high_uid215_vecRotateTest_combproc: PROCESS (aip1E_10high_uid215_vecRotateTest_a, aip1E_10high_uid215_vecRotateTest_b, aip1E_10high_uid215_vecRotateTest_s)
    BEGIN
        IF (aip1E_10high_uid215_vecRotateTest_s = "1") THEN
            aip1E_10high_uid215_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid215_vecRotateTest_a) + SIGNED(aip1E_10high_uid215_vecRotateTest_b));
        ELSE
            aip1E_10high_uid215_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid215_vecRotateTest_a) - SIGNED(aip1E_10high_uid215_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_10high_uid215_vecRotateTest_q <= aip1E_10high_uid215_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid213_vecRotateTest(BITSELECT,212)@11
    lowRangeA_uid213_vecRotateTest_in <= redist18_aip1E_uid200_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid213_vecRotateTest_b <= lowRangeA_uid213_vecRotateTest_in(0 downto 0);

    -- aip1E_10_uid216_vecRotateTest(BITJOIN,215)@11
    aip1E_10_uid216_vecRotateTest_q <= aip1E_10high_uid215_vecRotateTest_q & lowRangeA_uid213_vecRotateTest_b;

    -- aip1E_uid219_vecRotateTest(BITSELECT,218)@11
    aip1E_uid219_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_10_uid216_vecRotateTest_q(19 downto 0));
    aip1E_uid219_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid219_vecRotateTest_in(19 downto 0));

    -- redist15_aip1E_uid219_vecRotateTest_b_1(DELAY,392)
    redist15_aip1E_uid219_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid219_vecRotateTest_b, xout => redist15_aip1E_uid219_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid220_vecRotateTest(BITSELECT,219)@12
    xMSB_uid220_vecRotateTest_b <= STD_LOGIC_VECTOR(redist15_aip1E_uid219_vecRotateTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_10_uid227_vecRotateTest(CONSTANT,226)
    cstArcTan2Mi_10_uid227_vecRotateTest_q <= "010000000";

    -- highABits_uid233_vecRotateTest(BITSELECT,232)@12
    highABits_uid233_vecRotateTest_b <= STD_LOGIC_VECTOR(redist15_aip1E_uid219_vecRotateTest_b_1_q(19 downto 1));

    -- aip1E_11high_uid234_vecRotateTest(ADDSUB,233)@12
    aip1E_11high_uid234_vecRotateTest_s <= xMSB_uid220_vecRotateTest_b;
    aip1E_11high_uid234_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid233_vecRotateTest_b(18)) & highABits_uid233_vecRotateTest_b));
    aip1E_11high_uid234_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 9 => cstArcTan2Mi_10_uid227_vecRotateTest_q(8)) & cstArcTan2Mi_10_uid227_vecRotateTest_q));
    aip1E_11high_uid234_vecRotateTest_combproc: PROCESS (aip1E_11high_uid234_vecRotateTest_a, aip1E_11high_uid234_vecRotateTest_b, aip1E_11high_uid234_vecRotateTest_s)
    BEGIN
        IF (aip1E_11high_uid234_vecRotateTest_s = "1") THEN
            aip1E_11high_uid234_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid234_vecRotateTest_a) + SIGNED(aip1E_11high_uid234_vecRotateTest_b));
        ELSE
            aip1E_11high_uid234_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid234_vecRotateTest_a) - SIGNED(aip1E_11high_uid234_vecRotateTest_b));
        END IF;
    END PROCESS;
    aip1E_11high_uid234_vecRotateTest_q <= aip1E_11high_uid234_vecRotateTest_o(19 downto 0);

    -- lowRangeA_uid232_vecRotateTest(BITSELECT,231)@12
    lowRangeA_uid232_vecRotateTest_in <= redist15_aip1E_uid219_vecRotateTest_b_1_q(0 downto 0);
    lowRangeA_uid232_vecRotateTest_b <= lowRangeA_uid232_vecRotateTest_in(0 downto 0);

    -- aip1E_11_uid235_vecRotateTest(BITJOIN,234)@12
    aip1E_11_uid235_vecRotateTest_q <= aip1E_11high_uid234_vecRotateTest_q & lowRangeA_uid232_vecRotateTest_b;

    -- aip1E_uid238_vecRotateTest(BITSELECT,237)@12
    aip1E_uid238_vecRotateTest_in <= STD_LOGIC_VECTOR(aip1E_11_uid235_vecRotateTest_q(19 downto 0));
    aip1E_uid238_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid238_vecRotateTest_in(19 downto 0));

    -- xMSB_uid239_vecRotateTest(BITSELECT,238)@12
    xMSB_uid239_vecRotateTest_b <= STD_LOGIC_VECTOR(aip1E_uid238_vecRotateTest_b(19 downto 19));

    -- redist12_xMSB_uid239_vecRotateTest_b_1(DELAY,389)
    redist12_xMSB_uid239_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid239_vecRotateTest_b, xout => redist12_xMSB_uid239_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid241_vecRotateTest(LOGICAL,240)@13
    signOfSelectionSignal_uid241_vecRotateTest_q <= not (redist12_xMSB_uid239_vecRotateTest_b_1_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- signOfSelectionSignal_uid203_vecRotateTest(LOGICAL,202)@11
    signOfSelectionSignal_uid203_vecRotateTest_q <= not (xMSB_uid201_vecRotateTest_b);

    -- signOfSelectionSignal_uid165_vecRotateTest(LOGICAL,164)@9
    signOfSelectionSignal_uid165_vecRotateTest_q <= not (xMSB_uid163_vecRotateTest_b);

    -- signOfSelectionSignal_uid126_vecRotateTest(LOGICAL,125)@7
    signOfSelectionSignal_uid126_vecRotateTest_q <= not (xMSB_uid124_vecRotateTest_b);

    -- signOfSelectionSignal_uid90_vecRotateTest(LOGICAL,89)@5
    signOfSelectionSignal_uid90_vecRotateTest_q <= not (xMSB_uid88_vecRotateTest_b);

    -- signOfSelectionSignal_uid54_vecRotateTest(LOGICAL,53)@3
    signOfSelectionSignal_uid54_vecRotateTest_q <= not (xMSB_uid52_vecRotateTest_b);

    -- padACst_uid24_vecRotateTest(CONSTANT,23)
    padACst_uid24_vecRotateTest_q <= "0000000000";

    -- aPostPad_uid25_vecRotateTest(BITJOIN,24)@1
    aPostPad_uid25_vecRotateTest_q <= GND_q & padACst_uid24_vecRotateTest_q;

    -- mx_uid26_vecRotateTest(SUB,25)@1
    mx_uid26_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aPostPad_uid25_vecRotateTest_q));
    mx_uid26_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => redist43_xIn_x_1_q(11)) & redist43_xIn_x_1_q));
    mx_uid26_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(mx_uid26_vecRotateTest_a) - SIGNED(mx_uid26_vecRotateTest_b));
    mx_uid26_vecRotateTest_q <= mx_uid26_vecRotateTest_o(12 downto 0);

    -- mxR_uid27_vecRotateTest(BITSELECT,26)@1
    mxR_uid27_vecRotateTest_in <= STD_LOGIC_VECTOR(mx_uid26_vecRotateTest_q(11 downto 0));
    mxR_uid27_vecRotateTest_b <= STD_LOGIC_VECTOR(mxR_uid27_vecRotateTest_in(11 downto 0));

    -- redist44_xIn_y_1(DELAY,421)
    redist44_xIn_y_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => y, xout => redist44_xIn_y_1_q, clk => clk, aclr => areset );

    -- redist43_xIn_x_1(DELAY,420)
    redist43_xIn_x_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => x, xout => redist43_xIn_x_1_q, clk => clk, aclr => areset );

    -- concSignAFirstQuadrant_uid32_vecRotateTest(BITJOIN,31)@1
    concSignAFirstQuadrant_uid32_vecRotateTest_q <= redist2_signA_uid7_vecRotateTest_merged_bit_select_b_1_q & firstQuadrant_uid17_vecRotateTest_q;

    -- absY_uid34_vecRotateTest(MUX,33)@1 + 1
    absY_uid34_vecRotateTest_s <= concSignAFirstQuadrant_uid32_vecRotateTest_q;
    absY_uid34_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            absY_uid34_vecRotateTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (absY_uid34_vecRotateTest_s) IS
                WHEN "00" => absY_uid34_vecRotateTest_q <= redist43_xIn_x_1_q;
                WHEN "01" => absY_uid34_vecRotateTest_q <= redist44_xIn_y_1_q;
                WHEN "10" => absY_uid34_vecRotateTest_q <= mxR_uid27_vecRotateTest_b;
                WHEN "11" => absY_uid34_vecRotateTest_q <= redist44_xIn_y_1_q;
                WHEN OTHERS => absY_uid34_vecRotateTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- my_uid30_vecRotateTest(SUB,29)@1
    my_uid30_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aPostPad_uid25_vecRotateTest_q));
    my_uid30_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => redist44_xIn_y_1_q(11)) & redist44_xIn_y_1_q));
    my_uid30_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(my_uid30_vecRotateTest_a) - SIGNED(my_uid30_vecRotateTest_b));
    my_uid30_vecRotateTest_q <= my_uid30_vecRotateTest_o(12 downto 0);

    -- myR_uid31_vecRotateTest(BITSELECT,30)@1
    myR_uid31_vecRotateTest_in <= STD_LOGIC_VECTOR(my_uid30_vecRotateTest_q(11 downto 0));
    myR_uid31_vecRotateTest_b <= STD_LOGIC_VECTOR(myR_uid31_vecRotateTest_in(11 downto 0));

    -- absX_uid33_vecRotateTest(MUX,32)@1 + 1
    absX_uid33_vecRotateTest_s <= concSignAFirstQuadrant_uid32_vecRotateTest_q;
    absX_uid33_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            absX_uid33_vecRotateTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (absX_uid33_vecRotateTest_s) IS
                WHEN "00" => absX_uid33_vecRotateTest_q <= myR_uid31_vecRotateTest_b;
                WHEN "01" => absX_uid33_vecRotateTest_q <= redist43_xIn_x_1_q;
                WHEN "10" => absX_uid33_vecRotateTest_q <= redist44_xIn_y_1_q;
                WHEN "11" => absX_uid33_vecRotateTest_q <= redist43_xIn_x_1_q;
                WHEN OTHERS => absX_uid33_vecRotateTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- xip1E_1_uid43_vecRotateTest(ADDSUB,42)@2 + 1
    xip1E_1_uid43_vecRotateTest_s <= xMSB_uid36_vecRotateTest_b;
    xip1E_1_uid43_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => absX_uid33_vecRotateTest_q(11)) & absX_uid33_vecRotateTest_q));
    xip1E_1_uid43_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => absY_uid34_vecRotateTest_q(11)) & absY_uid34_vecRotateTest_q));
    xip1E_1_uid43_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xip1E_1_uid43_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xip1E_1_uid43_vecRotateTest_s = "1") THEN
                xip1E_1_uid43_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_1_uid43_vecRotateTest_a) + SIGNED(xip1E_1_uid43_vecRotateTest_b));
            ELSE
                xip1E_1_uid43_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_1_uid43_vecRotateTest_a) - SIGNED(xip1E_1_uid43_vecRotateTest_b));
            END IF;
        END IF;
    END PROCESS;
    xip1E_1_uid43_vecRotateTest_q <= xip1E_1_uid43_vecRotateTest_o(12 downto 0);

    -- signOfSelectionSignal_uid38_vecRotateTest(LOGICAL,37)@2
    signOfSelectionSignal_uid38_vecRotateTest_q <= not (xMSB_uid36_vecRotateTest_b);

    -- yip1E_1_uid44_vecRotateTest(ADDSUB,43)@2 + 1
    yip1E_1_uid44_vecRotateTest_s <= signOfSelectionSignal_uid38_vecRotateTest_q;
    yip1E_1_uid44_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => absY_uid34_vecRotateTest_q(11)) & absY_uid34_vecRotateTest_q));
    yip1E_1_uid44_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => absX_uid33_vecRotateTest_q(11)) & absX_uid33_vecRotateTest_q));
    yip1E_1_uid44_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            yip1E_1_uid44_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (yip1E_1_uid44_vecRotateTest_s = "1") THEN
                yip1E_1_uid44_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_1_uid44_vecRotateTest_a) + SIGNED(yip1E_1_uid44_vecRotateTest_b));
            ELSE
                yip1E_1_uid44_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_1_uid44_vecRotateTest_a) - SIGNED(yip1E_1_uid44_vecRotateTest_b));
            END IF;
        END IF;
    END PROCESS;
    yip1E_1_uid44_vecRotateTest_q <= yip1E_1_uid44_vecRotateTest_o(12 downto 0);

    -- yip1E_2NA_uid63_vecRotateTest(BITJOIN,62)@3
    yip1E_2NA_uid63_vecRotateTest_q <= yip1E_1_uid44_vecRotateTest_q & GND_q;

    -- yip1E_2sumAHighB_uid64_vecRotateTest(ADDSUB,63)@3
    yip1E_2sumAHighB_uid64_vecRotateTest_s <= signOfSelectionSignal_uid54_vecRotateTest_q;
    yip1E_2sumAHighB_uid64_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => yip1E_2NA_uid63_vecRotateTest_q(13)) & yip1E_2NA_uid63_vecRotateTest_q));
    yip1E_2sumAHighB_uid64_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => xip1E_1_uid43_vecRotateTest_q(12)) & xip1E_1_uid43_vecRotateTest_q));
    yip1E_2sumAHighB_uid64_vecRotateTest_combproc: PROCESS (yip1E_2sumAHighB_uid64_vecRotateTest_a, yip1E_2sumAHighB_uid64_vecRotateTest_b, yip1E_2sumAHighB_uid64_vecRotateTest_s)
    BEGIN
        IF (yip1E_2sumAHighB_uid64_vecRotateTest_s = "1") THEN
            yip1E_2sumAHighB_uid64_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid64_vecRotateTest_a) + SIGNED(yip1E_2sumAHighB_uid64_vecRotateTest_b));
        ELSE
            yip1E_2sumAHighB_uid64_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid64_vecRotateTest_a) - SIGNED(yip1E_2sumAHighB_uid64_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_2sumAHighB_uid64_vecRotateTest_q <= yip1E_2sumAHighB_uid64_vecRotateTest_o(14 downto 0);

    -- yip1_2_uid68_vecRotateTest(BITSELECT,67)@3
    yip1_2_uid68_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_2sumAHighB_uid64_vecRotateTest_q(13 downto 0));
    yip1_2_uid68_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_2_uid68_vecRotateTest_in(13 downto 0));

    -- redist40_yip1_2_uid68_vecRotateTest_b_1(DELAY,417)
    redist40_yip1_2_uid68_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_2_uid68_vecRotateTest_b, xout => redist40_yip1_2_uid68_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_2NA_uid60_vecRotateTest(BITJOIN,59)@3
    xip1E_2NA_uid60_vecRotateTest_q <= xip1E_1_uid43_vecRotateTest_q & GND_q;

    -- xip1E_2sumAHighB_uid61_vecRotateTest(ADDSUB,60)@3
    xip1E_2sumAHighB_uid61_vecRotateTest_s <= xMSB_uid52_vecRotateTest_b;
    xip1E_2sumAHighB_uid61_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => xip1E_2NA_uid60_vecRotateTest_q(13)) & xip1E_2NA_uid60_vecRotateTest_q));
    xip1E_2sumAHighB_uid61_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => yip1E_1_uid44_vecRotateTest_q(12)) & yip1E_1_uid44_vecRotateTest_q));
    xip1E_2sumAHighB_uid61_vecRotateTest_combproc: PROCESS (xip1E_2sumAHighB_uid61_vecRotateTest_a, xip1E_2sumAHighB_uid61_vecRotateTest_b, xip1E_2sumAHighB_uid61_vecRotateTest_s)
    BEGIN
        IF (xip1E_2sumAHighB_uid61_vecRotateTest_s = "1") THEN
            xip1E_2sumAHighB_uid61_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid61_vecRotateTest_a) + SIGNED(xip1E_2sumAHighB_uid61_vecRotateTest_b));
        ELSE
            xip1E_2sumAHighB_uid61_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid61_vecRotateTest_a) - SIGNED(xip1E_2sumAHighB_uid61_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_2sumAHighB_uid61_vecRotateTest_q <= xip1E_2sumAHighB_uid61_vecRotateTest_o(14 downto 0);

    -- xip1_2_uid67_vecRotateTest(BITSELECT,66)@3
    xip1_2_uid67_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_2sumAHighB_uid61_vecRotateTest_q(13 downto 0));
    xip1_2_uid67_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_2_uid67_vecRotateTest_in(13 downto 0));

    -- redist41_xip1_2_uid67_vecRotateTest_b_1(DELAY,418)
    redist41_xip1_2_uid67_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_2_uid67_vecRotateTest_b, xout => redist41_xip1_2_uid67_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_3NA_uid78_vecRotateTest(BITJOIN,77)@4
    xip1E_3NA_uid78_vecRotateTest_q <= redist41_xip1_2_uid67_vecRotateTest_b_1_q & absAECostZeroPaddingA_uid9_vecRotateTest_q;

    -- xip1E_3sumAHighB_uid79_vecRotateTest(ADDSUB,78)@4
    xip1E_3sumAHighB_uid79_vecRotateTest_s <= xMSB_uid70_vecRotateTest_b;
    xip1E_3sumAHighB_uid79_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => xip1E_3NA_uid78_vecRotateTest_q(15)) & xip1E_3NA_uid78_vecRotateTest_q));
    xip1E_3sumAHighB_uid79_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 14 => redist40_yip1_2_uid68_vecRotateTest_b_1_q(13)) & redist40_yip1_2_uid68_vecRotateTest_b_1_q));
    xip1E_3sumAHighB_uid79_vecRotateTest_combproc: PROCESS (xip1E_3sumAHighB_uid79_vecRotateTest_a, xip1E_3sumAHighB_uid79_vecRotateTest_b, xip1E_3sumAHighB_uid79_vecRotateTest_s)
    BEGIN
        IF (xip1E_3sumAHighB_uid79_vecRotateTest_s = "1") THEN
            xip1E_3sumAHighB_uid79_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid79_vecRotateTest_a) + SIGNED(xip1E_3sumAHighB_uid79_vecRotateTest_b));
        ELSE
            xip1E_3sumAHighB_uid79_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid79_vecRotateTest_a) - SIGNED(xip1E_3sumAHighB_uid79_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_3sumAHighB_uid79_vecRotateTest_q <= xip1E_3sumAHighB_uid79_vecRotateTest_o(16 downto 0);

    -- xip1_3_uid85_vecRotateTest(BITSELECT,84)@4
    xip1_3_uid85_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_3sumAHighB_uid79_vecRotateTest_q(15 downto 0));
    xip1_3_uid85_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_3_uid85_vecRotateTest_in(15 downto 0));

    -- redist38_xip1_3_uid85_vecRotateTest_b_1(DELAY,415)
    redist38_xip1_3_uid85_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_3_uid85_vecRotateTest_b, xout => redist38_xip1_3_uid85_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid72_vecRotateTest(LOGICAL,71)@4
    signOfSelectionSignal_uid72_vecRotateTest_q <= not (xMSB_uid70_vecRotateTest_b);

    -- yip1E_3NA_uid81_vecRotateTest(BITJOIN,80)@4
    yip1E_3NA_uid81_vecRotateTest_q <= redist40_yip1_2_uid68_vecRotateTest_b_1_q & absAECostZeroPaddingA_uid9_vecRotateTest_q;

    -- yip1E_3sumAHighB_uid82_vecRotateTest(ADDSUB,81)@4
    yip1E_3sumAHighB_uid82_vecRotateTest_s <= signOfSelectionSignal_uid72_vecRotateTest_q;
    yip1E_3sumAHighB_uid82_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => yip1E_3NA_uid81_vecRotateTest_q(15)) & yip1E_3NA_uid81_vecRotateTest_q));
    yip1E_3sumAHighB_uid82_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 14 => redist41_xip1_2_uid67_vecRotateTest_b_1_q(13)) & redist41_xip1_2_uid67_vecRotateTest_b_1_q));
    yip1E_3sumAHighB_uid82_vecRotateTest_combproc: PROCESS (yip1E_3sumAHighB_uid82_vecRotateTest_a, yip1E_3sumAHighB_uid82_vecRotateTest_b, yip1E_3sumAHighB_uid82_vecRotateTest_s)
    BEGIN
        IF (yip1E_3sumAHighB_uid82_vecRotateTest_s = "1") THEN
            yip1E_3sumAHighB_uid82_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid82_vecRotateTest_a) + SIGNED(yip1E_3sumAHighB_uid82_vecRotateTest_b));
        ELSE
            yip1E_3sumAHighB_uid82_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid82_vecRotateTest_a) - SIGNED(yip1E_3sumAHighB_uid82_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_3sumAHighB_uid82_vecRotateTest_q <= yip1E_3sumAHighB_uid82_vecRotateTest_o(16 downto 0);

    -- yip1_3_uid86_vecRotateTest(BITSELECT,85)@4
    yip1_3_uid86_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_3sumAHighB_uid82_vecRotateTest_q(15 downto 0));
    yip1_3_uid86_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_3_uid86_vecRotateTest_in(15 downto 0));

    -- redist37_yip1_3_uid86_vecRotateTest_b_1(DELAY,414)
    redist37_yip1_3_uid86_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_3_uid86_vecRotateTest_b, xout => redist37_yip1_3_uid86_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_4CostZeroPaddingA_uid95_vecRotateTest(CONSTANT,94)
    xip1E_4CostZeroPaddingA_uid95_vecRotateTest_q <= "000";

    -- yip1E_4NA_uid99_vecRotateTest(BITJOIN,98)@5
    yip1E_4NA_uid99_vecRotateTest_q <= redist37_yip1_3_uid86_vecRotateTest_b_1_q & xip1E_4CostZeroPaddingA_uid95_vecRotateTest_q;

    -- yip1E_4sumAHighB_uid100_vecRotateTest(ADDSUB,99)@5
    yip1E_4sumAHighB_uid100_vecRotateTest_s <= signOfSelectionSignal_uid90_vecRotateTest_q;
    yip1E_4sumAHighB_uid100_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => yip1E_4NA_uid99_vecRotateTest_q(18)) & yip1E_4NA_uid99_vecRotateTest_q));
    yip1E_4sumAHighB_uid100_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => redist38_xip1_3_uid85_vecRotateTest_b_1_q(15)) & redist38_xip1_3_uid85_vecRotateTest_b_1_q));
    yip1E_4sumAHighB_uid100_vecRotateTest_combproc: PROCESS (yip1E_4sumAHighB_uid100_vecRotateTest_a, yip1E_4sumAHighB_uid100_vecRotateTest_b, yip1E_4sumAHighB_uid100_vecRotateTest_s)
    BEGIN
        IF (yip1E_4sumAHighB_uid100_vecRotateTest_s = "1") THEN
            yip1E_4sumAHighB_uid100_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid100_vecRotateTest_a) + SIGNED(yip1E_4sumAHighB_uid100_vecRotateTest_b));
        ELSE
            yip1E_4sumAHighB_uid100_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid100_vecRotateTest_a) - SIGNED(yip1E_4sumAHighB_uid100_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_4sumAHighB_uid100_vecRotateTest_q <= yip1E_4sumAHighB_uid100_vecRotateTest_o(19 downto 0);

    -- yip1_4_uid104_vecRotateTest(BITSELECT,103)@5
    yip1_4_uid104_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_4sumAHighB_uid100_vecRotateTest_q(18 downto 0));
    yip1_4_uid104_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_4_uid104_vecRotateTest_in(18 downto 0));

    -- redist34_yip1_4_uid104_vecRotateTest_b_1(DELAY,411)
    redist34_yip1_4_uid104_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_4_uid104_vecRotateTest_b, xout => redist34_yip1_4_uid104_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_4NA_uid96_vecRotateTest(BITJOIN,95)@5
    xip1E_4NA_uid96_vecRotateTest_q <= redist38_xip1_3_uid85_vecRotateTest_b_1_q & xip1E_4CostZeroPaddingA_uid95_vecRotateTest_q;

    -- xip1E_4sumAHighB_uid97_vecRotateTest(ADDSUB,96)@5
    xip1E_4sumAHighB_uid97_vecRotateTest_s <= xMSB_uid88_vecRotateTest_b;
    xip1E_4sumAHighB_uid97_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => xip1E_4NA_uid96_vecRotateTest_q(18)) & xip1E_4NA_uid96_vecRotateTest_q));
    xip1E_4sumAHighB_uid97_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 16 => redist37_yip1_3_uid86_vecRotateTest_b_1_q(15)) & redist37_yip1_3_uid86_vecRotateTest_b_1_q));
    xip1E_4sumAHighB_uid97_vecRotateTest_combproc: PROCESS (xip1E_4sumAHighB_uid97_vecRotateTest_a, xip1E_4sumAHighB_uid97_vecRotateTest_b, xip1E_4sumAHighB_uid97_vecRotateTest_s)
    BEGIN
        IF (xip1E_4sumAHighB_uid97_vecRotateTest_s = "1") THEN
            xip1E_4sumAHighB_uid97_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid97_vecRotateTest_a) + SIGNED(xip1E_4sumAHighB_uid97_vecRotateTest_b));
        ELSE
            xip1E_4sumAHighB_uid97_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid97_vecRotateTest_a) - SIGNED(xip1E_4sumAHighB_uid97_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_4sumAHighB_uid97_vecRotateTest_q <= xip1E_4sumAHighB_uid97_vecRotateTest_o(19 downto 0);

    -- xip1_4_uid103_vecRotateTest(BITSELECT,102)@5
    xip1_4_uid103_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_4sumAHighB_uid97_vecRotateTest_q(18 downto 0));
    xip1_4_uid103_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_4_uid103_vecRotateTest_in(18 downto 0));

    -- redist35_xip1_4_uid103_vecRotateTest_b_1(DELAY,412)
    redist35_xip1_4_uid103_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_4_uid103_vecRotateTest_b, xout => redist35_xip1_4_uid103_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_5CostZeroPaddingA_uid113_vecRotateTest(CONSTANT,112)
    xip1E_5CostZeroPaddingA_uid113_vecRotateTest_q <= "0000";

    -- xip1E_5NA_uid114_vecRotateTest(BITJOIN,113)@6
    xip1E_5NA_uid114_vecRotateTest_q <= redist35_xip1_4_uid103_vecRotateTest_b_1_q & xip1E_5CostZeroPaddingA_uid113_vecRotateTest_q;

    -- xip1E_5sumAHighB_uid115_vecRotateTest(ADDSUB,114)@6
    xip1E_5sumAHighB_uid115_vecRotateTest_s <= xMSB_uid106_vecRotateTest_b;
    xip1E_5sumAHighB_uid115_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1E_5NA_uid114_vecRotateTest_q(22)) & xip1E_5NA_uid114_vecRotateTest_q));
    xip1E_5sumAHighB_uid115_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => redist34_yip1_4_uid104_vecRotateTest_b_1_q(18)) & redist34_yip1_4_uid104_vecRotateTest_b_1_q));
    xip1E_5sumAHighB_uid115_vecRotateTest_combproc: PROCESS (xip1E_5sumAHighB_uid115_vecRotateTest_a, xip1E_5sumAHighB_uid115_vecRotateTest_b, xip1E_5sumAHighB_uid115_vecRotateTest_s)
    BEGIN
        IF (xip1E_5sumAHighB_uid115_vecRotateTest_s = "1") THEN
            xip1E_5sumAHighB_uid115_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid115_vecRotateTest_a) + SIGNED(xip1E_5sumAHighB_uid115_vecRotateTest_b));
        ELSE
            xip1E_5sumAHighB_uid115_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid115_vecRotateTest_a) - SIGNED(xip1E_5sumAHighB_uid115_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_5sumAHighB_uid115_vecRotateTest_q <= xip1E_5sumAHighB_uid115_vecRotateTest_o(23 downto 0);

    -- xip1_5_uid121_vecRotateTest(BITSELECT,120)@6
    xip1_5_uid121_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_5sumAHighB_uid115_vecRotateTest_q(22 downto 0));
    xip1_5_uid121_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_5_uid121_vecRotateTest_in(22 downto 0));

    -- redist32_xip1_5_uid121_vecRotateTest_b_1(DELAY,409)
    redist32_xip1_5_uid121_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_5_uid121_vecRotateTest_b, xout => redist32_xip1_5_uid121_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid129_vecRotateTest(BITSELECT,128)@7
    twoToMiSiXip_uid129_vecRotateTest_b <= STD_LOGIC_VECTOR(redist32_xip1_5_uid121_vecRotateTest_b_1_q(22 downto 3));

    -- signOfSelectionSignal_uid108_vecRotateTest(LOGICAL,107)@6
    signOfSelectionSignal_uid108_vecRotateTest_q <= not (xMSB_uid106_vecRotateTest_b);

    -- yip1E_5NA_uid117_vecRotateTest(BITJOIN,116)@6
    yip1E_5NA_uid117_vecRotateTest_q <= redist34_yip1_4_uid104_vecRotateTest_b_1_q & xip1E_5CostZeroPaddingA_uid113_vecRotateTest_q;

    -- yip1E_5sumAHighB_uid118_vecRotateTest(ADDSUB,117)@6
    yip1E_5sumAHighB_uid118_vecRotateTest_s <= signOfSelectionSignal_uid108_vecRotateTest_q;
    yip1E_5sumAHighB_uid118_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1E_5NA_uid117_vecRotateTest_q(22)) & yip1E_5NA_uid117_vecRotateTest_q));
    yip1E_5sumAHighB_uid118_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => redist35_xip1_4_uid103_vecRotateTest_b_1_q(18)) & redist35_xip1_4_uid103_vecRotateTest_b_1_q));
    yip1E_5sumAHighB_uid118_vecRotateTest_combproc: PROCESS (yip1E_5sumAHighB_uid118_vecRotateTest_a, yip1E_5sumAHighB_uid118_vecRotateTest_b, yip1E_5sumAHighB_uid118_vecRotateTest_s)
    BEGIN
        IF (yip1E_5sumAHighB_uid118_vecRotateTest_s = "1") THEN
            yip1E_5sumAHighB_uid118_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid118_vecRotateTest_a) + SIGNED(yip1E_5sumAHighB_uid118_vecRotateTest_b));
        ELSE
            yip1E_5sumAHighB_uid118_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid118_vecRotateTest_a) - SIGNED(yip1E_5sumAHighB_uid118_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_5sumAHighB_uid118_vecRotateTest_q <= yip1E_5sumAHighB_uid118_vecRotateTest_o(23 downto 0);

    -- yip1_5_uid122_vecRotateTest(BITSELECT,121)@6
    yip1_5_uid122_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_5sumAHighB_uid118_vecRotateTest_q(22 downto 0));
    yip1_5_uid122_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_5_uid122_vecRotateTest_in(22 downto 0));

    -- redist31_yip1_5_uid122_vecRotateTest_b_1(DELAY,408)
    redist31_yip1_5_uid122_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_5_uid122_vecRotateTest_b, xout => redist31_yip1_5_uid122_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_6NA_uid137_vecRotateTest(BITJOIN,136)@7
    yip1E_6NA_uid137_vecRotateTest_q <= redist31_yip1_5_uid122_vecRotateTest_b_1_q & absAECostZeroPaddingA_uid9_vecRotateTest_q;

    -- yip1E_6sumAHighB_uid138_vecRotateTest(ADDSUB,137)@7
    yip1E_6sumAHighB_uid138_vecRotateTest_s <= signOfSelectionSignal_uid126_vecRotateTest_q;
    yip1E_6sumAHighB_uid138_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => yip1E_6NA_uid137_vecRotateTest_q(24)) & yip1E_6NA_uid137_vecRotateTest_q));
    yip1E_6sumAHighB_uid138_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 20 => twoToMiSiXip_uid129_vecRotateTest_b(19)) & twoToMiSiXip_uid129_vecRotateTest_b));
    yip1E_6sumAHighB_uid138_vecRotateTest_combproc: PROCESS (yip1E_6sumAHighB_uid138_vecRotateTest_a, yip1E_6sumAHighB_uid138_vecRotateTest_b, yip1E_6sumAHighB_uid138_vecRotateTest_s)
    BEGIN
        IF (yip1E_6sumAHighB_uid138_vecRotateTest_s = "1") THEN
            yip1E_6sumAHighB_uid138_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid138_vecRotateTest_a) + SIGNED(yip1E_6sumAHighB_uid138_vecRotateTest_b));
        ELSE
            yip1E_6sumAHighB_uid138_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid138_vecRotateTest_a) - SIGNED(yip1E_6sumAHighB_uid138_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_6sumAHighB_uid138_vecRotateTest_q <= yip1E_6sumAHighB_uid138_vecRotateTest_o(25 downto 0);

    -- yip1_6_uid142_vecRotateTest(BITSELECT,141)@7
    yip1_6_uid142_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_6sumAHighB_uid138_vecRotateTest_q(24 downto 0));
    yip1_6_uid142_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_6_uid142_vecRotateTest_in(24 downto 0));

    -- redist28_yip1_6_uid142_vecRotateTest_b_1(DELAY,405)
    redist28_yip1_6_uid142_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_6_uid142_vecRotateTest_b, xout => redist28_yip1_6_uid142_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid150_vecRotateTest(BITSELECT,149)@8
    twoToMiSiYip_uid150_vecRotateTest_b <= STD_LOGIC_VECTOR(redist28_yip1_6_uid142_vecRotateTest_b_1_q(24 downto 6));

    -- twoToMiSiYip_uid130_vecRotateTest(BITSELECT,129)@7
    twoToMiSiYip_uid130_vecRotateTest_b <= STD_LOGIC_VECTOR(redist31_yip1_5_uid122_vecRotateTest_b_1_q(22 downto 3));

    -- xip1E_6NA_uid134_vecRotateTest(BITJOIN,133)@7
    xip1E_6NA_uid134_vecRotateTest_q <= redist32_xip1_5_uid121_vecRotateTest_b_1_q & absAECostZeroPaddingA_uid9_vecRotateTest_q;

    -- xip1E_6sumAHighB_uid135_vecRotateTest(ADDSUB,134)@7
    xip1E_6sumAHighB_uid135_vecRotateTest_s <= xMSB_uid124_vecRotateTest_b;
    xip1E_6sumAHighB_uid135_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => xip1E_6NA_uid134_vecRotateTest_q(24)) & xip1E_6NA_uid134_vecRotateTest_q));
    xip1E_6sumAHighB_uid135_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 20 => twoToMiSiYip_uid130_vecRotateTest_b(19)) & twoToMiSiYip_uid130_vecRotateTest_b));
    xip1E_6sumAHighB_uid135_vecRotateTest_combproc: PROCESS (xip1E_6sumAHighB_uid135_vecRotateTest_a, xip1E_6sumAHighB_uid135_vecRotateTest_b, xip1E_6sumAHighB_uid135_vecRotateTest_s)
    BEGIN
        IF (xip1E_6sumAHighB_uid135_vecRotateTest_s = "1") THEN
            xip1E_6sumAHighB_uid135_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid135_vecRotateTest_a) + SIGNED(xip1E_6sumAHighB_uid135_vecRotateTest_b));
        ELSE
            xip1E_6sumAHighB_uid135_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid135_vecRotateTest_a) - SIGNED(xip1E_6sumAHighB_uid135_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_6sumAHighB_uid135_vecRotateTest_q <= xip1E_6sumAHighB_uid135_vecRotateTest_o(25 downto 0);

    -- xip1_6_uid141_vecRotateTest(BITSELECT,140)@7
    xip1_6_uid141_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_6sumAHighB_uid135_vecRotateTest_q(24 downto 0));
    xip1_6_uid141_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_6_uid141_vecRotateTest_in(24 downto 0));

    -- redist29_xip1_6_uid141_vecRotateTest_b_1(DELAY,406)
    redist29_xip1_6_uid141_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_6_uid141_vecRotateTest_b, xout => redist29_xip1_6_uid141_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_7_uid153_vecRotateTest(ADDSUB,152)@8
    xip1E_7_uid153_vecRotateTest_s <= xMSB_uid144_vecRotateTest_b;
    xip1E_7_uid153_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist29_xip1_6_uid141_vecRotateTest_b_1_q(24)) & redist29_xip1_6_uid141_vecRotateTest_b_1_q));
    xip1E_7_uid153_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 19 => twoToMiSiYip_uid150_vecRotateTest_b(18)) & twoToMiSiYip_uid150_vecRotateTest_b));
    xip1E_7_uid153_vecRotateTest_combproc: PROCESS (xip1E_7_uid153_vecRotateTest_a, xip1E_7_uid153_vecRotateTest_b, xip1E_7_uid153_vecRotateTest_s)
    BEGIN
        IF (xip1E_7_uid153_vecRotateTest_s = "1") THEN
            xip1E_7_uid153_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid153_vecRotateTest_a) + SIGNED(xip1E_7_uid153_vecRotateTest_b));
        ELSE
            xip1E_7_uid153_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid153_vecRotateTest_a) - SIGNED(xip1E_7_uid153_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid153_vecRotateTest_q <= xip1E_7_uid153_vecRotateTest_o(25 downto 0);

    -- xip1_7_uid160_vecRotateTest(BITSELECT,159)@8
    xip1_7_uid160_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_7_uid153_vecRotateTest_q(24 downto 0));
    xip1_7_uid160_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_7_uid160_vecRotateTest_in(24 downto 0));

    -- redist26_xip1_7_uid160_vecRotateTest_b_1(DELAY,403)
    redist26_xip1_7_uid160_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_7_uid160_vecRotateTest_b, xout => redist26_xip1_7_uid160_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid168_vecRotateTest(BITSELECT,167)@9
    twoToMiSiXip_uid168_vecRotateTest_b <= STD_LOGIC_VECTOR(redist26_xip1_7_uid160_vecRotateTest_b_1_q(24 downto 7));

    -- signOfSelectionSignal_uid146_vecRotateTest(LOGICAL,145)@8
    signOfSelectionSignal_uid146_vecRotateTest_q <= not (xMSB_uid144_vecRotateTest_b);

    -- twoToMiSiXip_uid149_vecRotateTest(BITSELECT,148)@8
    twoToMiSiXip_uid149_vecRotateTest_b <= STD_LOGIC_VECTOR(redist29_xip1_6_uid141_vecRotateTest_b_1_q(24 downto 6));

    -- yip1E_7_uid154_vecRotateTest(ADDSUB,153)@8
    yip1E_7_uid154_vecRotateTest_s <= signOfSelectionSignal_uid146_vecRotateTest_q;
    yip1E_7_uid154_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist28_yip1_6_uid142_vecRotateTest_b_1_q(24)) & redist28_yip1_6_uid142_vecRotateTest_b_1_q));
    yip1E_7_uid154_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 19 => twoToMiSiXip_uid149_vecRotateTest_b(18)) & twoToMiSiXip_uid149_vecRotateTest_b));
    yip1E_7_uid154_vecRotateTest_combproc: PROCESS (yip1E_7_uid154_vecRotateTest_a, yip1E_7_uid154_vecRotateTest_b, yip1E_7_uid154_vecRotateTest_s)
    BEGIN
        IF (yip1E_7_uid154_vecRotateTest_s = "1") THEN
            yip1E_7_uid154_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid154_vecRotateTest_a) + SIGNED(yip1E_7_uid154_vecRotateTest_b));
        ELSE
            yip1E_7_uid154_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid154_vecRotateTest_a) - SIGNED(yip1E_7_uid154_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid154_vecRotateTest_q <= yip1E_7_uid154_vecRotateTest_o(25 downto 0);

    -- yip1_7_uid161_vecRotateTest(BITSELECT,160)@8
    yip1_7_uid161_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid154_vecRotateTest_q(24 downto 0));
    yip1_7_uid161_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_7_uid161_vecRotateTest_in(24 downto 0));

    -- redist25_yip1_7_uid161_vecRotateTest_b_1(DELAY,402)
    redist25_yip1_7_uid161_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_7_uid161_vecRotateTest_b, xout => redist25_yip1_7_uid161_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_8_uid173_vecRotateTest(ADDSUB,172)@9
    yip1E_8_uid173_vecRotateTest_s <= signOfSelectionSignal_uid165_vecRotateTest_q;
    yip1E_8_uid173_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist25_yip1_7_uid161_vecRotateTest_b_1_q(24)) & redist25_yip1_7_uid161_vecRotateTest_b_1_q));
    yip1E_8_uid173_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 18 => twoToMiSiXip_uid168_vecRotateTest_b(17)) & twoToMiSiXip_uid168_vecRotateTest_b));
    yip1E_8_uid173_vecRotateTest_combproc: PROCESS (yip1E_8_uid173_vecRotateTest_a, yip1E_8_uid173_vecRotateTest_b, yip1E_8_uid173_vecRotateTest_s)
    BEGIN
        IF (yip1E_8_uid173_vecRotateTest_s = "1") THEN
            yip1E_8_uid173_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid173_vecRotateTest_a) + SIGNED(yip1E_8_uid173_vecRotateTest_b));
        ELSE
            yip1E_8_uid173_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid173_vecRotateTest_a) - SIGNED(yip1E_8_uid173_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid173_vecRotateTest_q <= yip1E_8_uid173_vecRotateTest_o(25 downto 0);

    -- yip1_8_uid180_vecRotateTest(BITSELECT,179)@9
    yip1_8_uid180_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid173_vecRotateTest_q(24 downto 0));
    yip1_8_uid180_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_8_uid180_vecRotateTest_in(24 downto 0));

    -- redist22_yip1_8_uid180_vecRotateTest_b_1(DELAY,399)
    redist22_yip1_8_uid180_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_8_uid180_vecRotateTest_b, xout => redist22_yip1_8_uid180_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid188_vecRotateTest(BITSELECT,187)@10
    twoToMiSiYip_uid188_vecRotateTest_b <= STD_LOGIC_VECTOR(redist22_yip1_8_uid180_vecRotateTest_b_1_q(24 downto 8));

    -- twoToMiSiYip_uid169_vecRotateTest(BITSELECT,168)@9
    twoToMiSiYip_uid169_vecRotateTest_b <= STD_LOGIC_VECTOR(redist25_yip1_7_uid161_vecRotateTest_b_1_q(24 downto 7));

    -- xip1E_8_uid172_vecRotateTest(ADDSUB,171)@9
    xip1E_8_uid172_vecRotateTest_s <= xMSB_uid163_vecRotateTest_b;
    xip1E_8_uid172_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist26_xip1_7_uid160_vecRotateTest_b_1_q(24)) & redist26_xip1_7_uid160_vecRotateTest_b_1_q));
    xip1E_8_uid172_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 18 => twoToMiSiYip_uid169_vecRotateTest_b(17)) & twoToMiSiYip_uid169_vecRotateTest_b));
    xip1E_8_uid172_vecRotateTest_combproc: PROCESS (xip1E_8_uid172_vecRotateTest_a, xip1E_8_uid172_vecRotateTest_b, xip1E_8_uid172_vecRotateTest_s)
    BEGIN
        IF (xip1E_8_uid172_vecRotateTest_s = "1") THEN
            xip1E_8_uid172_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid172_vecRotateTest_a) + SIGNED(xip1E_8_uid172_vecRotateTest_b));
        ELSE
            xip1E_8_uid172_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid172_vecRotateTest_a) - SIGNED(xip1E_8_uid172_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid172_vecRotateTest_q <= xip1E_8_uid172_vecRotateTest_o(25 downto 0);

    -- xip1_8_uid179_vecRotateTest(BITSELECT,178)@9
    xip1_8_uid179_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_8_uid172_vecRotateTest_q(24 downto 0));
    xip1_8_uid179_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_8_uid179_vecRotateTest_in(24 downto 0));

    -- redist23_xip1_8_uid179_vecRotateTest_b_1(DELAY,400)
    redist23_xip1_8_uid179_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_8_uid179_vecRotateTest_b, xout => redist23_xip1_8_uid179_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_9_uid191_vecRotateTest(ADDSUB,190)@10
    xip1E_9_uid191_vecRotateTest_s <= xMSB_uid182_vecRotateTest_b;
    xip1E_9_uid191_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist23_xip1_8_uid179_vecRotateTest_b_1_q(24)) & redist23_xip1_8_uid179_vecRotateTest_b_1_q));
    xip1E_9_uid191_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 17 => twoToMiSiYip_uid188_vecRotateTest_b(16)) & twoToMiSiYip_uid188_vecRotateTest_b));
    xip1E_9_uid191_vecRotateTest_combproc: PROCESS (xip1E_9_uid191_vecRotateTest_a, xip1E_9_uid191_vecRotateTest_b, xip1E_9_uid191_vecRotateTest_s)
    BEGIN
        IF (xip1E_9_uid191_vecRotateTest_s = "1") THEN
            xip1E_9_uid191_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid191_vecRotateTest_a) + SIGNED(xip1E_9_uid191_vecRotateTest_b));
        ELSE
            xip1E_9_uid191_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid191_vecRotateTest_a) - SIGNED(xip1E_9_uid191_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid191_vecRotateTest_q <= xip1E_9_uid191_vecRotateTest_o(25 downto 0);

    -- xip1_9_uid198_vecRotateTest(BITSELECT,197)@10
    xip1_9_uid198_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_9_uid191_vecRotateTest_q(24 downto 0));
    xip1_9_uid198_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_9_uid198_vecRotateTest_in(24 downto 0));

    -- redist20_xip1_9_uid198_vecRotateTest_b_1(DELAY,397)
    redist20_xip1_9_uid198_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_9_uid198_vecRotateTest_b, xout => redist20_xip1_9_uid198_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid206_vecRotateTest(BITSELECT,205)@11
    twoToMiSiXip_uid206_vecRotateTest_b <= STD_LOGIC_VECTOR(redist20_xip1_9_uid198_vecRotateTest_b_1_q(24 downto 9));

    -- signOfSelectionSignal_uid184_vecRotateTest(LOGICAL,183)@10
    signOfSelectionSignal_uid184_vecRotateTest_q <= not (xMSB_uid182_vecRotateTest_b);

    -- twoToMiSiXip_uid187_vecRotateTest(BITSELECT,186)@10
    twoToMiSiXip_uid187_vecRotateTest_b <= STD_LOGIC_VECTOR(redist23_xip1_8_uid179_vecRotateTest_b_1_q(24 downto 8));

    -- yip1E_9_uid192_vecRotateTest(ADDSUB,191)@10
    yip1E_9_uid192_vecRotateTest_s <= signOfSelectionSignal_uid184_vecRotateTest_q;
    yip1E_9_uid192_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist22_yip1_8_uid180_vecRotateTest_b_1_q(24)) & redist22_yip1_8_uid180_vecRotateTest_b_1_q));
    yip1E_9_uid192_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 17 => twoToMiSiXip_uid187_vecRotateTest_b(16)) & twoToMiSiXip_uid187_vecRotateTest_b));
    yip1E_9_uid192_vecRotateTest_combproc: PROCESS (yip1E_9_uid192_vecRotateTest_a, yip1E_9_uid192_vecRotateTest_b, yip1E_9_uid192_vecRotateTest_s)
    BEGIN
        IF (yip1E_9_uid192_vecRotateTest_s = "1") THEN
            yip1E_9_uid192_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid192_vecRotateTest_a) + SIGNED(yip1E_9_uid192_vecRotateTest_b));
        ELSE
            yip1E_9_uid192_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid192_vecRotateTest_a) - SIGNED(yip1E_9_uid192_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid192_vecRotateTest_q <= yip1E_9_uid192_vecRotateTest_o(25 downto 0);

    -- yip1_9_uid199_vecRotateTest(BITSELECT,198)@10
    yip1_9_uid199_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid192_vecRotateTest_q(24 downto 0));
    yip1_9_uid199_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_9_uid199_vecRotateTest_in(24 downto 0));

    -- redist19_yip1_9_uid199_vecRotateTest_b_1(DELAY,396)
    redist19_yip1_9_uid199_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_9_uid199_vecRotateTest_b, xout => redist19_yip1_9_uid199_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_10_uid211_vecRotateTest(ADDSUB,210)@11
    yip1E_10_uid211_vecRotateTest_s <= signOfSelectionSignal_uid203_vecRotateTest_q;
    yip1E_10_uid211_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist19_yip1_9_uid199_vecRotateTest_b_1_q(24)) & redist19_yip1_9_uid199_vecRotateTest_b_1_q));
    yip1E_10_uid211_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 16 => twoToMiSiXip_uid206_vecRotateTest_b(15)) & twoToMiSiXip_uid206_vecRotateTest_b));
    yip1E_10_uid211_vecRotateTest_combproc: PROCESS (yip1E_10_uid211_vecRotateTest_a, yip1E_10_uid211_vecRotateTest_b, yip1E_10_uid211_vecRotateTest_s)
    BEGIN
        IF (yip1E_10_uid211_vecRotateTest_s = "1") THEN
            yip1E_10_uid211_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid211_vecRotateTest_a) + SIGNED(yip1E_10_uid211_vecRotateTest_b));
        ELSE
            yip1E_10_uid211_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid211_vecRotateTest_a) - SIGNED(yip1E_10_uid211_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid211_vecRotateTest_q <= yip1E_10_uid211_vecRotateTest_o(25 downto 0);

    -- yip1_10_uid218_vecRotateTest(BITSELECT,217)@11
    yip1_10_uid218_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid211_vecRotateTest_q(24 downto 0));
    yip1_10_uid218_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_10_uid218_vecRotateTest_in(24 downto 0));

    -- redist16_yip1_10_uid218_vecRotateTest_b_1(DELAY,393)
    redist16_yip1_10_uid218_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_10_uid218_vecRotateTest_b, xout => redist16_yip1_10_uid218_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid226_vecRotateTest(BITSELECT,225)@12
    twoToMiSiYip_uid226_vecRotateTest_b <= STD_LOGIC_VECTOR(redist16_yip1_10_uid218_vecRotateTest_b_1_q(24 downto 10));

    -- twoToMiSiYip_uid207_vecRotateTest(BITSELECT,206)@11
    twoToMiSiYip_uid207_vecRotateTest_b <= STD_LOGIC_VECTOR(redist19_yip1_9_uid199_vecRotateTest_b_1_q(24 downto 9));

    -- xip1E_10_uid210_vecRotateTest(ADDSUB,209)@11
    xip1E_10_uid210_vecRotateTest_s <= xMSB_uid201_vecRotateTest_b;
    xip1E_10_uid210_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist20_xip1_9_uid198_vecRotateTest_b_1_q(24)) & redist20_xip1_9_uid198_vecRotateTest_b_1_q));
    xip1E_10_uid210_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 16 => twoToMiSiYip_uid207_vecRotateTest_b(15)) & twoToMiSiYip_uid207_vecRotateTest_b));
    xip1E_10_uid210_vecRotateTest_combproc: PROCESS (xip1E_10_uid210_vecRotateTest_a, xip1E_10_uid210_vecRotateTest_b, xip1E_10_uid210_vecRotateTest_s)
    BEGIN
        IF (xip1E_10_uid210_vecRotateTest_s = "1") THEN
            xip1E_10_uid210_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid210_vecRotateTest_a) + SIGNED(xip1E_10_uid210_vecRotateTest_b));
        ELSE
            xip1E_10_uid210_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid210_vecRotateTest_a) - SIGNED(xip1E_10_uid210_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid210_vecRotateTest_q <= xip1E_10_uid210_vecRotateTest_o(25 downto 0);

    -- xip1_10_uid217_vecRotateTest(BITSELECT,216)@11
    xip1_10_uid217_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_10_uid210_vecRotateTest_q(24 downto 0));
    xip1_10_uid217_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_10_uid217_vecRotateTest_in(24 downto 0));

    -- redist17_xip1_10_uid217_vecRotateTest_b_1(DELAY,394)
    redist17_xip1_10_uid217_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_10_uid217_vecRotateTest_b, xout => redist17_xip1_10_uid217_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_11_uid229_vecRotateTest(ADDSUB,228)@12
    xip1E_11_uid229_vecRotateTest_s <= xMSB_uid220_vecRotateTest_b;
    xip1E_11_uid229_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist17_xip1_10_uid217_vecRotateTest_b_1_q(24)) & redist17_xip1_10_uid217_vecRotateTest_b_1_q));
    xip1E_11_uid229_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 15 => twoToMiSiYip_uid226_vecRotateTest_b(14)) & twoToMiSiYip_uid226_vecRotateTest_b));
    xip1E_11_uid229_vecRotateTest_combproc: PROCESS (xip1E_11_uid229_vecRotateTest_a, xip1E_11_uid229_vecRotateTest_b, xip1E_11_uid229_vecRotateTest_s)
    BEGIN
        IF (xip1E_11_uid229_vecRotateTest_s = "1") THEN
            xip1E_11_uid229_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid229_vecRotateTest_a) + SIGNED(xip1E_11_uid229_vecRotateTest_b));
        ELSE
            xip1E_11_uid229_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid229_vecRotateTest_a) - SIGNED(xip1E_11_uid229_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_11_uid229_vecRotateTest_q <= xip1E_11_uid229_vecRotateTest_o(25 downto 0);

    -- xip1_11_uid236_vecRotateTest(BITSELECT,235)@12
    xip1_11_uid236_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_11_uid229_vecRotateTest_q(24 downto 0));
    xip1_11_uid236_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_11_uid236_vecRotateTest_in(24 downto 0));

    -- redist14_xip1_11_uid236_vecRotateTest_b_1(DELAY,391)
    redist14_xip1_11_uid236_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_11_uid236_vecRotateTest_b, xout => redist14_xip1_11_uid236_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid244_vecRotateTest(BITSELECT,243)@13
    twoToMiSiXip_uid244_vecRotateTest_b <= STD_LOGIC_VECTOR(redist14_xip1_11_uid236_vecRotateTest_b_1_q(24 downto 11));

    -- signOfSelectionSignal_uid222_vecRotateTest(LOGICAL,221)@12
    signOfSelectionSignal_uid222_vecRotateTest_q <= not (xMSB_uid220_vecRotateTest_b);

    -- twoToMiSiXip_uid225_vecRotateTest(BITSELECT,224)@12
    twoToMiSiXip_uid225_vecRotateTest_b <= STD_LOGIC_VECTOR(redist17_xip1_10_uid217_vecRotateTest_b_1_q(24 downto 10));

    -- yip1E_11_uid230_vecRotateTest(ADDSUB,229)@12
    yip1E_11_uid230_vecRotateTest_s <= signOfSelectionSignal_uid222_vecRotateTest_q;
    yip1E_11_uid230_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist16_yip1_10_uid218_vecRotateTest_b_1_q(24)) & redist16_yip1_10_uid218_vecRotateTest_b_1_q));
    yip1E_11_uid230_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 15 => twoToMiSiXip_uid225_vecRotateTest_b(14)) & twoToMiSiXip_uid225_vecRotateTest_b));
    yip1E_11_uid230_vecRotateTest_combproc: PROCESS (yip1E_11_uid230_vecRotateTest_a, yip1E_11_uid230_vecRotateTest_b, yip1E_11_uid230_vecRotateTest_s)
    BEGIN
        IF (yip1E_11_uid230_vecRotateTest_s = "1") THEN
            yip1E_11_uid230_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid230_vecRotateTest_a) + SIGNED(yip1E_11_uid230_vecRotateTest_b));
        ELSE
            yip1E_11_uid230_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid230_vecRotateTest_a) - SIGNED(yip1E_11_uid230_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_11_uid230_vecRotateTest_q <= yip1E_11_uid230_vecRotateTest_o(25 downto 0);

    -- yip1_11_uid237_vecRotateTest(BITSELECT,236)@12
    yip1_11_uid237_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_11_uid230_vecRotateTest_q(24 downto 0));
    yip1_11_uid237_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_11_uid237_vecRotateTest_in(24 downto 0));

    -- redist13_yip1_11_uid237_vecRotateTest_b_1(DELAY,390)
    redist13_yip1_11_uid237_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_11_uid237_vecRotateTest_b, xout => redist13_yip1_11_uid237_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_12_uid249_vecRotateTest(ADDSUB,248)@13
    yip1E_12_uid249_vecRotateTest_s <= signOfSelectionSignal_uid241_vecRotateTest_q;
    yip1E_12_uid249_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist13_yip1_11_uid237_vecRotateTest_b_1_q(24)) & redist13_yip1_11_uid237_vecRotateTest_b_1_q));
    yip1E_12_uid249_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 14 => twoToMiSiXip_uid244_vecRotateTest_b(13)) & twoToMiSiXip_uid244_vecRotateTest_b));
    yip1E_12_uid249_vecRotateTest_combproc: PROCESS (yip1E_12_uid249_vecRotateTest_a, yip1E_12_uid249_vecRotateTest_b, yip1E_12_uid249_vecRotateTest_s)
    BEGIN
        IF (yip1E_12_uid249_vecRotateTest_s = "1") THEN
            yip1E_12_uid249_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid249_vecRotateTest_a) + SIGNED(yip1E_12_uid249_vecRotateTest_b));
        ELSE
            yip1E_12_uid249_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid249_vecRotateTest_a) - SIGNED(yip1E_12_uid249_vecRotateTest_b));
        END IF;
    END PROCESS;
    yip1E_12_uid249_vecRotateTest_q <= yip1E_12_uid249_vecRotateTest_o(25 downto 0);

    -- yip1_12_uid256_vecRotateTest(BITSELECT,255)@13
    yip1_12_uid256_vecRotateTest_in <= STD_LOGIC_VECTOR(yip1E_12_uid249_vecRotateTest_q(24 downto 0));
    yip1_12_uid256_vecRotateTest_b <= STD_LOGIC_VECTOR(yip1_12_uid256_vecRotateTest_in(24 downto 0));

    -- redist8_yip1_12_uid256_vecRotateTest_b_1(DELAY,385)
    redist8_yip1_12_uid256_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_12_uid256_vecRotateTest_b, xout => redist8_yip1_12_uid256_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- redist9_yip1_12_uid256_vecRotateTest_b_3(DELAY,386)
    redist9_yip1_12_uid256_vecRotateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 25, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_yip1_12_uid256_vecRotateTest_b_1_q, xout => redist9_yip1_12_uid256_vecRotateTest_b_3_q, clk => clk, aclr => areset );

    -- outYE_uid262_vecRotateTest_shift6(BITSHIFT,356)@16
    outYE_uid262_vecRotateTest_shift6_qint <= redist9_yip1_12_uid256_vecRotateTest_b_3_q & "000000000000";
    outYE_uid262_vecRotateTest_shift6_q <= outYE_uid262_vecRotateTest_shift6_qint(36 downto 0);

    -- outYE_uid262_vecRotateTest_shift0(BITSHIFT,350)@14
    outYE_uid262_vecRotateTest_shift0_qint <= redist8_yip1_12_uid256_vecRotateTest_b_1_q & "0000";
    outYE_uid262_vecRotateTest_shift0_q <= outYE_uid262_vecRotateTest_shift0_qint(28 downto 0);

    -- outYE_uid262_vecRotateTest_add_1(ADD,351)@14 + 1
    outYE_uid262_vecRotateTest_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 25 => redist8_yip1_12_uid256_vecRotateTest_b_1_q(24)) & redist8_yip1_12_uid256_vecRotateTest_b_1_q));
    outYE_uid262_vecRotateTest_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => outYE_uid262_vecRotateTest_shift0_q(28)) & outYE_uid262_vecRotateTest_shift0_q));
    outYE_uid262_vecRotateTest_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outYE_uid262_vecRotateTest_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outYE_uid262_vecRotateTest_add_1_o <= STD_LOGIC_VECTOR(SIGNED(outYE_uid262_vecRotateTest_add_1_a) + SIGNED(outYE_uid262_vecRotateTest_add_1_b));
        END IF;
    END PROCESS;
    outYE_uid262_vecRotateTest_add_1_q <= outYE_uid262_vecRotateTest_add_1_o(29 downto 0);

    -- outYE_uid262_vecRotateTest_shift2(BITSHIFT,352)@14
    outYE_uid262_vecRotateTest_shift2_qint <= redist8_yip1_12_uid256_vecRotateTest_b_1_q & "000";
    outYE_uid262_vecRotateTest_shift2_q <= outYE_uid262_vecRotateTest_shift2_qint(27 downto 0);

    -- outYE_uid262_vecRotateTest_sub_3(SUB,353)@14 + 1
    outYE_uid262_vecRotateTest_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => outYE_uid262_vecRotateTest_shift2_q(27)) & outYE_uid262_vecRotateTest_shift2_q));
    outYE_uid262_vecRotateTest_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 25 => redist8_yip1_12_uid256_vecRotateTest_b_1_q(24)) & redist8_yip1_12_uid256_vecRotateTest_b_1_q));
    outYE_uid262_vecRotateTest_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outYE_uid262_vecRotateTest_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outYE_uid262_vecRotateTest_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(outYE_uid262_vecRotateTest_sub_3_a) - SIGNED(outYE_uid262_vecRotateTest_sub_3_b));
        END IF;
    END PROCESS;
    outYE_uid262_vecRotateTest_sub_3_q <= outYE_uid262_vecRotateTest_sub_3_o(28 downto 0);

    -- outYE_uid262_vecRotateTest_shift4(BITSHIFT,354)@15
    outYE_uid262_vecRotateTest_shift4_qint <= outYE_uid262_vecRotateTest_sub_3_q & "0000000";
    outYE_uid262_vecRotateTest_shift4_q <= outYE_uid262_vecRotateTest_shift4_qint(35 downto 0);

    -- outYE_uid262_vecRotateTest_sub_5(SUB,355)@15 + 1
    outYE_uid262_vecRotateTest_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => outYE_uid262_vecRotateTest_shift4_q(35)) & outYE_uid262_vecRotateTest_shift4_q));
    outYE_uid262_vecRotateTest_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 30 => outYE_uid262_vecRotateTest_add_1_q(29)) & outYE_uid262_vecRotateTest_add_1_q));
    outYE_uid262_vecRotateTest_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outYE_uid262_vecRotateTest_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outYE_uid262_vecRotateTest_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(outYE_uid262_vecRotateTest_sub_5_a) - SIGNED(outYE_uid262_vecRotateTest_sub_5_b));
        END IF;
    END PROCESS;
    outYE_uid262_vecRotateTest_sub_5_q <= outYE_uid262_vecRotateTest_sub_5_o(36 downto 0);

    -- outYE_uid262_vecRotateTest_add_7(ADD,357)@16 + 1
    outYE_uid262_vecRotateTest_add_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 37 => outYE_uid262_vecRotateTest_sub_5_q(36)) & outYE_uid262_vecRotateTest_sub_5_q));
    outYE_uid262_vecRotateTest_add_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 37 => outYE_uid262_vecRotateTest_shift6_q(36)) & outYE_uid262_vecRotateTest_shift6_q));
    outYE_uid262_vecRotateTest_add_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outYE_uid262_vecRotateTest_add_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outYE_uid262_vecRotateTest_add_7_o <= STD_LOGIC_VECTOR(SIGNED(outYE_uid262_vecRotateTest_add_7_a) + SIGNED(outYE_uid262_vecRotateTest_add_7_b));
        END IF;
    END PROCESS;
    outYE_uid262_vecRotateTest_add_7_q <= outYE_uid262_vecRotateTest_add_7_o(37 downto 0);

    -- highABits_uid361_outYE_uid262_vecRotateTest(BITSELECT,360)@17
    highABits_uid361_outYE_uid262_vecRotateTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => outYE_uid262_vecRotateTest_add_7_q(37)) & outYE_uid262_vecRotateTest_add_7_q));
    highABits_uid361_outYE_uid262_vecRotateTest_b <= STD_LOGIC_VECTOR(highABits_uid361_outYE_uid262_vecRotateTest_in(38 downto 26));

    -- srPostRndhigh_uid362_outYE_uid262_vecRotateTest(ADD,361)@17 + 1
    srPostRndhigh_uid362_outYE_uid262_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => highABits_uid361_outYE_uid262_vecRotateTest_b(12)) & highABits_uid361_outYE_uid262_vecRotateTest_b));
    srPostRndhigh_uid362_outYE_uid262_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & VCC_q));
    srPostRndhigh_uid362_outYE_uid262_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            srPostRndhigh_uid362_outYE_uid262_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            srPostRndhigh_uid362_outYE_uid262_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(srPostRndhigh_uid362_outYE_uid262_vecRotateTest_a) + SIGNED(srPostRndhigh_uid362_outYE_uid262_vecRotateTest_b));
        END IF;
    END PROCESS;
    srPostRndhigh_uid362_outYE_uid262_vecRotateTest_q <= srPostRndhigh_uid362_outYE_uid262_vecRotateTest_o(13 downto 0);

    -- lowRangeA_uid360_outYE_uid262_vecRotateTest(BITSELECT,359)@17
    lowRangeA_uid360_outYE_uid262_vecRotateTest_in <= outYE_uid262_vecRotateTest_add_7_q(25 downto 0);
    lowRangeA_uid360_outYE_uid262_vecRotateTest_b <= lowRangeA_uid360_outYE_uid262_vecRotateTest_in(25 downto 0);

    -- redist5_lowRangeA_uid360_outYE_uid262_vecRotateTest_b_1(DELAY,382)
    redist5_lowRangeA_uid360_outYE_uid262_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid360_outYE_uid262_vecRotateTest_b, xout => redist5_lowRangeA_uid360_outYE_uid262_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- srPostRnd_uid363_outYE_uid262_vecRotateTest(BITJOIN,362)@18
    srPostRnd_uid363_outYE_uid262_vecRotateTest_q <= srPostRndhigh_uid362_outYE_uid262_vecRotateTest_q & redist5_lowRangeA_uid360_outYE_uid262_vecRotateTest_b_1_q;

    -- sR_uid373_outYE_uid262_vecRotateTest(BITSELECT,372)@18
    sR_uid373_outYE_uid262_vecRotateTest_in <= STD_LOGIC_VECTOR(srPostRnd_uid363_outYE_uid262_vecRotateTest_q(37 downto 0));
    sR_uid373_outYE_uid262_vecRotateTest_b <= STD_LOGIC_VECTOR(sR_uid373_outYE_uid262_vecRotateTest_in(37 downto 27));

    -- redist4_sR_uid373_outYE_uid262_vecRotateTest_b_1(DELAY,381)
    redist4_sR_uid373_outYE_uid262_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sR_uid373_outYE_uid262_vecRotateTest_b, xout => redist4_sR_uid373_outYE_uid262_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- paddingX_uid311_outXE_uid260_vecRotateTest(CONSTANT,310)
    paddingX_uid311_outXE_uid260_vecRotateTest_q <= "000000000000000000000000000";

    -- updatedX_uid312_outXE_uid260_vecRotateTest(BITJOIN,311)@18
    updatedX_uid312_outXE_uid260_vecRotateTest_q <= maxValInOutFormat_uid309_outXE_uid260_vecRotateTest_q & paddingX_uid311_outXE_uid260_vecRotateTest_q;

    -- ovf_uid366_outYE_uid262_vecRotateTest(COMPARE,367)@18 + 1
    ovf_uid366_outYE_uid262_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 38 => updatedX_uid312_outXE_uid260_vecRotateTest_q(37)) & updatedX_uid312_outXE_uid260_vecRotateTest_q));
    ovf_uid366_outYE_uid262_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => srPostRnd_uid363_outYE_uid262_vecRotateTest_q(39)) & srPostRnd_uid363_outYE_uid262_vecRotateTest_q));
    ovf_uid366_outYE_uid262_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ovf_uid366_outYE_uid262_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            ovf_uid366_outYE_uid262_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid366_outYE_uid262_vecRotateTest_a) - SIGNED(ovf_uid366_outYE_uid262_vecRotateTest_b));
        END IF;
    END PROCESS;
    ovf_uid366_outYE_uid262_vecRotateTest_c(0) <= ovf_uid366_outYE_uid262_vecRotateTest_o(41);

    -- updatedY_uid315_outXE_uid260_vecRotateTest(BITJOIN,314)@18
    updatedY_uid315_outXE_uid260_vecRotateTest_q <= minValueInFormat_uid310_outXE_uid260_vecRotateTest_q & paddingX_uid311_outXE_uid260_vecRotateTest_q;

    -- udf_uid369_outYE_uid262_vecRotateTest(COMPARE,370)@18 + 1
    udf_uid369_outYE_uid262_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => srPostRnd_uid363_outYE_uid262_vecRotateTest_q(39)) & srPostRnd_uid363_outYE_uid262_vecRotateTest_q));
    udf_uid369_outYE_uid262_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 38 => updatedY_uid315_outXE_uid260_vecRotateTest_q(37)) & updatedY_uid315_outXE_uid260_vecRotateTest_q));
    udf_uid369_outYE_uid262_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            udf_uid369_outYE_uid262_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            udf_uid369_outYE_uid262_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid369_outYE_uid262_vecRotateTest_a) - SIGNED(udf_uid369_outYE_uid262_vecRotateTest_b));
        END IF;
    END PROCESS;
    udf_uid369_outYE_uid262_vecRotateTest_c(0) <= udf_uid369_outYE_uid262_vecRotateTest_o(41);

    -- ovfudfcond_uid372_outYE_uid262_vecRotateTest(BITJOIN,371)@19
    ovfudfcond_uid372_outYE_uid262_vecRotateTest_q <= ovf_uid366_outYE_uid262_vecRotateTest_c & udf_uid369_outYE_uid262_vecRotateTest_c;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- sRA1_uid374_outYE_uid262_vecRotateTest(MUX,373)@19
    sRA1_uid374_outYE_uid262_vecRotateTest_s <= ovfudfcond_uid372_outYE_uid262_vecRotateTest_q;
    sRA1_uid374_outYE_uid262_vecRotateTest_combproc: PROCESS (sRA1_uid374_outYE_uid262_vecRotateTest_s, redist4_sR_uid373_outYE_uid262_vecRotateTest_b_1_q, minValueInFormat_uid310_outXE_uid260_vecRotateTest_q, maxValInOutFormat_uid309_outXE_uid260_vecRotateTest_q)
    BEGIN
        CASE (sRA1_uid374_outYE_uid262_vecRotateTest_s) IS
            WHEN "00" => sRA1_uid374_outYE_uid262_vecRotateTest_q <= redist4_sR_uid373_outYE_uid262_vecRotateTest_b_1_q;
            WHEN "01" => sRA1_uid374_outYE_uid262_vecRotateTest_q <= minValueInFormat_uid310_outXE_uid260_vecRotateTest_q;
            WHEN "10" => sRA1_uid374_outYE_uid262_vecRotateTest_q <= maxValInOutFormat_uid309_outXE_uid260_vecRotateTest_q;
            WHEN "11" => sRA1_uid374_outYE_uid262_vecRotateTest_q <= maxValInOutFormat_uid309_outXE_uid260_vecRotateTest_q;
            WHEN OTHERS => sRA1_uid374_outYE_uid262_vecRotateTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outY_uid263_vecRotateTest(BITSELECT,262)@19
    outY_uid263_vecRotateTest_in <= STD_LOGIC_VECTOR(sRA1_uid374_outYE_uid262_vecRotateTest_q(9 downto 0));
    outY_uid263_vecRotateTest_b <= STD_LOGIC_VECTOR(outY_uid263_vecRotateTest_in(9 downto 0));

    -- twoToMiSiYip_uid245_vecRotateTest(BITSELECT,244)@13
    twoToMiSiYip_uid245_vecRotateTest_b <= STD_LOGIC_VECTOR(redist13_yip1_11_uid237_vecRotateTest_b_1_q(24 downto 11));

    -- xip1E_12_uid248_vecRotateTest(ADDSUB,247)@13
    xip1E_12_uid248_vecRotateTest_s <= redist12_xMSB_uid239_vecRotateTest_b_1_q;
    xip1E_12_uid248_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist14_xip1_11_uid236_vecRotateTest_b_1_q(24)) & redist14_xip1_11_uid236_vecRotateTest_b_1_q));
    xip1E_12_uid248_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 14 => twoToMiSiYip_uid245_vecRotateTest_b(13)) & twoToMiSiYip_uid245_vecRotateTest_b));
    xip1E_12_uid248_vecRotateTest_combproc: PROCESS (xip1E_12_uid248_vecRotateTest_a, xip1E_12_uid248_vecRotateTest_b, xip1E_12_uid248_vecRotateTest_s)
    BEGIN
        IF (xip1E_12_uid248_vecRotateTest_s = "1") THEN
            xip1E_12_uid248_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid248_vecRotateTest_a) + SIGNED(xip1E_12_uid248_vecRotateTest_b));
        ELSE
            xip1E_12_uid248_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid248_vecRotateTest_a) - SIGNED(xip1E_12_uid248_vecRotateTest_b));
        END IF;
    END PROCESS;
    xip1E_12_uid248_vecRotateTest_q <= xip1E_12_uid248_vecRotateTest_o(25 downto 0);

    -- xip1_12_uid255_vecRotateTest(BITSELECT,254)@13
    xip1_12_uid255_vecRotateTest_in <= STD_LOGIC_VECTOR(xip1E_12_uid248_vecRotateTest_q(24 downto 0));
    xip1_12_uid255_vecRotateTest_b <= STD_LOGIC_VECTOR(xip1_12_uid255_vecRotateTest_in(24 downto 0));

    -- redist10_xip1_12_uid255_vecRotateTest_b_1(DELAY,387)
    redist10_xip1_12_uid255_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_12_uid255_vecRotateTest_b, xout => redist10_xip1_12_uid255_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- redist11_xip1_12_uid255_vecRotateTest_b_3(DELAY,388)
    redist11_xip1_12_uid255_vecRotateTest_b_3 : dspba_delay
    GENERIC MAP ( width => 25, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist10_xip1_12_uid255_vecRotateTest_b_1_q, xout => redist11_xip1_12_uid255_vecRotateTest_b_3_q, clk => clk, aclr => areset );

    -- outXE_uid260_vecRotateTest_shift6(BITSHIFT,301)@16
    outXE_uid260_vecRotateTest_shift6_qint <= redist11_xip1_12_uid255_vecRotateTest_b_3_q & "000000000000";
    outXE_uid260_vecRotateTest_shift6_q <= outXE_uid260_vecRotateTest_shift6_qint(36 downto 0);

    -- outXE_uid260_vecRotateTest_shift0(BITSHIFT,295)@14
    outXE_uid260_vecRotateTest_shift0_qint <= redist10_xip1_12_uid255_vecRotateTest_b_1_q & "0000";
    outXE_uid260_vecRotateTest_shift0_q <= outXE_uid260_vecRotateTest_shift0_qint(28 downto 0);

    -- outXE_uid260_vecRotateTest_add_1(ADD,296)@14 + 1
    outXE_uid260_vecRotateTest_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 25 => redist10_xip1_12_uid255_vecRotateTest_b_1_q(24)) & redist10_xip1_12_uid255_vecRotateTest_b_1_q));
    outXE_uid260_vecRotateTest_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => outXE_uid260_vecRotateTest_shift0_q(28)) & outXE_uid260_vecRotateTest_shift0_q));
    outXE_uid260_vecRotateTest_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outXE_uid260_vecRotateTest_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outXE_uid260_vecRotateTest_add_1_o <= STD_LOGIC_VECTOR(SIGNED(outXE_uid260_vecRotateTest_add_1_a) + SIGNED(outXE_uid260_vecRotateTest_add_1_b));
        END IF;
    END PROCESS;
    outXE_uid260_vecRotateTest_add_1_q <= outXE_uid260_vecRotateTest_add_1_o(29 downto 0);

    -- outXE_uid260_vecRotateTest_shift2(BITSHIFT,297)@14
    outXE_uid260_vecRotateTest_shift2_qint <= redist10_xip1_12_uid255_vecRotateTest_b_1_q & "000";
    outXE_uid260_vecRotateTest_shift2_q <= outXE_uid260_vecRotateTest_shift2_qint(27 downto 0);

    -- outXE_uid260_vecRotateTest_sub_3(SUB,298)@14 + 1
    outXE_uid260_vecRotateTest_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => outXE_uid260_vecRotateTest_shift2_q(27)) & outXE_uid260_vecRotateTest_shift2_q));
    outXE_uid260_vecRotateTest_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 25 => redist10_xip1_12_uid255_vecRotateTest_b_1_q(24)) & redist10_xip1_12_uid255_vecRotateTest_b_1_q));
    outXE_uid260_vecRotateTest_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outXE_uid260_vecRotateTest_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outXE_uid260_vecRotateTest_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(outXE_uid260_vecRotateTest_sub_3_a) - SIGNED(outXE_uid260_vecRotateTest_sub_3_b));
        END IF;
    END PROCESS;
    outXE_uid260_vecRotateTest_sub_3_q <= outXE_uid260_vecRotateTest_sub_3_o(28 downto 0);

    -- outXE_uid260_vecRotateTest_shift4(BITSHIFT,299)@15
    outXE_uid260_vecRotateTest_shift4_qint <= outXE_uid260_vecRotateTest_sub_3_q & "0000000";
    outXE_uid260_vecRotateTest_shift4_q <= outXE_uid260_vecRotateTest_shift4_qint(35 downto 0);

    -- outXE_uid260_vecRotateTest_sub_5(SUB,300)@15 + 1
    outXE_uid260_vecRotateTest_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => outXE_uid260_vecRotateTest_shift4_q(35)) & outXE_uid260_vecRotateTest_shift4_q));
    outXE_uid260_vecRotateTest_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 30 => outXE_uid260_vecRotateTest_add_1_q(29)) & outXE_uid260_vecRotateTest_add_1_q));
    outXE_uid260_vecRotateTest_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outXE_uid260_vecRotateTest_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outXE_uid260_vecRotateTest_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(outXE_uid260_vecRotateTest_sub_5_a) - SIGNED(outXE_uid260_vecRotateTest_sub_5_b));
        END IF;
    END PROCESS;
    outXE_uid260_vecRotateTest_sub_5_q <= outXE_uid260_vecRotateTest_sub_5_o(36 downto 0);

    -- outXE_uid260_vecRotateTest_add_7(ADD,302)@16 + 1
    outXE_uid260_vecRotateTest_add_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 37 => outXE_uid260_vecRotateTest_sub_5_q(36)) & outXE_uid260_vecRotateTest_sub_5_q));
    outXE_uid260_vecRotateTest_add_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 37 => outXE_uid260_vecRotateTest_shift6_q(36)) & outXE_uid260_vecRotateTest_shift6_q));
    outXE_uid260_vecRotateTest_add_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outXE_uid260_vecRotateTest_add_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            outXE_uid260_vecRotateTest_add_7_o <= STD_LOGIC_VECTOR(SIGNED(outXE_uid260_vecRotateTest_add_7_a) + SIGNED(outXE_uid260_vecRotateTest_add_7_b));
        END IF;
    END PROCESS;
    outXE_uid260_vecRotateTest_add_7_q <= outXE_uid260_vecRotateTest_add_7_o(37 downto 0);

    -- highABits_uid306_outXE_uid260_vecRotateTest(BITSELECT,305)@17
    highABits_uid306_outXE_uid260_vecRotateTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => outXE_uid260_vecRotateTest_add_7_q(37)) & outXE_uid260_vecRotateTest_add_7_q));
    highABits_uid306_outXE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(highABits_uid306_outXE_uid260_vecRotateTest_in(38 downto 26));

    -- srPostRndhigh_uid307_outXE_uid260_vecRotateTest(ADD,306)@17 + 1
    srPostRndhigh_uid307_outXE_uid260_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => highABits_uid306_outXE_uid260_vecRotateTest_b(12)) & highABits_uid306_outXE_uid260_vecRotateTest_b));
    srPostRndhigh_uid307_outXE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & VCC_q));
    srPostRndhigh_uid307_outXE_uid260_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            srPostRndhigh_uid307_outXE_uid260_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            srPostRndhigh_uid307_outXE_uid260_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(srPostRndhigh_uid307_outXE_uid260_vecRotateTest_a) + SIGNED(srPostRndhigh_uid307_outXE_uid260_vecRotateTest_b));
        END IF;
    END PROCESS;
    srPostRndhigh_uid307_outXE_uid260_vecRotateTest_q <= srPostRndhigh_uid307_outXE_uid260_vecRotateTest_o(13 downto 0);

    -- lowRangeA_uid305_outXE_uid260_vecRotateTest(BITSELECT,304)@17
    lowRangeA_uid305_outXE_uid260_vecRotateTest_in <= outXE_uid260_vecRotateTest_add_7_q(25 downto 0);
    lowRangeA_uid305_outXE_uid260_vecRotateTest_b <= lowRangeA_uid305_outXE_uid260_vecRotateTest_in(25 downto 0);

    -- redist7_lowRangeA_uid305_outXE_uid260_vecRotateTest_b_1(DELAY,384)
    redist7_lowRangeA_uid305_outXE_uid260_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid305_outXE_uid260_vecRotateTest_b, xout => redist7_lowRangeA_uid305_outXE_uid260_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- srPostRnd_uid308_outXE_uid260_vecRotateTest(BITJOIN,307)@18
    srPostRnd_uid308_outXE_uid260_vecRotateTest_q <= srPostRndhigh_uid307_outXE_uid260_vecRotateTest_q & redist7_lowRangeA_uid305_outXE_uid260_vecRotateTest_b_1_q;

    -- sR_uid318_outXE_uid260_vecRotateTest(BITSELECT,317)@18
    sR_uid318_outXE_uid260_vecRotateTest_in <= STD_LOGIC_VECTOR(srPostRnd_uid308_outXE_uid260_vecRotateTest_q(37 downto 0));
    sR_uid318_outXE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(sR_uid318_outXE_uid260_vecRotateTest_in(37 downto 27));

    -- redist6_sR_uid318_outXE_uid260_vecRotateTest_b_1(DELAY,383)
    redist6_sR_uid318_outXE_uid260_vecRotateTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sR_uid318_outXE_uid260_vecRotateTest_b, xout => redist6_sR_uid318_outXE_uid260_vecRotateTest_b_1_q, clk => clk, aclr => areset );

    -- ovf_uid311_outXE_uid260_vecRotateTest(COMPARE,312)@18 + 1
    ovf_uid311_outXE_uid260_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 38 => updatedX_uid312_outXE_uid260_vecRotateTest_q(37)) & updatedX_uid312_outXE_uid260_vecRotateTest_q));
    ovf_uid311_outXE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => srPostRnd_uid308_outXE_uid260_vecRotateTest_q(39)) & srPostRnd_uid308_outXE_uid260_vecRotateTest_q));
    ovf_uid311_outXE_uid260_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ovf_uid311_outXE_uid260_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            ovf_uid311_outXE_uid260_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid311_outXE_uid260_vecRotateTest_a) - SIGNED(ovf_uid311_outXE_uid260_vecRotateTest_b));
        END IF;
    END PROCESS;
    ovf_uid311_outXE_uid260_vecRotateTest_c(0) <= ovf_uid311_outXE_uid260_vecRotateTest_o(41);

    -- udf_uid314_outXE_uid260_vecRotateTest(COMPARE,315)@18 + 1
    udf_uid314_outXE_uid260_vecRotateTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => srPostRnd_uid308_outXE_uid260_vecRotateTest_q(39)) & srPostRnd_uid308_outXE_uid260_vecRotateTest_q));
    udf_uid314_outXE_uid260_vecRotateTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 38 => updatedY_uid315_outXE_uid260_vecRotateTest_q(37)) & updatedY_uid315_outXE_uid260_vecRotateTest_q));
    udf_uid314_outXE_uid260_vecRotateTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            udf_uid314_outXE_uid260_vecRotateTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            udf_uid314_outXE_uid260_vecRotateTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid314_outXE_uid260_vecRotateTest_a) - SIGNED(udf_uid314_outXE_uid260_vecRotateTest_b));
        END IF;
    END PROCESS;
    udf_uid314_outXE_uid260_vecRotateTest_c(0) <= udf_uid314_outXE_uid260_vecRotateTest_o(41);

    -- ovfudfcond_uid317_outXE_uid260_vecRotateTest(BITJOIN,316)@19
    ovfudfcond_uid317_outXE_uid260_vecRotateTest_q <= ovf_uid311_outXE_uid260_vecRotateTest_c & udf_uid314_outXE_uid260_vecRotateTest_c;

    -- sRA1_uid319_outXE_uid260_vecRotateTest(MUX,318)@19
    sRA1_uid319_outXE_uid260_vecRotateTest_s <= ovfudfcond_uid317_outXE_uid260_vecRotateTest_q;
    sRA1_uid319_outXE_uid260_vecRotateTest_combproc: PROCESS (sRA1_uid319_outXE_uid260_vecRotateTest_s, redist6_sR_uid318_outXE_uid260_vecRotateTest_b_1_q, minValueInFormat_uid310_outXE_uid260_vecRotateTest_q, maxValInOutFormat_uid309_outXE_uid260_vecRotateTest_q)
    BEGIN
        CASE (sRA1_uid319_outXE_uid260_vecRotateTest_s) IS
            WHEN "00" => sRA1_uid319_outXE_uid260_vecRotateTest_q <= redist6_sR_uid318_outXE_uid260_vecRotateTest_b_1_q;
            WHEN "01" => sRA1_uid319_outXE_uid260_vecRotateTest_q <= minValueInFormat_uid310_outXE_uid260_vecRotateTest_q;
            WHEN "10" => sRA1_uid319_outXE_uid260_vecRotateTest_q <= maxValInOutFormat_uid309_outXE_uid260_vecRotateTest_q;
            WHEN "11" => sRA1_uid319_outXE_uid260_vecRotateTest_q <= maxValInOutFormat_uid309_outXE_uid260_vecRotateTest_q;
            WHEN OTHERS => sRA1_uid319_outXE_uid260_vecRotateTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outX_uid261_vecRotateTest(BITSELECT,260)@19
    outX_uid261_vecRotateTest_in <= STD_LOGIC_VECTOR(sRA1_uid319_outXE_uid260_vecRotateTest_q(9 downto 0));
    outX_uid261_vecRotateTest_b <= STD_LOGIC_VECTOR(outX_uid261_vecRotateTest_in(9 downto 0));

    -- xOut(GPOUT,4)@19
    xo <= outX_uid261_vecRotateTest_b;
    yo <= outY_uid263_vecRotateTest_b;

END normal;
