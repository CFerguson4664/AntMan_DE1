module multCordicFunctTest1(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3);
	input[9:0] SW;
	input[3:0] KEY;
	input CLOCK_50;
	output[9:0] LEDR;
	output[6:0] HEX0,HEX1,HEX2,HEX3;
	
	wire [16:0] x_o, y_o;
	reg[16:0] display;
	reg[9:0] LEDR;
	
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

//	parameter offset = 6'b23; // offset to translate origin to center of ant (47/2) will need to add in a 1'b.1 to vector
	
	wire [5:0] vX = 6'b101010; // -22
	
	
//	parameter x_i = 12'b001000000000; // d0.5 = 32
	wire [11:0] x_i = 12'b1_1_101010_0000; // -22?

//	wire [11:0] x_i = 
	wire [11:0] y_i = 12'b0;
	
	
//	wire[12:0] theta_i = 13'b0_01_1001001000; // angle to rotate by (pi/2)
	wire[12:0] theta_i = 13'b0_00_1100100100; // angle to rotate by (pi/4)
	wire[12:0] theta_i_none = 13'b0_01_1001011010; // angle to rotate by (pi/4)
	// wire [row] varname [column]
	reg [11:0] x_i_s [17:0];
	reg [9:0] x_o_s [17:0];
	
	wire[9:0] x_o_none, y_o_none;
	
	initial begin
		x_i_s[0] =  12'b0_0_000001_0000;
		x_i_s[1] =  12'b0_0_000010_0000;
		x_i_s[2] =  12'b0_0_000011_0000;
		x_i_s[3] =  12'b0_0_000100_0000;
		x_i_s[4] =  12'b0_0_000101_0000;
		x_i_s[5] =  12'b0_0_000110_0000;
		x_i_s[6] =  12'b0_0_000111_0000;
		x_i_s[7] =  12'b0_0_001000_0000;
		x_i_s[8] =  12'b0_0_001001_0000;
		x_i_s[9] =  12'b0_0_001010_0000;
		x_i_s[10] = 12'b0_0_001011_0000;
		x_i_s[11] = 12'b0_0_001100_0000;
		x_i_s[12] = 12'b0_0_001101_0000;
		x_i_s[13] = 12'b0_0_001110_0000;
		x_i_s[14] = 12'b0_0_001111_0000;
		x_i_s[15] = 12'b0_0_010000_0000;
		x_i_s[16] = 12'b0_0_010001_0000;
		x_i_s[17] = 12'b0_0_010010_0000;
	end
	
	reg [4:0] count;
	
	always @ (posedge ~KEY[0])
	begin
		if (count >= 18) count <= 0;
		else count <= count + 1;
		
		x_o_s[count][0+:10] <= x_o;
		
		
	end
	
	
//	unnamed c0(.a(theta_i), .areset(SW[9]), .clk(~KEY[0]), .x(x_i_s[count]), .xo(x_o_s[count]), .y(y_i), .yo(y_o));
	unnamed c0(.a(theta_i), .areset(SW[9]), .clk(~KEY[0]), .x(x_i_s[count]), .xo(x_o), .y(y_i), .yo(y_o));
//	unnamed c1(.a(theta_i_2), .areset(SW[9]), .clk(CLOCK_50), .x(x_i), .xo(x_o_none), .y(y_i), .yo(y_o_none));
	
	always @ (*)
		case ({SW[2], SW[1],SW[0]})
			3'b000: begin LEDR=x_i_s[SW[7:3]][11:2]; end
			3'b001: begin LEDR<=x_o_s[SW[7:3]][9:0]; end
//			3'b001: begin LEDR=x_o[9:0]; end
			3'b010: begin LEDR=y_i[11:2]; end
			3'b011: begin LEDR = y_o; end
			3'b100:begin LEDR = theta_i[12:3]; end
				
				
		endcase
		
		
	
	bin7seghex h0(display[3:0], HEX0);
		bin7seghex h1(display[7:4], HEX1);
		bin7seghex h2(display[11:8], HEX2);
		bin7seghex h3(display[15:12], HEX3);
//		assign LEDR[7] = display[16];
endmodule 