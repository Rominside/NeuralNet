

module Network (
    input clk,
    input [8:0] start,
//------INPUTS------
    input wire signed [26:0] input_0,
    input wire signed [26:0] input_1,
    input wire signed [26:0] input_2,
    input wire signed [26:0] input_3,
    input wire signed [26:0] input_4,
    input wire signed [26:0] input_5,
    input wire signed [26:0] input_6,
    input wire signed [26:0] input_7,
    input wire signed [26:0] input_8,
//------OUTPUTS-----
    output wire signed [26:0] out_2,
    output wire end_2
);
    //------LOGICS______
    genvar i;
    //--------------------Layer_0------------------------
    wire [8:0] end_0;
    wire signed [26:0] out_0 [8:0];
    reg signed [16:0] weight_0 [8:0][8:0];

    generate
        for (i = 0; i < 9; i = i + 1) begin
            Neurone neuron_0(.clk(clk),
                      .weight_0(weight_0[i][0]), .weight_1(weight_0[i][1]), .weight_2(weight_0[i][2]), .weight_3(weight_0[i][3]), .weight_4(weight_0[i][4]),
                      .weight_5(weight_0[i][5]), .weight_6(weight_0[i][6]), .weight_7(weight_0[i][7]), .weight_8(weight_0[i][8]),

                      .input_0(input_0),  .input_1(input_1),  .input_2(input_2),  .input_3(input_3),  .input_4(input_4),
                      .input_5(input_5),  .input_6(input_6),  .input_7(input_7),  .input_8(input_8),
                      .start_(start), .out(out_0[i]), .end_(end_0[i]));
        end
    endgenerate
    //--------------------Layer_1------------------------
    wire [8:0] end_1;
    wire signed [26:0] out_1 [8:0];
    reg signed [16:0] weight_1 [8:0][8:0];

    generate
        for (i = 0; i < 9; i = i + 1) begin
            Neurone neuron_1(.clk(clk),
                      .weight_0(weight_1[i][0]), .weight_1(weight_1[i][1]), .weight_2(weight_1[i][2]), .weight_3(weight_1[i][3]), .weight_4(weight_1[i][4]),
                      .weight_5(weight_1[i][5]), .weight_6(weight_1[i][6]), .weight_7(weight_1[i][7]), .weight_8(weight_1[i][8]),

                      .input_0(out_0[0]),  .input_1(out_0[1]),  .input_2(out_0[2]),  .input_3(out_0[3]),  .input_4(out_0[4]),
                      .input_5(out_0[5]),  .input_6(out_0[6]),  .input_7(out_0[7]),  .input_8(out_0[8]),
                      .start_(end_0), .out(out_1[i]), .end_(end_1[i]));
        end
    endgenerate
    //--------------------Layer_2------------------------
    reg signed [16:0] weight_2 [8:0];

    Neurone neurone_2(.clk(clk),
                      .weight_0(weight_2[0]), .weight_1(weight_2[1]), .weight_2(weight_2[2]), .weight_3(weight_2[3]), .weight_4(weight_2[4]),
                      .weight_5(weight_2[5]), .weight_6(weight_2[6]), .weight_7(weight_2[7]), .weight_8(weight_2[8]),

                      .input_0(out_1[0]),  .input_1(out_1[1]),  .input_2(out_1[2]),  .input_3(out_1[3]),  .input_4(out_1[4]),
                      .input_5(out_1[5]),  .input_6(out_1[6]),  .input_7(out_1[7]),  .input_8(out_1[8]),
                      .start_(end_1), .out(out_2), .end_(end_2));

   initial begin
   
   weight_0[0][0] = 5179;
