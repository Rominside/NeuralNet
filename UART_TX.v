module UART_TX#(parameter uart_rate = 9600)(
    input clk,
    input start,
    input [7:0] data,
    output reg t
    );


parameter	NEXclk = 100_000_000,
			period = NEXclk / uart_rate,
			bit0 = period,
			bit1 = 2*period,
			bit2 = 3*period,
			bit3 = 4*period,
			bit4 = 5*period,
			bit5 = 6*period,
			bit6 = 7*period,
			bit7 = 8*period,
			stop = 9*period,
			ending = 10*period;

reg [$clog2(ending):0] state = 0;

always @(posedge clk) begin
	case (state)
		0: begin
			t <= 1;
			if (start) state <= 1;
		end
		1: begin
			t <= 0;
			state <= state + 1;
		end
		bit0: begin
			t <= data[0];
			state <= state + 1;
		end
		bit1: begin
			t <= data[1];
			state <= state + 1;
		end
		bit2: begin
			t <= data[2];
			state <= state + 1;
		end
		bit3: begin
			t <= data[3];
			state <= state + 1;
		end
		bit4: begin
			t <= data[4];
			state <= state + 1;
		end
		bit5: begin
			t <= data[5];
			state <= state + 1;
		end
		bit6: begin
			t <= data[6];
			state <= state + 1;
		end
		bit7: begin
			t <= data[7];
			state <= state + 1;
		end
		stop:	begin
            t <= 1;
            state <= 0;
		end
		ending: begin
		end
		default: state <= state + 1;
	endcase
end

endmodule