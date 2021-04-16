// trying to figure out having the image as an output
//module multCordicFunctTest4(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3);
module multCordicFunctTest7(clk, reset, lineCount, theta_i, lineResult, done);//, HEX0, HEX1);
	input clk, reset;
	input [9:0] lineCount;
	input [12:0] theta_i;
//	output [6:0] HEX0, HEX1;
	output reg done = 0;
	output reg [56:0] lineResult;
	
//	reg [6:0] h0, h1;
	
	/*module unnamed (
		input  wire [12:0] a,      //      a.a			Fraction: 10bits, width 13 bits, signed
		input  wire        areset, // areset.reset
		input  wire        clk,    //    clk.clk
		input  wire [11:0] x,      //      x.x			Fraction: 10bits, width 12 bits, signed
		output wire [9:0]  xo,     //     xo.xo		Fraction: 8bits, width 10 bits, signed
		input  wire [11:0] y,      //      y.y			Fraction: 10bits, width 12 bits, signed
		output wire [9:0]  yo      //     yo.yo		Fraction: 8bits, width 10 bits, signed
	);
	
*/

	parameter pipeOffset = 6'd19; // offset to translate origin to center of ant (47/2) will need to add in a 1'b.1 to vector
	parameter y_offset = 6'd29;
	parameter x_offset = 6'd27;
	
	
//	parameter x_i = 12'b001000000000; // d0.5 = 32
//	wire [11:0] x_i = 12'b1_1_101010_0000; // -22?
	
	
//	wire[12:0] theta_i = 13'b0_01_1001001000; // angle to rotate by (pi/2)
//	wire[12:0] theta_i = 13'b0_00_1100100100; // angle to rotate by (pi/4)
//	wire[12:0] theta_i = 13'b0_00_0000000000; // angle to rotate by (0)

	// wire [row] varname [column]
	// wire [wordWidth] varname [row][column]
	
	// input: 12'b0_0_000000_0000
	
	
	// output: 10'b0_0_000000_00
	wire [9:0] x_o, y_o;
	
//	reg [11:0] xInput [415:0];
//	reg [11:0] yInput [415:0];
	
	reg [11:0] xInput [415:0];
	reg [11:0] yInput [415:0];
	
	reg [56:0] img_rotated [56:0];
	
	reg pipeCleaner [pipeOffset:0]; // place to put the trash cordic output (is this necessary?)
	
	initial begin
	
		integer i;
		for (i=0; i < 416; i = i + 1) begin // init to 0
			xInput[i] = 12'b0_0_000000_0000;
			yInput[i] = 12'b0_0_000000_0000;
		end
		
				
