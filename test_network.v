

module test_network();
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

    Network network_1(.clk(clk),
                      .input_0(inputs[0]), .input_1(inputs[1]), .input_2(inputs[2]),
                      .input_3(inputs[3]), .input_4(inputs[4]), .input_5(inputs[5]), .input_6(inputs[6]),
                      .input_7(inputs[7]), .input_8(inputs[8]),
                      .start(start_), .out_2(out), .end_2(end_));

    initial begin
    clk = 0;
    start_ = 1;
    //-------DATA-------
    //-----------test_1------------------- res: 1
//    inputs[0] = 0;
//    inputs[1] = 2;
//    inputs[2] = 11;
//    inputs[3] = 1;
//    inputs[4] = 520;
//    inputs[5] = 0;
//    inputs[6] = 0;
//    inputs[7] = 0;
//    inputs[8] = 0;
    //-----------test_2------------------- res: 0
//    inputs[0] = 0;
//    inputs[1] = 0;
//    inputs[2] = 4;
//    inputs[3] = 1;
//    inputs[4] = 294;
//    inputs[5] = 6442;
//    inputs[6] = 0;
//    inputs[7] = 0;
//    inputs[8] = 0;
    //-----------test_3------------------- res: 0
    inputs[0] = 0;
    inputs[1] = 0;
    inputs[2] = 4;
    inputs[3] = 1;
    inputs[4] = 300;
    inputs[5] = 440;
    inputs[6] = 0;
    inputs[7] = 0;
    inputs[8] = 0;
    end

endmodule