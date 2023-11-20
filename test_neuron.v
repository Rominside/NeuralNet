

module test_neuron();
    reg clk;
    reg start_;
    reg signed [99:0] inputs [8:0];
    reg signed [32:0] weight [8:0];
    wire signed [99:0] out;
    wire end_;

    always #10 begin
        clk = ~clk;
    end

    always #10 begin
        start_ = 0;
    end

    Neurone neurone_1(.clk(clk), .weight_0(weight[0]), .weight_1(weight[1]), .weight_2(weight[2]), .weight_3(weight[3]),
                      .weight_4(weight[4]), .weight_5(weight[5]), .weight_6(weight[6]), .weight_7(weight[7]),
                      .weight_8(weight[8]), .input_0(inputs[0]), .input_1(inputs[1]), .input_2(inputs[2]),
                      .input_3(inputs[3]), .input_4(inputs[4]), .input_5(inputs[5]), .input_6(inputs[6]),
                      .input_7(inputs[7]), .input_8(inputs[8]), .start_(start_), .out(out), .end_(end_));

    initial begin
        clk = 0;
        start_ = 1;
        inputs[0] = 0;
    inputs[1] = 0;
    inputs[2] = 4;
    inputs[3] = 1;
    inputs[4] = 294;
    inputs[5] = 6442;
    inputs[6] = 0;
    inputs[7] = 0;
    inputs[8] = 0;
        //------weight-----
        weight[0] =  51796937;
		weight[1] =  -40593016;
		weight[2] =  43687913;
		weight[3] =  55766463;
		weight[4] =  -8397900;
		weight[5] =  44529730;
		weight[6] =  -53606200;
		weight[7] =  23677492;
		weight[8] =  -38560940;
    end
    
endmodule