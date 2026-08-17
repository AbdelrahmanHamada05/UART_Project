module parity_check(
    input wire CLK,
    input wire RST,
    input wire strt_check_en,
    input wire sampled_bit,

    output reg strt_err
);

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        strt_err <= 1'd0;
    end
    else if(strt_check_en) begin
        if(sampled_bit != 1'b0) begin
            strt_err <= 1'd1;
        end
        else begin
            strt_err <= 1'd0;
        end
    end
    else begin
        strt_err <= 1'd0;
    end
end

endmodule