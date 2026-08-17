module deserializer(
    input wire CLK,
    input wire RST,
    input wire deser_en,
    input wire sampled_bit,

    output reg [7:0] P_DATA
);

reg [2:0] count;

always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        P_DATA <= 8'b0;
        count <= 3'b0;
    end
    else if(deser_en) begin
        P_DATA[count] <= sampled_bit;
        count <= count + 3'b1;
    end
    else begin
        count <= 3'b0;
    end
end

endmodule