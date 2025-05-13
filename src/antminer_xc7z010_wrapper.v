module antminer_xc7z010_wrapper
(
    input  wire [3:0] board_id    ,
    input  wire       power_good  ,
    input  wire [3:0] led         ,
    output wire       fan_pwm     ,
    input  wire [5:0] fan_speed   ,
    input  wire       tick_1s     ,
    input  wire       aresetn     ,
    output wire       clk_out     ,
    input  wire [1:0] aclk_100mhz ,
    input  wire [3:0] aclk_cpu     
);

localparam LP_COUNTER_LENGTH_BIT = 2;

wire aclk ;
wire reset;
wire en   ;

wire [(LP_COUNTER_LENGTH_BIT *2) -1:0] w_counter;

wire                             param_cycle_en  ;
wire                             param_direction ;

wire [LP_COUNTER_LENGTH_BIT -1:0] bl_counter         ;
wire                             bl_counter_full    ;
wire                             bl_counter_empty   ;
wire                             bl_en              ;

wire [LP_COUNTER_LENGTH_BIT -1:0] bh_counter         ;
wire                             bh_counter_full    ;
wire                             bh_counter_empty   ;
wire                             bh_en              ;

wire bh_en_condition     ;
wire bh_en_condition_up  ;
wire bh_en_condition_down;

assign aclk  = aclk_cpu[0];
assign reset = 1'b0;
assign en    = 1'b1;

assign fan_pwm = 1'b0      ;
assign clk_out = tick_1s   ;
assign led     = ~w_counter ;

assign w_counter = {
    bh_counter,
    bl_counter 
};

assign param_cycle_en  = 1'b1;
assign param_direction = 1'b1;

assign bl_en = tick_1s;
assign bh_en = (bh_en_condition) ? (tick_1s) : (1'b0);

assign bh_en_condition      = bh_en_condition_down || bh_en_condition_up;
assign bh_en_condition_up   = ((param_direction == 1'b1) & (bl_counter_full  == 1'b1)) ? (1'b1) : (1'b0);
assign bh_en_condition_down = ((param_direction == 1'b0) & (bl_counter_empty == 1'b1)) ? (1'b1) : (1'b0);

counter
#(
    .P_COUNTER_LENGTH_BIT (LP_COUNTER_LENGTH_BIT)
)
bl_counter_inst
(
    .param_cycle_en  (param_cycle_en    ),
    .param_direction (param_direction   ),

    .counter         (bl_counter        ),
    .counter_full    (bl_counter_full   ),
    .counter_empty   (bl_counter_empty  ),
    
    .en              (bl_en             ),
    .reset           (reset             ),
    .aresetn         (aresetn           ),
    .aclk            (aclk              ) 
);

counter
#(
    .P_COUNTER_LENGTH_BIT (LP_COUNTER_LENGTH_BIT)
)
bh_counter_inst
(
    .param_cycle_en  (param_cycle_en   ),
    .param_direction (param_direction  ),

    .counter         (bh_counter        ),
    .counter_full    (bh_counter_full   ),
    .counter_empty   (bh_counter_empty  ),
    
    .en              (bh_en             ),
    .reset           (reset             ),
    .aresetn         (aresetn           ),
    .aclk            (aclk              ) 
);

endmodule
