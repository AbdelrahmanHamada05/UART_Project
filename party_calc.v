module party_calc(
    input wire CLK, RST,
    input wire [7:0] P_DATA,
    input wire DATA_VALID,
    input wire PAR_TYP,

    output reg PAR_BIT
);

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        PAR_BIT <= 1'b0;
    end
    else if(DATA_VALID) begin
        if(PAR_TYP) begin
            PAR_BIT <= ~(^P_DATA);
        end
        else begin
            PAR_BIT <= ^P_DATA;
        end
    end

end

endmodule