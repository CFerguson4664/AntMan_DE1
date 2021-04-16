// trying to figure out having the image as an output
//module multCordicFunctTest4(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3);
module multCordicFunctTest4(clk, reset, lineCount, lineResult, done);//, HEX0, HEX1);
	input clk, reset;
	input [9:0] lineCount;
//	output [6:0] HEX0, HEX1;
	output reg done = 0;
	output reg [46:0] lineResult;
	
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
	
	
//	parameter x_i = 12'b001000000000; // d0.5 = 32
	wire [11:0] x_i = 12'b1_1_101010_0000; // -22?
	
	
//	wire[12:0] theta_i = 13'b0_01_1001001000; // angle to rotate by (pi/2)
//	wire[12:0] theta_i = 13'b0_00_1100100100; // angle to rotate by (pi/4)
	wire[12:0] theta_i = 13'b0_00_0000000000; // angle to rotate by (pi/4)

	// wire [row] varname [column]
	// wire [wordWidth] varname [row][column]
	
	// input: 12'b0_0_000000_0000
	
	
	// output: 10'b0_0_000000_00
	wire [9:0] x_o, y_o;
	
//	reg [11:0] xInput [415:0];
//	reg [11:0] yInput [415:0];
	
	reg [11:0] xInput [35:0];
	reg [11:0] yInput [35:0];
	
	reg [46:0] img_rotated [46:0];
	
	reg pipeCleaner [pipeOffset:0]; // place to put the trash cordic output (is this necessary?)
	
	initial begin
	
		integer i;
		for (i=0; i < 36/*416*/; i = i + 1) begin // init to 0
			xInput[i] = 12'b0_0_000000_0000;
			yInput[i] = 12'b0_0_000000_0000;
		end
				
//		// initialize x values (6'd47 = 6'b101111)
//		xInput[0] = 12'b0_0_000001_0000;
//		xInput[1] = 12'b0_0_001011_0000;
//		xInput[2] = 12'b0_0_000011_0000;
//		xInput[3] = 12'b0_0_000001_0000;
//		xInput[4] = 12'b0_0_100111_0000;
//		xInput[5] = 12'b0_0_000001_0000;
//		
//		// initialize y values
//		yInput[0] = 12'b0_0_000001_0000;
//		yInput[1] = 12'b0_0_001000_0000;
//		yInput[2] = 12'b0_0_000110_0000;
//		yInput[3] = 12'b0_0_101000_0000;
//		yInput[4] = 12'b0_0_100111_0000;
//		yInput[5] = 12'b0_0_001111_0000;