weight_0[0][1] = -4060;
weight_0[0][2] = 4368;
weight_0[0][3] = 5576;
weight_0[0][4] = -840;
weight_0[0][5] = 4452;
weight_0[0][6] = -5361;
weight_0[0][7] = 2367;
weight_0[0][8] = -3857;
weight_0[1][0] = 682;
weight_0[1][1] = 1233;
weight_0[1][2] = 1192;
weight_0[1][3] = 6414;
weight_0[1][4] = 3935;
weight_0[1][5] = -6034;
weight_0[1][6] = 4238;
weight_0[1][7] = -1770;
weight_0[1][8] = -2104;
weight_0[2][0] = 1184;
weight_0[2][1] = -1546;
weight_0[2][2] = -2625;
weight_0[2][3] = 1732;
weight_0[2][4] = -486;
weight_0[2][5] = 6323;
weight_0[2][6] = -3923;
weight_0[2][7] = -1471;
weight_0[2][8] = 3299;
weight_0[3][0] = 77;
weight_0[3][1] = -3752;
weight_0[3][2] = -5016;
weight_0[3][3] = 3200;
weight_0[3][4] = -3171;
weight_0[3][5] = -4024;
weight_0[3][6] = 5360;
weight_0[3][7] = 2841;
weight_0[3][8] = -1702;
weight_0[4][0] = 647;
weight_0[4][1] = 1529;
weight_0[4][2] = -4859;
weight_0[4][3] = 1995;
weight_0[4][4] = -1318;
weight_0[4][5] = 4438;
weight_0[4][6] = 1284;
weight_0[4][7] = 1472;
weight_0[4][8] = -5583;
weight_0[5][0] = -661;
weight_0[5][1] = -1304;
weight_0[5][2] = -3425;
weight_0[5][3] = 1903;
weight_0[5][4] = -5264;
weight_0[5][5] = -3669;
weight_0[5][6] = 5383;
weight_0[5][7] = 4063;
weight_0[5][8] = -4553;
weight_0[6][0] = -3796;
weight_0[6][1] = -4543;
weight_0[6][2] = -3770;
weight_0[6][3] = 1533;
weight_0[6][4] = 6146;
weight_0[6][5] = 7051;
weight_0[6][6] = 5770;
weight_0[6][7] = -4849;
weight_0[6][8] = 4894;
weight_0[7][0] = -5745;
weight_0[7][1] = 808;
weight_0[7][2] = -2150;
weight_0[7][3] = -898;
weight_0[7][4] = 700;
weight_0[7][5] = -5107;
weight_0[7][6] = -3025;
weight_0[7][7] = 780;
weight_0[7][8] = -1504;
weight_0[8][0] = 3165;
weight_0[8][1] = -3479;
weight_0[8][2] = -946;
weight_0[8][3] = -663;
weight_0[8][4] = -3368;
weight_0[8][5] = 2428;
weight_0[8][6] = 2404;
weight_0[8][7] = 1167;
weight_0[8][8] = 2030;
weight_1[0][0] = -3228;
weight_1[0][1] = -1207;
weight_1[0][2] = -4333;
weight_1[0][3] = 3106;
weight_1[0][4] = -5764;
weight_1[0][5] = 4013;
weight_1[0][6] = 369;
weight_1[0][7] = -2952;
weight_1[0][8] = 1539;
weight_1[1][0] = 2971;
weight_1[1][1] = 7083;
weight_1[1][2] = -6773;
weight_1[1][3] = 2629;
weight_1[1][4] = -1752;
weight_1[1][5] = 3617;
weight_1[1][6] = 2837;
weight_1[1][7] = 1907;
weight_1[1][8] = -2190;
weight_1[2][0] = -4289;
weight_1[2][1] = 4823;
weight_1[2][2] = -4525;
weight_1[2][3] = -2757;
weight_1[2][4] = 2231;
weight_1[2][5] = -2493;
weight_1[2][6] = -1848;
weight_1[2][7] = -5131;
weight_1[2][8] = -2703;
weight_1[3][0] = -964;
weight_1[3][1] = -1283;
weight_1[3][2] = 32;
weight_1[3][3] = -5274;
weight_1[3][4] = -5207;
weight_1[3][5] = -2633;
weight_1[3][6] = -5006;
weight_1[3][7] = 4585;
weight_1[3][8] = 991;
weight_1[4][0] = 7569;
weight_1[4][1] = -960;
weight_1[4][2] = -1528;
weight_1[4][3] = 1041;
weight_1[4][4] = -3749;
weight_1[4][5] = -114;
weight_1[4][6] = -519;
weight_1[4][7] = 810;
weight_1[4][8] = 4567;
weight_1[5][0] = 3557;
weight_1[5][1] = -6283;
weight_1[5][2] = 3959;
weight_1[5][3] = 4159;
weight_1[5][4] = -1847;
weight_1[5][5] = -735;
weight_1[5][6] = 4520;
weight_1[5][7] = -3703;
weight_1[5][8] = -4836;
weight_1[6][0] = 976;
weight_1[6][1] = 7851;
weight_1[6][2] = -1604;
weight_1[6][3] = -2347;
weight_1[6][4] = 1271;
weight_1[6][5] = 1818;
weight_1[6][6] = -1901;
weight_1[6][7] = -4066;
weight_1[6][8] = 2467;
weight_1[7][0] = 1848;
weight_1[7][1] = 2668;
weight_1[7][2] = 5104;
weight_1[7][3] = -4370;
weight_1[7][4] = 4650;
weight_1[7][5] = 1865;
weight_1[7][6] = 5294;
weight_1[7][7] = -1876;
weight_1[7][8] = 525;
weight_1[8][0] = -542;
weight_1[8][1] = 4049;
weight_1[8][2] = 1288;
weight_1[8][3] = 1926;
weight_1[8][4] = -2792;
weight_1[8][5] = 607;
weight_1[8][6] = 1136;
weight_1[8][7] = -2076;
weight_1[8][8] = 2111;
weight_2[0] = 1426;
weight_2[1] = 2060;
weight_2[2] = 6229;
weight_2[3] = -5275;
weight_2[4] = 6160;
weight_2[5] = -5721;
weight_2[6] = 2758;
weight_2[7] = -1195;
weight_2[8] = 1707;

   end

endmodule