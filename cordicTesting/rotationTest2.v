module rotationTest2(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3);
	input[9:0] SW;
	input[3:0] KEY;
	input CLOCK_50;
	output[9:0] LEDR;
	output[6:0] HEX0,HEX1,HEX2,HEX3;
	
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
	parameter pointX = 6'd22;
	parameter pointY = 6'd10;

	parameter x_i = {2'b00,pointX,4'b0000}; 
	parameter y_i = {2'b00,pointY,4'b0000};
	
	wire[9:0] x_o, y_o;
	
	wire[12:0] theta_i = 13'b0011001001000; // angle to rotate by

	unnamed c0(.a(theta_i), .areset(SW[9]), .clk(CLOCK_50), .x(x_i), .xo(x_o), .y(y_i), .yo(y_o));
	
	bin7seghex h0(pointX[3:0], HEX0);
	bin7seghex h1(pointX[5:4], HEX1);
	bin7seghex h2(x_o[5:2], HEX2);
	bin7seghex h3(x_o[7:6], HEX3);

	
endmodule 