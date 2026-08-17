module stop_check(
    input wire CLK,
    input wire RST,
    input wire stp_check_en,
    input wire sampled_bit,

    output reg stp_err
);

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        stp_err <= 1'd0;
    end
    else if(stp_check_en) begin
        if(sampled_bit != 1'b1) begin
            stp_err <= 1'd1;
        end
        else begin
            stp_err <= 1'd0;
        end
    end
    else begin
        stp_err <= 1'd0;
    end
end

endmodule