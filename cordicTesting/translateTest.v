module translateTest(SW, KEY, CLOCK_50, LEDR, HEX0,HEX1,HEX2,HEX3);
	input [9:0] SW;
	input [3:0] KEY;
	input CLOCK_50;
	output [9:0] LEDR;
	output [6:0] HEX0,HEX1,HEX2,HEX3;
	
	reg signed [9:0] LEDR;
	
	always @ (posedge ~KEY[0])
		begin
			if (KEY[3] == 1'b0) LEDR = SW;
			else if (KEY[1] == 1'b0) LEDR = LEDR >>> 1;
			else if (KEY[2] == 1'b0) LEDR = LEDR <<< 1;
		end
	
endmodule