module cordicTest2(SW, KEY, CLOCK_50, LEDR, HEX0,HEX1,HEX2,HEX3);
	input [9:0] SW;
	input [3:0] KEY;
	input CLOCK_50;
	output [9:0] LEDR;
	output [6:0] HEX0,HEX1,HEX2,HEX3
	
	
	// ROTATE SETUP
	parameter x_i = 17'd19896; // always cordic inverse (17'd19896)
	parameter y_i = 17'b0; // always 0
								 //swwwwwwwwffffffff
	parameter theta_i = 17'b00010110100000000; // angle to rotate by
	
		
  
  wire[16:0] x_o, y_o, theta_o;
  reg[16:0] display;
  
	cordic c0(.clk(~KEY[0]), .rst(SW[9]), .x_i(x_i), .y_i(y_i), .theta_i(theta_i), .x_o(x_o), .y_o(y_o), .theta_o(theta_o));
  
  
	always @ (*)
		case ({SW[2], SW[1],SW[0]})
			3'b000: display=x_i;
			3'b001: display=x_o;
			3'b010: display=y_i;
			3'b011: display=y_o;
			3'b100: display=theta_i;
			3'b101: display=theta_o;
			default: display=display;
				
				
		endcase
		
		
		bin7seghex h0(display[3:0], HEX0);
		bin7seghex h1(display[7:4], HEX1);
		bin7seghex h2(display[11:8], HEX2);
		bin7seghex h3(display[15:12], HEX3);
		assign LEDR[7] = display[16];
	
endmodule