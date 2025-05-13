
module tick_generator 
(
    output wire tick_1s ,
    input  wire aclk      //30ns
);

reg [31:00] counter;

always @(posedge aclk) begin : counter_inst
    if(counter == 'd50000000)begin
        counter <= 'd0;
    end
    else begin
        counter <= counter + 'd1;
    end
end

assign tick_1s = (counter == 'd50000000) ? (1'b1) : (1'b0);
    
endmodule
