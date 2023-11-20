`timescale 1ns / 1ps

module UART_RX#(parameter uart_rate = 115200)(
    input data,
    input clk,
    output [7:0] code,
    output reg R_O
    );

parameter	nexys_clk = 100_000_000, // clk of nexys
			period = nexys_clk / uart_rate / 2,
			bit0 = 3*period,
			bit1 = 5*period,
			bit2 = 7*period,
			bit3 = 9*period,
			bit4 = 11*period,
			bit5 = 13*period,
			bit6 = 15*period,
			bit7 = 17*period,
			stop = 19*period;

reg [$clog2(stop):0] state = 0;
reg [7:0] code_value;

assign code = code_value;

always @(posedge clk) begin
	if (state == 0) begin // the first clk 
		R_O <= 0;
		state <= state + 1;
	end
	else if (state <= period)begin // start bit
		if (~data) state <= state + 1;
	end
	else case (state)
		bit0: begin
			code_value[0] <= data;
			state <= state + 1;
		end
		bit1: begin
			code_value[1] <= data;
			state <= state + 1;
		end
		bit2: begin
			code_value[2] <= data;
			state <= state + 1;
		end
		bit3: begin
			code_value[3] <= data;
			state <= state + 1;
		end
		bit4: begin
			code_value[4] <= data;
			state <= state + 1;
		end
		bit5: begin
			code_value[5] <= data;
			state <= state + 1;
		end
		bit6: begin
			code_value[6] <= data;
			state <= state + 1;
		end
		bit7: begin
			code_value[7] <= data;
			state <= state + 1;
		end
		stop: begin
            R_O <= 1;
            state <= 0;
		end
		
		default: state <= state + 1;
	endcase
end

initial begin
    code_value = 0;
end

endmodule
