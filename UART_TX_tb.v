`timescale 1ns/1ps

module UART_TX_tb();

parameter CLK_PERIOD = 5;

reg CLK;
reg RST;
reg PAR_EN;
reg PAR_TYP;
reg DATA_VALID;
reg [7:0] P_DATA;
wire TX_OUT;
wire BUSY;



UART_TX DUT(
    .CLK(CLK),
    .RST(RST),
    .PAR_EN(PAR_EN),
    .PAR_TYP(PAR_TYP),
    .DATA_VALID(DATA_VALID),
    .P_DATA(P_DATA),
    .TX_OUT(TX_OUT),
    .BUSY(BUSY)
);

initial begin
    CLK = 0; 
end
always #2.5 CLK = ~CLK;

reg [10:0] expected_frame; // 1 start bit + 8 data bits + 1 parity bit + 1 stop bit
integer frame;
integer i;

task UART_expected_output;
input [7:0] data;
input parity_type;
input parity_enable;
reg parity;

begin
    if(parity_type) begin
        parity = ~(^data);
    end
    else begin
        parity = ^data;
    end
    expected_frame[0] = 1'b0;

    expected_frame[8:1] = data;

    if(parity_enable) begin
        expected_frame[9] = parity;
        expected_frame[10] = 1'b1;
        frame = 11;
    end
    else begin
        expected_frame[9] = 1'b1;    
        frame = 10;
    end
end
endtask


initial begin
    
    RST = 0;
    DATA_VALID = 0;
    PAR_EN = 0;
    PAR_TYP = 0;
    P_DATA = 0;

    repeat(2) #(CLK_PERIOD)
    RST = 1;

    // TEST 1
    P_DATA = 8'hA5;
    PAR_EN = 0;
    PAR_TYP = 0;

    UART_expected_output(P_DATA, PAR_TYP, PAR_EN);

    DATA_VALID = 1;
    @(posedge CLK);
    DATA_VALID = 0;

    wait(BUSY == 1);

    for(i = 0; i < frame; i = i + 1) begin
        @(negedge CLK);

        if (TX_OUT != expected_frame[i]) begin
            $display("ERROR at bit %0d: Expected=%b, Actual=%b", i, expected_frame[i], TX_OUT);
            $stop;
        end
        else begin
            $display("PASS bit %0d", i);
        end
    end

    wait(BUSY == 0);
    @(posedge CLK);

    // TEST 2
    P_DATA = 8'hF3;
    PAR_EN = 1;
    PAR_TYP = 1;

    UART_expected_output(P_DATA, PAR_TYP, PAR_EN);

    DATA_VALID = 1;
    @(posedge CLK);
    DATA_VALID = 0;

    wait(BUSY != 0);

    for(i = 0; i < frame; i = i + 1) begin
        @(negedge CLK);

        if (TX_OUT != expected_frame[i]) begin
            $display("ERROR at bit %0d: Expected=%b, Actual=%b", i, expected_frame[i], TX_OUT);
            $stop;
        end
        else begin
            $display("PASS bit %0d", i);
        end
    end

    wait(BUSY == 0);
    @(posedge CLK);

    // TEST 3
    P_DATA = 8'hBA;
    PAR_EN = 1;
    PAR_TYP = 1;

    UART_expected_output(P_DATA, PAR_TYP, PAR_EN);

    DATA_VALID = 1;
    @(posedge CLK);
    DATA_VALID = 0;

    wait(BUSY != 0);

    for(i = 0; i < frame; i = i + 1) begin
        @(negedge CLK);

        if (TX_OUT != expected_frame[i]) begin
            $display("ERROR at bit %0d: Expected=%b, Actual=%b", i, expected_frame[i], TX_OUT);
            $stop;
        end
        else begin
            $display("PASS bit %0d", i);
        end
    end

    wait(BUSY == 0);
    @(posedge CLK);

    // TEST 4
    P_DATA = 8'h13;
    PAR_EN = 1;
    PAR_TYP = 1;

    UART_expected_output(P_DATA, PAR_TYP, PAR_EN);

    DATA_VALID = 1;
    @(posedge CLK);
    DATA_VALID = 0;

    wait(BUSY != 0);

    for(i = 0; i < frame; i = i + 1) begin
        @(negedge CLK);

        if (TX_OUT != expected_frame[i]) begin
            $display("ERROR at bit %0d: Expected=%b, Actual=%b", i, expected_frame[i], TX_OUT);
            $stop;
        end
        else begin
            $display("PASS bit %0d", i);
        end
    end

    wait(BUSY == 0);
    @(posedge CLK);

    // TEST 5
    P_DATA = 8'h45;
    PAR_EN = 1;
    PAR_TYP = 1;

    UART_expected_output(P_DATA, PAR_TYP, PAR_EN);

    DATA_VALID = 1;
    @(posedge CLK);
    DATA_VALID = 0;

    wait(BUSY != 0);

    for(i = 0; i < frame; i = i + 1) begin
        @(negedge CLK);

        if (TX_OUT != expected_frame[i]) begin
            $display("ERROR at bit %0d: Expected=%b, Actual=%b", i, expected_frame[i], TX_OUT);
            $stop;
        end
        else begin
            $display("PASS bit %0d", i);
        end
    end
    #100
    $finish;
end

endmodule