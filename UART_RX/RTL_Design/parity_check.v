module parity_check(
    input wire CLK,
    input wire RST,
    input wire par_check_en,
    input wire sampled_bit,
    input wire PAR_TYP,
    input wire [7:0] P_DATA,

    output reg par_err
);

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        par_err <= 1'd0;
    end
    else if(par_check_en) begin
        calc_parity_bit <= ;

        if(sampled_bit != ((PAR_TYP)? (^P_DATA) : (~^P_DATA))) begin
            par_err <= 1'd1;
        end
        else begin
            par_err <= 1'd0;
        end
    end
    else begin
        par_err <= 1'd0;
    end
end

endmodule