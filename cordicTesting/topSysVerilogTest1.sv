module topSysVerilogTest1(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3);
	input[9:0] SW;
	input[3:0] KEY;
	input CLOCK_50;
	output[9:0] LEDR;
	output[6:0] HEX0,HEX1,HEX2,HEX3;
	
	wire [16:0] x_o, y_o;
	reg [3:0] h0,h1,h2,h3;
	reg[9:0] LEDR;
	

	reg [5:0] img_rotated [47:0];
	
	
	
	always_ff @ (posedge ~KEY[0])
//	begin
	//multCordicFunctTest3SystemVerilog2(clk, reset, img_rotated)
		multCordicFunctTest3SystemVerilog2 m0(1'b1, SW[9], img_rotated);
		
//	end
	
	always @ (*)
	begin
		/*case ({SW[2], SW[1],SW[0]})
			3'b000: begin LEDR=x_i_s[SW[7:3]][11:2]; end
//			3'b001: begin LEDR <= x_o_m[9:0]; end
			3'b001: begin LEDR <= x_o_m[SW[7:3]]; end
//			3'b001: begin LEDR<=x_o_s[SW[7:3]][9:0]; end
//			3'b001: begin LEDR=x_o[9:0]; end
			3'b010: begin LEDR=y_i[11:2]; end
			3'b011: begin LEDR = y_o; end
			3'b100:begin LEDR = theta_i[12:3]; end
				
				
		endcase */
		
		case (SW[8])
			0: begin
//			LEDR[0] <= img_rotated[SW[7:4]][0];
//			LEDR[1] <= img_rotated[SW[7:4]][1];
//			LEDR[2] <= img_rotated[SW[7:4]][2];
//			LEDR[3] <= img_rotated[SW[7:4]][3];
//			LEDR[4] <= img_rotated[SW[7:4]][4];
//			LEDR[5] <= img_rotated[SW[7:4]][5];
			end
			1: LEDR <= img_rotated[SW[7:4]][SW[3:0]];
			
		endcase
		
		
		
	end
				
//		assign LEDR = img_rotated[SW[7:4]][0]; // does not work
	
	bin7seghex h0d(h0, HEX0);
		bin7seghex h1d(h1, HEX1);
		bin7seghex h2d(h2, HEX2);
		bin7seghex h3d(h3, HEX3);
//		assign LEDR[7] = display[16];
endmodule 