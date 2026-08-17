module FSM(
    input wire CLK,
    input wire RST,
    input wire RX_IN,
    input wire PAR_EN,
    input wire bit_cnt,
    input wire edge_cnt,
    input wire par_err,
    input wire stp_err,
    input wire strt_glitch,

    output reg edge_bit_en,
    output reg dat_samp_en,
    output reg dat_samp_en,
    output reg par_check_en,
    output reg stp_check_en,
    output reg strt_ckeck_en,
    output reg deser_en,
    output reg data_valid

);



endmodule