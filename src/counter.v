
module counter
#(
    parameter P_COUNTER_LENGTH_BIT = 4  // default == 4
) 
(
    input  wire                             param_cycle_en  ,
    input  wire                             param_direction , // 0 - minus, 1- plus

    output reg  [P_COUNTER_LENGTH_BIT -1:0] counter         ,
    output wire                             counter_full    ,
    output wire                             counter_empty   ,
    
    input  wire                             en              ,
    input  wire                             reset           ,
    input  wire                             aresetn         ,
    input  wire                             aclk             
);

initial begin
    counter = 4'd0;
end
    
assign counter_full  = (counter == {P_COUNTER_LENGTH_BIT{1'b1}}) ? (1'b1) : (1'b0);
assign counter_empty = (counter == {P_COUNTER_LENGTH_BIT{1'b0}}) ? (1'b1) : (1'b0);

always @(posedge aclk, negedge aresetn) begin :counter_inst 
    if(!aresetn)begin
        counter <= 4'h0;
    end
    else if(en)begin
        if(reset)begin
            counter <= 4'h0;
        end
        else begin
            if(param_direction) begin
                if(counter == {P_COUNTER_LENGTH_BIT{1'b1}})begin
                    if(param_cycle_en)begin
                        counter <= {P_COUNTER_LENGTH_BIT{1'b0}};
                    end
                    else begin
                        counter <= counter;
                    end
                end 
                else begin
                    counter <= counter + 4'h1;
                end
            end
            else begin
                if(counter == {P_COUNTER_LENGTH_BIT{1'b0}})begin
                    if(param_cycle_en)begin
                        counter <= {P_COUNTER_LENGTH_BIT{1'b1}};
                    end
                    else begin
                        counter <= counter;
                    end
                end 
                else begin
                    counter <= counter - 4'h1;
                end
            end
        end
    end
    else begin
        counter <= counter;
    end
end

endmodule
