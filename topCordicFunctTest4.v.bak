// trying to figure out having the image as an output
module topCordicFunctTest4(SW,LEDR,KEY,CLOCK_50,HEX0,HEX1,HEX2,HEX3);
	input[9:0] SW;
	input[3:0] KEY;
	input CLOCK_50;
	output[9:0] LEDR;
	output[6:0] HEX0,HEX1,HEX2,HEX3;
	
	wire [16:0] x_o, y_o;
	reg [3:0] h0,h1,h2,h3;
	reg[9:0] LEDR;
	
	
	reg [5:0] img_rotated [47:0];
	
	reg [5:0] lineCount = 0; // output one line at a time
	wire [5:0] lineResult /*synthesis keep*/;
//	reg [5:0] lineResultReg;
	
	
	
	always @ (posedge ~KEY[0])
	begin
		
//		if (lineCount >= 47) begin
//			lineCount <= 0;
//		end else begin
//			lineCount <= lineCount + 1;
//		end

		if (lineCount >= 47) begin
					lineCount <= 0;
				end else begin
					lineCount <= SW[5:0];
				end
		
	end
	
	
//	multCordicFunctTest4
//module multCordicFunctTest4(clk, reset, lineCount, lineResult);
		multCordicFunctTest4 m0(~KEY[0], SW[9], lineCount, lineResult);
	
	
	always @ (*)
	begin
		LEDR <= lineResult;
		h2 <= lineCount[3:0];
		h3 <= lineCount[5:4];
		
		
	end
				
//		assign LEDR = img_rotated[SW[7:4]][0]; // does not work
	
	bin7seghex h0d(h0, HEX0);
		bin7seghex h1d(h1, HEX1);
		bin7seghex h2d(h2, HEX2);
		bin7seghex h3d(h3, HEX3);
//		assign LEDR[7] = display[16];
endmodule 