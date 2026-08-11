module serializer(
    input wire CLK, RST,
    input wire serial_en,
    input wire [7:0] P_DATA,

    output wire serial_data, serial_done
);

reg [2:0] count;

assign serial_data = P_DATA[count];

always @(posedge CLK or negedge RST) begin
    if(!RST)
        count <= 0;
    else if(serial_en) begin
        if(count < 7) begin
            count <= count + 1;
        end
    end
    else
        count <= 0;
end

assign serial_done = (count == 7)? 1 : 0;

endmodule