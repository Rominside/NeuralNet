

module top (
//-------------INPUTS-----------
    input clk,
    input RsRx,
//-------------OUTPUTS----------
    output RsTx
);

reg [3:0] GLOBAL_STATE; // global state
reg [3:0] currect_number;
reg [3:0] LOCAL_STATE; // state for one input number
reg start_network;
wire end_network;
wire R_UART_COMPL;
reg [32:0] DataFrame [8:0]
wire [7:0] data_out; // значения, полученные из uart

always @(posedge clk) begin
    case (GLOBAL_STATE)
        0:  begin
            case (LOCAL_STATE)
                0:  begin
                    DataFrame[currect_number] = {DataFrame[currect_number][31:8], data_out};
                    LOCAL_STATE = LOCAL_STATE + 1;
                end
                1:  begin   
                    DataFrame[currect_number] = {DataFrame[currect_number][31:16], data_out, DataFrame[currect_number][7:0]};
                    LOCAL_STATE = LOCAL_STATE + 1;
                end
                2:  begin
                    DataFrame[currect_number] = {DataFrame[currect_number][31:24], data_out, DataFrame[currect_number][15:0]};
                    LOCAL_STATE = LOCAL_STATE + 1;
                end
                3:  begin
                    DataFrame[currect_number] = {data_out, DataFrame[currect_number][23:0]};
                    LOCAL_STATE = 0;
                    currect_number = currect_number + 1;
                end
            endcase
            if (currect_number == 8) begin
                    currect_number = 0;
                    GLOBAL_STATE = GLOBAL_STATE + 1;
                end
        end 
        1:  begin
            if (start_network == 0) begin
                start_network = 1;
            end
            else if (end_network == 1) begin
                GLOBAL_STATE = GLOBAL_STATE + 1;
            end
        end
        2:  begin
            flag_send = 1;
            GLOBAL_STATE = 0;
        end
    endcase
end

// Network
wire out_network;
Network network_1(.clk(clk),
                      .input_0(DataFrame[0]), .input_1(DataFrame[1]), .input_2(DataFrame[2]),
                      .input_3(DataFrame[3]), .input_4(DataFrame[4]), .input_5(DataFrame[5]), .input_6(DataFrame[6]),
                      .input_7(DataFrame[7]), .input_8(DataFrame[8]),
                      .start(start_network), .out_2(out_network), .end_2(end_network));

reg [7:0] data_send;
reg flag_send;
//UART_RX #(.uart_rate(9600))
uart_rx(.clk(clk), .data(RsRx), .R_O(R_UART_COMPL), .code(data_out));
//UART_TX #(.uart_rate(9600))
uart_tx(.clk(clk), .start(flag_send), .data(out), .t(RsTx));

initial begin
    start_network = 0;
    flag_send = 0;
end

endmodule