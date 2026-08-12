/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Aug 13 00:25:12 2026
/////////////////////////////////////////////////////////////


module serializer ( CLK, RST, serial_en, P_DATA, serial_data, serial_done );
  input [7:0] P_DATA;
  input CLK, RST, serial_en;
  output serial_data, serial_done;
  wire   N2, N3, N4, N18, n3, n5, n6, n7, n8, n9, n1, n2, n4, n10, n11, n12,
         n13, n14, n15;
  assign serial_done = N18;

  DFFRX1M \count_reg[2]  ( .D(n8), .CK(CLK), .RN(RST), .Q(N4), .QN(n3) );
  DFFRX1M \count_reg[1]  ( .D(n7), .CK(CLK), .RN(RST), .Q(N3), .QN(n13) );
  DFFRX1M \count_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(N2), .QN(n14) );
  INVX2M U3 ( .A(serial_en), .Y(n15) );
  OAI32X1M U4 ( .A0(n15), .A1(n6), .A2(n3), .B0(N2), .B1(n15), .Y(n9) );
  NAND2X2M U5 ( .A(N3), .B(N2), .Y(n6) );
  NOR2X2M U6 ( .A(n3), .B(n6), .Y(N18) );
  AOI21X2M U7 ( .A0(n6), .A1(n3), .B0(n15), .Y(n8) );
  AOI2B1X1M U8 ( .A1N(N18), .A0(n5), .B0(n15), .Y(n7) );
  XNOR2X2M U9 ( .A(N3), .B(N2), .Y(n5) );
  AOI22X1M U10 ( .A0(P_DATA[2]), .A1(n14), .B0(P_DATA[3]), .B1(N2), .Y(n2) );
  AOI22X1M U11 ( .A0(P_DATA[0]), .A1(n14), .B0(P_DATA[1]), .B1(N2), .Y(n1) );
  OA22X1M U12 ( .A0(n13), .A1(n2), .B0(N3), .B1(n1), .Y(n12) );
  AOI22X1M U13 ( .A0(P_DATA[6]), .A1(n14), .B0(P_DATA[7]), .B1(N2), .Y(n10) );
  AOI22X1M U14 ( .A0(P_DATA[4]), .A1(n14), .B0(P_DATA[5]), .B1(N2), .Y(n4) );
  OAI22X1M U15 ( .A0(n10), .A1(n13), .B0(N3), .B1(n4), .Y(n11) );
  OAI2BB2X1M U16 ( .B0(n12), .B1(N4), .A0N(N4), .A1N(n11), .Y(serial_data) );
endmodule


module party_calc ( CLK, RST, P_DATA, DATA_VALID, PAR_TYP, PAR_BIT );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_TYP;
  output PAR_BIT;
  wire   n1, n3, n4, n5, n6, n7, n2;

  DFFRX1M PAR_BIT_reg ( .D(n7), .CK(CLK), .RN(RST), .Q(PAR_BIT) );
  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(PAR_BIT), .A1N(n2), .Y(n7) );
  INVX2M U3 ( .A(DATA_VALID), .Y(n2) );
  XOR3XLM U4 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U5 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
  XNOR2X2M U6 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  XOR3XLM U7 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U8 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
endmodule


module FSM_block ( CLK, RST, serial_done, PAR_EN, DATA_VALID, serial_en, 
        MUX_sel, BUSY );
  output [1:0] MUX_sel;
  input CLK, RST, serial_done, PAR_EN, DATA_VALID;
  output serial_en, BUSY;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n1, n3, n4, n5, n6;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRX1M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]), .QN(n3) );
  DFFRX1M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]), .QN(n4) );
  DFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]), .QN(n1) );
  NAND2X2M U3 ( .A(n13), .B(n8), .Y(MUX_sel[0]) );
  NAND3X12M U4 ( .A(n8), .B(n9), .C(n14), .Y(BUSY) );
  OAI21X2M U5 ( .A0(n1), .A1(n3), .B0(n13), .Y(MUX_sel[1]) );
  OAI32X1M U6 ( .A0(n5), .A1(PAR_EN), .A2(n8), .B0(n3), .B1(n9), .Y(
        next_state[2]) );
  INVX2M U7 ( .A(n7), .Y(serial_en) );
  INVX2M U8 ( .A(serial_done), .Y(n5) );
  AND2X2M U9 ( .A(n9), .B(n4), .Y(n12) );
  NAND3X2M U10 ( .A(n1), .B(n3), .C(current_state[2]), .Y(n14) );
  NAND3X2M U11 ( .A(n1), .B(n4), .C(current_state[1]), .Y(n8) );
  NAND2X2M U12 ( .A(current_state[0]), .B(n4), .Y(n9) );
  AOI21X2M U13 ( .A0(n3), .A1(n1), .B0(current_state[2]), .Y(n13) );
  OAI22X1M U14 ( .A0(current_state[1]), .A1(n9), .B0(n10), .B1(n8), .Y(
        next_state[1]) );
  NOR2X2M U15 ( .A(PAR_EN), .B(n5), .Y(n10) );
  OAI31X1M U16 ( .A0(n6), .A1(n5), .A2(n7), .B0(n11), .Y(next_state[0]) );
  NAND3X2M U17 ( .A(n12), .B(n3), .C(DATA_VALID), .Y(n11) );
  INVX2M U18 ( .A(PAR_EN), .Y(n6) );
  NAND2X2M U19 ( .A(current_state[1]), .B(n12), .Y(n7) );
endmodule


module UART_TX ( CLK, RST, PAR_EN, PAR_TYP, DATA_VALID, P_DATA, TX_OUT, BUSY
 );
  input [7:0] P_DATA;
  input CLK, RST, PAR_EN, PAR_TYP, DATA_VALID;
  output TX_OUT, BUSY;
  wire   serial_en, serial_done, serial_data, PAR_BIT, n1, n2;
  wire   [1:0] MUX_sel;

  serializer ser ( .CLK(CLK), .RST(RST), .serial_en(serial_en), .P_DATA(P_DATA), .serial_data(serial_data), .serial_done(serial_done) );
  party_calc par ( .CLK(CLK), .RST(RST), .P_DATA(P_DATA), .DATA_VALID(
        DATA_VALID), .PAR_TYP(PAR_TYP), .PAR_BIT(PAR_BIT) );
  FSM_block fsm ( .CLK(CLK), .RST(RST), .serial_done(serial_done), .PAR_EN(
        PAR_EN), .DATA_VALID(DATA_VALID), .serial_en(serial_en), .MUX_sel(
        MUX_sel), .BUSY(BUSY) );
  NAND2X8M U5 ( .A(n2), .B(n1), .Y(TX_OUT) );
  CLKNAND2X2M U6 ( .A(serial_data), .B(MUX_sel[0]), .Y(n2) );
  OAI21X2M U7 ( .A0(MUX_sel[0]), .A1(PAR_BIT), .B0(MUX_sel[1]), .Y(n1) );
endmodule

