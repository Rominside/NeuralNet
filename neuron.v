

module Neurone(
//------INPUTS------
    input clk,
    //------------WEIGHTS------------
    input wire signed [32:0] weight_0,
    input wire signed [32:0] weight_1,
    input wire signed [32:0] weight_2,
    input wire signed [32:0] weight_3,
    input wire signed [32:0] weight_4,
    input wire signed [32:0] weight_5,
    input wire signed [32:0] weight_6,
    input wire signed [32:0] weight_7,
    input wire signed [32:0] weight_8,
    //------------INPUTS------------
    input wire signed [99:0] input_0,
    input wire signed [99:0] input_1,
    input wire signed [99:0] input_2,
    input wire signed [99:0] input_3,
    input wire signed [99:0] input_4,
    input wire signed [99:0] input_5,
    input wire signed [99:0] input_6,
    input wire signed [99:0] input_7,
    input wire signed [99:0] input_8,

    input wire start_,
//------OUTPUTS-----
    output wire signed [99:0] out,
    output wire end_

);
//------LOGICS______
    reg signed [32:0] weight_reg [8:0];
    reg signed [99:0] inputs_reg [8:0];
    reg reg_end_;
    reg signed [99:0] reg_out;
    reg [3:0] state;

    always @(posedge start_) begin
        if (state != 0) begin
            state = 0;
        end
    end

    always @(posedge clk) begin
        if (state == 0) begin
            reg_out = 0;
            reg_end_ = 0;
            weight_reg[0] = weight_0;
	        weight_reg[1] = weight_1;
	        weight_reg[2] = weight_2;
	        weight_reg[3] = weight_3;
	        weight_reg[4] = weight_4;
	        weight_reg[5] = weight_5;
	        weight_reg[6] = weight_6;
	        weight_reg[7] = weight_7;
	        weight_reg[8] = weight_8;
	        inputs_reg[0] = input_0;
	        inputs_reg[1] = input_1;
	        inputs_reg[2] = input_2;
	        inputs_reg[3] = input_3;
	        inputs_reg[4] = input_4;
	        inputs_reg[5] = input_5;
	        inputs_reg[6] = input_6;
	        inputs_reg[7] = input_7;
	        inputs_reg[8] = input_8;
            state = state + 1;
        end
        else if (state < 10) begin
            reg_out = reg_out + weight_reg[state - 1] * inputs_reg[state - 1];
            state = state + 1;
        end
        else if (state == 10) begin
            if (reg_out < 0) begin
                reg_out = 0;
            end
            reg_end_ = 1;
            state = state + 1;
        end
    end

    assign out = reg_out;
    assign end_ = reg_end_;

    initial begin
//----------WEIGHT----------
	    weight_reg[0] = weight_0;
	    weight_reg[1] = weight_1;
	    weight_reg[2] = weight_2;
	    weight_reg[3] = weight_3;
	    weight_reg[4] = weight_4;
	    weight_reg[5] = weight_5;
	    weight_reg[6] = weight_6;
	    weight_reg[7] = weight_7;
	    weight_reg[8] = weight_8;
//----------INPUTS----------
        inputs_reg[0] = input_0;
	    inputs_reg[1] = input_1;
	    inputs_reg[2] = input_2;
	    inputs_reg[3] = input_3;
	    inputs_reg[4] = input_4;
	    inputs_reg[5] = input_5;
	    inputs_reg[6] = input_6;
	    inputs_reg[7] = input_7;
	    inputs_reg[8] = input_8;

        reg_end_ = 0;
        reg_out = 0;
        state = 0;
    end

endmodule