module data_sampling(
    input wire CLK,
    input wire RST,
    input wire data_samp_en,
    input wire RX_IN,
    input wire [4:0] edge_cnt,
    input wire [5:0] prescale,

    output sampled_bit
);

reg [1:0] ones, zeros;

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        ones <= 0;
        zeros <= 0;
    end
    else if(data_samp_en) begin
        if(prescale == 6'd4) begin
            if(edge_cnt == prescale/2) begin
                if(RX_IN) begin
                    ones <= ones + 2'd1;
                end
                else begin
                    zeros <= zeros + 2'b1;
                end
            end
        end
        else if(edge_cnt == prescale/2 - 1 || edge_cnt == prescale/2 || edge_cnt == prescale/2 + 1 ) begin
            if(RX_IN) begin
                ones <= ones + 2'd1;
            end
            else begin
                zeros <= zeros + 2'b1;
            end
        end
    end
    else begin
        ones <= 0;
        zeros <= 0;
    end
end

assign sampled_bit = (ones > zeros);

endmodule