`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: home    
// Engineer: andsronin
// 
// Create Date: 20.10.2024
// Design Name: antminer_xc7z010clg400
// Module Name: top_antminer_xc7z010
// Project Name: antminer_xc7z010clg400
// Target Devices: xc7z010clg400-1
// Tool Versions: Vivado 2022.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module top_antminer_xc7z010
(
    //BOARD ID
(* chip_pin = "L14" *) input  wire Board_ID3              , //L14 - PULLUP
(* chip_pin = "L15" *) input  wire Board_ID2              , //L15 - PULLDOWN
(* chip_pin = "M14" *) input  wire Board_ID1              , //M14 - PULLDOWN
(* chip_pin = "M15" *) input  wire Board_ID0              , //M15 - PULLDOWN
(* chip_pin = "U13" *) input  wire PUDC_B                 , //U13 - 3V3(R190) or 0(R191)
    //SYSTEM
(* chip_pin = "R11" *) output wire DONE                   , //R11 - LED         - D1
(* chip_pin = "E7"  *) input  wire PS_CLK_33M33           , //E7  - 33.330MHz   - Y1
(* chip_pin = "K17" *) input  wire BANK35_L12P_MRCC_100M  , //K17 - 100MHz      - Y2
(* chip_pin = "N18" *) input  wire BANK34_L13P_MRCC_100M  , //N18 - 100MHz      - Y3
(* chip_pin = "C7"  *) inout  wire P_GOOD                 , //C7  - 3V3 2A      - U12
(* chip_pin = "B10" *) inout  wire PS_SRST                , //B10 - from BUTTON - S1
(* chip_pin = "B14" *) inout  wire PS_MIO47_KEY_RESET     , //B14 - from BUTTON - S1
(* chip_pin = "B9"  *) inout  wire PS_MIO51_IP_GET        , //B9  - BUTTON 2V5  - S2
(* chip_pin = "B13" *) inout  wire PS_MIO50_CD_WP         , //B13 - PWRGD V2P5  - R177
(* chip_pin = "k18" *) output wire CLOCK_OUT              , //K18               - TP1
    //BUZZER
(* chip_pin = "C18" *) inout  wire PS_MIO39_BEEP          , //C18 - BZ1
    //LEDs
(* chip_pin = "F16" *) output wire BANK35_L6P_LED_N       , //F16        - D7
(* chip_pin = "M19" *) output wire BANK35_L7P_LED_N       , //M19        - D5
(* chip_pin = "M17" *) output wire BANK35_L8P_LED_N       , //M17        - D6
(* chip_pin = "L19" *) output wire BANK35_L9P_LED_N       , //L19        - D8
(* chip_pin = "A10" *) output wire PS_MIO37_LED_R         , //A10 - F5G1 - D3
(* chip_pin = "E13" *) output wire PS_MIO38_LED_G         , //E13 - F5G1 - D3
    //UART - LSF0102DCTR U7 -> J12
(* chip_pin = "B12" *) output wire MIO48_UART_TXD         , //B12 PULLUP 2V5
(* chip_pin = "C12" *) input  wire MIO49_UART_RXD         , //C12 PULLUP 2V5
    //FLASH - MT29F2G08AACWP
(* chip_pin = "E6"  *) output wire PS_MIO0_NAND_CS_N      , //E6 PULLUP PULLDOWN
(* chip_pin = "A7"  *) output wire PS_MIO1_NAND_WP_N      , //A7 PULLUP
(* chip_pin = "B8"  *) output wire PS_MIO2_NAND_ALE       , //B8 
(* chip_pin = "D6"  *) output wire PS_MIO3_NAND_WE_N      , //D6
(* chip_pin = "B7"  *) input  wire PS_MIO4_NAND_DQ2       , //B7
(* chip_pin = "A6"  *) inout  wire PS_MIO5_NAND_DQ0       , //A6
(* chip_pin = "A5"  *) inout  wire PS_MIO6_NAND_DQ1       , //A5 PULLDOWN
(* chip_pin = "D8"  *) output wire PS_MIO7_NAND_CLE       , //D8 PULLDOWN
(* chip_pin = "D5"  *) output wire PS_MIO8_NAND_RE_N      , //D5 PULLDOWN
(* chip_pin = "B5"  *) inout  wire PS_MIO9_NAND_DQ4       , //B5
(* chip_pin = "E9"  *) inout  wire PS_MIO10_NAND_DQ5      , //E9
(* chip_pin = "C6"  *) inout  wire PS_MIO11_NAND_DQ6      , //C6
(* chip_pin = "D9"  *) inout  wire PS_MIO12_NAND_DQ7      , //D9
(* chip_pin = "E8"  *) inout  wire PS_MIO13_NAND_DQ3      , //E8
(* chip_pin = "C5"  *) input  wire PS_MIO14_NAND_RB_N     , //C5 PULLUP
(* chip_pin = "C8"  *) output wire PS_MIO15_LED_N         , //C8
    //ETHERNET - B50612
(* chip_pin = "A19" *) output wire ETH_TX_CLK             , //A19
(* chip_pin = "E14" *) output wire ETH_TXD0               , //E14
(* chip_pin = "B18" *) output wire ETH_TXD1               , //B18
(* chip_pin = "D10" *) output wire ETH_TXD2               , //D10
(* chip_pin = "A17" *) output wire ETH_TXD3               , //A17
(* chip_pin = "F14" *) output wire ETH_TX_CTRL            , //F14
(* chip_pin = "B17" *) input  wire ETH_RX_CLK             , //B17
(* chip_pin = "D11" *) input  wire ETH_RX0                , //D11
(* chip_pin = "A16" *) input  wire ETH_RX1                , //A16
(* chip_pin = "F15" *) input  wire ETH_RX2                , //F15
(* chip_pin = "A15" *) input  wire ETH_RX3                , //A15
(* chip_pin = "D13" *) input  wire ETH_RX_CTRL            , //D13
(* chip_pin = "C10" *) output wire ETH_MDC                , //C10 PULLUP 2V5
(* chip_pin = "C11" *) inout  wire ETH_MDIO               , //C11 PULLUP 2V5
    //MICRO SD - TXS02612RTWR, SCHA5B0200
(* chip_pin = "D14" *) output wire PS_MIO40_CD_CLK        , //D14
(* chip_pin = "C17" *) output wire PS_MIO41_CD_CMD        , //C17
(* chip_pin = "E12" *) inout  wire PS_MIO42_CD_D0         , //E12
(* chip_pin = "A9"  *) inout  wire PS_MIO42_CD_D1         , //A9
(* chip_pin = "F13" *) inout  wire PS_MIO42_CD_D2         , //F13
(* chip_pin = "B15" *) inout  wire PS_MIO42_CD_D3         , //B15
(* chip_pin = "D16" *) input  wire PS_MIO46_CD_SW         , //D16
    //RAM - MT41K256M16HA-125:E - Y091K2560000
(* chip_pin = "N2"  *) output wire DDR3_A0                , //N2
(* chip_pin = "K2"  *) output wire DDR3_A1                , //K2
(* chip_pin = "M3"  *) output wire DDR3_A2                , //M3
(* chip_pin = "K3"  *) output wire DDR3_A3                , //K3
(* chip_pin = "M4"  *) output wire DDR3_A4                , //M4
(* chip_pin = "L1"  *) output wire DDR3_A5                , //L1
(* chip_pin = "L4"  *) output wire DDR3_A6                , //L4
(* chip_pin = "K4"  *) output wire DDR3_A7                , //K4
(* chip_pin = "K1"  *) output wire DDR3_A8                , //K1
(* chip_pin = "J4"  *) output wire DDR3_A9                , //J4
(* chip_pin = "F5"  *) output wire DDR3_A10               , //F5
(* chip_pin = "G4"  *) output wire DDR3_A11               , //G4
(* chip_pin = "E4"  *) output wire DDR3_A12               , //E4
(* chip_pin = "D4"  *) output wire DDR3_A13               , //D4
(* chip_pin = "F4"  *) output wire DDR3_A14               , //F4
(* chip_pin = "L5"  *) output wire DDR3_BA0               , //L5
(* chip_pin = "R4"  *) output wire DDR3_BA1               , //R4
(* chip_pin = "J5"  *) output wire DDR3_BA2               , //J5
(* chip_pin = "P5"  *) output wire DDR3_CAS_N             , //P5
(* chip_pin = "P4"  *) output wire DDR3_RAS_N             , //P4
(* chip_pin = "M5"  *) output wire DDR3_WE_N              , //M5
(* chip_pin = "N1"  *) output wire DDR3_CS_N              , //N1
(* chip_pin = "L2"  *) output wire DDR3_CLK_P             , //L2
(* chip_pin = "M2"  *) output wire DDR3_CLK_N             , //M2
(* chip_pin = "N2"  *) output wire DDR3_CKE               , //N2
(* chip_pin = "N5"  *) output wire DDR3_ODT               , //N5
(* chip_pin = "C3"  *) inout  wire DDR3_DQ0               , //C3
(* chip_pin = "B3"  *) inout  wire DDR3_DQ1               , //B3
(* chip_pin = "A2"  *) inout  wire DDR3_DQ2               , //A2
(* chip_pin = "A4"  *) inout  wire DDR3_DQ3               , //A4
(* chip_pin = "D3"  *) inout  wire DDR3_DQ4               , //D3
(* chip_pin = "D1"  *) inout  wire DDR3_DQ5               , //D1
(* chip_pin = "C1"  *) inout  wire DDR3_DQ6               , //C1
(* chip_pin = "E1"  *) inout  wire DDR3_DQ7               , //E1
(* chip_pin = "E2"  *) inout  wire DDR3_DQ8               , //E2
(* chip_pin = "E3"  *) inout  wire DDR3_DQ9               , //E3
(* chip_pin = "G3"  *) inout  wire DDR3_DQ10              , //G3
(* chip_pin = "H3"  *) inout  wire DDR3_DQ11              , //H3
(* chip_pin = "J3"  *) inout  wire DDR3_DQ12              , //J3
(* chip_pin = "H2"  *) inout  wire DDR3_DQ13              , //H2
(* chip_pin = "H1"  *) inout  wire DDR3_DQ14              , //H1
(* chip_pin = "J1"  *) inout  wire DDR3_DQ15              , //J1
(* chip_pin = "P1"  *) inout  wire DDR3_DQ16              , //P1
(* chip_pin = "P3"  *) inout  wire DDR3_DQ17              , //P3
(* chip_pin = "R3"  *) inout  wire DDR3_DQ18              , //R3
(* chip_pin = "R1"  *) inout  wire DDR3_DQ19              , //R1
(* chip_pin = "T4"  *) inout  wire DDR3_DQ20              , //T4
(* chip_pin = "U4"  *) inout  wire DDR3_DQ21              , //U4
(* chip_pin = "U2"  *) inout  wire DDR3_DQ22              , //U2
(* chip_pin = "U3"  *) inout  wire DDR3_DQ23              , //U3
(* chip_pin = "V1"  *) inout  wire DDR3_DQ24              , //V1
(* chip_pin = "Y3"  *) inout  wire DDR3_DQ25              , //Y3
(* chip_pin = "W1"  *) inout  wire DDR3_DQ26              , //W1
(* chip_pin = "Y4"  *) inout  wire DDR3_DQ27              , //Y4
(* chip_pin = "Y2"  *) inout  wire DDR3_DQ28              , //Y2
(* chip_pin = "W3"  *) inout  wire DDR3_DQ29              , //W3
(* chip_pin = "V2"  *) inout  wire DDR3_DQ30              , //V2
(* chip_pin = "V3"  *) inout  wire DDR3_DQ31              , //V3
(* chip_pin = "C2"  *) inout  wire DDR3_DQS0_P            , //C2
(* chip_pin = "B2"  *) inout  wire DDR3_DQS0_N            , //B2
(* chip_pin = "G2"  *) inout  wire DDR3_DQS1_P            , //G2
(* chip_pin = "F2"  *) inout  wire DDR3_DQS1_N            , //F2
(* chip_pin = "R2"  *) inout  wire DDR3_DQS2_P            , //R2
(* chip_pin = "T2"  *) inout  wire DDR3_DQS2_N            , //T2
(* chip_pin = "W5"  *) inout  wire DDR3_DQS3_P            , //W5
(* chip_pin = "W4"  *) inout  wire DDR3_DQS3_N            , //W4
(* chip_pin = "A1"  *) output wire DDR3_DM0               , //A1
(* chip_pin = "F1"  *) output wire DDR3_DM1               , //F1
(* chip_pin = "T1"  *) output wire DDR3_DM2               , //T1
(* chip_pin = "Y1"  *) output wire DDR3_DM3               , //Y1
(* chip_pin = "B4"  *) output wire DDR3_RESET_N           , //B4
    //CONNECTORS
    //J1
(* chip_pin = "C16" *) inout  wire PS_MIO28_EN1           , //C16 - J1
(* chip_pin = "T11" *) input  wire BANK34_L1P_PLUG1       , //T11 - J1
(* chip_pin = "T10" *) inout  wire BANK34_L1N_RST1        , //T10 - J1
(* chip_pin = "T12" *) inout  wire BANK34_L2P_TXD1        , //T12 - J1
(* chip_pin = "U12" *) inout  wire BANK34_L2N_RXD1        , //U12 - J1
    //J2
(* chip_pin = "C13" *) inout  wire PS_MIO29_EN2           , //C13 - J2
(* chip_pin = "R19" *) inout  wire BANK34_0_PLUG2         , //R19 - J2
(* chip_pin = "V13" *) inout  wire BANK34_L3N_RST2        , //V13 - J2
(* chip_pin = "V12" *) inout  wire BANK34_L4P_TXD2        , //V12 - J2
(* chip_pin = "W13" *) inout  wire BANK34_L4N_RXD2        , //W13 - J2
    //J3
(* chip_pin = "C15" *) inout  wire PS_MIO30_EN3           , //C15 - J3
(* chip_pin = "T14" *) inout  wire BANK34_L5P_PLUG3       , //T14 - J3
(* chip_pin = "T15" *) inout  wire BANK34_L5N_RST3        , //T15 - J3
(* chip_pin = "P14" *) inout  wire BANK34_L6P_TXD3        , //P14 - J3
(* chip_pin = "R14" *) inout  wire BANK34_L6N_RXD3        , //R14 - J3
    //J4
(* chip_pin = "E16" *) inout  wire PS_MIO31_EN4           , //E16 - J4
(* chip_pin = "Y16" *) inout  wire BANK34_L7P_PLUG4       , //Y16 - J4
(* chip_pin = "Y17" *) inout  wire BANK34_L7N_RST4        , //Y17 - J4
(* chip_pin = "W14" *) inout  wire BANK34_L8P_TXD4        , //W14 - J4
(* chip_pin = "Y14" *) inout  wire BANK34_L8N_RXD4        , //Y14 - J4
    //J5
(* chip_pin = "A14" *) inout  wire PS_MIO32_EN5           , //A14 - J5
(* chip_pin = "T16" *) inout  wire BANK34_L9P_PLUG5       , //T16 - J5
(* chip_pin = "U17" *) inout  wire BANK34_L9N_RST5        , //U17 - J5
(* chip_pin = "V15" *) inout  wire BANK34_L10P_TXD5       , //V15 - J5
(* chip_pin = "W15" *) inout  wire BANK34_L10N_RXD5       , //W15 - J5
    //J6
(* chip_pin = "D15" *) inout  wire PS_MIO33_EN6           , //D15 - J6
(* chip_pin = "U14" *) inout  wire BANK34_L11P_PLUG6      , //U14 - J6
(* chip_pin = "U15" *) inout  wire BANK34_L11N_RST6       , //U15 - J6
(* chip_pin = "U18" *) inout  wire BANK34_L12P_TXD6       , //U18 - J6
(* chip_pin = "U19" *) inout  wire BANK34_L12N_RXD6       , //U19 - J6
    //J7
(* chip_pin = "A12" *) inout  wire PS_MIO34_EN7           , //A12 - J7
(* chip_pin = "T20" *) inout  wire BANK34_L15P_PLUG7      , //T20 - J7
(* chip_pin = "U20" *) inout  wire BANK34_L15N_RST7       , //U20 - J7
(* chip_pin = "V20" *) inout  wire BANK34_L16P_TXD7       , //V20 - J7
(* chip_pin = "W20" *) inout  wire BANK34_L16N_RXD7       , //W20 - J7
    //J8
(* chip_pin = "F12" *) inout  wire PS_MIO35_EN8           , //F12 - J8
(* chip_pin = "Y18" *) inout  wire BANK34_L17P_PLUG8      , //Y18 - J8
(* chip_pin = "Y19" *) inout  wire BANK34_L17N_RST8       , //Y19 - J8
(* chip_pin = "V16" *) inout  wire BANK34_L18P_TXD8       , //V16 - J8
(* chip_pin = "W16" *) inout  wire BANK34_L18N_RXD8       , //W16 - J8
    //J9
(* chip_pin = "A11" *) inout  wire PS_MIO36_EN9           , //A11 - J9
(* chip_pin = "R16" *) inout  wire BANK34_L19P_PLUG9      , //R16 - J9
(* chip_pin = "R17" *) inout  wire BANK34_L19N_RST9       , //R17 - J9
(* chip_pin = "T17" *) inout  wire BANK34_L20P_TXD9       , //T17 - J9
(* chip_pin = "R18" *) inout  wire BANK34_L20N_RXD9       , //R18 - J9
    //I2C
(* chip_pin = "W18" *) inout  wire BANK34_L22P_SCL1       , //W18 - J1-J8
(* chip_pin = "W19" *) inout  wire BANK34_L22N_SDA1       , //W19 - J1-J8
    
(* chip_pin = "N17" *) inout  wire BANK34_L23P_SCL2       , //N17 - J9
(* chip_pin = "P18" *) inout  wire BANK34_L23N_SDA2       , //P18 - J9
    //FAN
(* chip_pin = "J18" *) output wire BANK35_L14P_FAN_PWM    , //J18 - FAN1 - FAN6
(* chip_pin = "F19" *) input  wire BANK35_L15P_FAN_SPEED1 , //F19 - FAN1
(* chip_pin = "F20" *) input  wire BANK35_L15N_FAN_SPEED2 , //F20 - FAN3
(* chip_pin = "G17" *) input  wire BANK35_L16P_FAN_SPEED3 , //G17 - FAN5
(* chip_pin = "G18" *) input  wire BANK35_L16N_FAN_SPEED4 , //G18 - FAN2
(* chip_pin = "J20" *) input  wire BANK35_L17P_FAN_SPEED5 , //J20 - FAN4
(* chip_pin = "H20" *) input  wire BANK35_L17N_FAN_SPEED6   //H20 - FAN6
);



endmodule
