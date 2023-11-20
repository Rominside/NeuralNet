

module Network (
    input clk,
    input start,
//------INPUTS------
    input wire signed [99:0] input_0,
    input wire signed [99:0] input_1,
    input wire signed [99:0] input_2,
    input wire signed [99:0] input_3,
    input wire signed [99:0] input_4,
    input wire signed [99:0] input_5,
    input wire signed [99:0] input_6,
    input wire signed [99:0] input_7,
    input wire signed [99:0] input_8,
//------OUTPUTS-----
    output wire signed [99:0] out_2,
    output wire end_2
);
    //------LOGICS______
    genvar i;
    //--------------------Layer_0------------------------
    wire [8:0] end_0;
    wire signed [99:0] out_0 [8:0];
    reg signed [32:0] weight_0 [8:0][8:0];

    generate
        for (i = 0; i < 9; i = i + 1) begin
            Neurone neuron_0(.clk(clk),
                      .weight_0(weight_0[i][0]), .weight_1(weight_0[i][1]), .weight_2(weight_0[i][2]), .weight_3(weight_0[i][3]), .weight_4(weight_0[i][4]),
                      .weight_5(weight_0[i][5]), .weight_6(weight_0[i][6]), .weight_7(weight_0[i][7]), .weight_8(weight_0[i][8]),

                      .input_0(input_0),  .input_1(input_1),  .input_2(input_2),  .input_3(input_3),  .input_4(input_4),
                      .input_5(input_5),  .input_6(input_6),  .input_7(input_7),  .input_8(input_8),
                      .start_(start), .out(out_0[i]), .end_(end_0));
        end
    endgenerate
    //--------------------Layer_1------------------------
    wire [8:0] end_1;
    wire signed [99:0] out_1 [8:0];
    reg signed [32:0] weight_1 [8:0][8:0];

    generate
        for (i = 0; i < 9; i = i + 1) begin
            Neurone neuron_1(.clk(clk),
                      .weight_0(weight_1[i][0]), .weight_1(weight_1[i][1]), .weight_2(weight_1[i][2]), .weight_3(weight_1[i][3]), .weight_4(weight_1[i][4]),
                      .weight_5(weight_1[i][5]), .weight_6(weight_1[i][6]), .weight_7(weight_1[i][7]), .weight_8(weight_1[i][8]),

                      .input_0(out_0[0]),  .input_1(out_0[1]),  .input_2(out_0[2]),  .input_3(out_0[3]),  .input_4(out_0[4]),
                      .input_5(out_0[5]),  .input_6(out_0[6]),  .input_7(out_0[7]),  .input_8(out_0[8]),
                      .start_(end_0), .out(out_1[i]), .end_(end_1));
        end
    endgenerate
    //--------------------Layer_2------------------------
    reg signed [32:0] weight_2 [8:0];

    Neurone neurone_2(.clk(clk),
                      .weight_0(weight_2[0]), .weight_1(weight_2[1]), .weight_2(weight_2[2]), .weight_3(weight_2[3]), .weight_4(weight_2[4]),
                      .weight_5(weight_2[5]), .weight_6(weight_2[6]), .weight_7(weight_2[7]), .weight_8(weight_2[8]),

                      .input_0(out_1[0]),  .input_1(out_1[1]),  .input_2(out_1[2]),  .input_3(out_1[3]),  .input_4(out_1[4]),
                      .input_5(out_1[5]),  .input_6(out_1[6]),  .input_7(out_1[7]),  .input_8(out_1[8]),
                      .start_(end_1), .out(out_2), .end_(end_2));

   initial begin
   //-------------WEIGHT_2-----------
        weight_2[0] = 14264025;
        weight_2[1] = 20602356;
        weight_2[2] = 62294483;
        weight_2[3] = -52745980;
        weight_2[4] = 61604893;
        weight_2[5] = -57201340;
        weight_2[6] = 27585557;
        weight_2[7] = -11946924;
        weight_2[8] = 17072096;
   //-------------WEIGHT_1_0-----------
        weight_1[0][0] = -32275876;
        weight_1[0][1] = -12062980;
        weight_1[0][2] = -43326270;
        weight_1[0][3] = 31068182;
        weight_1[0][4] = -57631090;
        weight_1[0][5] = 40135670;
        weight_1[0][6] = 3692445;
        weight_1[0][7] = -29517692;
        weight_1[0][8] = 15392154;
   //-------------WEIGHT_1_1-----------
        weight_1[1][0] = 29718474;
        weight_1[1][1] = 70831890;
        weight_1[1][2] = -67722040;
        weight_1[1][3] = 26290885;
        weight_1[1][4] = -17517610;
        weight_1[1][5] = 36172774;
        weight_1[1][6] = 28371105;
        weight_1[1][7] = 19072188;
        weight_1[1][8] = -21892619;
   //-------------WEIGHT_1_2-----------
        weight_1[2][0] =  -42887795;
		weight_1[2][1] =  48237255;
		weight_1[2][2] =  -45246680;
		weight_1[2][3] =  -27564096;
		weight_1[2][4] =  22319150;
		weight_1[2][5] =  -24925621;
		weight_1[2][6] =  -18475279;
		weight_1[2][7] =  -51304746;
		weight_1[2][8] =  -27026856;
   //-------------WEIGHT_1_3-8-----------
        weight_1[3][0] =  -9639674;
		weight_1[3][1] =  -12820534;
		weight_1[3][2] =  322473;
		weight_1[3][3] =  -52734125;
		weight_1[3][4] =  -52061220;
		weight_1[3][5] =  -26322730;
		weight_1[3][6] =  -50053300;
		weight_1[3][7] =  45850018;
		weight_1[3][8] =  9913957;
		weight_1[4][0] =  75697505;
		weight_1[4][1] =  -9596717;
		weight_1[4][2] =  -15273598;
		weight_1[4][3] =  10414126;
		weight_1[4][4] =  -37488255;
		weight_1[4][5] =  -1130938;
		weight_1[4][6] =  -5189091;
		weight_1[4][7] =  8107528;
		weight_1[4][8] =  45678002;
		weight_1[5][0] =  35574237;
		weight_1[5][1] =  -62820153;
		weight_1[5][2] =  39593485;
		weight_1[5][3] =  41596714;
		weight_1[5][4] =  -18464391;
		weight_1[5][5] =  -7349794;
		weight_1[5][6] =  45209858;
		weight_1[5][7] =  -37025860;
		weight_1[5][8] =  -48352993;
		weight_1[6][0] =  9760974;
		weight_1[6][1] =  78519475;
		weight_1[6][2] =  -16030839;
		weight_1[6][3] =  -23463795;
		weight_1[6][4] =  12710556;
		weight_1[6][5] =  18186097;
		weight_1[6][6] =  -19003719;
		weight_1[6][7] =  -40653790;
		weight_1[6][8] =  24678606;
		weight_1[7][0] =  18484290;
		weight_1[7][1] =  26689610;
		weight_1[7][2] =  51043534;
		weight_1[7][3] =  -43694296;
		weight_1[7][4] =  46502173;
		weight_1[7][5] =  18651621;
		weight_1[7][6] =  52947205;
		weight_1[7][7] =  -18759717;
		weight_1[7][8] =  5254749;
		weight_1[8][0] =  -5412975;
		weight_1[8][1] =  40497140;
		weight_1[8][2] =  12883414;
		weight_1[8][3] =  19266220;
		weight_1[8][4] =  -27910084;
		weight_1[8][5] =  6079718;
		weight_1[8][6] =  11367917;
		weight_1[8][7] =  -20752853;
		weight_1[8][8] =  21117686;
   //-------------WEIGHT_0_1-8-----------
        weight_0[0][0] =  51796937;
		weight_0[0][1] =  -40593016;
		weight_0[0][2] =  43687913;
		weight_0[0][3] =  55766463;
		weight_0[0][4] =  -8397900;
		weight_0[0][5] =  44529730;
		weight_0[0][6] =  -53606200;
		weight_0[0][7] =  23677492;
		weight_0[0][8] =  -38560940;
		weight_0[1][0] =  6820213;
		weight_0[1][1] =  12331647;
		weight_0[1][2] =  11927657;
		weight_0[1][3] =  64146614;
		weight_0[1][4] =  39352882;
		weight_0[1][5] =  -60339594;
		weight_0[1][6] =  42389870;
		weight_0[1][7] =  -17697872;
		weight_0[1][8] =  -21033227;
		weight_0[2][0] =  11847848;
		weight_0[2][1] =  -15455420;
		weight_0[2][2] =  -26243937;
		weight_0[2][3] =  17329845;
		weight_0[2][4] =  -4857534;
		weight_0[2][5] =  63234680;
		weight_0[2][6] =  -39225286;
		weight_0[2][7] =  -14701363;
		weight_0[2][8] =  32997638;
		weight_0[3][0] =  774564;
		weight_0[3][1] =  -37517750;
		weight_0[3][2] =  -50159350;
		weight_0[3][3] =  32008293;
		weight_0[3][4] =  -31702282;
		weight_0[3][5] =  -40231390;
		weight_0[3][6] =  53605320;
		weight_0[3][7] =  28414804;
		weight_0[3][8] =  -17019159;
		weight_0[4][0] =  6473134;
		weight_0[4][1] =  15294749;
		weight_0[4][2] =  -48587805;
		weight_0[4][3] =  19950338;
		weight_0[4][4] =  -13176967;
		weight_0[4][5] =  44388542;
		weight_0[4][6] =  12840790;
		weight_0[4][7] =  14723098;
		weight_0[4][8] =  -55822170;
		weight_0[5][0] =  -6606561;
		weight_0[5][1] =  -13038126;
		weight_0[5][2] =  -34240955;
		weight_0[5][3] =  19036311;
		weight_0[5][4] =  -52632910;
		weight_0[5][5] =  -36688846;
		weight_0[5][6] =  53832674;
		weight_0[5][7] =  40637308;
		weight_0[5][8] =  -45521086;
		weight_0[6][0] =  -37956023;
		weight_0[6][1] =  -45423755;
		weight_0[6][2] =  -37697947;
		weight_0[6][3] =  15335318;
		weight_0[6][4] =  61461980;
		weight_0[6][5] =  70514190;
		weight_0[6][6] =  57702935;
		weight_0[6][7] =  -48484740;
		weight_0[6][8] =  48947084;
		weight_0[7][0] =  -57441752;
		weight_0[7][1] =  8082059;
		weight_0[7][2] =  -21493924;
		weight_0[7][3] =  -8973718;
		weight_0[7][4] =  7795078;
		weight_0[7][5] =  -51064783;
		weight_0[7][6] =  -30248564;
		weight_0[7][7] =  7802988;
		weight_0[7][8] =  -15033889;
		weight_0[8][0] =  31656500;
		weight_0[8][1] =  -34782776;
		weight_0[8][2] =  -9455084;
		weight_0[8][3] =  -6624815;
		weight_0[8][4] =  -33674654;
		weight_0[8][5] =  24285741;
		weight_0[8][6] =  24040818;
		weight_0[8][7] =  11675864;
		weight_0[8][8] =  20305991;

   end

endmodule