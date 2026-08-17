module edge_bit_counter(
    input wire CLK,
    input wire RST,
    input wire enable,
    input wire [5:0] prescale,

    output reg [4:0] edge_cnt,
    output reg [3:0] bit_cnt
);


always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        edge_cnt <= 5'd0;
        bit_cnt <= 4'd0;
    end    
    else if(enable) begin
        if(edge_cnt == prescale - 1) begin
            edge_cnt <= 0;
            bit_cnt <= bit_cnt + 4'd1;
        end
        else begin
            edge_cnt <= edge_cnt + 5'd1;
        end
    end
    else begin
        bit_cnt <= 4'd0;
        edge_cnt <= 5'd0;
    end
end

endmodule