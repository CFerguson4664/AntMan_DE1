
module megaCordic (
	clk,
	areset,
	a,
	x,
	y,
	xo,
	yo);	

	input		clk;
	input		areset;
	input	[16:0]	a;
	input	[15:0]	x;
	input	[15:0]	y;
	output	[9:0]	xo;
	output	[9:0]	yo;
endmodule
