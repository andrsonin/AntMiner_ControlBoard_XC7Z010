`timescale 1ns / 1ps
module wrapper_AntMiner_ControlBoard_XC7Z010_1ver0
(
    //SoC
    output wire [63:0] soc_GPIO_0_tri_i ,
    input  wire [63:0] soc_GPIO_0_tri_o ,
    input  wire [63:0] soc_GPIO_0_tri_t ,
    output wire        soc_CAN_0_rx     ,
    input  wire        soc_CAN_0_tx     ,
    output wire        soc_uart_0_rxd   ,
    input  wire        soc_uart_0_txd   ,
    output wire        soc_SPI_0_io0_i  ,
    input  wire        soc_SPI_0_io0_o  ,
    input  wire        soc_SPI_0_io0_t  ,
    output wire        soc_SPI_0_io1_i  ,
    input  wire        soc_SPI_0_io1_o  ,
    input  wire        soc_SPI_0_io1_t  ,
    output wire        soc_SPI_0_sck_i  ,
    input  wire        soc_SPI_0_sck_o  ,
    input  wire        soc_SPI_0_sck_t  ,
    input  wire        soc_SPI_0_ss1_o  ,
    input  wire        soc_SPI_0_ss2_o  ,
    output wire        soc_SPI_0_ss_i   ,
    input  wire        soc_SPI_0_ss_o   ,
    input  wire        soc_SPI_0_ss_t   ,
    //BOARD
    input  wire [3:0]  i_board_id       ,
    input  wire        i_board_type     ,
    //SYSTEM
    input  wire [4:0]  i_cpu_aclk       ,
    input  wire [1:0]  i_sys_aclk_100mhz,
    output wire        o_sys_led_done   ,
    input  wire        i_pwrgood        ,
    output wire        o_hard_reset_n   ,
    output wire        o_clk            ,
    //LEDs
    output wire [3:0]  o_led_n          ,
    //CONNECTORS
    //J1
    input  wire [3:0]  i_J1             ,
    output wire [3:0]  o_J1_oe_n        ,
    //J2
    input  wire [3:0]  i_J2             ,
    output wire [3:0]  o_J2_oe_n        ,
    //J3
    input  wire [3:0]  i_J3             ,
    output wire [3:0]  o_J3_oe_n        ,
    //J4
    input  wire [3:0]  i_J4             ,
    output wire [3:0]  o_J4_oe_n        ,
    //J5
    input  wire [3:0]  i_J5             ,
    output wire [3:0]  o_J5_oe_n        ,
    //J6
    input  wire [3:0]  i_J6             ,
    output wire [3:0]  o_J6_oe_n        ,
    //J7
    input  wire [3:0]  i_J7             ,
    output wire [3:0]  o_J7_oe_n        ,
    //J8
    input  wire [3:0]  i_J8             ,
    output wire [3:0]  o_J8_oe_n        ,
    //J9
    input  wire [3:0]  i_J9             ,
    output wire [3:0]  o_J9_oe_n        ,
    //I2C
    input  wire [1:0]  i_SCL            ,
    input  wire [1:0]  i_SDA            ,
    output wire [1:0]  o_SCL_oe_n       ,
    output wire [1:0]  o_SDA_oe_n       ,
    //FAN
    output wire        o_fan_pwm        ,
    input  wire [5:0]  i_fan_speed     
);

assign o_hard_reset_n = 1'b1;
assign o_sys_led_done = 1'b1;
assign o_clk          = 1'b0;

assign o_led_n = 4'hF;

assign o_J1_oe_n = 4'hF;
assign o_J2_oe_n = 4'hF;
assign o_J3_oe_n = 4'hF;
assign o_J4_oe_n = 4'hF;
assign o_J5_oe_n = 4'hF;
assign o_J6_oe_n = 4'hF;
assign o_J7_oe_n = 4'hF;
assign o_J8_oe_n = 4'hF;
assign o_J9_oe_n = 4'hF;

assign o_SCL_oe_n = 2'b11;
assign o_SDA_oe_n = 2'b11;

assign o_fan_pwm = 1'b1;

assign soc_GPIO_0_tri_i = {64{1'b0}};
assign soc_CAN_0_rx     = 1'b0;
assign soc_SPI_0_io0_i  = 1'b0;
assign soc_SPI_0_io1_i  = 1'b0;
assign soc_SPI_0_sck_i  = 1'b0;
assign soc_SPI_0_ss_i   = 1'b0;
assign soc_uart_0_rxd   = 1'b0;

endmodule