// 	initialize x values (6'd47 = 6'b101111)
		xInput[0] = {2'b00,6'd1,4'b0}; //12'b0_0_000001_0000;
		xInput[1] = {2'b00,6'd11,4'b0}; //12'b0_0_001011_0000;
		xInput[2] = {2'b00,6'd3,4'b0}; //12'b0_0_000011_0000;
		xInput[3] = {2'b00,6'd1,4'b0}; //12'b0_0_000001_0000;
		xInput[4] = {2'b00,6'b100111,4'b0}; //12'b0_0_100111_0000;
		xInput[5] = {2'b00,6'd1,4'b0}; //12'b0_0_000001_0000;
		
		// initialize y values
		yInput[0] = {2'b00,6'd1,4'b0}; //12'b0_0_000001_0000;
		yInput[1] = {2'b00,6'd8,4'b0}; //12'b0_0_001000_0000;
		yInput[2] = {2'b00,6'd6,4'b0}; //12'b0_0_000110_0000;
		yInput[3] = {2'b00,6'd40,4'b0}; //12'b0_0_101000_0000;
		yInput[4] = {2'b00,6'd39,4'b0}; //12'b0_0_100111_0000;
		yInput[5] = {2'b00,6'd15,4'b0}; //12'b0_0_001111_0000;
		
		xInput[6] = {2'b00,6'd1,4'b0}; //12'b0_0_000001_0000;
		yInput[6] = {2'b00,6'd30,4'b0}; //12'b0_0_001111_0000;
		
		xInput[7] = {2'b00,6'd2,4'b0}; //12'b0_0_000001_0000;
		yInput[7] = {2'b00,6'd30,4'b0}; //12'b0_0_001111_0000;
		
		xInput[8] = {2'b00,6'd4,4'b0}; //12'b0_0_000001_0000;
		yInput[8] = {2'b00,6'd30,4'b0}; //12'b0_0_001111_0000;
		
		xInput[9] = {2'b00,6'd7,4'b0}; //12'b0_0_000001_0000;
		yInput[9] = {2'b00,6'd30,4'b0}; //12'b0_0_001111_0000;
		
		xInput[10] = {2'b00,6'd12,4'b0}; //12'b0_0_000001_0000;
		yInput[10] = {2'b00,6'd30,4'b0}; //12'b0_0_001111_0000;
		
		xInput[11] = {2'b00,6'd18,4'b0}; //12'b0_0_000001_0000;
		yInput[11] = {2'b00,6'd30,4'b0}; //12'b0_0_001111_0000;
		
		xInput[12] = {2'b00,6'd26,4'b0}; //12'b0_0_000001_0000;
		yInput[12] = {2'b00,6'd30,4'b0}; //12'b0_0_001111_0000;
		
		xInput[13] = {2'b00,6'd35,4'b0}; //12'b0_0_000001_0000;
		yInput[13] = {2'b00,6'd30,4'b0}; //12'b0_0_001111_0000;
//		
		
	end
		
	initial begin
		integer i;
		for (i=0; i < 47; i = i + 1) begin // init to 0
			img_rotated[i] = 47'b0; // this will make it so pixel 0,0 is always light up -> will deal with later
		end
		
	
	end
	
	reg [9:0] count = 0; // 19
	reg [9:0] countD = 0;
	reg [4:0] pipeCleanCount = 0;
	
	// output from cordic:
	// x,x,x,x,x,0,1,2,3
	
	always @ (posedge clk)
	begin
		if (count > 36/*416*/) begin // is this _really_ just greater than?
			count <= 0;
		end
		else count <= count + 1;
		
		
		if (reset == 1) begin
			countD <= 0;
			count <= 0;
			pipeCleanCount <= 0;
			done <= 0;
			
//			img_rotated[0] <= 0;
//			img_rotated[1] <= 0;
//			img_rotated[2] <= 0;
//			img_rotated[3] <= 0;
//			img_rotated[4] <= 0;
//			img_rotated[5] <= 0;
//			img_rotated[6] <= 0;
//			img_rotated[7] <= 0;
//			img_rotated[8] <= 0;
//			img_rotated[9] <= 0;
//			img_rotated[10] <= 0;
//			img_rotated[11] <= 0;
//			img_rotated[12] <= 0;
//			img_rotated[13] <= 0;
//			img_rotated[14] <= 0;
//			img_rotated[15] <= 0;
//			img_rotated[16] <= 0;
//			img_rotated[17] <= 0;
//			img_rotated[18] <= 0;
//			img_rotated[19] <= 0;
//			img_rotated[20] <= 0;
//			img_rotated[21] <= 0;
//			img_rotated[22] <= 0;
//			img_rotated[23] <= 0;
//			img_rotated[24] <= 0;
//			img_rotated[25] <= 0;
//			img_rotated[26] <= 0;
//			img_rotated[27] <= 0;
//			img_rotated[28] <= 0;
//			img_rotated[29] <= 0;
//			img_rotated[30] <= 0;
//			img_rotated[31] <= 0;
//			img_rotated[32] <= 0;
//			img_rotated[33] <= 0;
//			img_rotated[34] <= 0;
//			img_rotated[35] <= 0;
//			img_rotated[36] <= 0;
//			img_rotated[37] <= 0;
//			img_rotated[38] <= 0;
//			img_rotated[39] <= 0;
//			img_rotated[40] <= 0;
//			img_rotated[41] <= 0;
//			img_rotated[42] <= 0;
//			img_rotated[43] <= 0;
//			img_rotated[44] <= 0;
//			img_rotated[45] <= 0;
//			img_rotated[46] <= 0;

			img_rotated[0] <=  48'b000_00000_00000_00000_00000_00000_00000_00000_00000_00000;
			img_rotated[1] <=  48'b000000000000000000000000000000000000000000000000;
			img_rotated[2] <=  48'b000000000000000000000000000000000000000000000000;
			img_rotated[3] <=  48'b000000000000000000000000000000000000000000000000;
			img_rotated[4] <=  48'b000000000000000000000000000000000000000000000000;
			img_rotated[5] <=  48'b000000000000000000000000000000000000000000000000;
			img_rotated[6] <=  48'b000000000001111111111111111111111000000000000000;
			img_rotated[7] <=  48'b000000000110000000000000000000001111100000000000;
			img_rotated[8] <=  48'b000000001100000000000000000000000000011000000000;
			img_rotated[9] <=  48'b000000001000000000000000000000000000000110000000;
			img_rotated[10] <= 48'b000000010000000000000000000000000000000011000000;
			img_rotated[11] <= 48'b000000010000000000000000000000000000000001000000;
			img_rotated[12] <= 48'b000000100000000000000000000000000000000001000000;
			img_rotated[13] <= 48'b000000100000000001111110000000000110000000100000;
			img_rotated[14] <= 48'b000001000000001111110001000000011101000000110000;
			img_rotated[15] <= 48'b000010000000001111111100100000111111100000011000;
			img_rotated[16] <= 48'b001110011110000000100011000011100000000000001000;
			img_rotated[17] <= 48'b001000100001100011000000000000100000000000001100;
			img_rotated[18] <= 48'b010001000100011100000001000000100000000000000100;
			img_rotated[19] <= 48'b010001000110000000000111000000110000000000000100;
			img_rotated[20] <= 48'b010001001101110000000100011000011000000100001000;
			img_rotated[21] <= 48'b010001000100011100000010000000011000001100011000;
			img_rotated[22] <= 48'b001000000110001011100000000000110000001100010000;
			img_rotated[23] <= 48'b000100000011101000011000000001000000111110010000;
			img_rotated[24] <= 48'b000010000011011100001111111111111111010110100000;
			img_rotated[25] <= 48'b000001000001001111101000001000100101010110100000;
			img_rotated[26] <= 48'b000001000000101001111000001000100101011110100000;
			img_rotated[27] <= 48'b000000100000011000001111111111111111111110100000;
			img_rotated[28] <= 48'b000000100000001000001001111111111111111100100000;
			img_rotated[29] <= 48'b000000010000000110010000010111111111010100100000;
			img_rotated[30] <= 48'b000000001000000011010000010000100101010100100000;
			img_rotated[31] <= 48'b000000000100000000111000010001000101011000010000;
			img_rotated[32] <= 48'b000000000011000000001111111111111111110000010000;
			img_rotated[33] <= 48'b000000000001100000000000000000000000000000010000;
			img_rotated[34] <= 48'b000000000000011000000000000000000000000000010000;
			img_rotated[35] <= 48'b000000000000000111000000000000000000000000010000;
			img_rotated[36] <= 48'b000000000000000000110000000000000000000000010000;
			img_rotated[37] <= 48'b000000000000000000001100000000000000000000010000;
			img_rotated[38] <= 48'b000000000000000000000011110000000000000000100000;
			img_rotated[39] <= 48'b000000000000000000000000011110000000000011000000;
			img_rotated[40] <= 48'b000000000000000000000000000001111111111100000000;
			img_rotated[41] <= 48'b000000000000000000000000000000000000000000000000;
			img_rotated[42] <= 48'b000000000000000000000000000000000000000000000000;
			img_rotated[43] <= 48'b000000000000000000000000000000000000000000000000;
			img_rotated[44] <= 48'b000000000000000000000000000000000000000000000000;
			img_rotated[45] <= 48'b000000000000000000000000000000000000000000000000;
			img_rotated[46] <= 48'b000000000000000000000000000000000000000000000000;

			
			
		end 
		
		if(countD > pipeOffset + 416) begin
			done <= 1'b1;
		end else begin
			countD <= countD + 1;
		end
		
		if (pipeCleanCount >= pipeOffset) begin
			// set values
			// y_o[7:2] is the 'whole number' part of the output
//			img_rotated[y_o[7:2]][x_o[7:2]] <= 1;
			
		end else begin
			pipeCleanCount <= pipeCleanCount + 1;
		
		end
		
		lineResult <= img_rotated[lineCount];
//		h0 <= lineResult[3:0];
//		h1 <= lineResult[5:4];
		
	end
	
//	unnamed c0(.a(theta_i), .areset(reset), .clk(clk), .x(xInput[count]), .xo(x_o), .y(yInput[count]), .yo(y_o));
	
//	bin7seghex h0d(h0, HEX0);
//	bin7seghex h1d(h1, HEX1);
	
				
endmodule 