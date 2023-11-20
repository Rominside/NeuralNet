

module test_neuron();
    reg clk;
    reg start_;
    reg [8:0][8:0] inputs;
    wire out;
    wire end_;

    always #10 begin
        clk = ~clk;
    end

// 0.14264025,
//        0.20602356,
//        0.62294483,
//        -0.5274598,
//        0.61604893,
//        -0.5720134,
//        0.27585557,
//        -0.11946924,
//        0.17072096

    always #20 begin
        start = 0;
    end
    // надо делать 8 параметров и каждый проверять на то, отрицательный он или нет :(
    Neuron #(.weight_1(14264025), .weight_2(20602356), .weight_3(62294483), .weight_4(-5274598),
    .weight_5(61604893), .weight_6(-5720134), .weight_7(27585557), .weight_8(-11946924), .weight_9(17072096))
    Neuron_1 (.clk(clk), .start_(start_), .inpust(inputs), .out(out), . end_( end_));

    initial begin
        clk = 0;
        start = 1;
        inputs[0] = 1;
        inputs[1] = 2;
        inputs[2] = 3;
        inputs[3] = 4;
        inputs[4] = 5;
        inputs[5] = 6;
        inputs[6] = 7;
        inputs[7] = 8;
        inputs[8] = 9;
    end

endmodule : test_neuron