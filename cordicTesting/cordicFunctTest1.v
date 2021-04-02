module cordicFunctTest1(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3);
	input[9:0] SW;
	input[3:0] KEY;
	input CLOCK_50;
	output[9:0] LEDR;
	output[6:0] HEX0,HEX1,HEX2,HEX3;
	
	wire[16:0] x_o, y_o;
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
	parameter x_i = 12'b001000000000; 
	parameter y_i = 12'b0; 
	
	wire[12:0] theta_i = 13'b0011001001000; // angle to rotate by
	
	unnamed c0(.a(theta_i), .areset(SW[9]), .clk(~KEY[0]), .x(x_i), .xo(x_o), .y(y_i), .yo(y_o));
	
	always @ (*)
		case ({SW[2], SW[1],SW[0]})
			3'b000: begin display=x_i; LEDR=x_i[11:2]; end
			3'b001: begin display={x_o,2'b0}; LEDR=x_o; end
			3'b010: begin display=y_i; LEDR=y_i[11:2]; end
			3'b011: begin display={y_o,2'b0}; LEDR = y_o; end
			3'b100:begin display=theta_i; LEDR = theta_i[12:3]; end
			default: display=display;
				
				
		endcase
		
		
	
	bin7seghex h0(display[3:0], HEX0);
		bin7seghex h1(display[7:4], HEX1);
		bin7seghex h2(display[11:8], HEX2);
		bin7seghex h3(display[15:12], HEX3);
//		assign LEDR[7] = display[16];
endmodule 