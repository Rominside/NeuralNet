

module top (
//-------------INPUTS-----------
    input clk,
    input UART_RXD_OUT,
//-------------OUTPUTS----------
    output UART_TXD_IN
);

reg [3:0] GLOBAL_STATE; // global state
reg [3:0] currect_number;
reg [3:0] LOCAL_STATE; // state for one input number
reg [16:0] DataFrame [8:0]

// Network
reg start_network;
wire end_network;
wire [26] out_network;
wire out_network_en;
reg out_network_en_r;

// URAT Rx and Tx
reg flag_send;
wire R_UART_COMPL;
wire [7:0] data_out; // значения, полученные из uart



always @(posedge clk) begin
    case (GLOBAL_STATE)
        0:  begin
            if (R_UART_COMPL) begin
                case (LOCAL_STATE)
                    0:  begin
                        DataFrame[currect_number] = {DataFrame[currect_number][16:4], data_out};
                        LOCAL_STATE = LOCAL_STATE + 1;
                    end
                    1:  begin   
                        DataFrame[currect_number] = {DataFrame[currect_number][16:8], data_out, DataFrame[currect_number][3:0]};
                        LOCAL_STATE = LOCAL_STATE + 1;
                    end
                    2:  begin
                        DataFrame[currect_number] = {DataFrame[currect_number][16:12], data_out, DataFrame[currect_number][7:0]};
                        LOCAL_STATE = LOCAL_STATE + 1;
                    end
                    3:  begin
                        DataFrame[currect_number] = {data_out, DataFrame[currect_number][11:0]};
                        LOCAL_STATE = 0;
                        currect_number = currect_number + 1;
                    end
                endcase
            end
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
                if (out_network > 0) begin
                    out_network_en_r = 1;
                end
                else begin
                    out_network_en_r = 0;
                end
                GLOBAL_STATE = GLOBAL_STATE + 1;
            end
        end
        2:  begin
            flag_send = 1;
            GLOBAL_STATE = 0;
        end
    endcase
end

assign out_network_en = out_network_en_r;


Network network_1(.clk(clk),
                      .input_0(DataFrame[0]), .input_1(DataFrame[1]), .input_2(DataFrame[2]),
                      .input_3(DataFrame[3]), .input_4(DataFrame[4]), .input_5(DataFrame[5]), .input_6(DataFrame[6]),
                      .input_7(DataFrame[7]), .input_8(DataFrame[8]),
                      .start(start_network), .out_2(out_network), .end_2(end_network));



uart_rx(.clk(clk), .data(UART_RXD_OUT), .R_O(R_UART_COMPL), .code(data_out));
uart_tx(.clk(clk), .start(flag_send), .data(out_network_en), .t(UART_TXD_IN));

initial begin
//--------MAIN LOGIC------
    GLOBAL_STATE = 0;
    LOCAL_STATE = 0;
    currect_number = 0;
//--------SUB LOGIC------
    start_network = 0;
    flag_send = 0;
    out_network_en = 0;
//--------DATA FRAME------
    DataFrame[0] = 0;
    DataFrame[1] = 0;
    DataFrame[2] = 0;
    DataFrame[3] = 0;
    DataFrame[4] = 0;
    DataFrame[5] = 0;
    DataFrame[6] = 0;
    DataFrame[7] = 0;
    DataFrame[8] = 0;
end

endmodule