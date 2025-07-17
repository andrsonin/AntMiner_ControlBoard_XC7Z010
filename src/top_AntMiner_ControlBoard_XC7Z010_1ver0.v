`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: world    
// Engineer: andsronin
// Create Date: 15.07.2025
// Project Name: top_AntMiner_ControlBoard_XC7Z010_1ver0
// Target Devices: xc7z010clg400-1
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module top_AntMiner_ControlBoard_XC7Z010_1ver0
(
    //BOARD ID
(* chip_pin = "L14" *) input  wire Board_ID3              , //L14 - PULLUP
(* chip_pin = "L15" *) input  wire Board_ID2              , //L15 - PULLDOWN
(* chip_pin = "M14" *) input  wire Board_ID1              , //M14 - PULLDOWN
(* chip_pin = "M15" *) input  wire Board_ID0              , //M15 - PULLDOWN
(* chip_pin = "U13" *) input  wire PUDC_B                 , //U13 - 3V3(R190) or 0(R191)
    //SYSTEM
// (* chip_pin = "R11" *) output wire DONE                   , //R11 - LED         - D1
// (* chip_pin = "E7"  *) input  wire PS_CLK_33M33           , //E7  - 33.330MHz   - Y1
(* chip_pin = "K17" *) input  wire BANK35_L12P_MRCC_100M  , //K17 - 100MHz      - Y2
(* chip_pin = "N18" *) input  wire BANK34_L13P_MRCC_100M  , //N18 - 100MHz      - Y3
(* chip_pin = "C7"  *) inout  wire P_GOOD                 , //C7  - 3V3 2A      - U12
//  (* chip_pin = "B10" *) input   wire PS_SRST                , //B10 - from BUTTON - S1
//(* chip_pin = "B14" *) inout  wire PS_MIO47_KEY_RESET     , //B14 - from BUTTON - S1
//(* chip_pin = "B9"  *) inout  wire PS_MIO51_IP_GET        , //B9  - BUTTON 2V5  - S2
//(* chip_pin = "B13" *) inout  wire PS_MIO50_CD_WP         , //B13 - PWRGD V2P5  - R177
(* chip_pin = "k18" *) output wire CLOCK_OUT              , //K18               - TP1
    //BUZZER
//(* chip_pin = "C18" *) inout  wire PS_MIO39_BEEP          , //C18 - BZ1
    //LEDs
(* chip_pin = "F16" *) output wire BANK35_L6P_LED_N       , //F16        - D7
(* chip_pin = "M19" *) output wire BANK35_L7P_LED_N       , //M19        - D5
(* chip_pin = "M17" *) output wire BANK35_L8P_LED_N       , //M17        - D6
(* chip_pin = "L19" *) output wire BANK35_L9P_LED_N       , //L19        - D8
//(* chip_pin = "A10" *) output wire PS_MIO37_LED_R         , //A10 - F5G1 - D3
//(* chip_pin = "E13" *) output wire PS_MIO38_LED_G         , //E13 - F5G1 - D3
    //UART - LSF0102DCTR U7 -> J12
//(* chip_pin = "B12" *) output wire MIO48_UART_TXD         , //B12 PULLUP 2V5
//(* chip_pin = "C12" *) input  wire MIO49_UART_RXD         , //C12 PULLUP 2V5
    //FLASH - MT29F2G08AACWP
//(* chip_pin = "E6"  *) output wire PS_MIO0_NAND_CS_N      , //E6 PULLUP PULLDOWN
//(* chip_pin = "A7"  *) output wire PS_MIO1_NAND_WP_N      , //A7 PULLUP
//(* chip_pin = "B8"  *) output wire PS_MIO2_NAND_ALE       , //B8 
//(* chip_pin = "D6"  *) output wire PS_MIO3_NAND_WE_N      , //D6
//(* chip_pin = "B7"  *) input  wire PS_MIO4_NAND_DQ2       , //B7
//(* chip_pin = "A6"  *) inout  wire PS_MIO5_NAND_DQ0       , //A6
//(* chip_pin = "A5"  *) inout  wire PS_MIO6_NAND_DQ1       , //A5 PULLDOWN
//(* chip_pin = "D8"  *) output wire PS_MIO7_NAND_CLE       , //D8 PULLDOWN
//(* chip_pin = "D5"  *) output wire PS_MIO8_NAND_RE_N      , //D5 PULLDOWN
//(* chip_pin = "B5"  *) inout  wire PS_MIO9_NAND_DQ4       , //B5
//(* chip_pin = "E9"  *) inout  wire PS_MIO10_NAND_DQ5      , //E9
//(* chip_pin = "C6"  *) inout  wire PS_MIO11_NAND_DQ6      , //C6
//(* chip_pin = "D9"  *) inout  wire PS_MIO12_NAND_DQ7      , //D9
//(* chip_pin = "E8"  *) inout  wire PS_MIO13_NAND_DQ3      , //E8
//(* chip_pin = "C5"  *) input  wire PS_MIO14_NAND_RB_N     , //C5 PULLUP
//(* chip_pin = "C8"  *) output wire PS_MIO15_LED_N         , //C8
    //ETHERNET - B50612
//(* chip_pin = "A19" *) output wire ETH_TX_CLK             , //A19
//(* chip_pin = "E14" *) output wire ETH_TXD0               , //E14
//(* chip_pin = "B18" *) output wire ETH_TXD1               , //B18
//(* chip_pin = "D10" *) output wire ETH_TXD2               , //D10
//(* chip_pin = "A17" *) output wire ETH_TXD3               , //A17
//(* chip_pin = "F14" *) output wire ETH_TX_CTRL            , //F14
//(* chip_pin = "B17" *) input  wire ETH_RX_CLK             , //B17
//(* chip_pin = "D11" *) input  wire ETH_RX0                , //D11
//(* chip_pin = "A16" *) input  wire ETH_RX1                , //A16
//(* chip_pin = "F15" *) input  wire ETH_RX2                , //F15
//(* chip_pin = "A15" *) input  wire ETH_RX3                , //A15
//(* chip_pin = "D13" *) input  wire ETH_RX_CTRL            , //D13
//(* chip_pin = "C10" *) output wire ETH_MDC                , //C10 PULLUP 2V5
//(* chip_pin = "C11" *) inout  wire ETH_MDIO               , //C11 PULLUP 2V5
    //MICRO SD - TXS02612RTWR, SCHA5B0200
//(* chip_pin = "D14" *) output wire PS_MIO40_CD_CLK        , //D14
//(* chip_pin = "C17" *) output wire PS_MIO41_CD_CMD        , //C17
//(* chip_pin = "E12" *) inout  wire PS_MIO42_CD_D0         , //E12
//(* chip_pin = "A9"  *) inout  wire PS_MIO42_CD_D1         , //A9
//(* chip_pin = "F13" *) inout  wire PS_MIO42_CD_D2         , //F13
//(* chip_pin = "B15" *) inout  wire PS_MIO42_CD_D3         , //B15
//(* chip_pin = "D16" *) input  wire PS_MIO46_CD_SW         , //D16
    //RAM - MT41K256M16HA-125:E - Y091K2560000
(* chip_pin = "N2"  *) inout  wire DDR3_A0                , //N2
(* chip_pin = "K2"  *) inout  wire DDR3_A1                , //K2
(* chip_pin = "M3"  *) inout  wire DDR3_A2                , //M3
(* chip_pin = "K3"  *) inout  wire DDR3_A3                , //K3
(* chip_pin = "M4"  *) inout  wire DDR3_A4                , //M4
(* chip_pin = "L1"  *) inout  wire DDR3_A5                , //L1
(* chip_pin = "L4"  *) inout  wire DDR3_A6                , //L4
(* chip_pin = "K4"  *) inout  wire DDR3_A7                , //K4
(* chip_pin = "K1"  *) inout  wire DDR3_A8                , //K1
(* chip_pin = "J4"  *) inout  wire DDR3_A9                , //J4
(* chip_pin = "F5"  *) inout  wire DDR3_A10               , //F5
(* chip_pin = "G4"  *) inout  wire DDR3_A11               , //G4
(* chip_pin = "E4"  *) inout  wire DDR3_A12               , //E4
(* chip_pin = "D4"  *) inout  wire DDR3_A13               , //D4
(* chip_pin = "F4"  *) inout  wire DDR3_A14               , //F4
(* chip_pin = "L5"  *) inout  wire DDR3_BA0               , //L5
(* chip_pin = "R4"  *) inout  wire DDR3_BA1               , //R4
(* chip_pin = "J5"  *) inout  wire DDR3_BA2               , //J5
(* chip_pin = "P5"  *) inout  wire DDR3_CAS_N             , //P5
(* chip_pin = "P4"  *) inout  wire DDR3_RAS_N             , //P4
(* chip_pin = "M5"  *) inout  wire DDR3_WE_N              , //M5
(* chip_pin = "N1"  *) inout  wire DDR3_CS_N              , //N1
(* chip_pin = "L2"  *) inout  wire DDR3_CLK_P             , //L2
(* chip_pin = "M2"  *) inout  wire DDR3_CLK_N             , //M2
(* chip_pin = "N2"  *) inout  wire DDR3_CKE               , //N2
(* chip_pin = "N5"  *) inout  wire DDR3_ODT               , //N5
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
(* chip_pin = "A1"  *) inout  wire DDR3_DM0               , //A1
(* chip_pin = "F1"  *) inout  wire DDR3_DM1               , //F1
(* chip_pin = "T1"  *) inout  wire DDR3_DM2               , //T1
(* chip_pin = "Y1"  *) inout  wire DDR3_DM3               , //Y1
(* chip_pin = "B4"  *) inout  wire DDR3_RESET_N           , //B4
    //CONNECTORS
    //J1
//(* chip_pin = "C16" *) inout  wire PS_MIO28_EN1           , //C16 - J1
(* chip_pin = "T11" *) inout  wire BANK34_L1P_PLUG1       , //T11 - J1
(* chip_pin = "T10" *) inout  wire BANK34_L1N_RST1        , //T10 - J1
(* chip_pin = "T12" *) inout  wire BANK34_L2P_TXD1        , //T12 - J1
(* chip_pin = "U12" *) inout  wire BANK34_L2N_RXD1        , //U12 - J1
    //J2
//(* chip_pin = "C13" *) inout  wire PS_MIO29_EN2           , //C13 - J2
(* chip_pin = "R19" *) inout  wire BANK34_0_PLUG2         , //R19 - J2
(* chip_pin = "V13" *) inout  wire BANK34_L3N_RST2        , //V13 - J2
(* chip_pin = "V12" *) inout  wire BANK34_L4P_TXD2        , //V12 - J2
(* chip_pin = "W13" *) inout  wire BANK34_L4N_RXD2        , //W13 - J2
    //J3
//(* chip_pin = "C15" *) inout  wire PS_MIO30_EN3           , //C15 - J3
(* chip_pin = "T14" *) inout  wire BANK34_L5P_PLUG3       , //T14 - J3
(* chip_pin = "T15" *) inout  wire BANK34_L5N_RST3        , //T15 - J3
(* chip_pin = "P14" *) inout  wire BANK34_L6P_TXD3        , //P14 - J3
(* chip_pin = "R14" *) inout  wire BANK34_L6N_RXD3        , //R14 - J3
    //J4
//(* chip_pin = "E16" *) inout  wire PS_MIO31_EN4           , //E16 - J4
(* chip_pin = "Y16" *) inout  wire BANK34_L7P_PLUG4       , //Y16 - J4
(* chip_pin = "Y17" *) inout  wire BANK34_L7N_RST4        , //Y17 - J4
(* chip_pin = "W14" *) inout  wire BANK34_L8P_TXD4        , //W14 - J4
(* chip_pin = "Y14" *) inout  wire BANK34_L8N_RXD4        , //Y14 - J4
    //J5
//(* chip_pin = "A14" *) inout  wire PS_MIO32_EN5           , //A14 - J5
(* chip_pin = "T16" *) inout  wire BANK34_L9P_PLUG5       , //T16 - J5
(* chip_pin = "U17" *) inout  wire BANK34_L9N_RST5        , //U17 - J5
(* chip_pin = "V15" *) inout  wire BANK34_L10P_TXD5       , //V15 - J5
(* chip_pin = "W15" *) inout  wire BANK34_L10N_RXD5       , //W15 - J5
    //J6
//(* chip_pin = "D15" *) inout  wire PS_MIO33_EN6           , //D15 - J6
(* chip_pin = "U14" *) inout  wire BANK34_L11P_PLUG6      , //U14 - J6
(* chip_pin = "U15" *) inout  wire BANK34_L11N_RST6       , //U15 - J6
(* chip_pin = "U18" *) inout  wire BANK34_L12P_TXD6       , //U18 - J6
(* chip_pin = "U19" *) inout  wire BANK34_L12N_RXD6       , //U19 - J6
    //J7
//(* chip_pin = "A12" *) inout  wire PS_MIO34_EN7           , //A12 - J7
(* chip_pin = "T20" *) inout  wire BANK34_L15P_PLUG7      , //T20 - J7
(* chip_pin = "U20" *) inout  wire BANK34_L15N_RST7       , //U20 - J7
(* chip_pin = "V20" *) inout  wire BANK34_L16P_TXD7       , //V20 - J7
(* chip_pin = "W20" *) inout  wire BANK34_L16N_RXD7       , //W20 - J7
    //J8
//(* chip_pin = "F12" *) inout  wire PS_MIO35_EN8           , //F12 - J8
(* chip_pin = "Y18" *) inout  wire BANK34_L17P_PLUG8      , //Y18 - J8
(* chip_pin = "Y19" *) inout  wire BANK34_L17N_RST8       , //Y19 - J8
(* chip_pin = "V16" *) inout  wire BANK34_L18P_TXD8       , //V16 - J8
(* chip_pin = "W16" *) inout  wire BANK34_L18N_RXD8       , //W16 - J8
    //J9
//(* chip_pin = "A11" *) inout  wire PS_MIO36_EN9           , //A11 - J9
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

wire [3:0] w_board_id       ;
wire       w_board_type     ;
wire [4:0] w_cpu_aclk       ;
wire [0:0] w_cpu_areset_n   ;
wire [1:0] w_sys_aclk_100mhz;
wire       w_sys_led_done   ;
wire       w_pwrgood        ;
wire       w_hard_reset_n   ;
wire [3:0] w_cpu_cfg_led    ;
wire [3:0] w_cpu_led_n      ;
wire [3:0] w_led_n          ;
wire       w_clk            ;
wire [3:0] w_cpu_cfg_J1     ;
wire [3:0] w_cpu_J1_oe_n    ;
wire [3:0] w_J1             ;
wire [3:0] w_J1_oe_n        ;
wire [3:0] w_cpu_cfg_J2     ;
wire [3:0] w_cpu_J2_oe_n    ;
wire [3:0] w_J2             ;
wire [3:0] w_J2_oe_n        ;
wire [3:0] w_cpu_cfg_J3     ;
wire [3:0] w_cpu_J3_oe_n    ;
wire [3:0] w_J3             ;
wire [3:0] w_J3_oe_n        ;
wire [3:0] w_cpu_cfg_J4     ;
wire [3:0] w_cpu_J4_oe_n    ;
wire [3:0] w_J4             ;
wire [3:0] w_J4_oe_n        ;
wire [3:0] w_cpu_cfg_J5     ;
wire [3:0] w_cpu_J5_oe_n    ;
wire [3:0] w_J5             ;
wire [3:0] w_J5_oe_n        ;
wire [3:0] w_cpu_cfg_J6     ;
wire [3:0] w_cpu_J6_oe_n    ;
wire [3:0] w_J6             ;
wire [3:0] w_J6_oe_n        ;
wire [3:0] w_cpu_cfg_J7     ;
wire [3:0] w_cpu_J7_oe_n    ;
wire [3:0] w_J7             ;
wire [3:0] w_J7_oe_n        ;
wire [3:0] w_cpu_cfg_J8     ;
wire [3:0] w_cpu_J8_oe_n    ;
wire [3:0] w_J8             ;
wire [3:0] w_J8_oe_n        ;
wire [3:0] w_cpu_cfg_J9     ;
wire [3:0] w_cpu_J9_oe_n    ;
wire [3:0] w_J9             ;
wire [3:0] w_J9_oe_n        ;
wire [1:0] w_SCL            ;
wire [1:0] w_SDA            ;
wire [1:0] w_SCL_oe_n       ;
wire [1:0] w_SDA_oe_n       ;
wire [1:0] w_SCL_pl_oe_n    ;
wire [1:0] w_SDA_pl_oe_n    ;
wire [1:0] w_SCL_ps_oe_n    ;
wire [1:0] w_SDA_ps_oe_n    ;
wire       w_fan_pwm        ;
wire [5:0] w_fan_speed      ;

wire        FIXED_IO_ddr_vrn ;
wire        FIXED_IO_ddr_vrp ;
wire [53:0] FIXED_IO_mio     ;
wire        FIXED_IO_ps_clk  ;
wire        FIXED_IO_ps_porb ;
wire        FIXED_IO_ps_srstb;

wire [31:0] io_gpio_J_tri_i    ;
wire [31:0] io_gpio_J_tri_o    ;
wire [31:0] io_gpio_J_tri_t    ;
wire [31:0] o_gpio_J_cfg_tri_o ;

wire IIC_0_scl_i;
wire IIC_0_scl_o;
wire IIC_0_scl_t;
wire IIC_0_sda_i;
wire IIC_0_sda_o;
wire IIC_0_sda_t;
wire IIC_1_scl_i;
wire IIC_1_scl_o;
wire IIC_1_scl_t;
wire IIC_1_sda_i;
wire IIC_1_sda_o;
wire IIC_1_sda_t;

wire [63:0] soc_GPIO_0_tri_i ;
wire [63:0] soc_GPIO_0_tri_o ;
wire [63:0] soc_GPIO_0_tri_t ;
wire        soc_CAN_0_rx     ;
wire        soc_CAN_0_tx     ;
wire        soc_SPI_0_io0_i  ;
wire        soc_SPI_0_io0_o  ;
wire        soc_SPI_0_io0_t  ;
wire        soc_SPI_0_io1_i  ;
wire        soc_SPI_0_io1_o  ;
wire        soc_SPI_0_io1_t  ;
wire        soc_SPI_0_sck_i  ;
wire        soc_SPI_0_sck_o  ;
wire        soc_SPI_0_sck_t  ;
wire        soc_SPI_0_ss1_o  ;
wire        soc_SPI_0_ss2_o  ;
wire        soc_SPI_0_ss_i   ;
wire        soc_SPI_0_ss_o   ;
wire        soc_SPI_0_ss_t   ;
wire        soc_uart_0_rxd   ;
wire        soc_uart_0_txd   ;
wire        soc_irq_uart_0   ;

assign w_board_id        = {
    Board_ID3,
    Board_ID2,
    Board_ID1,
    Board_ID0
};
assign w_board_type      = PUDC_B;
assign w_sys_aclk_100mhz = {
    BANK34_L13P_MRCC_100M,
    BANK35_L12P_MRCC_100M
};
assign w_pwrgood         = P_GOOD;
assign w_J1              = {
    BANK34_L1N_RST1 ,
    BANK34_L2N_RXD1 ,
    BANK34_L2P_TXD1 ,
    BANK34_L1P_PLUG1 
};
assign w_J2              = {
    BANK34_L3N_RST2 ,
    BANK34_L4N_RXD2 ,
    BANK34_L4P_TXD2 ,
    BANK34_0_PLUG2   
};
assign w_J3              = {
    BANK34_L5N_RST3 ,
    BANK34_L6N_RXD3 ,
    BANK34_L6P_TXD3 ,
    BANK34_L5P_PLUG3 
};
assign w_J4              = {
    BANK34_L7N_RST4 ,
    BANK34_L8N_RXD4 ,
    BANK34_L8P_TXD4 ,
    BANK34_L7P_PLUG4 
};
assign w_J5              = {
    BANK34_L9N_RST5 ,
    BANK34_L10N_RXD5,
    BANK34_L10P_TXD5,
    BANK34_L9P_PLUG5 
};
assign w_J6              = {
    BANK34_L11N_RST6,
    BANK34_L12N_RXD6,
    BANK34_L12P_TXD6,
    BANK34_L11P_PLUG6
};
assign w_J7              = {
    BANK34_L15N_RST7,
    BANK34_L16N_RXD7,
    BANK34_L16P_TXD7,
    BANK34_L15P_PLUG7
};
assign w_J8              = {
    BANK34_L17N_RST8,
    BANK34_L18N_RXD8,
    BANK34_L18P_TXD8,
    BANK34_L17P_PLUG8
};
assign w_J9              = {
    BANK34_L19N_RST9,
    BANK34_L20N_RXD9,
    BANK34_L20P_TXD9,
    BANK34_L19P_PLUG9
};
assign w_SCL             = {
    BANK34_L23P_SCL2,
    BANK34_L22P_SCL1
};
assign w_SDA             = {
    BANK34_L23N_SDA2,
    BANK34_L22N_SDA1
};
assign w_fan_speed       = {
    BANK35_L17N_FAN_SPEED6,
    BANK35_L17P_FAN_SPEED5,
    BANK35_L16N_FAN_SPEED4,
    BANK35_L16P_FAN_SPEED3,
    BANK35_L15N_FAN_SPEED2,
    BANK35_L15P_FAN_SPEED1
};

assign io_gpio_J_tri_i = {
    w_J9,
    w_J8,
    w_J7,
    w_J6,
    w_J5,
    w_J4,
    w_J3,
    w_J2,
    w_J1
};

assign {
    w_cpu_cfg_J9,
    w_cpu_cfg_J8,
    w_cpu_cfg_J7,
    w_cpu_cfg_J6,
    w_cpu_cfg_J5,
    w_cpu_cfg_J4,
    w_cpu_cfg_J3,
    w_cpu_cfg_J2,
    w_cpu_cfg_J1
} = o_gpio_J_cfg_tri_o;

assign {
    w_cpu_J9_oe_n,
    w_cpu_J8_oe_n,
    w_cpu_J7_oe_n,
    w_cpu_J6_oe_n,
    w_cpu_J5_oe_n,
    w_cpu_J4_oe_n,
    w_cpu_J3_oe_n,
    w_cpu_J2_oe_n,
    w_cpu_J1_oe_n
} = ({4'h0,io_gpio_J_tri_t}) ? ({4'h0,io_gpio_J_tri_o}) : ({36{1'b1}});


assign P_GOOD    = (w_hard_reset_n) ? (1'bZ) : (1'b0);
// assign DONE      = w_sys_led_done;
assign CLOCK_OUT = w_clk;

assign { 
    BANK35_L6P_LED_N,
    BANK35_L7P_LED_N,
    BANK35_L8P_LED_N,
    BANK35_L9P_LED_N 
} = (w_cpu_cfg_led) ? (w_cpu_led_n) : (w_led_n);

assign {
    BANK34_L1N_RST1 ,
    BANK34_L2N_RXD1 ,
    BANK34_L2P_TXD1 ,
    BANK34_L1P_PLUG1 
} = (w_cpu_cfg_J1) ? ((w_cpu_J1_oe_n) ? (1'bZ) : (1'b0)) : ((w_J1_oe_n) ? (1'bZ): (1'b0));

assign {
    BANK34_L3N_RST2 ,
    BANK34_L4N_RXD2 ,
    BANK34_L4P_TXD2 ,
    BANK34_0_PLUG2   
} = (w_cpu_cfg_J2) ? ((w_cpu_J2_oe_n) ? (1'bZ) : (1'b0)) : ((w_J2_oe_n) ? (1'bZ): (1'b0));

assign {
    BANK34_L5N_RST3 ,
    BANK34_L6N_RXD3 ,
    BANK34_L6P_TXD3 ,
    BANK34_L5P_PLUG3 
} = (w_cpu_cfg_J3) ? ((w_cpu_J3_oe_n) ? (1'bZ) : (1'b0)) : ((w_J3_oe_n) ? (1'bZ): (1'b0));

assign {
    BANK34_L7N_RST4 ,
    BANK34_L8N_RXD4 ,
    BANK34_L8P_TXD4 ,
    BANK34_L7P_PLUG4 
} = (w_cpu_cfg_J4) ? ((w_cpu_J4_oe_n) ? (1'bZ) : (1'b0)) : ((w_J4_oe_n) ? (1'bZ): (1'b0));

assign {
    BANK34_L9N_RST5 ,
    BANK34_L10N_RXD5,
    BANK34_L10P_TXD5,
    BANK34_L9P_PLUG5 
} = (w_cpu_cfg_J5) ? ((w_cpu_J5_oe_n) ? (1'bZ) : (1'b0)) : ((w_J5_oe_n) ? (1'bZ): (1'b0));

assign {
    BANK34_L11N_RST6,
    BANK34_L12N_RXD6,
    BANK34_L12P_TXD6,
    BANK34_L11P_PLUG6
} = (w_cpu_cfg_J6) ? ((w_cpu_J6_oe_n) ? (1'bZ) : (1'b0)) : ((w_J6_oe_n) ? (1'bZ): (1'b0));

assign {
    BANK34_L15N_RST7,
    BANK34_L16N_RXD7,
    BANK34_L16P_TXD7,
    BANK34_L15P_PLUG7
} = (w_cpu_cfg_J7) ? ((w_cpu_J7_oe_n) ? (1'bZ) : (1'b0)) : ((w_J7_oe_n) ? (1'bZ): (1'b0));

assign {
    BANK34_L17N_RST8,
    BANK34_L18N_RXD8,
    BANK34_L18P_TXD8,
    BANK34_L17P_PLUG8
} = (w_cpu_cfg_J8) ? ((w_cpu_J8_oe_n) ? (1'bZ) : (1'b0)) : ((w_J8_oe_n) ? (1'bZ): (1'b0));

assign {
    BANK34_L19N_RST9,
    BANK34_L20N_RXD9,
    BANK34_L20P_TXD9,
    BANK34_L19P_PLUG9
} = (w_cpu_cfg_J9) ? ((w_cpu_J9_oe_n) ? (1'bZ) : (1'b0)) : ((w_J9_oe_n) ? (1'bZ): (1'b0));


assign IIC_0_scl_i = BANK34_L22P_SCL1;
assign IIC_0_sda_i = BANK34_L22N_SDA1;
assign IIC_1_scl_i = BANK34_L23P_SCL2;
assign IIC_1_sda_i = BANK34_L23N_SDA2;

assign w_SCL_ps_oe_n[0] = (IIC_0_scl_t) ? (IIC_0_scl_o) : (1'b1);
assign w_SDA_ps_oe_n[0] = (IIC_0_sda_t) ? (IIC_0_sda_o) : (1'b1);
assign w_SCL_ps_oe_n[1] = (IIC_1_scl_t) ? (IIC_1_scl_o) : (1'b1);
assign w_SDA_ps_oe_n[1] = (IIC_1_sda_t) ? (IIC_1_sda_o) : (1'b1);

assign w_SCL_oe_n = w_SCL_pl_oe_n & w_SCL_ps_oe_n;
assign w_SDA_oe_n = w_SDA_pl_oe_n & w_SDA_ps_oe_n;

assign BANK34_L22P_SCL1 = (w_SCL_oe_n[0]) ? (1'bZ) : (1'b0);
assign BANK34_L22N_SDA1 = (w_SDA_oe_n[0]) ? (1'bZ) : (1'b0);
assign BANK34_L23P_SCL2 = (w_SCL_oe_n[1]) ? (1'bZ) : (1'b0);
assign BANK34_L23N_SDA2 = (w_SDA_oe_n[1]) ? (1'bZ) : (1'b0);

assign BANK35_L14P_FAN_PWM = w_fan_pwm;

wrapper_AntMiner_ControlBoard_XC7Z010_1ver0
WRAPPER_inst
(
    .soc_GPIO_0_tri_i (soc_GPIO_0_tri_i ),
    .soc_GPIO_0_tri_o (soc_GPIO_0_tri_o ),
    .soc_GPIO_0_tri_t (soc_GPIO_0_tri_t ),
    .soc_CAN_0_rx     (soc_CAN_0_rx     ),
    .soc_CAN_0_tx     (soc_CAN_0_tx     ),
    .soc_uart_0_rxd   (soc_uart_0_rxd   ),
    .soc_uart_0_txd   (soc_uart_0_txd   ),
    .soc_SPI_0_io0_i  (soc_SPI_0_io0_i  ),
    .soc_SPI_0_io0_o  (soc_SPI_0_io0_o  ),
    .soc_SPI_0_io0_t  (soc_SPI_0_io0_t  ),
    .soc_SPI_0_io1_i  (soc_SPI_0_io1_i  ),
    .soc_SPI_0_io1_o  (soc_SPI_0_io1_o  ),
    .soc_SPI_0_io1_t  (soc_SPI_0_io1_t  ),
    .soc_SPI_0_sck_i  (soc_SPI_0_sck_i  ),
    .soc_SPI_0_sck_o  (soc_SPI_0_sck_o  ),
    .soc_SPI_0_sck_t  (soc_SPI_0_sck_t  ),
    .soc_SPI_0_ss1_o  (soc_SPI_0_ss1_o  ),
    .soc_SPI_0_ss2_o  (soc_SPI_0_ss2_o  ),
    .soc_SPI_0_ss_i   (soc_SPI_0_ss_i   ),
    .soc_SPI_0_ss_o   (soc_SPI_0_ss_o   ),
    .soc_SPI_0_ss_t   (soc_SPI_0_ss_t   ),
    .i_board_id       (w_board_id       ),
    .i_board_type     (w_board_type     ),
    .i_cpu_aclk       (w_cpu_aclk       ),
    .i_sys_aclk_100mhz(w_sys_aclk_100mhz),
    .o_sys_led_done   (w_sys_led_done   ),
    .i_pwrgood        (w_pwrgood        ),
    .o_hard_reset_n   (w_hard_reset_n   ),
    .o_led_n          (w_led_n          ),
    .o_clk            (w_clk            ),
    .i_J1             (w_J1             ),
    .o_J1_oe_n        (w_J1_oe_n        ),
    .i_J2             (w_J2             ),
    .o_J2_oe_n        (w_J2_oe_n        ),
    .i_J3             (w_J3             ),
    .o_J3_oe_n        (w_J3_oe_n        ),
    .i_J4             (w_J4             ),
    .o_J4_oe_n        (w_J4_oe_n        ),
    .i_J5             (w_J5             ),
    .o_J5_oe_n        (w_J5_oe_n        ),
    .i_J6             (w_J6             ),
    .o_J6_oe_n        (w_J6_oe_n        ),
    .i_J7             (w_J7             ),
    .o_J7_oe_n        (w_J7_oe_n        ),
    .i_J8             (w_J8             ),
    .o_J8_oe_n        (w_J8_oe_n        ),
    .i_J9             (w_J9             ),
    .o_J9_oe_n        (w_J9_oe_n        ),
    .i_SCL            (w_SCL            ),
    .i_SDA            (w_SDA            ),
    .o_SCL_oe_n       (w_SCL_pl_oe_n    ),
    .o_SDA_oe_n       (w_SDA_pl_oe_n    ),
    .o_fan_pwm        (w_fan_pwm        ),
    .i_fan_speed      (w_fan_speed      ) 
);

design_antminer_s9_1ver0
SoC_inst
(
    .DDR_addr           (
        {                
            DDR3_A14,    
            DDR3_A13,    
            DDR3_A12,    
            DDR3_A11,    
            DDR3_A10,    
            DDR3_A9 ,    
            DDR3_A8 ,    
            DDR3_A7 ,    
            DDR3_A6 ,    
            DDR3_A5 ,    
            DDR3_A4 ,    
            DDR3_A3 ,    
            DDR3_A2 ,    
            DDR3_A1 ,    
            DDR3_A0      
        }               
    ),                      
    .DDR_ba             (
        {
            DDR3_BA2,
            DDR3_BA1,
            DDR3_BA0
        }
    ),
    .DDR_cas_n          (DDR3_CAS_N       ),
    .DDR_ck_n           (DDR3_CLK_N       ),
    .DDR_ck_p           (DDR3_CLK_P       ),
    .DDR_cke            (DDR3_CKE         ),
    .DDR_cs_n           (DDR3_CS_N        ),
    .DDR_dm             (
        {
            DDR3_DM3,
            DDR3_DM2,
            DDR3_DM1,
            DDR3_DM0
        }
    ),
    .DDR_dq             (
        {
            DDR3_DQ31,
            DDR3_DQ30,
            DDR3_DQ29,
            DDR3_DQ28,
            DDR3_DQ27,
            DDR3_DQ26,
            DDR3_DQ25,
            DDR3_DQ24,
            DDR3_DQ23,
            DDR3_DQ22,
            DDR3_DQ21,
            DDR3_DQ20,
            DDR3_DQ19,
            DDR3_DQ18,
            DDR3_DQ17,
            DDR3_DQ16,
            DDR3_DQ15,
            DDR3_DQ14,
            DDR3_DQ13,
            DDR3_DQ12,
            DDR3_DQ11,
            DDR3_DQ10,
            DDR3_DQ9,
            DDR3_DQ8,
            DDR3_DQ7,
            DDR3_DQ6,
            DDR3_DQ5,
            DDR3_DQ4,
            DDR3_DQ3,
            DDR3_DQ2,
            DDR3_DQ1,
            DDR3_DQ0
        }
    ),
    .DDR_dqs_n          (
        {
            DDR3_DQS3_N,
            DDR3_DQS2_N,
            DDR3_DQS1_N,
            DDR3_DQS0_N
        }
    ),
    .DDR_dqs_p          (
        {
            DDR3_DQS3_P,
            DDR3_DQS2_P,
            DDR3_DQS1_P,
            DDR3_DQS0_P
        }
    ),
    .DDR_odt            (DDR3_ODT                  ),
    .DDR_ras_n          (DDR3_RAS_N                ),
    .DDR_reset_n        (DDR3_RESET_N              ),
    .DDR_we_n           (DDR3_WE_N                 ),
    .FCLK_CLK0          (w_cpu_aclk[0]             ),
    .FCLK_CLK1          (w_cpu_aclk[1]             ),
    .FCLK_CLK2          (w_cpu_aclk[2]             ),
    .FCLK_CLK3          (w_cpu_aclk[3]             ),
    .FCLK_RESET_N       (w_cpu_areset_n[0]         ),
    .FIXED_IO_ddr_vrn   (FIXED_IO_ddr_vrn          ),
    .FIXED_IO_ddr_vrp   (FIXED_IO_ddr_vrp          ),
    .FIXED_IO_mio       (FIXED_IO_mio              ),
    .FIXED_IO_ps_clk    (FIXED_IO_ps_clk           ),
    .FIXED_IO_ps_porb   (FIXED_IO_ps_porb          ),
    .FIXED_IO_ps_srstb  (FIXED_IO_ps_srstb         ),
    .IIC_0_scl_i        (IIC_0_scl_i               ),
    .IIC_0_scl_o        (IIC_0_scl_o               ),
    .IIC_0_scl_t        (IIC_0_scl_t               ),
    .IIC_0_sda_i        (IIC_0_sda_i               ),
    .IIC_0_sda_o        (IIC_0_sda_o               ),
    .IIC_0_sda_t        (IIC_0_sda_t               ),
    .IIC_1_scl_i        (IIC_1_scl_i               ),
    .IIC_1_scl_o        (IIC_1_scl_o               ),
    .IIC_1_scl_t        (IIC_1_scl_t               ),
    .IIC_1_sda_i        (IIC_1_sda_i               ),
    .IIC_1_sda_o        (IIC_1_sda_o               ),
    .IIC_1_sda_t        (IIC_1_sda_t               ),
    .GPIO_0_tri_i       (soc_GPIO_0_tri_i          ),
    .GPIO_0_tri_o       (soc_GPIO_0_tri_o          ),
    .GPIO_0_tri_t       (soc_GPIO_0_tri_t          ),
    .CAN_0_rx           (soc_CAN_0_rx              ),
    .CAN_0_tx           (soc_CAN_0_tx              ),
    .SPI_0_io0_i        (soc_SPI_0_io0_i           ),
    .SPI_0_io0_o        (soc_SPI_0_io0_o           ),
    .SPI_0_io0_t        (soc_SPI_0_io0_t           ),
    .SPI_0_io1_i        (soc_SPI_0_io1_i           ),
    .SPI_0_io1_o        (soc_SPI_0_io1_o           ),
    .SPI_0_io1_t        (soc_SPI_0_io1_t           ),
    .SPI_0_sck_i        (soc_SPI_0_sck_i           ),
    .SPI_0_sck_o        (soc_SPI_0_sck_o           ),
    .SPI_0_sck_t        (soc_SPI_0_sck_t           ),
    .SPI_0_ss1_o        (soc_SPI_0_ss1_o           ),
    .SPI_0_ss2_o        (soc_SPI_0_ss2_o           ),
    .SPI_0_ss_i         (soc-SPI_0_ss_i            ),
    .SPI_0_ss_o         (soc_SPI_0_ss_o            ),
    .SPI_0_ss_t         (soc_SPI_0_ss_t            ),
    .uart_0_rxd         (soc_uart_0_rxd            ),
    .uart_0_txd         (soc_uart_0_txd            ),
    .irq_uart_0         (soc_irq_uart_0            ),
    .o_gpio_J_cfg_tri_o (o_gpio_J_cfg_tri_o        ),
    .io_gpio_J_tri_i    (io_gpio_J_tri_i           ),
    .io_gpio_J_tri_o    (io_gpio_J_tri_o           ),
    .io_gpio_J_tri_t    (io_gpio_J_tri_t           ),
    .o_cpu_cfg_led_tri_o(w_cpu_cfg_led             ),
    .o_cpu_led_n_tri_o  (w_cpu_led_n               ),
    .i_board_id_tri_i   (
        {
            w_board_type,
            w_board_id
        }
    )
);

endmodule
