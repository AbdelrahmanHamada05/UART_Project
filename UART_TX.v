module UART_TX(
    input wire CLK,
    input wire RST,
    input wire PAR_EN,
    input wire PAR_TYP,
    input wire DATA_VALID,
    input wire [7:0] P_DATA,

    output reg TX_OUT,
    output wire BUSY
);

wire serial_en;
wire serial_done;
wire serial_data;
wire PAR_BIT;
wire start_bit = 1'b0;
wire stop_bit = 1'b1;

wire [1:0] MUX_sel;

serializer ser (
    .CLK(CLK),
    .RST(RST),
    .serial_en(serial_en),
    .P_DATA(P_DATA),

    .serial_done(serial_done),
    .serial_data(serial_data)
);

party_calc par (
    .CLK(CLK),
    .RST(RST),
    .P_DATA(P_DATA),
    .PAR_TYP(PAR_TYP),
    .DATA_VALID(DATA_VALID),

    .PAR_BIT(PAR_BIT)
);

FSM_block fsm (
    .CLK(CLK),
    .RST(RST),
    .serial_done(serial_done),
    .PAR_EN(PAR_EN),
    .DATA_VALID(DATA_VALID),

    .serial_en(serial_en),
    .MUX_sel(MUX_sel),
    .BUSY(BUSY)
);

always @(*) begin
    case(MUX_sel)
        2'b00:  TX_OUT = start_bit;
        2'b01:  TX_OUT = serial_data;
        2'b10:  TX_OUT = PAR_BIT;
        2'b11:  TX_OUT = stop_bit;
    endcase
end

endmodule