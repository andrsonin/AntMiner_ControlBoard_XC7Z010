module antminer_xc7z010_wrapper
(
    input  wire       led_done       ,
    input  wire [3:0] led            ,
    // -------------------------------
    input  wire [4:0] board_id       ,

    input  wire       power_good     ,

    input  wire       button_aresetn ,

    output wire       clk_out        ,
    input  wire [1:0] aclk_100mhz    ,
    input  wire       aclk_33mhz33    
);

endmodule