// start 0
		xInput[0] = {2'b00,6'd12,4'b0};
		yInput[0] = {2'b00,6'd12,4'b0};

		xInput[1] = {2'b00,6'd12,4'b0};
		yInput[1] = {2'b00,6'd13,4'b0};

		xInput[2] = {2'b00,6'd12,4'b0};
		yInput[2] = {2'b00,6'd14,4'b0};

		xInput[3] = {2'b00,6'd12,4'b0};
		yInput[3] = {2'b00,6'd15,4'b0};

		xInput[4] = {2'b00,6'd13,4'b0};
		yInput[4] = {2'b00,6'd12,4'b0};

		xInput[5] = {2'b00,6'd13,4'b0};
		yInput[5] = {2'b00,6'd13,4'b0};

		xInput[6] = {2'b00,6'd13,4'b0};
		yInput[6] = {2'b00,6'd14,4'b0};

		xInput[7] = {2'b00,6'd13,4'b0};
		yInput[7] = {2'b00,6'd15,4'b0};

		xInput[8] = {2'b00,6'd14,4'b0};
		yInput[8] = {2'b00,6'd12,4'b0};

		xInput[9] = {2'b00,6'd14,4'b0};
		yInput[9] = {2'b00,6'd13,4'b0};

		xInput[10] = {2'b00,6'd14,4'b0};
		yInput[10] = {2'b00,6'd14,4'b0};

		xInput[11] = {2'b00,6'd14,4'b0};
		yInput[11] = {2'b00,6'd15,4'b0};

		xInput[12] = {2'b00,6'd15,4'b0};
		yInput[12] = {2'b00,6'd12,4'b0};

		xInput[13] = {2'b00,6'd15,4'b0};
		yInput[13] = {2'b00,6'd13,4'b0};

		xInput[14] = {2'b00,6'd15,4'b0};
		yInput[14] = {2'b00,6'd14,4'b0};

		xInput[15] = {2'b00,6'd15,4'b0};
		yInput[15] = {2'b00,6'd15,4'b0};

// start 1
		xInput[16] = {2'b00,6'd40,4'b0};
		yInput[16] = {2'b00,6'd12,4'b0};

		xInput[17] = {2'b00,6'd40,4'b0};
		yInput[17] = {2'b00,6'd13,4'b0};

		xInput[18] = {2'b00,6'd40,4'b0};
		yInput[18] = {2'b00,6'd14,4'b0};

		xInput[19] = {2'b00,6'd40,4'b0};
		yInput[19] = {2'b00,6'd15,4'b0};

		xInput[20] = {2'b00,6'd41,4'b0};
		yInput[20] = {2'b00,6'd12,4'b0};

		xInput[21] = {2'b00,6'd41,4'b0};
		yInput[21] = {2'b00,6'd13,4'b0};

		xInput[22] = {2'b00,6'd41,4'b0};
		yInput[22] = {2'b00,6'd14,4'b0};

		xInput[23] = {2'b00,6'd41,4'b0};
		yInput[23] = {2'b00,6'd15,4'b0};

		xInput[24] = {2'b00,6'd42,4'b0};
		yInput[24] = {2'b00,6'd12,4'b0};

		xInput[25] = {2'b00,6'd42,4'b0};
		yInput[25] = {2'b00,6'd13,4'b0};

		xInput[26] = {2'b00,6'd42,4'b0};
		yInput[26] = {2'b00,6'd14,4'b0};

		xInput[27] = {2'b00,6'd42,4'b0};
		yInput[27] = {2'b00,6'd15,4'b0};

		xInput[28] = {2'b00,6'd43,4'b0};
		yInput[28] = {2'b00,6'd12,4'b0};

		xInput[29] = {2'b00,6'd43,4'b0};
		yInput[29] = {2'b00,6'd13,4'b0};

		xInput[30] = {2'b00,6'd43,4'b0};
		yInput[30] = {2'b00,6'd14,4'b0};

		xInput[31] = {2'b00,6'd43,4'b0};
		yInput[31] = {2'b00,6'd15,4'b0};

// start 2
		xInput[32] = {2'b00,6'd16,4'b0};
		yInput[32] = {2'b00,6'd16,4'b0};

		xInput[33] = {2'b00,6'd16,4'b0};
		yInput[33] = {2'b00,6'd17,4'b0};

		xInput[34] = {2'b00,6'd16,4'b0};
		yInput[34] = {2'b00,6'd18,4'b0};

		xInput[35] = {2'b00,6'd16,4'b0};
		yInput[35] = {2'b00,6'd19,4'b0};

		xInput[36] = {2'b00,6'd17,4'b0};
		yInput[36] = {2'b00,6'd16,4'b0};

		xInput[37] = {2'b00,6'd17,4'b0};
		yInput[37] = {2'b00,6'd17,4'b0};

		xInput[38] = {2'b00,6'd17,4'b0};
		yInput[38] = {2'b00,6'd18,4'b0};

		xInput[39] = {2'b00,6'd17,4'b0};
		yInput[39] = {2'b00,6'd19,4'b0};

		xInput[40] = {2'b00,6'd18,4'b0};
		yInput[40] = {2'b00,6'd16,4'b0};

		xInput[41] = {2'b00,6'd18,4'b0};
		yInput[41] = {2'b00,6'd17,4'b0};

		xInput[42] = {2'b00,6'd18,4'b0};
		yInput[42] = {2'b00,6'd18,4'b0};

		xInput[43] = {2'b00,6'd18,4'b0};
		yInput[43] = {2'b00,6'd19,4'b0};

		xInput[44] = {2'b00,6'd19,4'b0};
		yInput[44] = {2'b00,6'd16,4'b0};

		xInput[45] = {2'b00,6'd19,4'b0};
		yInput[45] = {2'b00,6'd17,4'b0};

		xInput[46] = {2'b00,6'd19,4'b0};
		yInput[46] = {2'b00,6'd18,4'b0};

		xInput[47] = {2'b00,6'd19,4'b0};
		yInput[47] = {2'b00,6'd19,4'b0};

// start 3
		xInput[48] = {2'b00,6'd20,4'b0};
		yInput[48] = {2'b00,6'd16,4'b0};

		xInput[49] = {2'b00,6'd20,4'b0};
		yInput[49] = {2'b00,6'd17,4'b0};

		xInput[50] = {2'b00,6'd20,4'b0};
		yInput[50] = {2'b00,6'd18,4'b0};

		xInput[51] = {2'b00,6'd20,4'b0};
		yInput[51] = {2'b00,6'd19,4'b0};

		xInput[52] = {2'b00,6'd21,4'b0};
		yInput[52] = {2'b00,6'd16,4'b0};

		xInput[53] = {2'b00,6'd21,4'b0};
		yInput[53] = {2'b00,6'd17,4'b0};

		xInput[54] = {2'b00,6'd21,4'b0};
		yInput[54] = {2'b00,6'd18,4'b0};

		xInput[55] = {2'b00,6'd21,4'b0};
		yInput[55] = {2'b00,6'd19,4'b0};

		xInput[56] = {2'b00,6'd22,4'b0};
		yInput[56] = {2'b00,6'd16,4'b0};

		xInput[57] = {2'b00,6'd22,4'b0};
		yInput[57] = {2'b00,6'd17,4'b0};

		xInput[58] = {2'b00,6'd22,4'b0};
		yInput[58] = {2'b00,6'd18,4'b0};

		xInput[59] = {2'b00,6'd22,4'b0};
		yInput[59] = {2'b00,6'd19,4'b0};

		xInput[60] = {2'b00,6'd23,4'b0};
		yInput[60] = {2'b00,6'd16,4'b0};

		xInput[61] = {2'b00,6'd23,4'b0};
		yInput[61] = {2'b00,6'd17,4'b0};

		xInput[62] = {2'b00,6'd23,4'b0};
		yInput[62] = {2'b00,6'd18,4'b0};

		xInput[63] = {2'b00,6'd23,4'b0};
		yInput[63] = {2'b00,6'd19,4'b0};

// start 4
		xInput[64] = {2'b00,6'd32,4'b0};
		yInput[64] = {2'b00,6'd16,4'b0};

		xInput[65] = {2'b00,6'd32,4'b0};
		yInput[65] = {2'b00,6'd17,4'b0};

		xInput[66] = {2'b00,6'd32,4'b0};
		yInput[66] = {2'b00,6'd18,4'b0};

		xInput[67] = {2'b00,6'd32,4'b0};
		yInput[67] = {2'b00,6'd19,4'b0};

		xInput[68] = {2'b00,6'd33,4'b0};
		yInput[68] = {2'b00,6'd16,4'b0};

		xInput[69] = {2'b00,6'd33,4'b0};
		yInput[69] = {2'b00,6'd17,4'b0};

		xInput[70] = {2'b00,6'd33,4'b0};
		yInput[70] = {2'b00,6'd18,4'b0};

		xInput[71] = {2'b00,6'd33,4'b0};
		yInput[71] = {2'b00,6'd19,4'b0};

		xInput[72] = {2'b00,6'd34,4'b0};
		yInput[72] = {2'b00,6'd16,4'b0};

		xInput[73] = {2'b00,6'd34,4'b0};
		yInput[73] = {2'b00,6'd17,4'b0};

		xInput[74] = {2'b00,6'd34,4'b0};
		yInput[74] = {2'b00,6'd18,4'b0};

		xInput[75] = {2'b00,6'd34,4'b0};
		yInput[75] = {2'b00,6'd19,4'b0};

		xInput[76] = {2'b00,6'd35,4'b0};
		yInput[76] = {2'b00,6'd16,4'b0};

		xInput[77] = {2'b00,6'd35,4'b0};
		yInput[77] = {2'b00,6'd17,4'b0};

		xInput[78] = {2'b00,6'd35,4'b0};
		yInput[78] = {2'b00,6'd18,4'b0};

		xInput[79] = {2'b00,6'd35,4'b0};
		yInput[79] = {2'b00,6'd19,4'b0};

// start 5
		xInput[80] = {2'b00,6'd36,4'b0};
		yInput[80] = {2'b00,6'd16,4'b0};

		xInput[81] = {2'b00,6'd36,4'b0};
		yInput[81] = {2'b00,6'd17,4'b0};

		xInput[82] = {2'b00,6'd36,4'b0};
		yInput[82] = {2'b00,6'd18,4'b0};

		xInput[83] = {2'b00,6'd36,4'b0};
		yInput[83] = {2'b00,6'd19,4'b0};

		xInput[84] = {2'b00,6'd37,4'b0};
		yInput[84] = {2'b00,6'd16,4'b0};

		xInput[85] = {2'b00,6'd37,4'b0};
		yInput[85] = {2'b00,6'd17,4'b0};

		xInput[86] = {2'b00,6'd37,4'b0};
		yInput[86] = {2'b00,6'd18,4'b0};

		xInput[87] = {2'b00,6'd37,4'b0};
		yInput[87] = {2'b00,6'd19,4'b0};

		xInput[88] = {2'b00,6'd38,4'b0};
		yInput[88] = {2'b00,6'd16,4'b0};

		xInput[89] = {2'b00,6'd38,4'b0};
		yInput[89] = {2'b00,6'd17,4'b0};

		xInput[90] = {2'b00,6'd38,4'b0};
		yInput[90] = {2'b00,6'd18,4'b0};

		xInput[91] = {2'b00,6'd38,4'b0};
		yInput[91] = {2'b00,6'd19,4'b0};

		xInput[92] = {2'b00,6'd39,4'b0};
		yInput[92] = {2'b00,6'd16,4'b0};

		xInput[93] = {2'b00,6'd39,4'b0};
		yInput[93] = {2'b00,6'd17,4'b0};

		xInput[94] = {2'b00,6'd39,4'b0};
		yInput[94] = {2'b00,6'd18,4'b0};

		xInput[95] = {2'b00,6'd39,4'b0};
		yInput[95] = {2'b00,6'd19,4'b0};

// start 6
		xInput[96] = {2'b00,6'd20,4'b0};
		yInput[96] = {2'b00,6'd20,4'b0};

		xInput[97] = {2'b00,6'd20,4'b0};
		yInput[97] = {2'b00,6'd21,4'b0};

		xInput[98] = {2'b00,6'd20,4'b0};
		yInput[98] = {2'b00,6'd22,4'b0};

		xInput[99] = {2'b00,6'd20,4'b0};
		yInput[99] = {2'b00,6'd23,4'b0};

		xInput[100] = {2'b00,6'd21,4'b0};
		yInput[100] = {2'b00,6'd20,4'b0};

		xInput[101] = {2'b00,6'd21,4'b0};
		yInput[101] = {2'b00,6'd21,4'b0};

		xInput[102] = {2'b00,6'd21,4'b0};
		yInput[102] = {2'b00,6'd22,4'b0};

		xInput[103] = {2'b00,6'd21,4'b0};
		yInput[103] = {2'b00,6'd23,4'b0};

		xInput[104] = {2'b00,6'd22,4'b0};
		yInput[104] = {2'b00,6'd20,4'b0};

		xInput[105] = {2'b00,6'd22,4'b0};
		yInput[105] = {2'b00,6'd21,4'b0};

		xInput[106] = {2'b00,6'd22,4'b0};
		yInput[106] = {2'b00,6'd22,4'b0};

		xInput[107] = {2'b00,6'd22,4'b0};
		yInput[107] = {2'b00,6'd23,4'b0};

		xInput[108] = {2'b00,6'd23,4'b0};
		yInput[108] = {2'b00,6'd20,4'b0};

		xInput[109] = {2'b00,6'd23,4'b0};
		yInput[109] = {2'b00,6'd21,4'b0};

		xInput[110] = {2'b00,6'd23,4'b0};
		yInput[110] = {2'b00,6'd22,4'b0};

		xInput[111] = {2'b00,6'd23,4'b0};
		yInput[111] = {2'b00,6'd23,4'b0};

// start 7
		xInput[112] = {2'b00,6'd24,4'b0};
		yInput[112] = {2'b00,6'd20,4'b0};

		xInput[113] = {2'b00,6'd24,4'b0};
		yInput[113] = {2'b00,6'd21,4'b0};

		xInput[114] = {2'b00,6'd24,4'b0};
		yInput[114] = {2'b00,6'd22,4'b0};

		xInput[115] = {2'b00,6'd24,4'b0};
		yInput[115] = {2'b00,6'd23,4'b0};

		xInput[116] = {2'b00,6'd25,4'b0};
		yInput[116] = {2'b00,6'd20,4'b0};

		xInput[117] = {2'b00,6'd25,4'b0};
		yInput[117] = {2'b00,6'd21,4'b0};

		xInput[118] = {2'b00,6'd25,4'b0};
		yInput[118] = {2'b00,6'd22,4'b0};

		xInput[119] = {2'b00,6'd25,4'b0};
		yInput[119] = {2'b00,6'd23,4'b0};

		xInput[120] = {2'b00,6'd26,4'b0};
		yInput[120] = {2'b00,6'd20,4'b0};

		xInput[121] = {2'b00,6'd26,4'b0};
		yInput[121] = {2'b00,6'd21,4'b0};

		xInput[122] = {2'b00,6'd26,4'b0};
		yInput[122] = {2'b00,6'd22,4'b0};

		xInput[123] = {2'b00,6'd26,4'b0};
		yInput[123] = {2'b00,6'd23,4'b0};

		xInput[124] = {2'b00,6'd27,4'b0};
		yInput[124] = {2'b00,6'd20,4'b0};

		xInput[125] = {2'b00,6'd27,4'b0};
		yInput[125] = {2'b00,6'd21,4'b0};

		xInput[126] = {2'b00,6'd27,4'b0};
		yInput[126] = {2'b00,6'd22,4'b0};

		xInput[127] = {2'b00,6'd27,4'b0};
		yInput[127] = {2'b00,6'd23,4'b0};

// start 8
		xInput[128] = {2'b00,6'd28,4'b0};
		yInput[128] = {2'b00,6'd20,4'b0};

		xInput[129] = {2'b00,6'd28,4'b0};
		yInput[129] = {2'b00,6'd21,4'b0};

		xInput[130] = {2'b00,6'd28,4'b0};
		yInput[130] = {2'b00,6'd22,4'b0};

		xInput[131] = {2'b00,6'd28,4'b0};
		yInput[131] = {2'b00,6'd23,4'b0};

		xInput[132] = {2'b00,6'd29,4'b0};
		yInput[132] = {2'b00,6'd20,4'b0};

		xInput[133] = {2'b00,6'd29,4'b0};
		yInput[133] = {2'b00,6'd21,4'b0};

		xInput[134] = {2'b00,6'd29,4'b0};
		yInput[134] = {2'b00,6'd22,4'b0};

		xInput[135] = {2'b00,6'd29,4'b0};
		yInput[135] = {2'b00,6'd23,4'b0};

		xInput[136] = {2'b00,6'd30,4'b0};
		yInput[136] = {2'b00,6'd20,4'b0};

		xInput[137] = {2'b00,6'd30,4'b0};
		yInput[137] = {2'b00,6'd21,4'b0};

		xInput[138] = {2'b00,6'd30,4'b0};
		yInput[138] = {2'b00,6'd22,4'b0};

		xInput[139] = {2'b00,6'd30,4'b0};
		yInput[139] = {2'b00,6'd23,4'b0};

		xInput[140] = {2'b00,6'd31,4'b0};
		yInput[140] = {2'b00,6'd20,4'b0};

		xInput[141] = {2'b00,6'd31,4'b0};
		yInput[141] = {2'b00,6'd21,4'b0};

		xInput[142] = {2'b00,6'd31,4'b0};
		yInput[142] = {2'b00,6'd22,4'b0};

		xInput[143] = {2'b00,6'd31,4'b0};
		yInput[143] = {2'b00,6'd23,4'b0};

// start 9
		xInput[144] = {2'b00,6'd32,4'b0};
		yInput[144] = {2'b00,6'd20,4'b0};

		xInput[145] = {2'b00,6'd32,4'b0};
		yInput[145] = {2'b00,6'd21,4'b0};

		xInput[146] = {2'b00,6'd32,4'b0};
		yInput[146] = {2'b00,6'd22,4'b0};

		xInput[147] = {2'b00,6'd32,4'b0};
		yInput[147] = {2'b00,6'd23,4'b0};

		xInput[148] = {2'b00,6'd33,4'b0};
		yInput[148] = {2'b00,6'd20,4'b0};

		xInput[149] = {2'b00,6'd33,4'b0};
		yInput[149] = {2'b00,6'd21,4'b0};

		xInput[150] = {2'b00,6'd33,4'b0};
		yInput[150] = {2'b00,6'd22,4'b0};

		xInput[151] = {2'b00,6'd33,4'b0};
		yInput[151] = {2'b00,6'd23,4'b0};

		xInput[152] = {2'b00,6'd34,4'b0};
		yInput[152] = {2'b00,6'd20,4'b0};

		xInput[153] = {2'b00,6'd34,4'b0};
		yInput[153] = {2'b00,6'd21,4'b0};

		xInput[154] = {2'b00,6'd34,4'b0};
		yInput[154] = {2'b00,6'd22,4'b0};

		xInput[155] = {2'b00,6'd34,4'b0};
		yInput[155] = {2'b00,6'd23,4'b0};

		xInput[156] = {2'b00,6'd35,4'b0};
		yInput[156] = {2'b00,6'd20,4'b0};

		xInput[157] = {2'b00,6'd35,4'b0};
		yInput[157] = {2'b00,6'd21,4'b0};

		xInput[158] = {2'b00,6'd35,4'b0};
		yInput[158] = {2'b00,6'd22,4'b0};

		xInput[159] = {2'b00,6'd35,4'b0};
		yInput[159] = {2'b00,6'd23,4'b0};

// start 10
		xInput[160] = {2'b00,6'd16,4'b0};
		yInput[160] = {2'b00,6'd24,4'b0};

		xInput[161] = {2'b00,6'd16,4'b0};
		yInput[161] = {2'b00,6'd25,4'b0};

		xInput[162] = {2'b00,6'd16,4'b0};
		yInput[162] = {2'b00,6'd26,4'b0};

		xInput[163] = {2'b00,6'd16,4'b0};
		yInput[163] = {2'b00,6'd27,4'b0};

		xInput[164] = {2'b00,6'd17,4'b0};
		yInput[164] = {2'b00,6'd24,4'b0};

		xInput[165] = {2'b00,6'd17,4'b0};
		yInput[165] = {2'b00,6'd25,4'b0};

		xInput[166] = {2'b00,6'd17,4'b0};
		yInput[166] = {2'b00,6'd26,4'b0};

		xInput[167] = {2'b00,6'd17,4'b0};
		yInput[167] = {2'b00,6'd27,4'b0};

		xInput[168] = {2'b00,6'd18,4'b0};
		yInput[168] = {2'b00,6'd24,4'b0};

		xInput[169] = {2'b00,6'd18,4'b0};
		yInput[169] = {2'b00,6'd25,4'b0};

		xInput[170] = {2'b00,6'd18,4'b0};
		yInput[170] = {2'b00,6'd26,4'b0};

		xInput[171] = {2'b00,6'd18,4'b0};
		yInput[171] = {2'b00,6'd27,4'b0};

		xInput[172] = {2'b00,6'd19,4'b0};
		yInput[172] = {2'b00,6'd24,4'b0};

		xInput[173] = {2'b00,6'd19,4'b0};
		yInput[173] = {2'b00,6'd25,4'b0};

		xInput[174] = {2'b00,6'd19,4'b0};
		yInput[174] = {2'b00,6'd26,4'b0};

		xInput[175] = {2'b00,6'd19,4'b0};
		yInput[175] = {2'b00,6'd27,4'b0};

// start 11
		xInput[176] = {2'b00,6'd20,4'b0};
		yInput[176] = {2'b00,6'd24,4'b0};

		xInput[177] = {2'b00,6'd20,4'b0};
		yInput[177] = {2'b00,6'd25,4'b0};

		xInput[178] = {2'b00,6'd20,4'b0};
		yInput[178] = {2'b00,6'd26,4'b0};

		xInput[179] = {2'b00,6'd20,4'b0};
		yInput[179] = {2'b00,6'd27,4'b0};

		xInput[180] = {2'b00,6'd21,4'b0};
		yInput[180] = {2'b00,6'd24,4'b0};

		xInput[181] = {2'b00,6'd21,4'b0};
		yInput[181] = {2'b00,6'd25,4'b0};

		xInput[182] = {2'b00,6'd21,4'b0};
		yInput[182] = {2'b00,6'd26,4'b0};

		xInput[183] = {2'b00,6'd21,4'b0};
		yInput[183] = {2'b00,6'd27,4'b0};

		xInput[184] = {2'b00,6'd22,4'b0};
		yInput[184] = {2'b00,6'd24,4'b0};

		xInput[185] = {2'b00,6'd22,4'b0};
		yInput[185] = {2'b00,6'd25,4'b0};

		xInput[186] = {2'b00,6'd22,4'b0};
		yInput[186] = {2'b00,6'd26,4'b0};

		xInput[187] = {2'b00,6'd22,4'b0};
		yInput[187] = {2'b00,6'd27,4'b0};

		xInput[188] = {2'b00,6'd23,4'b0};
		yInput[188] = {2'b00,6'd24,4'b0};

		xInput[189] = {2'b00,6'd23,4'b0};
		yInput[189] = {2'b00,6'd25,4'b0};

		xInput[190] = {2'b00,6'd23,4'b0};
		yInput[190] = {2'b00,6'd26,4'b0};

		xInput[191] = {2'b00,6'd23,4'b0};
		yInput[191] = {2'b00,6'd27,4'b0};

// start 12
		xInput[192] = {2'b00,6'd32,4'b0};
		yInput[192] = {2'b00,6'd24,4'b0};

		xInput[193] = {2'b00,6'd32,4'b0};
		yInput[193] = {2'b00,6'd25,4'b0};

		xInput[194] = {2'b00,6'd32,4'b0};
		yInput[194] = {2'b00,6'd26,4'b0};

		xInput[195] = {2'b00,6'd32,4'b0};
		yInput[195] = {2'b00,6'd27,4'b0};

		xInput[196] = {2'b00,6'd33,4'b0};
		yInput[196] = {2'b00,6'd24,4'b0};

		xInput[197] = {2'b00,6'd33,4'b0};
		yInput[197] = {2'b00,6'd25,4'b0};

		xInput[198] = {2'b00,6'd33,4'b0};
		yInput[198] = {2'b00,6'd26,4'b0};

		xInput[199] = {2'b00,6'd33,4'b0};
		yInput[199] = {2'b00,6'd27,4'b0};

		xInput[200] = {2'b00,6'd34,4'b0};
		yInput[200] = {2'b00,6'd24,4'b0};

		xInput[201] = {2'b00,6'd34,4'b0};
		yInput[201] = {2'b00,6'd25,4'b0};

		xInput[202] = {2'b00,6'd34,4'b0};
		yInput[202] = {2'b00,6'd26,4'b0};

		xInput[203] = {2'b00,6'd34,4'b0};
		yInput[203] = {2'b00,6'd27,4'b0};

		xInput[204] = {2'b00,6'd35,4'b0};
		yInput[204] = {2'b00,6'd24,4'b0};

		xInput[205] = {2'b00,6'd35,4'b0};
		yInput[205] = {2'b00,6'd25,4'b0};

		xInput[206] = {2'b00,6'd35,4'b0};
		yInput[206] = {2'b00,6'd26,4'b0};

		xInput[207] = {2'b00,6'd35,4'b0};
		yInput[207] = {2'b00,6'd27,4'b0};

// start 13
		xInput[208] = {2'b00,6'd36,4'b0};
		yInput[208] = {2'b00,6'd24,4'b0};

		xInput[209] = {2'b00,6'd36,4'b0};
		yInput[209] = {2'b00,6'd25,4'b0};

		xInput[210] = {2'b00,6'd36,4'b0};
		yInput[210] = {2'b00,6'd26,4'b0};

		xInput[211] = {2'b00,6'd36,4'b0};
		yInput[211] = {2'b00,6'd27,4'b0};

		xInput[212] = {2'b00,6'd37,4'b0};
		yInput[212] = {2'b00,6'd24,4'b0};

		xInput[213] = {2'b00,6'd37,4'b0};
		yInput[213] = {2'b00,6'd25,4'b0};

		xInput[214] = {2'b00,6'd37,4'b0};
		yInput[214] = {2'b00,6'd26,4'b0};

		xInput[215] = {2'b00,6'd37,4'b0};
		yInput[215] = {2'b00,6'd27,4'b0};

		xInput[216] = {2'b00,6'd38,4'b0};
		yInput[216] = {2'b00,6'd24,4'b0};

		xInput[217] = {2'b00,6'd38,4'b0};
		yInput[217] = {2'b00,6'd25,4'b0};

		xInput[218] = {2'b00,6'd38,4'b0};
		yInput[218] = {2'b00,6'd26,4'b0};

		xInput[219] = {2'b00,6'd38,4'b0};
		yInput[219] = {2'b00,6'd27,4'b0};

		xInput[220] = {2'b00,6'd39,4'b0};
		yInput[220] = {2'b00,6'd24,4'b0};

		xInput[221] = {2'b00,6'd39,4'b0};
		yInput[221] = {2'b00,6'd25,4'b0};

		xInput[222] = {2'b00,6'd39,4'b0};
		yInput[222] = {2'b00,6'd26,4'b0};

		xInput[223] = {2'b00,6'd39,4'b0};
		yInput[223] = {2'b00,6'd27,4'b0};

// start 14
		xInput[224] = {2'b00,6'd20,4'b0};
		yInput[224] = {2'b00,6'd28,4'b0};

		xInput[225] = {2'b00,6'd20,4'b0};
		yInput[225] = {2'b00,6'd29,4'b0};

		xInput[226] = {2'b00,6'd20,4'b0};
		yInput[226] = {2'b00,6'd30,4'b0};

		xInput[227] = {2'b00,6'd20,4'b0};
		yInput[227] = {2'b00,6'd31,4'b0};

		xInput[228] = {2'b00,6'd21,4'b0};
		yInput[228] = {2'b00,6'd28,4'b0};

		xInput[229] = {2'b00,6'd21,4'b0};
		yInput[229] = {2'b00,6'd29,4'b0};

		xInput[230] = {2'b00,6'd21,4'b0};
		yInput[230] = {2'b00,6'd30,4'b0};

		xInput[231] = {2'b00,6'd21,4'b0};
		yInput[231] = {2'b00,6'd31,4'b0};

		xInput[232] = {2'b00,6'd22,4'b0};
		yInput[232] = {2'b00,6'd28,4'b0};

		xInput[233] = {2'b00,6'd22,4'b0};
		yInput[233] = {2'b00,6'd29,4'b0};

		xInput[234] = {2'b00,6'd22,4'b0};
		yInput[234] = {2'b00,6'd30,4'b0};

		xInput[235] = {2'b00,6'd22,4'b0};
		yInput[235] = {2'b00,6'd31,4'b0};

		xInput[236] = {2'b00,6'd23,4'b0};
		yInput[236] = {2'b00,6'd28,4'b0};

		xInput[237] = {2'b00,6'd23,4'b0};
		yInput[237] = {2'b00,6'd29,4'b0};

		xInput[238] = {2'b00,6'd23,4'b0};
		yInput[238] = {2'b00,6'd30,4'b0};

		xInput[239] = {2'b00,6'd23,4'b0};
		yInput[239] = {2'b00,6'd31,4'b0};

// start 15
		xInput[240] = {2'b00,6'd32,4'b0};
		yInput[240] = {2'b00,6'd28,4'b0};

		xInput[241] = {2'b00,6'd32,4'b0};
		yInput[241] = {2'b00,6'd29,4'b0};

		xInput[242] = {2'b00,6'd32,4'b0};
		yInput[242] = {2'b00,6'd30,4'b0};

		xInput[243] = {2'b00,6'd32,4'b0};
		yInput[243] = {2'b00,6'd31,4'b0};

		xInput[244] = {2'b00,6'd33,4'b0};
		yInput[244] = {2'b00,6'd28,4'b0};

		xInput[245] = {2'b00,6'd33,4'b0};
		yInput[245] = {2'b00,6'd29,4'b0};

		xInput[246] = {2'b00,6'd33,4'b0};
		yInput[246] = {2'b00,6'd30,4'b0};

		xInput[247] = {2'b00,6'd33,4'b0};
		yInput[247] = {2'b00,6'd31,4'b0};

		xInput[248] = {2'b00,6'd34,4'b0};
		yInput[248] = {2'b00,6'd28,4'b0};

		xInput[249] = {2'b00,6'd34,4'b0};
		yInput[249] = {2'b00,6'd29,4'b0};

		xInput[250] = {2'b00,6'd34,4'b0};
		yInput[250] = {2'b00,6'd30,4'b0};

		xInput[251] = {2'b00,6'd34,4'b0};
		yInput[251] = {2'b00,6'd31,4'b0};

		xInput[252] = {2'b00,6'd35,4'b0};
		yInput[252] = {2'b00,6'd28,4'b0};

		xInput[253] = {2'b00,6'd35,4'b0};
		yInput[253] = {2'b00,6'd29,4'b0};

		xInput[254] = {2'b00,6'd35,4'b0};
		yInput[254] = {2'b00,6'd30,4'b0};

		xInput[255] = {2'b00,6'd35,4'b0};
		yInput[255] = {2'b00,6'd31,4'b0};

// start 16
		xInput[256] = {2'b00,6'd16,4'b0};
		yInput[256] = {2'b00,6'd32,4'b0};

		xInput[257] = {2'b00,6'd16,4'b0};
		yInput[257] = {2'b00,6'd33,4'b0};

		xInput[258] = {2'b00,6'd16,4'b0};
		yInput[258] = {2'b00,6'd34,4'b0};

		xInput[259] = {2'b00,6'd16,4'b0};
		yInput[259] = {2'b00,6'd35,4'b0};

		xInput[260] = {2'b00,6'd17,4'b0};
		yInput[260] = {2'b00,6'd32,4'b0};

		xInput[261] = {2'b00,6'd17,4'b0};
		yInput[261] = {2'b00,6'd33,4'b0};

		xInput[262] = {2'b00,6'd17,4'b0};
		yInput[262] = {2'b00,6'd34,4'b0};

		xInput[263] = {2'b00,6'd17,4'b0};
		yInput[263] = {2'b00,6'd35,4'b0};

		xInput[264] = {2'b00,6'd18,4'b0};
		yInput[264] = {2'b00,6'd32,4'b0};

		xInput[265] = {2'b00,6'd18,4'b0};
		yInput[265] = {2'b00,6'd33,4'b0};

		xInput[266] = {2'b00,6'd18,4'b0};
		yInput[266] = {2'b00,6'd34,4'b0};

		xInput[267] = {2'b00,6'd18,4'b0};
		yInput[267] = {2'b00,6'd35,4'b0};

		xInput[268] = {2'b00,6'd19,4'b0};
		yInput[268] = {2'b00,6'd32,4'b0};

		xInput[269] = {2'b00,6'd19,4'b0};
		yInput[269] = {2'b00,6'd33,4'b0};

		xInput[270] = {2'b00,6'd19,4'b0};
		yInput[270] = {2'b00,6'd34,4'b0};

		xInput[271] = {2'b00,6'd19,4'b0};
		yInput[271] = {2'b00,6'd35,4'b0};

// start 17
		xInput[272] = {2'b00,6'd20,4'b0};
		yInput[272] = {2'b00,6'd32,4'b0};

		xInput[273] = {2'b00,6'd20,4'b0};
		yInput[273] = {2'b00,6'd33,4'b0};

		xInput[274] = {2'b00,6'd20,4'b0};
		yInput[274] = {2'b00,6'd34,4'b0};

		xInput[275] = {2'b00,6'd20,4'b0};
		yInput[275] = {2'b00,6'd35,4'b0};

		xInput[276] = {2'b00,6'd21,4'b0};
		yInput[276] = {2'b00,6'd32,4'b0};

		xInput[277] = {2'b00,6'd21,4'b0};
		yInput[277] = {2'b00,6'd33,4'b0};

		xInput[278] = {2'b00,6'd21,4'b0};
		yInput[278] = {2'b00,6'd34,4'b0};

		xInput[279] = {2'b00,6'd21,4'b0};
		yInput[279] = {2'b00,6'd35,4'b0};

		xInput[280] = {2'b00,6'd22,4'b0};
		yInput[280] = {2'b00,6'd32,4'b0};

		xInput[281] = {2'b00,6'd22,4'b0};
		yInput[281] = {2'b00,6'd33,4'b0};

		xInput[282] = {2'b00,6'd22,4'b0};
		yInput[282] = {2'b00,6'd34,4'b0};

		xInput[283] = {2'b00,6'd22,4'b0};
		yInput[283] = {2'b00,6'd35,4'b0};

		xInput[284] = {2'b00,6'd23,4'b0};
		yInput[284] = {2'b00,6'd32,4'b0};

		xInput[285] = {2'b00,6'd23,4'b0};
		yInput[285] = {2'b00,6'd33,4'b0};

		xInput[286] = {2'b00,6'd23,4'b0};
		yInput[286] = {2'b00,6'd34,4'b0};

		xInput[287] = {2'b00,6'd23,4'b0};
		yInput[287] = {2'b00,6'd35,4'b0};

// start 18
		xInput[288] = {2'b00,6'd32,4'b0};
		yInput[288] = {2'b00,6'd32,4'b0};

		xInput[289] = {2'b00,6'd32,4'b0};
		yInput[289] = {2'b00,6'd33,4'b0};

		xInput[290] = {2'b00,6'd32,4'b0};
		yInput[290] = {2'b00,6'd34,4'b0};

		xInput[291] = {2'b00,6'd32,4'b0};
		yInput[291] = {2'b00,6'd35,4'b0};

		xInput[292] = {2'b00,6'd33,4'b0};
		yInput[292] = {2'b00,6'd32,4'b0};

		xInput[293] = {2'b00,6'd33,4'b0};
		yInput[293] = {2'b00,6'd33,4'b0};

		xInput[294] = {2'b00,6'd33,4'b0};
		yInput[294] = {2'b00,6'd34,4'b0};

		xInput[295] = {2'b00,6'd33,4'b0};
		yInput[295] = {2'b00,6'd35,4'b0};

		xInput[296] = {2'b00,6'd34,4'b0};
		yInput[296] = {2'b00,6'd32,4'b0};

		xInput[297] = {2'b00,6'd34,4'b0};
		yInput[297] = {2'b00,6'd33,4'b0};

		xInput[298] = {2'b00,6'd34,4'b0};
		yInput[298] = {2'b00,6'd34,4'b0};

		xInput[299] = {2'b00,6'd34,4'b0};
		yInput[299] = {2'b00,6'd35,4'b0};

		xInput[300] = {2'b00,6'd35,4'b0};
		yInput[300] = {2'b00,6'd32,4'b0};

		xInput[301] = {2'b00,6'd35,4'b0};
		yInput[301] = {2'b00,6'd33,4'b0};

		xInput[302] = {2'b00,6'd35,4'b0};
		yInput[302] = {2'b00,6'd34,4'b0};

		xInput[303] = {2'b00,6'd35,4'b0};
		yInput[303] = {2'b00,6'd35,4'b0};

// start 19
		xInput[304] = {2'b00,6'd36,4'b0};
		yInput[304] = {2'b00,6'd32,4'b0};

		xInput[305] = {2'b00,6'd36,4'b0};
		yInput[305] = {2'b00,6'd33,4'b0};

		xInput[306] = {2'b00,6'd36,4'b0};
		yInput[306] = {2'b00,6'd34,4'b0};

		xInput[307] = {2'b00,6'd36,4'b0};
		yInput[307] = {2'b00,6'd35,4'b0};

		xInput[308] = {2'b00,6'd37,4'b0};
		yInput[308] = {2'b00,6'd32,4'b0};

		xInput[309] = {2'b00,6'd37,4'b0};
		yInput[309] = {2'b00,6'd33,4'b0};

		xInput[310] = {2'b00,6'd37,4'b0};
		yInput[310] = {2'b00,6'd34,4'b0};

		xInput[311] = {2'b00,6'd37,4'b0};
		yInput[311] = {2'b00,6'd35,4'b0};

		xInput[312] = {2'b00,6'd38,4'b0};
		yInput[312] = {2'b00,6'd32,4'b0};

		xInput[313] = {2'b00,6'd38,4'b0};
		yInput[313] = {2'b00,6'd33,4'b0};

		xInput[314] = {2'b00,6'd38,4'b0};
		yInput[314] = {2'b00,6'd34,4'b0};

		xInput[315] = {2'b00,6'd38,4'b0};
		yInput[315] = {2'b00,6'd35,4'b0};

		xInput[316] = {2'b00,6'd39,4'b0};
		yInput[316] = {2'b00,6'd32,4'b0};

		xInput[317] = {2'b00,6'd39,4'b0};
		yInput[317] = {2'b00,6'd33,4'b0};

		xInput[318] = {2'b00,6'd39,4'b0};
		yInput[318] = {2'b00,6'd34,4'b0};

		xInput[319] = {2'b00,6'd39,4'b0};
		yInput[319] = {2'b00,6'd35,4'b0};

// start 20
		xInput[320] = {2'b00,6'd20,4'b0};
		yInput[320] = {2'b00,6'd36,4'b0};

		xInput[321] = {2'b00,6'd20,4'b0};
		yInput[321] = {2'b00,6'd37,4'b0};

		xInput[322] = {2'b00,6'd20,4'b0};
		yInput[322] = {2'b00,6'd38,4'b0};

		xInput[323] = {2'b00,6'd20,4'b0};
		yInput[323] = {2'b00,6'd39,4'b0};

		xInput[324] = {2'b00,6'd21,4'b0};
		yInput[324] = {2'b00,6'd36,4'b0};

		xInput[325] = {2'b00,6'd21,4'b0};
		yInput[325] = {2'b00,6'd37,4'b0};

		xInput[326] = {2'b00,6'd21,4'b0};
		yInput[326] = {2'b00,6'd38,4'b0};

		xInput[327] = {2'b00,6'd21,4'b0};
		yInput[327] = {2'b00,6'd39,4'b0};

		xInput[328] = {2'b00,6'd22,4'b0};
		yInput[328] = {2'b00,6'd36,4'b0};

		xInput[329] = {2'b00,6'd22,4'b0};
		yInput[329] = {2'b00,6'd37,4'b0};

		xInput[330] = {2'b00,6'd22,4'b0};
		yInput[330] = {2'b00,6'd38,4'b0};

		xInput[331] = {2'b00,6'd22,4'b0};
		yInput[331] = {2'b00,6'd39,4'b0};

		xInput[332] = {2'b00,6'd23,4'b0};
		yInput[332] = {2'b00,6'd36,4'b0};

		xInput[333] = {2'b00,6'd23,4'b0};
		yInput[333] = {2'b00,6'd37,4'b0};

		xInput[334] = {2'b00,6'd23,4'b0};
		yInput[334] = {2'b00,6'd38,4'b0};

		xInput[335] = {2'b00,6'd23,4'b0};
		yInput[335] = {2'b00,6'd39,4'b0};

// start 21
		xInput[336] = {2'b00,6'd24,4'b0};
		yInput[336] = {2'b00,6'd36,4'b0};

		xInput[337] = {2'b00,6'd24,4'b0};
		yInput[337] = {2'b00,6'd37,4'b0};

		xInput[338] = {2'b00,6'd24,4'b0};
		yInput[338] = {2'b00,6'd38,4'b0};

		xInput[339] = {2'b00,6'd24,4'b0};
		yInput[339] = {2'b00,6'd39,4'b0};

		xInput[340] = {2'b00,6'd25,4'b0};
		yInput[340] = {2'b00,6'd36,4'b0};

		xInput[341] = {2'b00,6'd25,4'b0};
		yInput[341] = {2'b00,6'd37,4'b0};

		xInput[342] = {2'b00,6'd25,4'b0};
		yInput[342] = {2'b00,6'd38,4'b0};

		xInput[343] = {2'b00,6'd25,4'b0};
		yInput[343] = {2'b00,6'd39,4'b0};

		xInput[344] = {2'b00,6'd26,4'b0};
		yInput[344] = {2'b00,6'd36,4'b0};

		xInput[345] = {2'b00,6'd26,4'b0};
		yInput[345] = {2'b00,6'd37,4'b0};

		xInput[346] = {2'b00,6'd26,4'b0};
		yInput[346] = {2'b00,6'd38,4'b0};

		xInput[347] = {2'b00,6'd26,4'b0};
		yInput[347] = {2'b00,6'd39,4'b0};

		xInput[348] = {2'b00,6'd27,4'b0};
		yInput[348] = {2'b00,6'd36,4'b0};

		xInput[349] = {2'b00,6'd27,4'b0};
		yInput[349] = {2'b00,6'd37,4'b0};

		xInput[350] = {2'b00,6'd27,4'b0};
		yInput[350] = {2'b00,6'd38,4'b0};

		xInput[351] = {2'b00,6'd27,4'b0};
		yInput[351] = {2'b00,6'd39,4'b0};

// start 22
		xInput[352] = {2'b00,6'd28,4'b0};
		yInput[352] = {2'b00,6'd36,4'b0};

		xInput[353] = {2'b00,6'd28,4'b0};
		yInput[353] = {2'b00,6'd37,4'b0};

		xInput[354] = {2'b00,6'd28,4'b0};
		yInput[354] = {2'b00,6'd38,4'b0};

		xInput[355] = {2'b00,6'd28,4'b0};
		yInput[355] = {2'b00,6'd39,4'b0};

		xInput[356] = {2'b00,6'd29,4'b0};
		yInput[356] = {2'b00,6'd36,4'b0};

		xInput[357] = {2'b00,6'd29,4'b0};
		yInput[357] = {2'b00,6'd37,4'b0};

		xInput[358] = {2'b00,6'd29,4'b0};
		yInput[358] = {2'b00,6'd38,4'b0};

		xInput[359] = {2'b00,6'd29,4'b0};
		yInput[359] = {2'b00,6'd39,4'b0};

		xInput[360] = {2'b00,6'd30,4'b0};
		yInput[360] = {2'b00,6'd36,4'b0};

		xInput[361] = {2'b00,6'd30,4'b0};
		yInput[361] = {2'b00,6'd37,4'b0};

		xInput[362] = {2'b00,6'd30,4'b0};
		yInput[362] = {2'b00,6'd38,4'b0};

		xInput[363] = {2'b00,6'd30,4'b0};
		yInput[363] = {2'b00,6'd39,4'b0};

		xInput[364] = {2'b00,6'd31,4'b0};
		yInput[364] = {2'b00,6'd36,4'b0};

		xInput[365] = {2'b00,6'd31,4'b0};
		yInput[365] = {2'b00,6'd37,4'b0};

		xInput[366] = {2'b00,6'd31,4'b0};
		yInput[366] = {2'b00,6'd38,4'b0};

		xInput[367] = {2'b00,6'd31,4'b0};
		yInput[367] = {2'b00,6'd39,4'b0};

// start 23
		xInput[368] = {2'b00,6'd32,4'b0};
		yInput[368] = {2'b00,6'd36,4'b0};

		xInput[369] = {2'b00,6'd32,4'b0};
		yInput[369] = {2'b00,6'd37,4'b0};

		xInput[370] = {2'b00,6'd32,4'b0};
		yInput[370] = {2'b00,6'd38,4'b0};

		xInput[371] = {2'b00,6'd32,4'b0};
		yInput[371] = {2'b00,6'd39,4'b0};

		xInput[372] = {2'b00,6'd33,4'b0};
		yInput[372] = {2'b00,6'd36,4'b0};

		xInput[373] = {2'b00,6'd33,4'b0};
		yInput[373] = {2'b00,6'd37,4'b0};

		xInput[374] = {2'b00,6'd33,4'b0};
		yInput[374] = {2'b00,6'd38,4'b0};

		xInput[375] = {2'b00,6'd33,4'b0};
		yInput[375] = {2'b00,6'd39,4'b0};

		xInput[376] = {2'b00,6'd34,4'b0};
		yInput[376] = {2'b00,6'd36,4'b0};

		xInput[377] = {2'b00,6'd34,4'b0};
		yInput[377] = {2'b00,6'd37,4'b0};

		xInput[378] = {2'b00,6'd34,4'b0};
		yInput[378] = {2'b00,6'd38,4'b0};

		xInput[379] = {2'b00,6'd34,4'b0};
		yInput[379] = {2'b00,6'd39,4'b0};

		xInput[380] = {2'b00,6'd35,4'b0};
		yInput[380] = {2'b00,6'd36,4'b0};

		xInput[381] = {2'b00,6'd35,4'b0};
		yInput[381] = {2'b00,6'd37,4'b0};

		xInput[382] = {2'b00,6'd35,4'b0};
		yInput[382] = {2'b00,6'd38,4'b0};

		xInput[383] = {2'b00,6'd35,4'b0};
		yInput[383] = {2'b00,6'd39,4'b0};

// start 24
		xInput[384] = {2'b00,6'd16,4'b0};
		yInput[384] = {2'b00,6'd40,4'b0};

		xInput[385] = {2'b00,6'd16,4'b0};
		yInput[385] = {2'b00,6'd41,4'b0};

		xInput[386] = {2'b00,6'd16,4'b0};
		yInput[386] = {2'b00,6'd42,4'b0};

		xInput[387] = {2'b00,6'd16,4'b0};
		yInput[387] = {2'b00,6'd43,4'b0};

		xInput[388] = {2'b00,6'd17,4'b0};
		yInput[388] = {2'b00,6'd40,4'b0};

		xInput[389] = {2'b00,6'd17,4'b0};
		yInput[389] = {2'b00,6'd41,4'b0};

		xInput[390] = {2'b00,6'd17,4'b0};
		yInput[390] = {2'b00,6'd42,4'b0};

		xInput[391] = {2'b00,6'd17,4'b0};
		yInput[391] = {2'b00,6'd43,4'b0};

		xInput[392] = {2'b00,6'd18,4'b0};
		yInput[392] = {2'b00,6'd40,4'b0};

		xInput[393] = {2'b00,6'd18,4'b0};
		yInput[393] = {2'b00,6'd41,4'b0};

		xInput[394] = {2'b00,6'd18,4'b0};
		yInput[394] = {2'b00,6'd42,4'b0};

		xInput[395] = {2'b00,6'd18,4'b0};
		yInput[395] = {2'b00,6'd43,4'b0};

		xInput[396] = {2'b00,6'd19,4'b0};
		yInput[396] = {2'b00,6'd40,4'b0};

		xInput[397] = {2'b00,6'd19,4'b0};
		yInput[397] = {2'b00,6'd41,4'b0};

		xInput[398] = {2'b00,6'd19,4'b0};
		yInput[398] = {2'b00,6'd42,4'b0};

		xInput[399] = {2'b00,6'd19,4'b0};
		yInput[399] = {2'b00,6'd43,4'b0};

// start 25
		xInput[400] = {2'b00,6'd36,4'b0};
		yInput[400] = {2'b00,6'd40,4'b0};

		xInput[401] = {2'b00,6'd36,4'b0};
		yInput[401] = {2'b00,6'd41,4'b0};

		xInput[402] = {2'b00,6'd36,4'b0};
		yInput[402] = {2'b00,6'd42,4'b0};

		xInput[403] = {2'b00,6'd36,4'b0};
		yInput[403] = {2'b00,6'd43,4'b0};

		xInput[404] = {2'b00,6'd37,4'b0};
		yInput[404] = {2'b00,6'd40,4'b0};

		xInput[405] = {2'b00,6'd37,4'b0};
		yInput[405] = {2'b00,6'd41,4'b0};

		xInput[406] = {2'b00,6'd37,4'b0};
		yInput[406] = {2'b00,6'd42,4'b0};

		xInput[407] = {2'b00,6'd37,4'b0};
		yInput[407] = {2'b00,6'd43,4'b0};

		xInput[408] = {2'b00,6'd38,4'b0};
		yInput[408] = {2'b00,6'd40,4'b0};

		xInput[409] = {2'b00,6'd38,4'b0};
		yInput[409] = {2'b00,6'd41,4'b0};

		xInput[410] = {2'b00,6'd38,4'b0};
		yInput[410] = {2'b00,6'd42,4'b0};

		xInput[411] = {2'b00,6'd38,4'b0};
		yInput[411] = {2'b00,6'd43,4'b0};

		xInput[412] = {2'b00,6'd39,4'b0};
		yInput[412] = {2'b00,6'd40,4'b0};

		xInput[413] = {2'b00,6'd39,4'b0};
		yInput[413] = {2'b00,6'd41,4'b0};

		xInput[414] = {2'b00,6'd39,4'b0};
		yInput[414] = {2'b00,6'd42,4'b0};

		xInput[415] = {2'b00,6'd39,4'b0};
		yInput[415] = {2'b00,6'd43,4'b0};
		
		
	end
		
	initial begin
		integer i;
		for (i=0; i < 57; i = i + 1) begin // init to 0
			img_rotated[i] = 57'b0; // this will make it so pixel 0,0 is always light up -> will deal with later
		end
		
	
	end
	
	reg [9:0] count = 0; // 19
	reg [9:0] countD = 0;
	reg [4:0] pipeCleanCount = 0;
	
	// output from cordic:
	// x,x,x,x,x,0,1,2,3
	
	always @ (posedge clk)
	begin
		if (count > 416) begin // is this _really_ just greater than?
			count <= 0;
		end
		else count <= count + 1;
		
		
		if (reset == 1) begin
			countD <= 0;
			count <= 0;
			pipeCleanCount <= 0;
			done <= 0;
			
			img_rotated[0] <= 0;
			img_rotated[1] <= 0;
			img_rotated[2] <= 0;
			img_rotated[3] <= 0;
			img_rotated[4] <= 0;
			img_rotated[5] <= 0;
			img_rotated[6] <= 0;
			img_rotated[7] <= 0;
			img_rotated[8] <= 0;
			img_rotated[9] <= 0;
			img_rotated[10] <= 0;
			img_rotated[11] <= 0;
			img_rotated[12] <= 0;
			img_rotated[13] <= 0;
			img_rotated[14] <= 0;
			img_rotated[15] <= 0;
			img_rotated[16] <= 0;
			img_rotated[17] <= 0;
			img_rotated[18] <= 0;
			img_rotated[19] <= 0;
			img_rotated[20] <= 0;
			img_rotated[21] <= 0;
			img_rotated[22] <= 0;
			img_rotated[23] <= 0;
			img_rotated[24] <= 0;
			img_rotated[25] <= 0;
			img_rotated[26] <= 0;
			img_rotated[27] <= 0;
			img_rotated[28] <= 0;
			img_rotated[29] <= 0;
			img_rotated[30] <= 0;
			img_rotated[31] <= 0;
			img_rotated[32] <= 0;
			img_rotated[33] <= 0;
			img_rotated[34] <= 0;
			img_rotated[35] <= 0;
			img_rotated[36] <= 0;
			img_rotated[37] <= 0;
			img_rotated[38] <= 0;
			img_rotated[39] <= 0;
			img_rotated[40] <= 0;
			img_rotated[41] <= 0;
			img_rotated[42] <= 0;
			img_rotated[43] <= 0;
			img_rotated[44] <= 0;
			img_rotated[45] <= 0;
			img_rotated[46] <= 0;
			img_rotated[47] <= 0;
			img_rotated[48] <= 0;
			img_rotated[49] <= 0;
			img_rotated[50] <= 0;
			img_rotated[51] <= 0;
			img_rotated[52] <= 0;
			img_rotated[53] <= 0;
			img_rotated[54] <= 0;
			img_rotated[55] <= 0;
			img_rotated[56] <= 0;

			
			
		end 
		
		if(countD > pipeOffset + 480) begin
			done <= 1'b1;
		end else begin
			countD <= countD + 1;
		end
		
		if (pipeCleanCount >= pipeOffset) begin
			// set values
			// y_o[7:2] is the 'whole number' part of the output
			img_rotated[y_o[7:2]+y_offset][x_o[7:2]+x_offset] <= 1;
			img_rotated[y_offset][x_offset] <= 0;
			
		end else begin
			pipeCleanCount <= pipeCleanCount + 1;
		
		end
		
		lineResult <= img_rotated[lineCount];
//		h0 <= lineResult[3:0];
//		h1 <= lineResult[5:4];
		
	end
	
	unnamed c0(.a(theta_i), .areset(reset), .clk(clk), .x(xInput[count]-{2'b00,x_offset, 4'b0000}), .xo(x_o), .y(yInput[count]-{2'b00,y_offset, 4'b0000}), .yo(y_o));
	
//	bin7seghex h0d(h0, HEX0);
//	bin7seghex h1d(h1, HEX1);
	
				
endmodule 